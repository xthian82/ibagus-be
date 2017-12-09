package com.snowtech.service;

import com.snowtech.entity.Subrubro;
import com.snowtech.repository.SubrubroRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class SubrubroService {

    @Autowired
    private SubrubroRepository subrubroRepository;

    public Page<Subrubro> getSubrubros(Pageable pageable) {
        return subrubroRepository.findAll(pageable);
    }

    public Subrubro getSubrubro(Integer id) {
        return subrubroRepository.findOne(id);
    }

    public Subrubro save(Subrubro subRubro) {
        return subrubroRepository.save(subRubro);
    }

    public void delete(Integer id) {
        subrubroRepository.delete(id);
    }
}
