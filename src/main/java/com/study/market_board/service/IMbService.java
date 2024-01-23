package com.study.market_board.service;

import com.study.common.attach.vo.AttachVO;
import com.study.market_board.vo.MbVO;

import java.util.List;

public interface IMbService {
    public List<MbVO> getMarketBoardList();
    public  void insertMb(MbVO mbVO);
}
