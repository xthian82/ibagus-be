package com.snowtech.service;

import com.snowtech.entity.Medida;
import com.snowtech.repository.MedidaRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MedidaService {

    @Autowired
    private MedidaRepository medidaRepository;

    public List<Medida> getMedidas() {
        return medidaRepository.findAll();
    }

    public Medida getMedida(Integer id) {
        return medidaRepository.findOne(id);
    }

    public Medida save(Medida medida) {
        return medidaRepository.saveAndFlush(medida);
    }

    public void delete(Integer id) {
        medidaRepository.delete(id);
    }
}
