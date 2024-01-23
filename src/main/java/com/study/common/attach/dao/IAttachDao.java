package com.study.common.attach.dao;

import com.study.common.attach.vo.AttachVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAttachDao {

    int insertAttach(AttachVO attachVO);
}
