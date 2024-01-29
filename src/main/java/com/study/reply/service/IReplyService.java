package com.study.reply.service;

import com.study.common.vo.PagingVO;
import com.study.reply.vo.ReplyVO;

import java.util.List;

public interface IReplyService {
public List<ReplyVO> getReplyListByParent(PagingVO paging, String reCategory, int reParentNo);
public void modifyReply(ReplyVO reply);
public void removeReply(ReplyVO reply);
/* 댓글 등록 */
public void registReply(ReplyVO reply) ;


}




