package com.snowtech.repository;

import com.snowtech.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
