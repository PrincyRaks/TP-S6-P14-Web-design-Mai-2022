package com.springmvc.controller;

import com.springmvc.model.Admin;
import com.springmvc.model.Annonce;
import com.springmvc.repository.AdminRepository;
import com.springmvc.repository.AnnonceRepository;
import com.springmvc.service.Converter;
import com.springmvc.service.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@RequestMapping("/admin")
@Controller
public class BackController {

    @Autowired
    AdminRepository adminRepository;
    @Autowired
    AnnonceRepository annonceRepository;

    private ModelAndView modelAndView = new ModelAndView();

    @GetMapping("/login")
     public String toLogin(){
        return "admin/login";
    }

    @PostMapping("/signin")
    public ModelAndView Login(@ModelAttribute Admin admin, HttpSession session){
        Admin adminAuthentificate = adminRepository.Authentication(admin.getLogin(),admin.getMotdepasse());
        if(adminAuthentificate != null && adminAuthentificate.getLogin() != null && adminAuthentificate.getMotdepasse() != null){
            session.setAttribute("admin",adminAuthentificate);
            System.out.println(admin.getLogin() + admin.getMotdepasse());
            return toListeAnnnonce(session);
        }else {
            modelAndView.addObject("error","login invalid");
            modelAndView.setViewName("admin/login");
        }
        return modelAndView;
    }

    @GetMapping("/logout")
    public RedirectView Logout(HttpSession session){
        session.removeAttribute("admin");
        return new RedirectView("/sites-IA/public/accueil.gg");
    }

    @GetMapping("/formulaire-annonce")
    public String toFormAnnonce(HttpSession session){
        return "admin/FormAnnonce";
    }

    @PostMapping("/insert-annonce")
    public ModelAndView AddAnnonce(@RequestParam("sary") MultipartFile multipartFile, Annonce annonce, HttpSession session) throws IOException {
        try{
            annonce.setIdetat(1);
            Admin admin = (Admin) session.getAttribute("admin");
            annonce.setIdadmin(admin.getId());
            annonce.setDatepublication(null);
            annonce.setNomphoto(multipartFile.getOriginalFilename());
            annonce.setPhoto(UploadImage.saveImageToBase64(multipartFile));
            annonce = annonceRepository.save(annonce);
            if (annonce.getId() != 0){
                modelAndView.addObject("info","Annonce crée");
            }
        }catch (Exception e){
            modelAndView.addObject("error","Annonce non-crée");
            e.printStackTrace();
        }
        modelAndView.setViewName("admin/FormAnnonce");
        return modelAndView;
    }

    @GetMapping("/liste-annonce")
    public ModelAndView toListeAnnnonce(HttpSession session){
        modelAndView.addObject("annonces",annonceRepository.findAllByOrderByDatepublicationDesc());
        int number = annonceRepository.ListeAnnonceEtat(1).size();
        session.setAttribute("non-valide",number);
        modelAndView.setViewName("admin/ListeAnnonce");
        return modelAndView;
    }

    @PostMapping("/validate-publish")
    public ModelAndView validatePublish(HttpServletRequest request,HttpSession session) throws Exception {
        Annonce annonce = annonceRepository.findById(Integer.parseInt(request.getParameter("idannonce"))).get();
        try {
            if(request.getParameter("datepublication") == null){
                modelAndView.addObject("error","Inserer une date de publication");
                return toListeAnnnonce(session);
            }else if(request.getParameter("datepublication") != null) {
                annonce.setIdetat(2);
                annonce.setDatepublication(Converter.DateTimeConverter(request.getParameter("datepublication")));
                annonceRepository.save(annonce);
                modelAndView.addObject("info-success","Annonce publiée");
            }
        }catch (Exception e){
            modelAndView.addObject("info-error","Annonce non-publiée : " + e.getMessage());
        }
        return toListeAnnnonce(session);
    }

    @GetMapping("/modify-annonce/{id}")
    public ModelAndView toFormModif(@PathVariable int id){
        modelAndView.addObject("annonce",annonceRepository.findById(id).get());
        modelAndView.setViewName("admin/FormModif");
        return modelAndView;
    }

    @PostMapping("/update-annonce")
    public ModelAndView ModifyAnnonce(@RequestParam("sary") MultipartFile multipartFile,HttpServletRequest request,HttpSession session) throws IOException {
        Annonce annonce = annonceRepository.findById(Integer.parseInt(request.getParameter("id"))).get();
        try{
            annonce.setTitre(request.getParameter("titre"));
            annonce.setResume(request.getParameter("resume"));
            annonce.setContenu(request.getParameter("contenu"));
            annonce.setNomphoto(multipartFile.getOriginalFilename());
            Admin admin = (Admin) session.getAttribute("admin");
            annonce.setIdadmin(admin.getId());
            annonce.setIdetat(1);
            annonce.setDatepublication(null);
            System.out.println("Changement : " + Timestamp.valueOf(LocalDateTime.now()) );
            annonce.setDateCreation(Timestamp.valueOf(LocalDateTime.now()));
            annonce.setPhoto(UploadImage.saveImageToBase64(multipartFile));
            if (annonce.getId() != 0){
                modelAndView.addObject("info","Annonce modifiée");
            }
        }catch (Exception e){
            e.printStackTrace();
            modelAndView.addObject("error","Annonce non-modifiée"+ "\n" + e.getMessage());
        }
        modelAndView.setViewName("admin/FormAnnonce");
        return modelAndView;
    }

}
