package com.snowtech.repository;

import com.snowtech.entity.Rubro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface RubroRepository extends JpaRepository<Rubro, Integer> {

}
