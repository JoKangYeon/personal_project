package com.study.market_board.dao;

import com.study.market_board.vo.MbVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface IMbDao {

    List<MbVO> getMbList(@Param(value = "sort") String sort, @Param(value = "cate") String cate);
    void insertMb(MbVO mbVO);

}
