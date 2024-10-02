package com.apogee.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.apogee.EntityModel.Cart;
import com.apogee.EntityModel.User;

public interface CartRepository extends JpaRepository<Cart, Integer> {

    public Optional<Cart> findByUser(User user);

}
