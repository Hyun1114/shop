<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인증 방어 코드 : 로그인 전에만 페이지 열람 가능
	// session.getAttribute("loginMember") --> null
	
	if(session.getAttribute("loginMember") != null) {
		System.out.println("이미 로그인 되어 있습니다.");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container p-3 my-3 bg-dark text-white" style="text-align: center;">
		<!-- start :  sub menu include -->
		<div>
			<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
		</div>
		<!-- end : sub menu include -->
		<div>
			<form id="loginForm" action="<%=request.getContextPath() %>/loginAction.jsp" class=".custom-select">
			<h1 style="text-align : center">로그인</h1>
				<div class="text-white">아이디 : </div>
				<div><input type="text" id="memberId" name="memberId"></div><br>
				<div class="text-white">비밀번호 : </div>
				<div><input type="password" id="memberPw" name="memberPw"></div><br>
				<div><button id="loginBtn" class="btn btn-warning" type="button">로그인</button></div>
			</form>
		</div>
	</div>
	<script>
		let loginBtn = $('#loginBtn').click(function() {
			if($('#memberId').val() == '') { // id가 공백이면
				alert('아이디를 입력해주세요!');
				return;
			} else if($('#memberPw').val() == '') { // pw가 공백이면
				alert('비밀번호를 입력해주세요!');
			} else {
				// 버튼을 클릭 했을 때
				// <button type="button"> -> <button type="submit">
				$('#loginForm').submit();
			}
		});
	</script>
</body>
</html>