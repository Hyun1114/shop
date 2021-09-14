<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<!-- start :  sub menu include -->
	<div>
		<jsp:include page="/partial/submenu.jsp"></jsp:include>
	</div>
	<!-- end : sub menu include -->
	<div class="container p-3 bg-dark text-white" style="text-align: center;">
	<h1>메인 화면</h1>
<%
	if(session.getAttribute("loginMember") == null) {
%>
		<!-- 로그인 전  -->
		<div><a class="btn btn-success" href="<%=request.getContextPath() %>/loginForm.jsp">로그인</a></div>
		<br><div><a class="btn btn-danger" href="<%=request.getContextPath() %>/insertMemberForm.jsp">회원가입</a></div><!-- insertMemberAction.jsp -->
<%		
	} else {
		Member loginMember = (Member)session.getAttribute("loginMember");
%>
		<!-- 로그인 -->
		<div class="text-white"><%=loginMember.getMemberName()%>님 반갑습니다.</div><br>
		<div><a class="btn btn-outline-danger" href="<%=request.getContextPath() %>/logout.jsp">로그아웃</a></div><br>
		<div><a class="btn btn-outline-info" href="<%=request.getContextPath() %>/selectMemberOne.jsp">회원정보</a></div>
<%	
	}
%>
</div>
</body>
</html>