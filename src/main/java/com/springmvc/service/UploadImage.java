package com.springmvc.service;

import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class UploadImage {
    public static void saveImage(MultipartFile image) throws Exception {
        // Récupérer les données de l'image uploadée
        byte[] imageData = image.getBytes();
        try {
            Path path = Paths.get("D:\\ETU-001611\\S6\\Mr Rojo\\Exam\\TP S6 P14 Web design Mai 2022\\iia\\src\\main\\webapp\\WEB-INF\\img\\" + image.getOriginalFilename());
            Files.write(path, imageData);
        }catch (Exception e){
            e.printStackTrace();
            throw e;
        }
    }
}
