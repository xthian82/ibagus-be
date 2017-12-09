package com.snowtech.controller;

import com.snowtech.entity.Subrubro;
import com.snowtech.service.SubrubroService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/subrubros")
public class SubrubroController {

    @Autowired
    private SubrubroService subrubroService;

    @GetMapping
    public Page<Subrubro> getAll(Pageable pageable) {
        return subrubroService.getSubrubros(pageable);
    }

    @GetMapping("/{id}")
    public Subrubro getById(@PathVariable Integer id) {
        return subrubroService.getSubrubro(id);
    }

    @PutMapping
    public Subrubro save(@RequestBody Subrubro data) {
        return subrubroService.save(data);
    }

    @DeleteMapping("/{id}")
    public void remove(@PathVariable Integer id) {
        subrubroService.delete(id);
    }
}
