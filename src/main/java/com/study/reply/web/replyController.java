package com.study.reply.web;


import com.study.common.vo.PagingVO;
import com.study.reply.service.IReplyService;
import com.study.reply.vo.ReplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

@Controller
public class replyController {

    @Inject
    IReplyService replyService;


    @RequestMapping("/reply/replyList")
    public String replyList(Model model, PagingVO paging, ReplyVO reply){
        List<ReplyVO> replyList = replyService.getReplyListByParent(paging, reply.getReCategory(), reply.getReNo());
        model.addAttribute("replyList", replyList);
        return "market_board/replyBox";
    }

    @ResponseBody
    @RequestMapping("/reply/replyRegist")
    public void registReply(ReplyVO reply){
        replyService.registReply(reply);
    }

    @ResponseBody
    @RequestMapping("/reply/replyModify")
    public void modifyReply(ReplyVO reply){

            replyService.modifyReply(reply);


    }

    @ResponseBody
    @RequestMapping("/reply/replyDelete")
    public void deleteReply(ReplyVO reply){

            replyService.removeReply(reply);

    }




}
