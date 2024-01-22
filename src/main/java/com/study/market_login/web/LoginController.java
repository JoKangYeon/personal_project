package com.study.market_login.web;

import com.study.common.util.CookieUtils;
import com.study.market_login.service.ILoginService;
import com.study.member.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.servlet.http.*;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class LoginController {

    @Inject
    ILoginService loginService;

    @GetMapping("/login/login.wow")
    public String loginGet(Model model, HttpServletRequest req){

        String remId = "";
        for(Cookie cookie : req.getCookies()){
            if(cookie.getName().equals("SAVE_ID")){
                remId = cookie.getValue();
            }
        }
        model.addAttribute("remId", remId);


        return "/login/login";
    }

    @PostMapping("/login/login.wow")
    public String loginPost(Model model,  String userId,  String userPw, @RequestParam(value = "rememberMe", required = false)
                            String saveId, HttpServletResponse resp, HttpServletRequest req, HttpSession session) throws Exception {

        MemberVO user = loginService.getUser(userId, userPw);   // DB 데이터
        boolean checkNon = (userId == null || userId.isEmpty() || userPw == null || userPw.isEmpty());

        // ID저장하기 선택안한 경우
        if(saveId == null) {    // 쿠키 만들어주기
            CookieUtils cookieUtils = new CookieUtils(req);     // common의 만들어 둔 CookieUtil활용
            if (cookieUtils.exists("SAVE_ID")){ // 쿠키가 존재하지않는게 true라면
                Cookie cookie = CookieUtils.createCookie("SAVE_ID", userId, "/", 0);
                resp.addCookie(cookie);
            }
            saveId = "";    // null 대신 빈문자 처리
        }

        if(user == null || checkNon){   // 입력한 id 또는 비밀번호가 틀린 경우, 사용자가 입력안한 경우
            model.addAttribute("Wrong", null);
            return "redirect:/login/login.com?msg=" + URLEncoder.encode("ID 또는 비밀번호를 확인해주세요.", "utf-8");
        }

        // 위 2가지 경우가 아니면 로그인 성공

        if(saveId.equals("Y")){
            Cookie cookie = CookieUtils.createCookie("SAVE_ID", userId, "/", 60 * 60 * 24 * 7); // 일주일 기억
            resp.addCookie(cookie);
        }

        session.setAttribute("USER", user);
        model.addAttribute("USER", user);
        return "redirect:/market_board/boardList.com";
    }





    @RequestMapping("/login/logout.wow")
    public String logout(){
        return "/market_board/boardList";
    }



    @RequestMapping("/login/signup.wow")
    public String goSignup(){
        return "/login/signup";
    }




}
