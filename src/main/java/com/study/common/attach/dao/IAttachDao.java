package com.study.common.attach.dao;

import com.study.common.attach.vo.AttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAttachDao {

    int insertAttach(AttachVO attachVO);

    public List<AttachVO> getAttachList();


}
