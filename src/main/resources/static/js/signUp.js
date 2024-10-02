var activevalue;
function updateCheckboxValue() {
	var checkbox = document.getElementById('activeCheckbox');
	activevalue = checkbox.checked ? 1 : 0;
}

function signUpFun() {
	// if (!validateForm()) {
	//     alert("Please fill in all mandatory fields.");
	//     return;
	// }
	debugger;
	selectedRoles = [
		{ "roleId": "4", "roleName": "ROLE_USER" }
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

	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "http://localhost:8090/EcomBack/user/createUser",
		data: JSON.stringify(userData),
		success: function(data) {
			alert("user registered successfully");
			/*window.location.href = '/EcomBack/loginpage';*/  
		},
		error: function(error) {
			alert("user not registered");
			window.location.href = '/EcomBack/signup';
			console.log(error);
		}
	});
}

function validateForm() {
	return $("#name").val() && $("#password").val() && $("#email").val()
		&& $("#address").val() && $("#aboutt").val()
		&& $("input[name='gender']:checked").val() && $("#phone").val();
}