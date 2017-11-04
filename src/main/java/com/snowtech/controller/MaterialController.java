package com.snowtech.controller;

import com.snowtech.entity.Material;
import com.snowtech.service.MaterialService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/materiales")
public class MaterialController {

    @Autowired
    private MaterialService materialService;

    @GetMapping
    public List<Material> getAll() {
        return materialService.getMateriales();
    }

    @GetMapping("/{id}")
    public Material getById(@PathVariable Long id) {
        return materialService.getMateriale(id);
    }

    @PutMapping
    public Material save(@RequestBody Material data) {
        return materialService.save(data);
    }

    @DeleteMapping("/{id}")
    public void remove(@PathVariable Long id) {
        materialService.delete(id);
    }
}
