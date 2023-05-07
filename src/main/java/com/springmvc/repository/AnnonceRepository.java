package com.springmvc.repository;

import com.springmvc.model.Annonce;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface AnnonceRepository extends JpaRepository<Annonce,Integer> {

    @Query(value = "SELECT * FROM Annonce where idetat =2 and datepublication<= NOW()",nativeQuery = true)
    List<Annonce> ListeAnnoncePublie();

    @Query(value = "SELECT * FROM Annonce where idetat =:idetat",nativeQuery = true)
    List<Annonce> ListeAnnonceEtat(int idetat);

    List<Annonce> findAllByOrderByDatepublicationDesc();
    List<Annonce> findAnnoncesByTitreContainingIgnoreCase(String titre);
}
