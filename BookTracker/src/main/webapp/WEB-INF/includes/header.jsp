<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="home.do">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="getBook.do?bookId=0&action=Add">Add
							a Book</a></li>
				</ul>
				<ul class="navbar-nav">
					<form action="getBook.do" method="GET">
					<input type="hidden" name="action" value="display">
						Book ID: <input type="text" name="bookId" /> <input type="submit"
							value="Show Book" />
					</form>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>