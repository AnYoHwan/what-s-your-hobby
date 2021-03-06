package com.mycompany.service;

import java.util.List;

import com.mycompany.vo.ReplyVO;

public interface ReplyService {

	// 댓글조회
	public List<ReplyVO> readReply(int coseq) throws Exception;
	
	// 댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	
	// 댓글 수정
	public void updateReply(ReplyVO vo) throws Exception;
	
	// 댓글 삭제
	public void deleteReply(ReplyVO vo) throws Exception;
	
	// 선택된 댓글 조회
	public ReplyVO selectReply(int crseq) throws Exception;
}
