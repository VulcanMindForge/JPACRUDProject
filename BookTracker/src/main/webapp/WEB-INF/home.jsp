<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Tracker</title>
</head>
<body>
<c:forEach var="book" items="${books}">
<ul>
<li>${book.id}</li>
<li>${book.name}</li>
</ul>
</c:forEach>
</body>
</html>