package com.apogee.repository;

import com.apogee.EntityModel.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User>findByEmail(String email); 
    User findByEmailAndPassword(String email, String password);
}
