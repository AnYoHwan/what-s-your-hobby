package com.mycompany.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.dao.CommunityDAO;
import com.mycompany.utill.FileUtils;
import com.mycompany.vo.CommunityVO;
import com.mycompany.vo.SearchCriteria;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Inject
	private CommunityDAO communitydao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// 커뮤니티 생성 작성
	@Override
	public void leader(CommunityVO communityVO, MultipartHttpServletRequest mpRequest) throws Exception {
		communitydao.leader(communityVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(communityVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			communitydao.insertFile(list.get(i)); 
		}
	}
	
	// 커뮤니티 목록 조회
	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception {
		return communitydao.list(scri);
	}
	
	// 커뮤니티 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return communitydao.listCount(scri);
	}
	
	// 커뮤니티 조회
	@Override
	public CommunityVO read(int coseq) throws Exception {
		return communitydao.read(coseq);
	}
	
	// 커뮤니티 수정
	@Override
	public void update(CommunityVO communityVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		communitydao.update(communityVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(communityVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				communitydao.insertFile(tempMap);
			}else {
				communitydao.updateFile(tempMap);
			}
		}
	}
	
	// 커뮤니티 삭제
	@Override
	public void delete(int coseq) throws Exception {
		communitydao.delete(coseq);
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int coseq) throws Exception {
		return communitydao.selectFileList(coseq);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return communitydao.selectFileInfo(map);
	}
}
