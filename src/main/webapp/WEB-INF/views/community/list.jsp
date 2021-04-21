<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>커뮤니티 목록</title>
	<style type="text/css">
		li {list-style: none; float: left; padding: 6px;}
	</style>
</head>

<body>
<div class="container">
<header>
<h1> 커뮤니티 목록 </h1>
</header>
<hr />
	<div>
		<%@include file="nav.jsp" %>
	</div>
<hr />
<section id="container">
<form role="form" method="get">
<table class="table table-hover">
	<tr><th>이미지</th><th>번호</th><th>모임장</th><th>카테고리</th><th>등록일</th></tr>
		<c:forEach items="${list}" var = "list">
	<tr>
		<td><c:out value="${list.coseq}" /></td>
		<td><c:out value="${list.leader}" /></td>
		<td>
			<a href="/community/readView?coseq=${list.coseq}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.category}" /></a>
		</td>
		<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
	</tr>
</c:forEach>
</table>
  <div class="search row">
  	<div class="col-xs-2 col-sm-2">
    <select name="searchType" class="form-control">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>제목</option>
      <option value="i"<c:out value="${scri.searchType eq 'i' ? 'selected' : ''}"/>>내용</option>
      <option value="l"<c:out value="${scri.searchType eq 'l' ? 'selected' : ''}"/>>작성자</option>
      <option value="ci"<c:out value="${scri.searchType eq 'ci' ? 'selected' : ''}"/>>제목+내용</option>
    </select>
    </div>

	<div class="col-xs-10 col-sm-10">
		<div class="input-group">
    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
	<span class="input-group-btn">
    <button id="searchBtn" type="submit" class="btn btn-default">검색</button>
    </span>
    </div>
    </div>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
<div class="col-md-offset-3">
  <ul class="pagination">
    <c:if test="${pageMaker.prev}">
    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	
    	<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}"/>>
    	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>

</div>
</form>
</section>
<hr />
</div>
</body>
</html>