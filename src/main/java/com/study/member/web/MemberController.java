package com.study.member.web;

import com.study.member.service.IMemberServiceImpl;
import com.study.member.vo.MemberVO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

@Controller
public class MemberController {

    @Inject
    IMemberServiceImpl memberService;


    // ID중복확인 Ajax
    @ResponseBody
    @RequestMapping("/idCheck.com")
    public ResponseEntity<MemberVO> idCheck(String mmId){
        MemberVO member = memberService.getMember(mmId);
        System.out.println(member);
//        if(member == null){
//            return member;
//        }else {
//            return member;
//        }
        return ResponseEntity.ok(member);
    }

    @RequestMapping("/registMember.com")
    public String registMember(String checkDup, MemberVO member, Model model){

        model.addAttribute(checkDup);
        String result = memberService.registMember(member);




        return "market_board/boardList";


    }



}
