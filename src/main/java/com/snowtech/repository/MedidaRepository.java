package com.snowtech.repository;

import com.snowtech.entity.Medida;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface MedidaRepository extends JpaRepository<Medida, Integer> {

}
