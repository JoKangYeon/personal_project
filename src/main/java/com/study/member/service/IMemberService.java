package com.study.member.service;

import com.study.member.vo.MemberVO;

import java.util.List;

public interface IMemberService {

    public MemberVO getMember(String memId);
    public List<MemberVO> getMemberList();
    public boolean registMember(MemberVO member);
}
