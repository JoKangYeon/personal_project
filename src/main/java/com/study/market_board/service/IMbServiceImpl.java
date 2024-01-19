package com.study.market_board.service;

import com.study.market_board.dao.IMbDao;
import com.study.market_board.vo.MbVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class IMbServiceImpl implements IMbService {

   @Inject
    IMbDao mbDao;


    @Override
    public List<MbVO> getMarketBoardList() {
        return mbDao.getMbList();
    }




}
