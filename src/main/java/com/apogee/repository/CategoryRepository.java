package com.apogee.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.apogee.EntityModel.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    
}
