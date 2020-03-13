<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
<script type="text/javascript">
/* $("#doublecheck").submit( function(event){
	event.preventDefault();
	// serialize는 form의 <input> 요소들의 name이 배열형태로 그 값이 인코딩되어 URL query string으로 하는 메서드
	let queryString = $(this).serialize();
	$.ajax({
		url: "/getIDCheck",
		type: "GET",
		dataType: "json",
		data: queryString,
		success: function(result){
			if(result==100){
				opener.document.getElementById("id").value=document.getElementById("id").value;
				alert('사용가능한 이름입니다.');
				self.opener = self;
				self.close();
			}else{
				alert('이미 사용중인 이름입니다.');
			}
		}
    })
}); */
$(document).ready(function(){
    $("#check").on("click", function(){
    	let queryString = $("#doublecheck").serialize();
    	$.ajax({
    		url: "/getIDCheck",
    		type: "GET",
    		dataType: "json",
    		data: queryString,
    		success: function(result){
    			if(result==100){
    				opener.document.getElementById("id").value=document.getElementById("id").value;
    				alert('사용가능한 이름입니다.');
    				self.opener = self;
    				self.close();
    			}else if(result==101){
    				alert('이미 사용중인 이름입니다.')
    			}
    		}
        })
    })    
});
</script>
</head>
<body>
<form action="" id="doublecheck">
<input type="text" name="id" id="id">
<input type="button" value="중복확인" id="check">
</form>
</body>
</html>