<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="includes/head.jsp"%>
<%@ include file="includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Tracker</title>
</head>
<body class="bg-dark align-items-center">
	<div class="container bg-light align-items-center mt-5"
		style="--bs-bg-opacity: .75;">
		<div>
			<h1 class="text-center">All Books</h1>
		</div>
		<div classs="table-responsive">
			<table class ="table table-striped align-items-center">
				<thead>
					<tr>
						<td>ID</td>
						<td>Title</td>
						<td>Synopsis</td>
						<td>Author</td>
						<td>Options</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<tr class = "mt-2">
							<td>${book.id}</td>
							<td>${book.name}</td>
							<c:choose>
								<c:when test="${empty book.synopsis}"><td> No synopsis entered yet </td></c:when>
								<c:otherwise><td> ${book.synopsis}</td></c:otherwise>
							</c:choose>
							<td>Author not implemented yet</td>
							<td>
								<form action="getBook.do" method="GET">
								<input type="hidden" name="bookId" value="${book.id}">
								<button type="submit" name="action" value="Edit" class="btn btn-primary">Edit</button>
								<button type="submit" name="action" value="Delete" class="btn btn-danger">Delete</button>
								</form>
							</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<%@ include file="includes/footer.jsp"%>
</html>