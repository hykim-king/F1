package com.roadscanner.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.roadscanner.cmn.MessageVO;
import com.roadscanner.domain.MemberVO;
import com.roadscanner.user.service.UserService;

@Controller
public class WithdrawController {
    
    @Autowired
    UserService userService;

    /**
     * 회원 탈퇴 페이지로 이동
     * @return 회원 탈퇴 페이지 뷰 이름
     */
    @RequestMapping(value = "/withdraw", method = RequestMethod.GET)
    public String withdrawPageStart() {
        System.out.println("회원 탈퇴 페이지로 이동...");
        return "withdraw";
    }

    /**
     * 회원 탈퇴 처리
     * @param user 회원 정보 (비밀번호가 담긴 객체)
     * @return JSON 형태의 응답 데이터
     */
    @RequestMapping(value = "/withdrawProcess", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String withdraw(MemberVO user) {
        System.out.println("┌────────────────────────────────────────────────────────┐");
        System.out.println("│ withdraw()                                            │");
        System.out.println("└────────────────────────────────────────────────────────┘");
        
        String jsonString = "";
        MessageVO message = new MessageVO();
        
        // UserService에 비밀번호가 일치하는지 확인하는 메서드가 있다고 가정하고 사용합니다.
        int withdrawStatus = userService.doWithdraw(user);
        
        if (withdrawStatus == 1) {
            // 탈퇴 처리 성공
            int deleteStatus = userService.doWithdraw(user);
            if (deleteStatus == 1) {
                message.setMsgId("30");
                message.setMsgContents("탈퇴되었습니다.");
            } else {
                message.setMsgId("20");
                message.setMsgContents("회원 탈퇴에 실패했습니다.");
            }
        } else {
            // 비밀번호가 일치하지 않아 탈퇴 처리 실패
            message.setMsgId("10");
            message.setMsgContents("비밀번호를 확인해 주세요.");
        }
        
        jsonString = new Gson().toJson(message);
        return jsonString;
    }
}