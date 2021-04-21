package com.mycompany.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.dao.ReplyDAO;
import com.mycompany.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;
	
	// 댓글조회
	@Override
	public List<ReplyVO> readReply(int coseq) throws Exception {
		return dao.readReply(coseq);
	}
	
	// 댓글작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}
	
	// 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}
	
	// 댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}
	
	// 선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int crseq) throws Exception{
		return dao.selectReply(crseq);
	}
}
