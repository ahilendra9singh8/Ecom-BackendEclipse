<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<div class="card text-center">
		<div class="card-header">
			<h1>Your Order's Details</h1>
		</div>

		<div class="card-body" id="orderDetails"></div>
		<!-- <div class="card-footer text-muted">

                </div> -->
	</div>

	<script src="${pageContext.request.contextPath}/static/js/order.js"></script>

</body>

</html>