package com.study.market_board.dao;

import com.study.market_board.vo.MbVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMbDao {

    public List<MbVO> getMbList();
//    public int insertMb(MbVO mbVO);
}
