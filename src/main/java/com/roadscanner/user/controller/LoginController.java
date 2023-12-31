package com.roadscanner.user.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.roadscanner.cmn.MessageVO;
import com.roadscanner.domain.MemberVO;
import com.google.gson.Gson;
import com.roadscanner.user.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {	
	final Logger LOG = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	UserService userService;
	
	/**
	 * 로그인 화면에 처음 접근할때 호출 하는 함수
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPageStart(@ModelAttribute("user") MemberVO vo) {
		System.out.println("로그인 화면으로 이동...");
		return "login";
	}
	
	/**
	 * 로그인 화면에서 로그인 버튼을 눌렀을때 post로 호출할때 접근하는 함수
	 * @param vo
	 * @param dao
	 * @param model
	 * @param session
	 * @return
	 * @throws SQLException
	 */
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody         //해당 내용이 화면이 아닌 데이터만 던진자고 알려주는 것임
    public String loginButtonEvent(MemberVO user, Model model, HttpSession httpSession ) throws SQLException {        
        LOG.debug("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ loginButtonEvent()                                     │");
        LOG.debug("└────────────────────────────────────────────────────────┘");
        String jsonString = "";        
        LOG.debug("┌────────────────────────────────────────────────────────┐");
        LOG.debug("│ user : "+user);
        MessageVO message = new MessageVO();
        
        // (1 : id 미입력)
        if(null == user.getUid() || "".equals(user.getUid())) {
            message.setMsgId("1");
            message.setMsgContents("아이디를 입력 하세요.");
            return new Gson().toJson(message);        
        }
        // (2 : pass 미입력)
        if(null == user.getUpassword() || "".equals(user.getUpassword())) {
            message.setMsgId("2");
            message.setMsgContents("비밀번호를 입력 하세요.");
            return new Gson().toJson(message);        
        }
        
        int status = this.userService.doLogin(user);        
        if(10==status) {         // (10 : id 오류)
            message.setMsgId("10");
            message.setMsgContents("아이디를 확인 하세요.");
        }else if(20==status) {     // (20 : pass 오류)
            message.setMsgId("20");
            message.setMsgContents("비밀번호를 확인  하세요.");
        }else if(30==status) {                    // (30 : 성공)
            message.setMsgId("30");
            message.setMsgContents(user.getUid()+"가 로그인 되었습니다.");
            
            //----------------------------------------------------------
            //- 사용자 정보 조회 : session처리
            //----------------------------------------------------------
            MemberVO userInfo = userService.selectUser(user);
            if(null!=userInfo) {
                httpSession.setAttribute("user", userInfo);
            }
        }else {
            message.setMsgId("99");
            message.setMsgContents("알수 없는 오류");            
        }
        jsonString = new Gson().toJson(message);
        
        LOG.debug("│ jsonString : "+jsonString);
        LOG.debug("└────────────────────────────────────────────────────────┘");
        return jsonString;        		
	}
    
    
	
	/* 로그아웃시에 셰션 제거 호출  */
    @GetMapping("/logout")
    public String logoutButtonEvent(HttpSession session) {
		session.invalidate();
		return "/";	
	}

    /**
     * 아이디/비밀번호 찾기 화면
     * @return
     */
	@RequestMapping(value = "/findIdPw", method = RequestMethod.GET)
	public String findIdPwStart() {
		System.out.println("아이디/비밀번호 찾기 화면으로 이동...");
		return "findIdAndPw";
	}

    /**
     * 아이디 찾기 기능
     * @param user
     * @param httpSession
     * @return
     * @throws SQLException
     */
    @RequestMapping(value = "/findId", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody         
    public String findId(MemberVO user, HttpSession httpSession) throws SQLException {
        System.out.println("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ findId()                                               │");
        System.out.println("│ 아이디찾기 기능                                                   │");
        System.out.println("└────────────────────────────────────────────────────────┘");
        String jsonString = "";    
        MessageVO message = new MessageVO();
        
        System.out.println("┌────────────────────────────────────────────────────────┐");

        String result = "-1";
        result = this.userService.doSearchId(user);        
        if("-1".equals(result)) {         // (10 : id 오류)
            message.setMsgId("10");
            message.setMsgContents("이메일을 확인해 주세요.");
        }else {                    
            message.setMsgId("30");
            message.setMsgContents("아이디는 " +result+" 입니다.");
            
        }
        jsonString = new Gson().toJson(message);        
        System.out.println("│ jsonString : "+jsonString);
        System.out.println("└────────────────────────────────────────────────────────┘");
        return jsonString;    
    }
    /**
     * 패스워드 찾기 기능
     * @param user
     * @param httpSession
     * @return
     * @throws SQLException
     */
    @RequestMapping(value = "/findPw", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody     
    public String findPw(MemberVO user, HttpSession httpSession) throws SQLException {
        System.out.println("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ findPw()                                               │");
        System.out.println("│ 비밀번호찾기 기능                                                                                     │");
        System.out.println("└────────────────────────────────────────────────────────┘");
        String jsonString = "";    
        MessageVO message = new MessageVO();
        
        System.out.println("┌────────────────────────────────────────────────────────┐");

        String pwresult = "-1";
        pwresult = this.userService.doSearchPw(user);        
        if("-1".equals(pwresult)) {         // (10 : id 오류)
            message.setMsgId("10");
            message.setMsgContents("아이디와 이메일을 확인해 주세요.");
        }else {                    
            message.setMsgId("30");
            message.setMsgContents("비밀번호는 " +pwresult+" 입니다.");
        }
        jsonString = new Gson().toJson(message);        
        System.out.println("│ jsonString : "+jsonString);
        System.out.println("└────────────────────────────────────────────────────────┘");
        return jsonString;    
    }
    
    @RequestMapping(value = "/idDulpCheck", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String membershipIdCheck(MemberVO user, HttpSession httpSession) throws SQLException {
		System.out.println("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ membershipIdCheck()                                    │");
        System.out.println("└────────────────────────────────────────────────────────┘");
        
        String jsonString = "";
        MessageVO message = new MessageVO();
        
        System.out.println("===================================================");
        
        int result = 0;
        result = this.userService.doIdDuplCheck(user);
        
        if(10 == result) {
        	message.setMsgId("10");
        	message.setMsgContents("해당 ID는 사용할 수 없습니다");
        } else if(20 == result) {
        	message.setMsgId("20");
        	message.setMsgContents("사용할 수 있는 ID입니다");
        } 
        
       jsonString = new Gson().toJson(message);
       System.out.println("│ jsonString : "+jsonString);
        
        System.out.println("===================================================");
        
        return jsonString;
	}
    
    @RequestMapping(value = "/emailDulpCheck", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String emailDulpCheck(MemberVO user, HttpSession httpSession) throws SQLException {
		System.out.println("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ membershipIdCheck()                                    │");
        System.out.println("└────────────────────────────────────────────────────────┘");
        
        String jsonString = "";
        MessageVO message = new MessageVO();
        
        System.out.println("===================================================");
        
        int result = 0;
        result = this.userService.doEmailDuplCheck(user);
        
        if(10 == result) {
        	message.setMsgId("10");
        	message.setMsgContents("해당 이메일은 사용할 수 없습니다");
        } else if(20 == result) {
        	message.setMsgId("20");
        	message.setMsgContents("사용할 수 있는 이메일입니다");
        } 
        
       jsonString = new Gson().toJson(message);
       System.out.println("│ jsonString : "+jsonString);
        
        System.out.println("===================================================");
        
        return jsonString;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String membershipRegister(MemberVO user) throws Exception {
		System.out.println("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ membershipRegister()                                   │");
        System.out.println("└────────────────────────────────────────────────────────┘");
        System.out.println("│ user : "+ user.toString());

        
		int flag = this.userService.register(user);
		
		String jsonString = "";
		MessageVO message = new MessageVO();
		
		if(10 == flag) {
			message.setMsgId("10");
			message.setMsgContents("축하합니다, 회원가입에 성공했습니다");
		} else if(20 == flag){
			message.setMsgId("20");
			message.setMsgContents("회원가입에 실패했습니다");
		}	
		
		jsonString = new Gson().toJson(message);
		
		return jsonString;
	}
	}
	

