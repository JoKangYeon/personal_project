package com.study.member.service;

import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.regex.Pattern;

@Service
public class IMemberServiceImpl implements IMemberService {

    @Inject
    IMemberDao memberDao;


    @Override
    public MemberVO getMember(String memId) {
        return memberDao.getMember(memId);
    }

    @Override
    public List<MemberVO> getMemberList() {
        return memberDao.getMemberList();
    }

    @Override
    public boolean registMember(MemberVO member) {

        String regex = "/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$]).{8,16}$/";

        boolean checkPw = Pattern.matches(regex, member.getMmPassword());

        if(checkPw){
            memberDao.registMember(member);
        }

        return checkPw;
    }

}
