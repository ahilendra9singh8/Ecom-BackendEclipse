<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />

<!doctype html>
<html lang="en">

<head>

<title>category</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/category.css">
</head>
</head>

<body>
	<main>

		<h2>Product Categories</h2>

		<!--        show user-->
		<table id="categoryTable">
			<thead>
				<tr>
					<th>Sr.No.</th>
					<th>Product Category</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>

		<p style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
			<button style="font-weight: bold;" id="categoryButton">Add
				Category</button>
		</p>

		<!-- Category Creation Popup -->
		<div id="categoryPopup" class="popup">
			<div class="popup-content">
				<span class="close">&times;</span> <label for="categoryInput">Category:</label>
				<input type="text" id="categoryInput">
				<button id="saveCategory">Save</button>
			</div>
		</div>

		<input type="text" id="hiddenforeditId" name="" value="" hidden>
		<!-- Include jQuery from a CDN -->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/category.js"></script>
	</main>
</body>
</html>