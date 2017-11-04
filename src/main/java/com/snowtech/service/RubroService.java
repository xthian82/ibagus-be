package com.snowtech.service;

import com.snowtech.entity.Rubro;
import com.snowtech.repository.RubroRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RubroService {

    @Autowired
    private RubroRepository rubroRepository;

    public List<Rubro> getRubros() {
        return rubroRepository.findAll();
    }

    public Rubro getRubro(Integer id) {
        return rubroRepository.findOne(id);
    }

    public Rubro save(Rubro rubro) {
        return rubroRepository.saveAndFlush(rubro);
    }

    public void delete(Integer id) {
        rubroRepository.delete(id);
    }
}
