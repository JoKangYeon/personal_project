package com.study.market_login.service;

import com.study.member.dao.IMemberDao;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;


@Service
public class ILoginServiceImpl implements ILoginService {

    @Inject
    IMemberService memberService;

    @Override
    public MemberVO getUser(String id, String pw) {
        MemberVO member = memberService.getMember(id);

        if(member == null){
            return null;
        }
        if(!StringUtils.equals(member.getMmPassword(), pw) ){
            return null;
        }

        // 관리자 식별
//        if(StringUtils.equals(member.getMmId(), id) && StringUtils.equals(member.getMmPassword(), pw)){
//        }
        return member;
    }
}
