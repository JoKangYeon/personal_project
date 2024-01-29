package com.study.market_board.service;

import com.study.common.attach.vo.AttachVO;
import com.study.common.vo.PagingVO;
import com.study.market_board.vo.MbVO;

import java.util.List;

public interface IMbService {
    public List<MbVO> getMarketBoardList(String cate, String sort, PagingVO paging, String searchWord);
    public  void insertMb(MbVO mbVO);

    public MbVO getMbBoard(int mbNo);


}
