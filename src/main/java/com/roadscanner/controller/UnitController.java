package com.roadscanner.controller;

import com.roadscanner.dto.UnitResponseDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UnitController {

    @GetMapping("/unit")
    public String unit() {
        return "OK";
    }

    @GetMapping("/unit/dto")
    public UnitResponseDto unitResponseDto(@RequestParam("name") String name,
                                           @RequestParam("amount") int amount) {
        return new UnitResponseDto(name, amount);
    }
}
