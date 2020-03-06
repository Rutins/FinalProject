<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="roadName" name="roadName">
<c:forEach var="RoadName" items="${APIRoadName}">
		<option value="<c:out value="${RoadName}"/>"><c:out value="${RoadName}"/></option>
</c:forEach>	
</select>