package com.roadscanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UploadController {
	
	@GetMapping(value = "/feedback") //http://localhost:8080/road-scanner/feedback
	public String feedback() {
		return "feedback";
	}
	
	@GetMapping(value = "/upload")
	public String upload() {
		return "upload";
	}
}
