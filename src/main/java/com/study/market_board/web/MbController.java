package com.study.market_board.web;

import com.study.common.attach.vo.AttachVO;
import com.study.common.util.StudyAttachUtils;
import com.study.common.vo.PagingVO;
import com.study.market_board.service.IMbService;
import com.study.market_board.vo.MbVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public String marketHome(Model model, @ModelAttribute("paging") PagingVO paging){  // Home이지만 List가 홈임
        String sort = "DESC";
        String cate = "MBC01";
        String searchWord = "";
        List<MbVO> marketBoardList = mbService.getMarketBoardList(cate, sort, paging, searchWord);


        model.addAttribute("marketBoardList", marketBoardList);
        return "market_board/boardList";
    }

    @RequestMapping("/market_board/boardView.wow")
    public String marketView(Model model){
        return "market_board/boardView";
    }

    @RequestMapping("/market_board/boardList.wow")
    public String marketList(Model model, @ModelAttribute("paging") PagingVO paging){
        List<MbVO> marketBoardList = mbService.getMarketBoardList("MBC01","DESC", paging, "");
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
    public String setBoardByDate(Model model, String sort, String cate,Integer viewCnt, Integer curPageVal, @ModelAttribute("paging") PagingVO paging, String searchWord) {  // 시간 있으면 객체로 만들기

        paging.setRowSizePerPage(viewCnt);
        paging.setCurPage(curPageVal);
        List<MbVO> marketBoardList = mbService.getMarketBoardList(cate,sort,paging, searchWord);

        model.addAttribute("marketBoardList", marketBoardList);

        return "market_board/listBox";
    }

    @RequestMapping("/setPage.wow")
    public String setPage(Model model, String sort, String cate,Integer viewCnt, Integer curPageVal, @ModelAttribute("paging") PagingVO paging, String searchWord) {  // 시간 있으면 객체로 만들기

        paging.setRowSizePerPage(viewCnt);
        paging.setCurPage(curPageVal);
        List<MbVO> marketBoardList = mbService.getMarketBoardList(cate,sort,paging, searchWord);

        model.addAttribute("marketBoardList", marketBoardList);

        return "market_board/pageBox";
    }





















}
