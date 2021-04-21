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
<title>회원가입</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#nick").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nick").focus();
					return false;
				}
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
			});
		})
			
			function fn_idChk(){
				$.ajax({
					url : "/member/idChk",
					type : "post",
					dataType : "json",
					data : {"id" : $("#id").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							$("#idChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}
					}
				})
			}
		function fn_nickChk(){
			$.ajax({
				url : "/member/nickChk",
				type : "post",
				dataType : "json",
				data : {"nick" : $("#nick").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 닉네임입니다.");
					}else if(data == 0){
						$("#nickChk").attr("value", "Y");
						alert("사용가능한 닉네임입니다.");
					}
				}
			})
		}
		</script>
<body>
<section id="container">
	<form action="/member/register" method="post">
		<div class="form-group has-feedback">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id" />
			<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="nick">닉네임</label>
			<input class="form-control" type="text" id="nick" name="nick" />
			<button class="nickChk" type="button" id="nickChk" onclick="fn_nickChk();" value="N">중복확인</button>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pw">패스워드</label>
			<input class="form-control" type="password" id="pw" name="pw" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="text" id="email" name="email" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="gender">성별</label>
			<input type="radio" id="gender" name="gender" value="남" checked="checked">남
		    <input type="radio" id="gender" name="gender" value="여">여
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="age">연령</label>
			<input type="radio" id="age" name="age" value="10대" checked="checked">10대
		    <input type="radio" id="age" name="age" value="20대">20대
		    <input type="radio" id="age" name="age" value="30대">30대
		    <input type="radio" id="age" name="age" value="40대">40대
		    <input type="radio" id="age" name="age" value="50대">50대
		    <input type="radio" id="age" name="age" value="60대">60대
		    <input type="radio" id="age" name="age" value="70대이상">70대이상
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">회원가입</button>
			<button class="cencle btn btn-danger" type="button">취소</button>
		</div>
</form>
</section>
</body>
</html>