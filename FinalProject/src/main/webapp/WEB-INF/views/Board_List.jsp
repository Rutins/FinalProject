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

<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

<script type="text/javascript">
//로그인 Null 체크
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
</script>
<script type="text/javascript">
	function SearchNullCheck(){
		if(!document.search.board_search_cate.value){
			alert("카테고리를 선택해주세요.");
			document.search.board_search_cate.focus();
			return false;
		} else if(!document.search.board_search_text.value){
			alert("내용을 입력해주세요.");
			document.search.board_search_text.focus();
			return false;
		}
	}
</script>
<title>고속도로 휴게소 정보</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/business-frontpage.css">
</head>
<%!
	//여기 오류 확인하고 휴게소 정보 찾는 페이지에도 넣기
	//String >> int 변환
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
%>
<%
	int thispage = toInt(request.getParameter("page"));
	//현재 페이지
	if(thispage<1){
		thispage = 1;
	}
	
	//총 레코드 수 (임시 할당)
	int total_text = 300;
	//페이지 당 레코드 수
	int page_text_cnt = 5;
	//페이지 당 보여줄 번호 수
	int group_page_cnt = 5;
	
	//글 끝 번호 = 현재 페이지 * 페이지 당 보여줄 번호 수
	int text_end_no = thispage*group_page_cnt;
	//글 첫 번호 = 글 끝 번호 -(페이지 당 보여줄 번호 수 - 1)
	int text_start_no = text_end_no-(page_text_cnt-1);
	if(text_end_no > total_text){
		//글 끝번호 보다 총 글수가 크면 글 끝번호 = 총 글수
		text_end_no = total_text;
	}
	
	//현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
	int total_page = total_text / page_text_cnt + (total_text % page_text_cnt > 0 ? 1:0);
	if(thispage > total_page){
		thispage = total_page;
	}
	
	//현재 그룹 번호 = 현재페이지 / 페이지당 보여줄 번호 수/ (현재 페이지 % 페이지당 보여줄 번호 수 > 0 ? 1:0)
	int this_group_no = thispage/group_page_cnt + (thispage % group_page_cnt > 0 ? 1:0);
	//현재 그룹 끝 번호 = 현재 그룹 번호 * 페이지당 보여줄 번호
	int this_group_end_no = this_group_no * group_page_cnt;
	//현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수-1);
	int this_group_start_no = this_group_end_no - (group_page_cnt-1);
	
	if(this_group_end_no > total_page){
		//현재 그룹 끝 번호가 전체페이지 수 보다 클 경우 현재 그룹 끝 번호 = 전체 페이지 수
		this_group_end_no = total_page;
	}
	
	//이전 페이지 번호 = 현재 그룹 시작 번호 - 페이지당 보여줄 번호 수
	int before_page_no = this_group_start_no - group_page_cnt;
	//다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호 수
	int next_page_no = this_group_start_no + group_page_cnt;
	
	if(before_page_no < 1){
		//이전 페이지 번호가 1보다 작을 경우 이전 페이지를 1로 만든다
		before_page_no = 1;
	}
	
	if(next_page_no > total_page){
		//다음 페이지가 전체 페이지 수 보다 클경우 다음 페이지 = 전체 페이지 수 / 페이지당 보여줄 번호 수 * 페이지당 보여줄 번호수 + 1
		next_page_no = total_page / group_page_cnt * group_page_cnt + 1;
		next_page_no = total_page;
	}
	
%>
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
          <li class="nav-item">
            <a class="nav-link" href="Introduction">사이트 소개</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getAPIRoadKind">휴게소 정보</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="Board_List">게시판
               <span class="sr-only">(current)</span>
            </a>
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
      	<div class="board_list">
		<section class="board_list">
			<header>
				<h1>게시판</h1>
			</header>
			<table class="type09">
				<thead>
					<tr>
						<th scope="col">No.</th>
						<th scope="col">카테고리</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="num">3</th>
						<th>편의시설</th>
						<!-- 아래 img는 첨부파일 표시 유무, 반복문쓸거 같아서 하나만 써놓았어요 -->
						<th class="title"><a>제목</a><img alt="에러" src="/resources/img/picture.png"></th>
						<th>민정원</th>
						<th>20-02-11</th>
						<th>333</th>
						</tr>
					<tr>
						<th class="num">2</th>
						<th>음식점</th>
						<th class="title">제목</th>
						<th>민정원</th>
						<th>20-02-11</th>
						<th>222</th>
					</tr>
					<tr>
						<th class="num">1</th>
						<th>사람수</th>
						<th class="title">제목</th>
						<th>민정원</th>
						<th>20-02-11</th>
						<th>111</th>
					</tr>
				</tbody>
			</table>
		</section>
		<section class="board_list">
			<form action="" name="search" onsubmit="return SearchNullCheck()">
				<select name="board_search_cate">
					<option value="" selected>==선택==</option>
					<option value="category">카테고리</option>
					<option value="title">제목</option>
					<option value="writer">글쓴이</option>
				</select>
				<input type="text" name="board_search_text" placeholder="내용을 입력하세요.">
				<input type="submit" value="검색" class="btn btn-primary btn-lg">
				<a href="Board_Write"><input type="button" value="글쓰기" class="btn btn-primary btn-lg" id="write_get"></a>
			</form>
		</section>
		<section style="margin-left: 30%">
			<%--페이지 구현만 해놓고 오류 처리 안함, 실제 데이터 넣어서 오류 체크 해보기
				여기도 ajax적용해서 구현다시 해야됨(오류) --%>
			<a href="#?thispage=1" class="btn btn-primary btn-lg">맨앞으로</a>
			<a href="Board_List.jsp?thispage=<%=before_page_no %>" class="btn btn-primary btn-lg">이전</a>
				<%for(int i = text_start_no; i <=text_end_no; i++){ %>
					<a href="Board_List.jsp?thispage=<%=i %>" class="btn btn-primary btn-lg">
						<%if(i>0){ %>
							<%if(thispage == i){ %>
								[<%=i %>]
							<%} else { %>
								<%=i %>
							<%} %>
						<%} %>	
					</a>
				<%} %>
			<a href="Board_List.jsp?thispage=<%=next_page_no %>" class="btn btn-primary btn-lg">다음</a>
			<a href="Board_List.jsp?thispage=<%=total_page %>" class="btn btn-primary btn-lg">맨뒤로</a>
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