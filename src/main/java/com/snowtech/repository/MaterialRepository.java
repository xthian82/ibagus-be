package com.snowtech.repository;

import com.snowtech.entity.Material;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface MaterialRepository extends JpaRepository<Material, Long> {

}
