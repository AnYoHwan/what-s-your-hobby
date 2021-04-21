package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.CommunityVO;
import com.mycompany.vo.SearchCriteria;

@Repository
public class CommunityImpl implements CommunityDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 커뮤니티 생성
	@Override
	public void leader(CommunityVO communityVO) throws Exception {
		sqlSession.insert("communityMapper.insert", communityVO);
	}
	
	// 커뮤니티 목록 조회
	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception{
		return sqlSession.selectList("communityMapper.listPage", scri);
	}
	
	// 커뮤니티 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("communityMapper.listCount", scri);
	}
	
	// 커뮤니티 조회
	@Override
	public CommunityVO read(int coseq) throws Exception{
		return sqlSession.selectOne("communityMapper.read", coseq);
	}

	// 커뮤니티 수정
	@Override
	public void update(CommunityVO communityVO) throws Exception {
		sqlSession.update("communityMapper.update", communityVO);
	}
	
	// 커뮤니티 삭제
	@Override
	public void delete(int coseq) throws Exception {
		sqlSession.delete("communityMapper.delete", coseq);
	}
	
	// 커뮤니티 파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("communityMapper.insertFile", map);
	}
	
   	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("communityMapper.selectFileList", bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("communityMapper.selectFileInfo", map);
	}
	
	// 첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("communityMapper.updateFile", map);
	}
}
