package com.springmvc.controller;

import com.springmvc.model.Annonce;
import com.springmvc.repository.AnnonceRepository;
import com.springmvc.service.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class FrontController {

    @Autowired
    AnnonceRepository annonceRepository;
    private static ModelAndView modelAndView = new ModelAndView();

    @RequestMapping
    public ModelAndView index(){
        modelAndView.addObject("liste",annonceRepository.ListeAnnoncePublie());
        modelAndView.setViewName("public/index");
        return  modelAndView;
    }

    @GetMapping("/public-recherche")
    public ModelAndView Recherche(HttpServletRequest request){
        List<Annonce> list = annonceRepository.findAnnoncesByTitreContainingIgnoreCase(request.getParameter("titre"));
        modelAndView.addObject("liste",list);
        modelAndView.setViewName("public/index");
        return modelAndView;
    }

    @GetMapping("/detail-annonce/{id}")
    public ModelAndView DetailAnnonce(@PathVariable int id){
        Annonce a = annonceRepository.findById(id).get();
        modelAndView.addObject("annonce",a);
        modelAndView.setViewName("public/Annonce");
        return modelAndView;
    }

}
