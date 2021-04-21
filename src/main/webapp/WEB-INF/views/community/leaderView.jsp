<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>커뮤니티 생성</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/community/leader");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
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
	</script>
<body>
<div class="container">
<header>
<h1> 커뮤니티 생성 </h1>
</header>
<hr/>
	<div>
		<%@include file="nav.jsp" %>
	</div>
<hr />
<section id="container">
<form name="writeForm" method="post" action="/conmmunity/leader" enctype="multipart/form-data">
<c:if test="${member.id != null}">
	<div class="form-group">
			<label for="leader" class="col-sm-2 control-label">모임장</label>
			<input type="text" id="leader" name="leader" class="chk" title="모임장을 입력하세요."/>
	</div>
	<div class="form-group">
			<label for="category" class="col-sm-2 control-label">카테고리</label>
			<input type="text" id="category" name="category" class="chk" title="카테고리를 입력하세요."/>
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
			<textarea id="intro" name="intro" class="chk" title="모임소개를 입력하세요."></textarea>
	</div>
		<div id="fileIndex"></div>
	<div class="form-group">
			<button class="write_btn btn btn-warning" type="submit">개설하기</button>
			<button class="fileAdd_btn" type="button">파일추가</button>
	</div>
	</c:if>
	<c:if test="${member.id == null}">
	<p>로그인 후에 작성하실 수 있습니다.</p>
	</c:if>
	</form>
</section>
<hr />
</div>
</body>
</html>