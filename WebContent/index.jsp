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
	<!-- start :  sub menu include -->
	<div>
		<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
	</div>
	<!-- end : sub menu include -->
	
	<!-- 상품 목록 출력 -->
<%
	// 페이지
	int currentPage = 1;
	
	// 페이지 번호가 null이 아니라면 int 타입으로 바꿔서 페이지 번호 사용
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 디버깅 코드
	System.out.println(currentPage +" <-- currentPage");
	
	final int ROW_PER_PAGE = 10; // 상수 : rowPerPage 변수는 10으로 초기화되면 끝까지 10이다. 바꾸지 말자.
	
	int beginRow = (currentPage - 1) * ROW_PER_PAGE;
	
	// 전체 목록 가져오기
	EbookDao ebookDao = new EbookDao();
	ArrayList<Ebook> ebookListByMain = ebookDao.selectEbookListByMain();
	
	// 인기 상품 목록 가져오기
	ArrayList<Ebook> popularEbookList = ebookDao.selectPopularEbookList();
	
	// 신상품 목록 가져오기
	ArrayList<Ebook> newEbookList = ebookDao.selectNewEbookList();
	
	// 최근 공지사항 5개 가져오기
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = noticeDao.selectNewEbookList();

%>
  <main class="site-main">  
    <!--================ Hero banner start =================-->
    <section class="hero-banner">
      <div class="container">
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block">
            <div class="hero-banner__img">
              <img class="img-fluid" src="<%=request.getContextPath()%>/tem/img/home/book.JPG" style="width:500px; height:500px;" alt="">
            </div>
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
              <h4>E-book Shop에 오신걸 환영합니다!</h4>
              <h1>Welcome to EBS!</h1>
              <p>다양한 책들이 구비되어 있으니 많은 이용 부탁드립니다! </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ Hero banner start =================-->
    <!--================ Hero Carousel end =================-->
    <section class="cart_area">
      <div class="container">
      <div class="section-intro pb-60px">
          <h3>공지<span class="section-intro__style">사항</span></h3>
        </div>
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr style="text-align:center;">
                            <th>번호</th>
							<th>제목</th>
							<th>작성 날짜</th>
                          </tr>
                      </thead>
                      <tbody>
<%
						for(Notice n : noticeList) {
%>
						 <tr style="text-align:center;">
							<td><%=n.getNoticeNo() %></td>
							<td><a href="<%=request.getContextPath() %>/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo() %>"><%=n.getNoticeTitle() %></a></td>
							<td><%=n.getCreateDate() %></td>
						</tr>
<%
				}
%>
					</tbody>
                  </table>
              </div>
          </div>
      </div>
  	</section>
  	<section class="cart_area">
      <div class="container">
      <div class="section-intro pb-60px">
          <h3><span class="section-intro__style">신 </span>상품!</h3>
        </div>
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                  	<tr style="text-align:center;">
<%
            for(Ebook e : newEbookList) {
%>   
		               <td>
		                  <div>
		                      <a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
		                     <img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg()%>" width="200" height="300">
		                     </a>
		                  </div>
		                  <div><a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>"><%=e.getEbookTitle()%></a></div>
		                  <div>₩ <%=e.getEbookPrice()%></div>
		               </td>
		            
<%         
		            }
%>
     		 		</tr>
                  </table>
              </div>
          </div>
      </div>
  	</section>
  	<section class="cart_area">
      <div class="container">
      <div class="section-intro pb-60px">
          <h3><span class="section-intro__style">인기 </span>상품!</h3>
        </div>
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                  	<tr style="text-align:center;">
<%
            		for(Ebook e : popularEbookList) {
%>   
               			<td>
                  		<div>
                    		<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
                    			<img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg()%>" width="200" height="300">
                     		</a>
                  		</div>
                  		<div><a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>"><%=e.getEbookTitle()%></a></div>
                  		<div>₩ <%=e.getEbookPrice()%></div>
               			</td>
<%         
            		}
%>
      				</tr>
                  </table>
              </div>
          </div>
      </div>
  	</section>
  	<section class="cart_area">
      <div class="container">
      <div class="section-intro pb-60px">
          <h3><span class="section-intro__style">전체 </span>상품!</h3>
        </div>
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                  	<tr style="text-align:center;">
<%
				            int i = 0;
				            for(Ebook e : ebookListByMain) {
%>   
				               <td>
				                  <div>
				                     <a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>">
				                    <img src="<%=request.getContextPath()%>/image/<%=e.getEbookImg()%>" width="200" height="300">
				                    </a>
				                  </div>
				                  <div><a href="<%=request.getContextPath()%>/selectEbookOne.jsp?ebookNo=<%=e.getEbookNo()%>"><%=e.getEbookTitle()%></a></div>
				                  <div>₩ <%=e.getEbookPrice()%></div>
				               </td>   
<%         
            				}
%>
				      </tr>
                  </table>
              </div>
          </div>
      </div>
  	</section>
  </main>
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
</body>
</html>