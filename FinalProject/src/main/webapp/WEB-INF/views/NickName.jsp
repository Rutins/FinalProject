<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("check").on("click", function(){
    	let queryString = $("#doublecheck").serialize();
    	$.ajax({
    		url: "/getNickNameCheck",
    		type: "GET",
    		dataType: "json",
    		data: queryString,
    		success: function(result){
    			if(result==100){
    				opener.document.Signup.nickname.value=document.NickName.nickname.value;
    				alert('사용가능한 이름입니다.');
    				self.opener = self;
    				self.close();
    			}else{
    				alert('이미 사용중인 이름입니다.')
    			}
    		}
        })
    });    
});
</script>
</head>
<body>
<form action="" id="doublecheck">
<input type="text" name="nickname">
<input type="button" value="중복확인" id="check">
</form>
</body>
</html>