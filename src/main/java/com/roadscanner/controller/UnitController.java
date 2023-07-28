package com.roadscanner.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UnitController {

    @GetMapping("/unit")
    public String unit() {
        return "OK";
    }
}
