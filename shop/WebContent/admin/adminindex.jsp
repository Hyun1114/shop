<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<div class="container p-3 bg-dark text-white" style="text-align: center;">
	<!-- 관리자 메뉴 include -->
		<div>
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
		</div>
	<!-- 관리자 메뉴 end -->
	<div>
	<h1>관리자 페이지</h1>
	<div class="text-white"><%=loginMember.getMemberId()%>님 반갑습니다.</div><br>
	<div><a class="btn btn-outline-success" href="<%=request.getContextPath() %>/index.jsp">이전</a></div>
	</div>
</div>
</body>
</html>