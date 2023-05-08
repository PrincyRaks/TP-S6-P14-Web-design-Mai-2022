package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

public class UploadImage {
    @Autowired
    private static ResourceLoader resourceLoader;
    public static String saveImageToBase64(MultipartFile image) throws Exception {
        byte[] imageData = image.getBytes();
        String ImgBase64 = " ";
        try {
            String uploadDir = "src/main/resources/static/imgIA/";
            File uploadDirPath = new File(uploadDir);
            if (!uploadDirPath.exists()) {
                uploadDirPath.mkdirs();
            }
            Path path = Paths.get(uploadDir + image.getOriginalFilename());
            //write file
            Files.write(path, imageData);
            byte[] bytes = Files.readAllBytes(path);
            ImgBase64 = Base64.getEncoder().encodeToString(bytes);

        }catch (Exception e){
            throw e;
        }
        return ImgBase64;
    }
}
