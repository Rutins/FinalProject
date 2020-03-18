<%@page import="com.kgitbank.client.vodao.ClientVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>

<%
ClientVO login = null;
login=(ClientVO)session.getAttribute("loginfo");
%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

<script type="text/javascript">
	function LoginNullCheck(){
		if(!document.login.id.value){
			alert("아이디를 입력해주세요.");
			document.login.id.focus();
			return false;
		} else if(!document.login.pw.value){
			alert("비밀번호를 입력해주세요.");
			document.login.pw.focus();
			return false;
		}
	}
	
	function IDNullCheck(){
		if(!document.id_search.name.value){
			alert("이름을 입력해주세요.");
			document.id_search.name.focus();
			return false;
		} else if(!document.id_search.pnum.value){
			alert("휴대 전화 번호를 입력해주세요.");
			document.id_search.pnum.focus();
			return false;
		}
	}
	
	function PWNullCheck(){
		if(!document.pw_search.id.value){
			alert("아이디를 입력해주세요.");
			document.pw_search.id.focus();
			return false;
		} else if(!document.pw_search.name.value){
			alert("이름을 입력해주세요.");
			document.pw_search.name.focus();
			return false;
		} else if(!document.pw_search.tel.value){
			alert("휴대 전화 번호를 입력해주세요.");
			document.pw_search.tel.focus();
			return false;
		}
	}
</script>
<title>아이디 / 비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/business-frontpage.css">
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
          <li class="nav-item active">
            <a class="nav-link" href="/">홈
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Introduction">사이트 소개</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Rest">휴게소 정보</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">문의 사항</a>
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
      <div id="get">
      	<form action="" name="id_search" onsubmit="return IDNullCheck()">
			<div class="search" align="center">
				<h1>아이디 / 비밀번호 찾기</h1><br><br>
				<h3>아이디 찾기</h3>
				<hr><br>
				<table>
					<tr>
						<td>이름 </td>
						<td><input type="text" name="name"><td>
					</tr>
					<tr>
						<td>휴대 전화</td>
						<td><input type="tel" name="pnum"></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="확인" class="btn btn-primary btn-lg">	
				<br><br><br>
			</div>
		</form>
		<form action="" name="pw_search" onsubmit="return PWNullCheck()">
			<div class="search" align="center">
				<h3>비밀번호 찾기</h3>
				<hr><br>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>휴대 전화</td>
						<td><input type="tel" name="tel"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="확인" class="btn btn-primary btn-lg"></td>
					</tr>
				</table>
			</div>
		</form>
      </div>
    </div>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  

</body>

</html>
