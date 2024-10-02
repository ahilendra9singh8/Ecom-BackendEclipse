$(function() {
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/categories/getAllCategory",
		dataType: "json",
		success: function(response) {
			// console.log(response);
			populateTable(response);
		},

		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});

	function populateTable(categoryies) {
		var tbody = $('#categoryTable tbody');
		tbody.empty();
		categoryies.forEach(function(category) {
			var row = '<tr>'
				+ '<td>' + category.categoryId + '</td>'
				+ '<td>' + category.title + '</td>'

				+ '<td><button onclick="editCategory(\'' + category.categoryId + '\')">Edit</button>\n\n\
                   <button onclick="deleteCategory(\''+ category.categoryId + '\')">Delete</button>'
				+ '</tr>';
			tbody.append(row);
		});
	}

});

$(document).ready(function() {
	$('#categoryButton').click(function() {
		$("#categoryName").val("");
		$('#categoryPopup').fadeIn();
	});

	$('.close').click(function() {
		$('#categoryPopup').fadeOut();
	});

	$('#saveCategory').click(function() {
		var categoryName = $('#categoryInput').val();
		var categoryData = {
			title: categoryName
		};
		var hiddenforeditId = $("#hiddenforeditId").val();
		if (hiddenforeditId !== "") {
			$.ajax({
				type: "PUT", // or "POST" depending on your API
				url: "http://localhost:8090/EcomBack/categories/updateCategory/"
					+ hiddenforeditId,
				contentType: "application/json",
				data: JSON.stringify(categoryData),
				success: function(response) {
					alert("Category updated successfully");
					location.reload(true);
				},
				error: function(xhr, status, error) {
					alert("Error updating Category");
					console.error("Error: " + error);
				}
			});
		} else {
			$.ajax({
				type: "POST",
				contentType: "application/json",
				url: "http://localhost:8090/EcomBack/categories/createCategory",
				data: JSON.stringify(categoryData),
				success: function(data) {
					alert("Category created successfully!");
					location.reload(true);
				},
				error: function(error) {
					alert("Error creating Category!");
					console.log("Error: " + error);
				}
			});
		}
		$('#categoryPopup').fadeOut();
	});
});


function editCategory(categoryId) {
	$('#categoryPopup').fadeIn();
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/categories/getCategoryById/"
			+ categoryId,
		dataType: "json", // Change the data type according to your API response
		success: function(category) {
			$("#hiddenforeditId").val(category.categoryId);
			$("#categoryInput").val(category.title);
		},
		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});
}

function deleteCategory(categoryId) {
	if (confirm("Are you Sure ?") === false) {
		return;
	} else {
		$.ajax({
			type: "DELETE",
			url: "http://localhost:8090/EcomBack/categories/deleteCategory/"
				+ categoryId,
			success: function(response) {
				console.log("Category deleted successfully");
				location.reload(true);
			},
			error: function(xhr, status, error) {
				console.error("Status: " + status);
				alert("Error deleting Category");
			}
		});
	}
}