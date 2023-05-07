package com.springmvc.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Converter {

    public static Timestamp DateTimeConverter(String datetime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(datetime, formatter);
        System.out.println(Timestamp.valueOf(localDateTime));
        return Timestamp.valueOf(localDateTime);
    }

}
