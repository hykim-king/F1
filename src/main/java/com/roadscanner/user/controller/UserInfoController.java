package com.roadscanner.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.roadscanner.domain.MemberVO;
import com.roadscanner.user.service.UserService;

@Controller
public class UserInfoController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		
		System.out.println("= = = = = = = = = = = = = = = = = =");
		System.out.println("로그인 성공, 마이페이지 시작");
		System.out.println("= = = = = = = = = = = = = = = = = =");
		
		return "mypage";
		
	}
	
}
