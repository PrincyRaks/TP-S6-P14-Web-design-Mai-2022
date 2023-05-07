package com.springmvc.repository;

import com.springmvc.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admin,Integer> {
    @Query(value="SELECT * from Admin where login =:login and motdepasse =:password ",nativeQuery = true)
    Admin Authentication(String login, String password);
}
