package com.study.member.web;

import com.study.member.service.IMemberServiceImpl;
import com.study.member.vo.MemberVO;
import org.apache.poi.ss.formula.functions.Mode;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MemberController {

    @Inject
    IMemberServiceImpl memberService;


    // ID중복확인 Ajax
    @RequestMapping(value = "/idCheck.wow")
    @ResponseBody
    public boolean idCheck(String mmId, Model model){
        MemberVO member = memberService.getMember(mmId);
        if (member == null){
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("/registMember.wow")
    public String registMember(String checkDup, MemberVO member, Model model){

        model.addAttribute("checkDup", checkDup);
        boolean result = memberService.registMember(member);

        return "market_board/boardList";


    }





}
