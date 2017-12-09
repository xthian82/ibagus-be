package com.snowtech.repository;

import com.snowtech.entity.Subrubro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Component;

@Component
public interface SubrubroRepository extends PagingAndSortingRepository<Subrubro, Integer> {

}
