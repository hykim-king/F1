package com.roadscanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/")
    public String listUserView() {
        return "/board/list_user";
    }

    @GetMapping("/write")
    public String writeView() {
        return "/board/write";
    }

    @GetMapping("/admin/write")
    public String adminPostWrite() {
        return "/board/admin-post-write";
    }
}
