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
<title>커뮤니티</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/community/readView?coseq=${replyUpdate.coseq}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
		})
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
		<form name="updateForm" role="form" method="post" action="/community/replyUpdate">
			<input type="hidden" name="coseq" value="${replyUpdate.coseq}" readonly="readonly"/>
			<input type="hidden" id="crseq" name="crseq" value="${replyUpdate.crseq}" />
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
	<div class="form-group">
			<label for="content" class="col-sm-2 control-label">댓글 내용</label>
			<input type="text" id="content" name="content" value="${replyUpdate.content}"/>
	</div>
	<div>
		<button type="submit" class="update_btn btn btn-warning">저장</button>
		<button type="button" class="cancel_btn btn btn-danger">취소</button>
	</div>
</form>
</section>
<hr />
</div>
</body>
</html>