package com.snowtech.controller;

import com.snowtech.entity.Rubro;
import com.snowtech.service.RubroService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rubros")
class RubroController {

    @Autowired
    private RubroService rubroService;

    @GetMapping
    public List<Rubro> getAll() {
        return rubroService.getRubros();
    }

    @GetMapping("/{id}")
    public Rubro getRubro(@PathVariable Integer id) {
        return rubroService.getRubro(id);
    }

    @PostMapping
    public Rubro saveRubro(@RequestBody Rubro rubro) {
        return rubroService.save(rubro);
    }

    @DeleteMapping("/{id}")
    public void removeRubro(@PathVariable Integer id) {
        rubroService.delete(id);
    }
}
