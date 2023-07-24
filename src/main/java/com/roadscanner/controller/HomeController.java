package com.roadscanner.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
	
public class HomeController {
	
    @GetMapping("/")
    public String index() {
        return "index";
    }
    
    @RequestMapping("/test")
    public String test() {
        return "test";
    }

}
