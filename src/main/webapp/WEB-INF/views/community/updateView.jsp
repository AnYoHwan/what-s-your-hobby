<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
			$(document).ready(function(){
				var formObj = $("form[name='updateForm']");
				
				$(document).on("click","#fileDel", function(){
					$(this).parent().remove();
				})
				
				fn_addFile();
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/community/readView?coseq=${update.coseq}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/community/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
					}
				}
			}
 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
		
	</script>
<body>
<div class="container">
<header>
<h1> 커뮤니티 </h1>
</header>
<hr />
	<div>
		<%@include file="nav.jsp" %>
	</div>
<hr />
<section id="container">
<form name="updateForm" role="form" method="post" action="/community/update" enctype="multipart/form-data">
<input type="hidden" name="coseq" value="${update.coseq}" readonly="readonly"/>
<input type="hidden" id="page" name="page" value="${scri.page}"> 
<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
	<div class="form-group">
			<label for="leader" class="col-sm-2 control-label">모임장</label>
			<input type="text" id="leader" name="leader" value="${update.leader}" readonly="readonly"/>
	</div>
	<div class="form-group">
			<label for="category" class="col-sm-2 control-label">카테고리</label>
			<input type="text" id="category" name="category" value="${update.category}" class="chk" title="카테고리를 입력하세요."/>
	</div>
	<div class="form-group">
			<label for="place" class="col-sm-2 control-label">모임장소</label>
			<select name="place">
		    	<option value="서울" selected="selected">서울</option>
		    	<option value="경기">경기</option>
		    	<option value="충남">충남</option>
		    	<option value="충복">충복</option>
		    	<option value="경남">경남</option>
		    	<option value="경북">경북</option>
		    	<option value="전북">전북</option>
		    	<option value="전남">전남</option>
		    	<option value="인천">인천</option>
		    	<option value="대전">대전</option>
		    	<option value="대구">대구</option>
		    	<option value="울산">울산</option>
		    	<option value="광주">광주</option>
		    	<option value="부산">부산</option>
		    	<option value="제주">제주</option>
	    	</select>
	</div>
	<div class="form-group">
			<label for="intro" class="col-sm-2 control-label">모임소개</label>
			<textarea id="intro" name="intro" class="chk" title="모임소개를 입력하세요."><c:out value="${update.intro}"/></textarea>
	</div>
	<div class="form-group">
			<label for="regdate" class="col-sm-2 control-label">모임생성</label>
			<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
	</div>
	<div id="fileIndex">
			<c:forEach var="file" items="${file}" varStatus="var">
	<div>
			<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
			<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
			<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
			<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
	</div>
	</c:forEach>
	</div>
<div>
<button type="button" class="update_btn btn btn-warning">저장</button>
<button type="button" class="cancel_btn btn btn-danger">취소</button>
<button type="button" class="fileAdd_btn">파일추가</button>
</div>
</form>
</section>
<hr />
</div>
</body>
</html>