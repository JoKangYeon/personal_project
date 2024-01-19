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
    public String registMember(MemberVO member) {

        List<MemberVO> memberList = memberDao.getMemberList();

        // ID 중복확인
        for(MemberVO dbMember : memberList){
            if(dbMember.getMmId().equals(member.getMmId())){
                return "중복된 ID입니다.";
            }
        }

        // 여기오면 중복안됨

        String regex = "/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$]).{8,16}$/";

        boolean checkPw = Pattern.matches(regex, member.getMmPassword());

        if(!checkPw){
            return "숫자와 알파벳 그리고 !,@,#,$ 중 1가지 이상 포함한 8~16글자로 입력해주세요.";
        }

        return "회원가입 성공";
    }

}
