function openForm() {
	$("#name").val("");
	$("#email").val("");
	$("#phone").val("");
	$("#address").val("");
	$("#password").val("");
	$("#about").val("");
	$('#activeCheckbox').prop('checked', false);
	$('input[name="gender"]').prop('checked', false);
	$('#role').val('');

	var form = document.getElementById('popupForm');
	form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block'
		: 'none';
}

function hideEditUserDetails() {
	document.getElementById('popupForm').style.display = 'none';
}

var activevalue;
function updateCheckboxValue() {
	var checkbox = document.getElementById('activeCheckbox');
	activevalue = checkbox.checked ? 1 : 0;
}


function createUser() {
	// if (!validateForm()) {
	//     alert("Please fill in all mandatory fields.");
	//     return;
	// }
	var roleId;
	if ($("#role").val() === "ROLE_ADMIN") {
		roleId = "1";
	} else if ($("#role").val() === "ROLE_MANAGER") {
		roleId = "2";
	} else if ($("#role").val() === "ROLE_SUB_MANAGER") {
		roleId = "3";
	} else if ($("#role").val() === "ROLE_USER") {
		roleId = "4";
	}

	selectedRoles = [
		{ "roleId": roleId, "roleName": $("#role").val() }
	];

	var userData = {
		name: $("#name").val(),
		password: $("#password").val(),
		email: $("#email").val(),
		address: $("#address").val(),
		about: $("#about1").val(),
		gender: $("input[name='gender']:checked").val(),
		phone: $("#phone").val(),
		role: selectedRoles,
		active: activevalue
	};

	var hiddenforeditId = $("#hiddenforeditId").val();
	if (hiddenforeditId !== "") {
		$.ajax({
			type: "PUT", // or "POST" depending on your API
			url: "http://localhost:8090/EcomBack/user/updateUser/"
				+ hiddenforeditId,
			contentType: "application/json",
			data: JSON.stringify(userData),
			success: function(response) {
				alert("User updated successfully");
				location.reload(true);
			},
			error: function(xhr, status, error) {
				alert("Error updating user");
				console.error("Error: " + error);
			}
		});
	} else {
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8090/EcomBack/user/createUser",
			data: JSON.stringify(userData),
			success: function(data) {
				alert("User created successfully!");
				location.reload(true);
			},
			error: function(error) {
				alert("Error creating user!");
				console.log("Error: " + error);
			}
		});
	}
}

function validateForm() {
	return $("#name").val() && $("#password").val()
		&& $("#email").val() && $("#address").val()
		&& $("#about").val()
		&& $("input[name='gender']:checked").val()
		&& $("#phone").val();
}


$(function() {
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/user/getAllUser",
		dataType: "json",
		success: function(response) {
			populateTable(response);
		},

		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});

	function populateTable(users) {
		var tbody = $('#userTable tbody');
		tbody.empty();
		var row;
		users.forEach(function(user) {
			user.role.forEach(function(r) {

				row = '<tr>'
					+ '<td>' + user.name + '</td>'
					+ '<td>' + user.email + '</td>'
					+ '<td>' + user.phone + '</td>'
					+ '<td>' + user.gender + '</td>'
					+ '<td>' + user.address + '</td>'
					+ '<td>' + user.about + '</td>'
					+ '<td>' + r.roleName + '</td>'
					+ '<td><button onclick="editUser(\''
					+ user.userId
					+ '\')">Edit</button>\n\n\
                                     <button onclick="deleteUser(\''
					+ user.userId
					+ '\')">Delete</button>\n\n\
                                     <button onclick="showUserDetails(\''
					+ user.userId
					+ '\')">Details</button></td>'
					+ '</tr>';
			});
			tbody.append(row);
		});
	}
});


function showUserDetails(userId) {
	document.getElementById('userDetailsPopup').style.display = 'block';
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/user/getUserById/"
			+ userId,
		dataType: "json", // Change the data type according to your API response
		success: function(user) {
			$("#userDetailsPopup")
				.html(
					"<h2>User Details</h2>"
					+ "<p>Name: "
					+ user.name
					+ "</p>"
					+ "<p>Email: "
					+ user.email
					+ "</p>"
					+ "<p>phone : "
					+ user.phone
					+ "</p>"
					+ "<p>Gender : "
					+ user.gender
					+ "</p>"
					+ "<p>Address : "
					+ user.address
					+ "</p>"
					+ "<p>About : "
					+ user.about
					+ "</p>"
					+ '<button onclick="hideUserDetails()">Close</button>');
		},
		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});
}

function hideUserDetails() {
	document.getElementById('userDetailsPopup').style.display = 'none';
}


function deleteUser(userId) {
	if (confirm("Are you Sure ?") === false) {
		return;
	} else {
		$.ajax({
			type: "DELETE",
			url: "http://localhost:8090/EcomBack/user/deleteUser/"
				+ userId,
			success: function(response) {
				console.log("User deleted successfully");
				location.reload(true);
			},
			error: function(xhr, status, error) {
				console.error("Status: " + status);
				alert("Error deleting user");
			}
		});
	}
}

function editUser(userId) {
	document.getElementById('popupForm').style.display = 'block';
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/user/getUserById/"
			+ userId,
		dataType: "json", // Change the data type according to your API response
		success: function(user) {
			$("#hiddenforeditId").val(user.userId);

			$("#name").val(user.name);
			$("#email").val(user.email);
			$("#phone").val(user.phone);
			$("#address").val(user.address);
			$("#about1").val(user.about);

			if (user.active) {
				$("#activeCheckbox").prop("checked", user.active);
			}
			$('input[name=gender][value="' + user.gender + '"]').prop(
				'checked', true);

			user.role.forEach(function(r) {
				console.log(r.roleName);
				$('#role option[value="' + r.roleName + '"]').prop('selected', true);
			})
		},
		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});
}