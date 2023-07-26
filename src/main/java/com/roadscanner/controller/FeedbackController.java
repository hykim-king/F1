package com.roadscanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedbackController {
	
	@GetMapping(value = "/feedback")
	public String feedback() {
		return "feedback";
//	http://localhost:8080/road-scanner/feedback
	}
}
