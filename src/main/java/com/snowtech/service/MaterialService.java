package com.snowtech.service;


import com.snowtech.entity.Material;
import com.snowtech.repository.MaterialRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MaterialService {

    @Autowired
    private MaterialRepository materialRepository;

    public List<Material> getMateriales() {
        return materialRepository.findAll();
    }

    public Material getMateriale(Long id) {
        return materialRepository.findOne(id);
    }

    public Material save(Material material) {
        return materialRepository.saveAndFlush(material);
    }

    public void delete(Long id) {
        materialRepository.delete(id);
    }
}
