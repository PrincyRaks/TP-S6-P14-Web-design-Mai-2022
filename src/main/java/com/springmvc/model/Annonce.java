package com.springmvc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Annonce {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private  int id;

    private String titre;
    private  String resume;
    private String photo;
    private String contenu;

    @Nullable
    private Timestamp datepublication;

    @Column(name="idetat")
    private int idetat;

    @Column(name = "idadmin")
    private int idadmin;

    @Column(insertable = false,updatable = false,name = "datecreation",columnDefinition = "DATE DEFAULT NOW()")
    private Timestamp dateCreation;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idadmin",referencedColumnName = "idadmin",insertable = false,updatable = false)
    private Admin admin;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idetat",referencedColumnName = "id",insertable = false,updatable = false)
    private Etat etat;

}
