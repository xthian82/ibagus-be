package com.snowtech.controller;

import com.snowtech.entity.Material;
import com.snowtech.entity.Medida;
import com.snowtech.service.MaterialService;
import com.snowtech.service.MedidaService;
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
@RequestMapping("/medidas")
public class MedidaController {

    @Autowired
    private MedidaService medidaService;

    @GetMapping
    public List<Medida> getAll() {
        return medidaService.getMedidas();
    }

    @GetMapping("/{id}")
    public Medida getById(@PathVariable Integer id) {
        return medidaService.getMedida(id);
    }

    @PutMapping
    public Medida save(@RequestBody Medida data) {
        return medidaService.save(data);
    }

    @DeleteMapping("/{id}")
    public void remove(@PathVariable Integer id) {
        medidaService.delete(id);
    }
}
