<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	
<script type="text/javascript">
$("#roadKnd").on(click, function(event){
	event.preventDefault();
	let FrontVO = $(this).serialize();
	$.ajax({
		url: "/controller/getAPIRoadName",
		type: "POST",
		dataType: "text",
		data: FrontVO,
		success: function(roadName){
			$("#aa").load("/WEB-INF/views/aa.jsp #aa", function(){
				
			})
		}

	})

});
</script>
</head>
<body>
<div>
<form action="">
<select name="roadKnd">
	<c:forEach var="kind" items="${APIRoadKind}">
		<option id="roadKnd"><c:out value="${kind}"/></option>
	</c:forEach>	
</select>
<span id="aa"></span>
<span id="aa2"></span>
</form>
</div>

</body>
</html>
