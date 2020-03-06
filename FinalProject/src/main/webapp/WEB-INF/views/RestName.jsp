<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select id="restName" name="restName">
<c:forEach var="RestName" items="${APIRestName}">
		<option value="<c:out value="${RestName}"/>"><c:out value="${RestName}"/></option>
</c:forEach>	
</select>