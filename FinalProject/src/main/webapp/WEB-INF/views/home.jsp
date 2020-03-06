<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('select#roadKind').change(function(){
		$('#roadName').load("getAPIRoadName", {'roadKind' : $("select#roadKind").val()},function(){
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
<select name="roadKind" id="roadKind">
	<c:forEach var="kind" items="${APIRoadKind}">
		<option value="<c:out value="${kind}"/>"><c:out value="${kind}"/></option>
	</c:forEach>	
</select>
<select id="roadName" style="display:none"></select>
<select id="restName" style="display:none"></select>
</form>
</div>

</body>
</html>
