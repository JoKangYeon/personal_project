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
    public int registMember(MemberVO member) {
          // 파라미터로 오는값에 대해서는 컨트롤러에서 처리해야함
//        String regex = "/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$]).{8,16}$/";
//        boolean checkPw = Pattern.matches(regex, member.getMmPassword());
//        if(checkPw){
//            memberDao.registMember(member);
//        }

        return memberDao.registMember(member);
    }

}
