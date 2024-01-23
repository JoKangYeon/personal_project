package com.study.market_board.service;

import com.study.common.attach.dao.IAttachDao;
import com.study.common.attach.vo.AttachVO;
import com.study.market_board.dao.IMbDao;
import com.study.market_board.vo.MbVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class IMbServiceImpl implements IMbService {

   @Inject
    IMbDao mbDao;

   @Inject
    IAttachDao attachDao;

    @Override
    public List<MbVO> getMarketBoardList() {
        return mbDao.getMbList();
    }

    @Override
    public void insertMb(MbVO mbVO) {

        mbDao.insertMb(mbVO);

        List<AttachVO> attaches = mbVO.getAttaches();
        if(attaches != null){
            for (AttachVO attach : attaches){
                attach.setAtchParentNo(mbVO.getMbNo());
                attachDao.insertAttach(attach);
            }
        }
    }


}
