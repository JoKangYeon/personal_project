package com.study.market_login.service;

import com.study.member.vo.MemberVO;

public interface ILoginService {
    public MemberVO getUser(String id, String pw);
}
