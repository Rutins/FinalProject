<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('select#roadKnd').change(function(){
		$('#roadName').load("getAPIRoadName", {'roadKnd' : $("select#roadKnd").val()},function(){
			$(this).show();
		});
		return false;
	});
});

$(document).ready(function(){
	$('select#roadName').change(function(){
		$('#restName').load("getAPIRestName", {'roadName' : $("select#roadName").val()},function(){
			$(this).show();
		});
		return false;
	});
});
</script>
</head>
<body>
<div>
<form action="">
<select name="roadKnd" id="roadKnd">
	<c:forEach var="kind" items="${APIRoadKind}">
		<option value="<c:out value="${kind}"/>"><c:out value="${kind}"/></option>
	</c:forEach>	
</select>
<span id="roadName"></span>
<span id="restName"></span>
</form>
</div>

</body>
</html>
