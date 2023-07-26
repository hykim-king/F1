package com.roadscanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
	
public class HomeController {
	
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/registerpage")
    public String registerpage() {
        return "registerpage";
    }
    
    @RequestMapping("/test2")
    public String test2() {
        return "test2";
    }
    
    @RequestMapping("/withdraw")
    public String withdraw() {
        return "withdraw";
    }

}