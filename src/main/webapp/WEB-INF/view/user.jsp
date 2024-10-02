<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>

<head>
<title>User Details</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/user.css">
</head>

<body>
	<h2>User Dashboard</h2>

	<!--        show user-->
	<table id="userTable">
		<thead>
			<tr>
				<th>Username</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Gender</th>
				<th>Address</th>
				<th>About</th>
				<th>Role</th>
				<th></th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	<p style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
		<button style="font-weight: bold;" onclick="openForm()">Add
			User</button>
	</p>

	<!--create user-->
	<div id="popupForm" style="display: none;" class="createuserpopup">
		<!-- Updated form with tabular layout -->
		<form>
			<div class="form-row">
				<div class="form-group">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" required><br>
				</div>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" required><br>
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						id="password" name="password" required><br>
				</div>

			</div>


			<div class="form-row">
				<div class="form-group">
					<label for="about1">About:</label> <input type="text" id="about1"
						name="about1" required><br>
				</div>
				<div class="form-group">
					<label for="address">Address:</label>
					<textarea id="address" name="address" required></textarea>
					<br>
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label> <input type="text" id="phone"
						name="phone" required><br>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="activeCheckbox">Active:</label> <input type="checkbox"
						id="activeCheckbox" onchange="updateCheckboxValue()">
				</div>
				<div class="form-group">
					<label for="gender">Gender:</label> <input type="radio" id="male"
						name="gender" value="Male"> <label for="male">Male</label>
					<input type="radio" id="female" name="gender" value="Female">
					<label for="female">Female</label><br>
				</div>
				<div class="form-group">
					<label for="cars">Role :</label> 
					<select name="role" id="role">
						<option value="" disabled>--Select One--</option>
						<option value="ROLE_ADMIN">ROLE_ADMIN</option>
						<option value="ROLE_MANAGER">ROLE_MANAGER</option>
						<option value="ROLE_SUB_MANAGER">ROLE_SUB_MANAGER</option>
						<option value="ROLE_USER">ROLE_USER</option>
					</select>
				</div>
			</div>
			<div class="form-row">
				<input style="font-weight: bold;" type="submit" value="Submit"
					onclick="createUser()">
				<button onclick="hideEditUserDetails()">Close</button>
			</div>
		</form>
	</div>


	<div id="userDetailsPopup" class="popup"></div>

	<input type="text" id="hiddenforeditId" name="" value="" hidden>

	<!-- Include jQuery from a CDN -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/user.js"></script>
</body>

</html>