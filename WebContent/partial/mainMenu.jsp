<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>EBS</title>
	<link rel="icon" href="<%=request.getContextPath()%>/tem/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/css/style.css">
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.jsp">EBS</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item submenu dropdown">
                <a href="<%=request.getContextPath()%>/index.jsp" class="nav-link dropdown-toggle">메인으로</a>
				</li>
              <li class="nav-item submenu dropdown">
                <a href="<%=request.getContextPath()%>/selectEbookListByMain.jsp" class="nav-link dropdown-toggle">Ebook</a>
				</li>
				<li class="nav-item submenu dropdown">
                <a href="<%=request.getContextPath()%>/selectNoticeList.jsp" class="nav-link dropdown-toggle">공지사항</a>
              </li>
              <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/selectQnaList.jsp">QnA 게시판</a></li>
            </ul>
            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>      
             </ul>
<%
		if(session.getAttribute("loginMember") == null) {
%>
			<!-- 로그인 전  -->
			<a class="button button-header" href="<%=request.getContextPath() %>/loginForm.jsp">로그인</a></div>
			<a class="button button-header" href="<%=request.getContextPath() %>/insertMemberForm.jsp">회원가입</a></div><!-- insertMemberAction.jsp -->
<%		
		} else {
			Member loginMember = (Member)session.getAttribute("loginMember");
%>
			<!-- 로그인 -->
			<a class="button button-header" href="<%=request.getContextPath() %>/logout.jsp">logout</a><br>
<%
			if(loginMember.getMemberLevel() == 0) {
%>
				<!-- 회원정보 페이지로 가는 링크 -->
				<a class="button button-header" href="<%=request.getContextPath() %>/selectMemberOne.jsp?memberNo=<%=loginMember.getMemberNo()%>">내정보</a><br>
				<a class="button button-header" href="<%=request.getContextPath() %>/selectOrderListByMember.jsp">주문</a><br>
<%				
			}
%>
<%	
			if(loginMember.getMemberLevel() > 0) {
%>
				<!-- 관리자 페이지로 가는 링크 -->
				<div><a class="button button-header" href="<%=request.getContextPath() %>/admin/adminindex.jsp">관리자</a></div>
<%				
			}
%>
<%	
		}
%>
          </div>
        </div>
      </nav>
    </div>
  </header>
  </body>
  </html>