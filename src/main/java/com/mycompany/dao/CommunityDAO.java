package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.vo.CommunityVO;
import com.mycompany.vo.SearchCriteria;


public interface CommunityDAO {

	// 커뮤니티 생성
	public void leader(CommunityVO communityVO) throws Exception;
	
	// 커뮤니티 목록 조회
	public List<CommunityVO> list(SearchCriteria scri) throws Exception;
	
	// 커뮤니티 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 커뮤니티 조회
	public CommunityVO read(int coseq) throws Exception;
	
	// 커뮤니티 수정
	public void update(CommunityVO communityVO) throws Exception;
	
	// 커뮤니티 삭세
	public void delete(int coseq) throws Exception;
	
	// 커뮤니티 파일업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
    // 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
}
