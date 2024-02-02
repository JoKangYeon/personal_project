package com.study.reply.service;

import com.study.common.vo.PagingVO;
import com.study.reply.vo.ReplyVO;

import java.util.List;

public interface IReplyService {
public List<ReplyVO> getReplyListByParent(PagingVO paging, ReplyVO reply);
public void modifyReply(ReplyVO reply);
public void removeReply(ReplyVO reply);

public void registReply(ReplyVO reply) ;

/* 부모 번호 댓글 수 */
public  int getReplyCountByParent(PagingVO paging, String reCategory, int reparentNo);


}




