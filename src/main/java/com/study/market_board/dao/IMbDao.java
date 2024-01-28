package com.study.market_board.dao;

import com.study.common.vo.PagingVO;
import com.study.market_board.vo.MbVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface IMbDao {

    public List<MbVO> getMbList(@Param("cate") String cate, @Param("sort") String sort, @Param( value= "paging") PagingVO paging, @Param("searchWord") String searchWord);
    public void insertMb(MbVO mbVO);
    public int getTotalRowCount(@Param("cate") String cate, @Param("searchWord") String searchWord);

}
