package com.study.market_board.web;

import com.study.market_board.service.IMbService;
import com.study.market_board.vo.MbVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;

@Controller
public class MbController {

    @Inject
    IMbService MbService;

    @RequestMapping("/")
    public String marketHome(Model model){  // Home이지만 List가 홈임
        List<MbVO> marketBoardList = MbService.getMarketBoardList();
        model.addAttribute("marketBoardList", marketBoardList);
        return "market_board/boardList";
    }

    @RequestMapping("/market_board/boardView.com")
    public String marketView(Model model){
        return "market_board/boardView";
    }

    @RequestMapping("/market_board/boardList.com")
    public String marketList(Model model){
        List<MbVO> marketBoardList = MbService.getMarketBoardList();
        model.addAttribute("marketBoardList", marketBoardList);
        return "market_board/boardList";
    }

}
