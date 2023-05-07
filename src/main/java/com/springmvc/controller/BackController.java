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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Base64;

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
    public ModelAndView AddAnnonce(@RequestParam("sary") MultipartFile multipartFile, HttpServletRequest request, HttpSession session) throws IOException {
        try{
            UploadImage.saveImage(multipartFile);
        }catch (Exception e){
            modelAndView.addObject("error",e.getMessage());
        }
        Annonce annonce = new Annonce();
        String originalString = "D:\\ETU-001611\\S6\\Mr Rojo\\Exam\\TP S6 P14 Web design Mai 2022\\iia\\src\\main\\webapp\\WEB-INF\\img\\"+multipartFile.getOriginalFilename();
        annonce.setTitre(request.getParameter("titre"));
        annonce.setResume(request.getParameter("resume"));
        annonce.setContenu(request.getParameter("contenu"));
        annonce.setIdetat(1);
        Admin admin = (Admin) session.getAttribute("admin");
        annonce.setIdadmin(admin.getId());
        annonce.setDatepublication(null);
        byte[] bytes = Files.readAllBytes(Paths.get(originalString));
        String base64 = Base64.getEncoder().encodeToString(bytes);
        annonce.setPhoto(base64);
        annonce = annonceRepository.save(annonce);
        if (annonce.getId() != 0){
            modelAndView.addObject("info","Annonce crée");
        }else {
            modelAndView.addObject("error","Annonce non-crée");
        }
        modelAndView.setViewName("admin/FormAnnonce");
        return modelAndView;
    }

    @GetMapping("/liste-annonce")
    public ModelAndView toListeAnnnonce(HttpSession session){
        modelAndView.addObject("annonces",annonceRepository.findAll());
        int number = annonceRepository.ListeAnnonceEtat(1).size();
        session.setAttribute("non-valide",number);
        modelAndView.setViewName("admin/ListeAnnonce");
        return modelAndView;
    }

    @PostMapping("/validate-publish")
    public ModelAndView validatePublish(HttpServletRequest request,HttpSession session) throws Exception {
        Annonce annonce = annonceRepository.findById(Integer.parseInt(request.getParameter("idannonce"))).get();
        annonce.setIdetat(2);
        if(request.getParameter("datepublication") == null){
            modelAndView.addObject("error","Inserer une date de publication");
            return toListeAnnnonce(session);
        }else {
            annonce.setDatepublication(Converter.DateTimeConverter(request.getParameter("datepublication")));
        }
        annonce = annonceRepository.save(annonce);
        if (annonce != null){
            modelAndView.addObject("info-success","Annonce publiée");
        }else {
            modelAndView.addObject("info-error","Annonce non-publiée");
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
            UploadImage.saveImage(multipartFile);
        }catch (Exception e){
            modelAndView.addObject("error",e.getMessage());
        }
        String originalString = "D:\\ETU-001611\\S6\\Mr Rojo\\Exam\\TP S6 P14 Web design Mai 2022\\iia\\src\\main\\webapp\\WEB-INF\\img\\"+multipartFile.getOriginalFilename();
        annonce.setTitre(request.getParameter("titre"));
        annonce.setResume(request.getParameter("resume"));
        annonce.setContenu(request.getParameter("contenu"));
        annonce.setIdadmin(Integer.parseInt(request.getParameter("idadmin")));
        annonce.setIdetat(1);
        annonce.setDatepublication(null);
        System.out.println("Changement : " + Timestamp.valueOf(LocalDateTime.now()) );
        annonce.setDateCreation(Timestamp.valueOf(LocalDateTime.now()));
        byte[] bytes = Files.readAllBytes(Paths.get(originalString));
        String base64 = Base64.getEncoder().encodeToString(bytes);
        annonce.setPhoto(base64);
        annonce = annonceRepository.save(annonce);
        if (annonce.getId() != 0){
            modelAndView.addObject("info","Annonce modifiée");
        }else {
            modelAndView.addObject("error","Annonce non-modifiée");
        }
        modelAndView.setViewName("admin/FormAnnonce");
        return modelAndView;
    }

}
