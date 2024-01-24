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
        List<MbVO> mbList = mbDao.getMbList();
        List<AttachVO> attaches = attachDao.getAttachList();
        // mbList에 attaches 값 넣어주기
        for (MbVO mbVO : mbList){
            for (AttachVO attach : attaches){
                if(mbVO.getMbNo() == attach.getAtchParentNo()){
                    mbVO.getAttaches().add(attach);
                    System.out.println(attach);
                }
            }
        }

        return mbList;
    }

    @Override
    public void insertMb(MbVO mbVO) {
        // 현재 parentNo의 값이 0인데 selectkey를 사용해서 값변경
        mbDao.insertMb(mbVO);
        //89

        System.out.println("=======>  " + mbVO.getMbNo());

        List<AttachVO> attaches = mbVO.getAttaches();
        if(attaches != null){
            for (AttachVO attach : attaches){
                attach.setAtchParentNo(mbVO.getMbNo());
                attachDao.insertAttach(attach);
            }
        }
    }

    @Override
    public List<MbVO> getOldMarketBoardList() {

        return mbDao.getOldMbList();
    }


}
