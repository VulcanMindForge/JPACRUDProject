<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ include file="../includes/head.jsp"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
</head>
<body class="bg-dark align-items-center">
	<div class="container bg-light align-items-center mt-5"
		style="--bs-bg-opacity: .75;">
		<c:if test="${deleted}">
			<div>
				<h1 class="text-center">Book successfully deleted!</h1>
			</div>
		</c:if>
		<c:choose>
		<c:when test="${book == null}">
			<c:if test="${action eq 'display'}">
					<h1 class="text-center">No book found with that ID!</h1>
			</c:if>
		</c:when>
		</c:choose>
		
		<form class="form" action="editBook.do" method="GET" id="editBook">
			<c:if test="${book != null}">
				<ul>
					<li>
						<h4>ID:</h4> <c:choose>
							<c:when test="${action == 'Edit'}">${book.id}
						<input type="hidden" name="bookId" value="${book.id}">
							</c:when>
							<c:when test="${action eq 'Add'}"> Book ID will be set automatically.</c:when>
							<c:when test="empty ${book.id}">No book found!</c:when>
							<c:otherwise>${book.id}
						<input type="hidden" name="bookId" value="${book.id}">
							</c:otherwise>
						</c:choose>
					</li>

					<li>
						<h4>Title:</h4> <c:choose>
							<c:when test="empty ${book.name}">No Title has been entered yet.</c:when>
							<c:when test="${(action eq 'Edit') || (action eq 'Add')}">
								<input type="text" form="editBook" name="bookTitle"
									value="${book.name}">
							</c:when>
							<c:otherwise>${book.name}
						<input type="hidden" name="bookTitle" value="${book.name}">
							</c:otherwise>
						</c:choose>
					</li>

					<li>
						<h4>Synopsis:</h4> <c:choose>
							<c:when test="${(action == 'Edit') || (action == 'Add')}">
								<input type="text" form="editBook" name="bookSynopsis">
							</c:when>
							<c:when test="${book.synopsis eq null}">No Synopsis has been entered yet.</c:when>
							<c:otherwise>${book.synopsis}
						<input type="hidden" name="bookSynopsis" value="${book.synopsis}">
							</c:otherwise>
						</c:choose>
					</li>

					<li>
						<h4>Date Released:</h4> <c:choose>
							<c:when test="empty ${book.dateReleased}">No Date has been entered yet.</c:when>
							<c:when test="${(action eq 'Edit') || (action eq 'Add')}">
								<input type="date" form="editBook" name="bookReleaseDate">
							</c:when>
							<c:otherwise>${book.dateReleased}
						<input type="hidden" name="bookSynopsis"
									value="${book.dateReleased}">
							</c:otherwise>
						</c:choose>
					</li>
					<li>
						<h4>Part of a series:</h4> <c:choose>
							<c:when test="empty ${book.series}">Has not been entered yet.</c:when>
							<c:when test="${(action eq 'Edit') || (action eq 'Add')}">
								<label for="Yes">Yes</label>
								<input type="checkbox" form="editBook" name="bookSeries"
									value="true" id="yes">
								<label for="No">No</label>
								<input type="checkbox" form="editBook" name="bookSeries"
									value="false" id="no">
							</c:when>
							<c:otherwise>${book.series}
						<input type="hidden" name="series" value="${book.series}">
							</c:otherwise>
						</c:choose>
					</li>
					<c:if test="${book.series ne false}">
						<li>
							<h4>Number In Series:</h4> <c:choose>
								<c:when test="empty ${book.numInSeries}">No number has been entered yet.</c:when>
								<c:when test="${(action eq 'Edit') || (action eq 'Add')}">
									<input type="text" form="editBook" name="bookNumInSeries">
								</c:when>
								<c:otherwise>${book.numInSeries}
						<input type="hidden" name="bookNumInSeries"
										value="${book.numInSeries}">
								</c:otherwise>
							</c:choose>
						</li>
					</c:if>
					<li>
						<h4>Series complete:</h4> <c:choose>
							<c:when test="empty ${book.series}">Completion state not updated.</c:when>
							<c:when test="${(action eq 'Edit') || (action eq 'Add')}">
								<input type="checkbox" form="editBook" name="bookComplete"
									value="true" id="Yes">
								<input type="checkbox" form="editBook" name="bookComplete"
									value="false" id="No">
							</c:when>
							<c:otherwise>${book.complete}</c:otherwise>
						</c:choose>
					</li>

					<li>
						<h4>Cover Image:</h4> <c:choose>
							<c:when test="${(action eq 'Edit') || (action eq 'Add')}">
								<input type="text" form="editBook" name="bookImageURL">
							</c:when>
							<c:otherwise>
								<img alt="No image URL entered" src="${book.imageURL}">
							</c:otherwise>
						</c:choose>
					</li>
				</ul>

				<c:choose>
					<c:when test="${action eq 'display'}">
						<button type="submit" name="action" value="Edit"
							class="btn btn-primary" formaction="show.do?bookId=${book.id}"
							form="editBook">Edit</button>
						<button type="submit" name="action" value="Delete"
							class="btn btn-danger" formaction="show.do?bookId=${book.id}"
							form="editBook">Delete</button>
					</c:when>
					<c:when test="${action eq 'Edit'}">
						<button type="submit" name="action" value="Edit"
							class="btn btn-primary" formaction="editBook.do" form="editBook">Confirm
							Edit</button>
					</c:when>

					<c:when test="${action eq 'Add'}">
						<button type="submit" name="action" value="Edit"
							class="btn btn-primary" formaction="addBook.do" form="editBook">Confirm
							add</button>
					</c:when>

					<c:when test="${action eq 'Delete'}">
						<button type="submit" name="action" value="Delete"
							class="btn btn-danger"
							formaction="deleteBook.do?bookId=${book.id}">Confirm
							Delete</button>
					</c:when>

				</c:choose>
			</c:if>
		</form>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>