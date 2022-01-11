<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>
	<link rel="icon" href="<%=request.getContextPath()%>/tem/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/linericon/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/tem/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
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
<%
			String memberIdCheck="";
			if(request.getParameter("memberIdCheck") != null) {
				memberIdCheck = request.getParameter("memberIdCheck");
			}
%>
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
					<h1>회원가입</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.jsp">메인</a></li>
              <li class="breadcrumb-item active" aria-current="page">회원가입</li>
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
					<div class="login_form_inner register_form_inner">
						<h3>회원가입</h3>
						<form class="row login_form" action="<%=request.getContextPath() %>/selectMemberIdCheckAction.jsp" method="post">
							<div class="col-md-12 form-group">
								<p>중복 검사 : <%=request.getParameter("idCheckResult") %></p>
								<input type="text" class="form-control" name="memberIdCheck" placeholder="Id" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'">
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">아이디 중복 검사</button>
							</div>
						</form>
						<form class="row login_form" id="joinForm" action="<%=request.getContextPath() %>/insertMemberAction.jsp" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="memberId" name="memberId" readonly="readonly" value="<%=memberIdCheck%>">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
			                </div>
			                <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="memberName" name="memberName" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'">
			                </div>
			                <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="memberAge" name="memberAge" placeholder="Age" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Age'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" class="memberGender" name="memberGender" value="남">남
									<br>
									<input type="checkbox" class="memberGender" name="memberGender" value="여">여
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button id="btn" type="button" value="submit" class="button button-register w-100">회원가입</button>
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
		$('#btn').click(function() {
			if($('#memberId').val() == '') {
				alert('아이디를 입력해주세요!');
				return;
			}
			if($('#memberPw').val() == '') {
				alert('비밀번호를 입력해주세요!');
				return;
			}
			if($('#memberName').val() == '') {
				alert('이름를 입력해주세요!');
				return;
			}
			if($('#memberName').val() == '') {
				alert('이름를 입력해주세요!');
				return;
			}
			if($('#memberAge').val() == '') {
				alert('나이를 입력해주세요!');
				return;
			}
			let memberGender = $('.memberGender:checked'); // 클래스 속성으로 부르면 리턴 값은 배열로 취한다.
			if(memberGender.length == 0) {
				alert('성별을 선택해주세요!');
				return;
			}
			$('#joinForm').submit();
		})
	</script>
</body>
</html>