<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="navbar-brand text-warning" href="<%=request.getContextPath() %>/index.jsp">메인으로</a></li>
			<li class="nav-item"><a class="navbar-brand text-warning" href="<%=request.getContextPath()%>/selectEbookListByMain.jsp">Ebook</a></li>
			<li class="nav-item"><a class="navbar-brand text-warning" href="<%=request.getContextPath()%>/selectNoticeList.jsp">공지사항</a></li>
			<li class="nav-item"><a class="navbar-brand text-warning" href="<%=request.getContextPath()%>/selectQnaList.jsp">QnA 게시판</a></li>
		</ul>
	
<%
		if(session.getAttribute("loginMember") == null) {
%>
			<!-- 로그인 전  -->
			<div><a class="btn btn-success" href="<%=request.getContextPath() %>/loginForm.jsp">로그인</a></div>
			<div><a class="btn btn-danger" href="<%=request.getContextPath() %>/insertMemberForm.jsp">회원가입</a></div><!-- insertMemberAction.jsp -->
<%		
		} else {
			Member loginMember = (Member)session.getAttribute("loginMember");
%>
			<!-- 로그인 -->
			<div class="text-white"><%=loginMember.getMemberName()%>님 반갑습니다.</div>
			<p></p>
			<div><a class="btn btn-outline-danger" href="<%=request.getContextPath() %>/logout.jsp">로그아웃</a></div><br>
<%
			if(loginMember.getMemberLevel() == 0) {
%>
				<!-- 회원정보 페이지로 가는 링크 -->
				<div><a class="btn btn-outline-info" href="<%=request.getContextPath() %>/selectMemberOne.jsp?memberNo=<%=loginMember.getMemberNo()%>">회원정보</a></div><br>
				<div><a class="btn btn-outline-warning" href="<%=request.getContextPath() %>/selectOrderListByMember.jsp">나의 주문</a></div><br>
<%				
			}
%>
<%	
			if(loginMember.getMemberLevel() > 0) {
%>
				<!-- 관리자 페이지로 가는 링크 -->
				<div><a class="btn btn-outline-primary" href="<%=request.getContextPath() %>/admin/adminindex.jsp">관리자 페이지</a></div>
<%				
			}
%>
<%	
		}
%>
	</nav>