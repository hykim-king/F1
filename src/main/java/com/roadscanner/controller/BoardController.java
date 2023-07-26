package com.roadscanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@GetMapping("/")
	public String amollaboardListView() {
		return "/board/list_user";
	}

    @GetMapping("/write")
    public String writeView() {
        return "/board/write";
    }
    
    @GetMapping("/admin")
    public String boardAdminView() {
    	return "/board/list_admin";
    }
    
    @GetMapping("/admin/write")
    public String adminPostWrite() {
        return "/board/admin-post-write";
        
    }
}
