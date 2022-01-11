<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>로그인</title>
	<link rel="icon" href="<%=request.getContextPath()%>/tem/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/linericon/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/css/style.css">
</head>
<body>
	<!-- start :  sub menu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<!-- end : sub menu include -->
	
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>로그인 / 회원가입</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.jsp">메인</a></li>
              <li class="breadcrumb-item active" aria-current="page">로그인 / 회원가입</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>EBS에 오신 걸 환영합니다.</h4>
							<p>다양한 책들이 구비되어 있으니 많은 이용 부탁드립니다!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>로그인</h3>
						<form class="row login_form" id="loginForm" action="<%=request.getContextPath() %>/loginAction.jsp">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="memberId" name="memberId" placeholder="Id" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<button id="loginBtn" type="button" value="submit" class="button button-login w-100">로그인</button>
								<a href="<%=request.getContextPath()%>/insertMemberForm.jsp">회원가입</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
	
  <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="<%=request.getContextPath()%>/tem/img/gallery/r1.jpg" alt=""></li>
								<li><img src="<%=request.getContextPath()%>/tem/img/gallery/r2.jpg" alt=""></li>
								<li><img src="<%=request.getContextPath()%>/tem/img/gallery/r3.jpg" alt=""></li>
								<li><img src="<%=request.getContextPath()%>/tem/img/gallery/r5.jpg" alt=""></li>
								<li><img src="<%=request.getContextPath()%>/tem/img/gallery/r7.jpg" alt=""></li>
								<li><img src="<%=request.getContextPath()%>/tem/img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



  <script src="<%=request.getContextPath()%>/tem/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="<%=request.getContextPath()%>/tem/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/tem/vendors/skrollr.min.js"></script>
  <script src="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath()%>/tem/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="<%=request.getContextPath()%>/tem/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="<%=request.getContextPath()%>/tem/vendors/mail-script.js"></script>
  <script src="<%=request.getContextPath()%>/tem/js/main.js"></script>
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