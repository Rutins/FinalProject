<%@page import="com.kgitbank.client.vodao.ClientVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<%
ClientVO login = null;
login=(ClientVO)session.getAttribute("loginfo");

%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>사이트 소개</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/business-frontpage.css">
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

</head>		
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/">GAZUA 휴게소</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="/">홈
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="Introduction">사이트 소개
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getAPIRoadKind">휴게소 정보</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Board_List">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QA">문의 사항</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="bg-primary py-5 mb-5">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">사진 넣는 곳</h1>
          <p class="lead mb-5 text-white-50"></p>
        </div>
      </div>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <div class="row">
  		<form action="getLogin" name="login" onsubmit="return LoginNullCheck()">
  			<!-- 로그인 부분, onfocus 부분은 input text란 클릭시 내용 지우기 -->  
      		<div class="col-md-8 mb-5">
			<%if(session.getAttribute("loginfo")==null){%>
				<!-- 로그인 안할 시 나오는 부분 -->
				<section class="main_login_section">
					<input class="main_login" type="text" name="id" placeholder="아이디" onfocus="this.value=''; return true;"><br>
					<input class="main_login" type="password" name="pw" placeholder="비밀번호" onfocus="this.value=''; return true;"><br>
					<input type="submit" value="로그인" class="btn btn-primary btn-lg main_logon_btn">
					<a href="Signup">
						<input type="button" value="회원가입" class="btn btn-primary btn-lg main_logon_btn2">
					</a><br><br>
					<a href="Search" class="main_login_a">아이디 / 비밀번호 찾기</a>
				</section>
			<%}
			else {%>	
				<!-- 로그인 성공시 나오는 부분 --> 
				 <section class="main_login_section">	
					<h2 class="main_login_a"><%=login.getNickname()%> 님 환영합니다 !</h2>
					<br><br><br>
					<!-- 로그아웃 할때 받을 do -->
					<a href="getLogout"><input type="button" value="로그아웃" class="btn btn-primary btn-lg"></a>
					<a href="Confirm">
						<input type="button" value="마이 페이지" class="btn btn-primary btn-lg main_logon_btn2">
					</a>
				</section>
			<%} %>
				<section class="main_login_section main_user"> 
					<!-- ?에는 방문자수 -->
					<span class="main_span">오늘 ?명&nbsp&nbsp&nbsp&nbsp전체 ?명</span><br><br>
					<!-- ?에는 멤버수 -->
					<span class="main_span">접속 멤버 ?명&nbsp&nbsp<input class="btn btn-primary btn-lg" type="button" value="새로고침"></span>
					<br><br>
					<div style="overflow: scroll; width: 200px; height: 200px; background-color: white">여기에 내용을 넣는다</div>
				</section>	
      		</div>
  		</form>
      <div id="get" class="introduction">
		<h2 class="introduction_h2">사이트 소개</h2>
		<section class="introduction_section">
			저희 '가즈아 휴게소'는 보다 휴게소 정보를 쉽고 편하게 얻고자 했으면 하는 마음에 만들어진 사이트입니다.<br>
			지도를 통해서 간편하게 휴게소를 찾을 수 있는 것은 물론 클릭을 통해서 바로 정보를 볼 수 있게 만들었습니다.<br>
			더욱 자세하게 휴게소 정보를 찾고 싶으시다면, '휴게소 정보'를 클릭해서 카테고리별으로 찾을 수 있습니다.<br>
			<br>
			또한 휴게소에 대한 후기, 의견등을 나누어 다양한 유저들과의 소통을 할 수 있습니다.<br>
			게시판에서 다양한 의견을 나누어 보세요!<br><br>
		</section>	
	</div>
    </div>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container text-white">
    	<h1><center>Contact Us</center><br></h1>
  
    	<div class="footer_left">
    	가즈아휴게소 <br>
		서울특별시 종로구 돈화문로 26, 5층(묘동, 단성사) <br>
		02-5959-8081 <br>
		GAZUA828@NAVER.COM <br>
		</div>
		
		<div class="footer_center"><p>
    	영업시간<br>
		평일 : 9시 - 18시<br>
		토요일 : 9시 - 18시<br>
		일요일 : 휴무<br>		
		</p></div>
		
		
		<div class="footer_right">		
		<form name="message" id="messageform">
		
		<div class="row1">
			<div class="name">
				<input type="text" placeholder="이름" id="name" required="" data-validation-required-message="이름을 입력해주세요">
			</div>
			<div class="email">
				<input type="email" placeholder="이메일" id="email" required="" data-validation-required-message="이메일을 입력해주세요">
			</div>
		</div>
		
		<div class="row2">
			<br><br><textarea class="message" placeholder="메시지를 남겨주세요" id="message" required="" data-validation-required-message="보낼 메시지를 입력해주세요"></textarea>
		</div>
		
		<div class="row3" align="center">
			<br><button type="submit" class="btn btn-primary btn-lg"><a onclick="button1_click();">보내기</a></button>
		</div>		
		
		</form>		
		</div>
		
		<br><br><br><br><br><br><br><br><br>
		<div class="footer_bottom">
    	<center>Copyright &copy; Your Website 2019</center>
    	</div>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  

</body>

</html>