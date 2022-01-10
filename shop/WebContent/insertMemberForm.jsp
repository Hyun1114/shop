<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
		// 로그인 상태
		if(session.getAttribute("loginMember") != null) {
			// 다시 브라우저에게 다른 곳을 요청
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
%>
	<div class="container bg-dark text-white" style="text-align: center;">
		<h1>회원가입</h1>
<%
			String memberIdCheck="";
			if(request.getParameter("memberIdCheck") != null) {
				memberIdCheck = request.getParameter("memberIdCheck");
			}
%>
		
		<!-- memberId가 사용가능한지 확인 폼 -->
		<form action="<%=request.getContextPath() %>/selectMemberIdCheckAction.jsp" method="post">
			<div class="text-white">
				아이디 중복 검사 : 
				<!--처음 이 페이지에 들어오면 null -->
				<!-- 중복 검사 후 들어오면 '사용중인 아이디 입니다' -->
				<%=request.getParameter("idCheckResult") %>
			</div>
			<div><input type="text" name="memberIdCheck"></div>
			<button class="btn btn-success" type="submit">아이디 중복 검사</button>
		</form>
		
		<!-- 회원가입 폼 -->
		<form action="<%=request.getContextPath() %>/insertMemberAction.jsp" method="post" class=".custom-select">	
		
			<!-- 회원 아이디 -->
			<div class="text-white">아이디 : </div>
			<div><input type="text" name="memberId" readonly="readonly" value="<%=memberIdCheck%>"></div>
			
			<!-- 회원 비밀번호 -->
			<div class="text-white">비밀번호 : </div>
			<div class="text-white"><input type="password" name="memberPw"></div>
			
			<!-- 회원 이름 -->
			<div class="text-white">이름 : </div>
			<div class="text-white"><input type="text" name="memberName"></div>
			
			<!-- 회원 나이 -->
			<div class="text-white">나이 : </div>
			<div><input type="text" name="memberAge"></div>
			
			<!-- 회원 성별 -->
			<div class="text-white">성별 : </div>
			<div>
			<input type="radio" name="memberGender" value="남">남
			<input type="radio" name="memberGender" value="여">여
			</div>
			
			<br><button class="btn btn-success" type="submit">회원가입</button>
			<button class="btn btn-danger" type="reset">초기화</button>
		</form>
	</div>
</body>
</html>