package com.snowtech.repository;

import com.snowtech.entity.Subrubro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface SubrubroRepository extends JpaRepository<Subrubro, Integer> {

}
