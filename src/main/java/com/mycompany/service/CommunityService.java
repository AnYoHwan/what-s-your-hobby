package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.vo.CommunityVO;
import com.mycompany.vo.SearchCriteria;

public interface CommunityService {

	// 커뮤니티 생성
	public void leader(CommunityVO communityVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 커뮤니티 목록 조회
	public List<CommunityVO> list(SearchCriteria scri) throws Exception;
	
	// 커뮤니티 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 커뮤니티 조회
	public CommunityVO read(int coseq) throws Exception;
	
	// 커뮤니티 수정
	public void update(CommunityVO communityVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 커뮤니티 삭제
	public void delete(int coseq) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운'
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}
