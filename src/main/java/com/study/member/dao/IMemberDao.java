package com.study.member.dao;

import com.study.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMemberDao {
    public MemberVO getMember(String mmId);
    public List<MemberVO> getMemberList();
    public int registMember(MemberVO member);

}