package com.study.market_board.dao;

import com.study.common.vo.PagingVO;
import com.study.market_board.vo.MbVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface IMbDao {

    public List<MbVO> getMbList(@Param("cate") String cate, @Param("sort") String sort, @Param("paging") PagingVO paging);
    public void insertMb(MbVO mbVO);
    public int getTotalRowCount();

}
