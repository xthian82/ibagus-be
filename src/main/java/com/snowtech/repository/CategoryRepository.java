package com.snowtech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.snowtech.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
