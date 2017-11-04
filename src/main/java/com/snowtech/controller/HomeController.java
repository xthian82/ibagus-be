package com.snowtech.controller;

import com.snowtech.config.App;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
class HomeController {

    @Autowired
    private App app;

    @GetMapping
    String getHome() {
        return app.getDescription();
    }

    @GetMapping("/version")
    String getVersion() {
        return app.getVersion();
    }
}
