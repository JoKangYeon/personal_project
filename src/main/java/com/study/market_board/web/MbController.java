package com.study.market_board.web;

import com.study.common.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
import com.study.market_board.service.IMbService;
import com.study.market_board.vo.MbVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MbController {

    @Inject
    IMbService mbService;

    @Inject
    StudyAttachUtils attachUtils;



    @RequestMapping("/")
    public String marketHome(Model model){  // Home이지만 List가 홈임
        List<MbVO> marketBoardList = mbService.getMarketBoardList();


        model.addAttribute("marketBoardList", marketBoardList);
        return "market_board/boardList";
    }

    @RequestMapping("/market_board/boardView.wow")
    public String marketView(Model model){
        return "market_board/boardView";
    }

    @RequestMapping("/market_board/boardList.wow")
    public String marketList(Model model){
        List<MbVO> marketBoardList = mbService.getMarketBoardList();
        model.addAttribute("marketBoardList", marketBoardList);
        return "market_board/boardList";
    }

    @RequestMapping("/market_board/boardForm.wow")
    public String marketForm(Model model){
        return "market_board/boardForm";
    }


    @RequestMapping("/boardRegist.wow")
    public String marketRegist(Model model, MbVO mbVo, @RequestParam(name = "mbFiles", required = false) MultipartFile[] mbFiles) throws IOException {
//        System.out.println("===========>" + mbFiles[0]);
//        System.out.println(mbVo);
        if(mbFiles != null){
            List<AttachVO> attachList = attachUtils.getAttachListByMultiparts(mbFiles,"Market_Board", "market_board");
            mbVo.setAttaches(attachList);
        }
        mbService.insertMb(mbVo);

        return "redirect:market_board/boardList.wow";
    }

    @RequestMapping("/orderBy.wow")
    public List<MbVO> setBoardByDate(String orderBy, String cateBy) {
        List<MbVO> marketBoardList = mbService.getMarketBoardList();

        if(orderBy.equals("DESC")){
            if (cateBy.equals("MBC01")) {
                return marketBoardList;
            }else if(cateBy.equals("MBC02")){

            }else {

            }
        }else {
            if(cateBy.equals("MBC01")) {

            }else if(cateBy.equals("MBC02")){

            }else {

            }
        }



    }
























}
