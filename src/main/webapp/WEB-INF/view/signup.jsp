<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>Bootstrap Simple Login Form with Blue Background</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/signUp.css">
</head>

<body>
	<div class="signup-form" id="signup">
		<form>
			<h2>Sign Up</h2>
			<p>Please fill in this form to create an account!</p>
			<hr>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" id="name" class="form-control" name="name"
							placeholder="Full Name" required="required">
					</div>
					<div class="col">
						<input type="email" id="email" class="form-control" name="email"
							placeholder="Email" required="required">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="password" id="password" class="form-control"
							name="password" placeholder="Password" required="required">
					</div>
					<div class="col">
						<input type="text" id="phone" class="form-control" name="phone"
							placeholder="Phone" required="required">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" id="address" class="form-control"
							name="address" placeholder="Short Address" required="required">
					</div>

					<div class="col">
						<input type="text" id="about1" class="form-control" name="about1"
							placeholder="About" required="required">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<label for="gender">Gender:</label> <input type="radio" id="male"
							name="gender" value="Male"> <label for="male">Male</label>
						<input type="radio" id="female" name="gender" value="Female">
						<label for="female">Female</label><br>
					</div>
					<div class="col">
						<label for="activeCheckbox">Active:</label> <input type="checkbox"
							id="activeCheckbox" onchange="updateCheckboxValue()">
					</div>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="form-check-label"><input type="checkbox" required="required"> I accept the <a
                                href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label> -->
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="signUpFun()">Sign Up</button>
			</div>
		</form>
		<div class="hint-text">
			Already have an account? <a href="#">Login here</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

	<script src="${pageContext.request.contextPath}/static/js/signUp.js"></script>

</body>

</html>

