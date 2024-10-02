function addToCart(productId, quantity) {

	var cartData = {
		productId: productId,
		quantity: quantity
	};

	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "http://localhost:8090/EcomBack/cart/addtoCart",
		data: JSON.stringify(cartData),
		success: function(data) {
			alert("Item added in cart!");
			location.reload(true);
		},
		error: function(error) {
			alert("Item not add in cart!");
			console.log(error);
		}
	});
}

//Get All Category
$(function() {
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/categories/getAllCategory",
		dataType: "json",
		success: function(response) {
			var catdropdownId = $('#product_category');
			catdropdownId.empty();
			catdropdownId.append($('<option>').text('Select Category').val(''));

			var $dropdownContent = $('.dropdown-content');

			// Clear existing content
			$dropdownContent.find('button:not([id="categoryButton"])').remove(); // Remove existing buttons

			// Add a default button
			$dropdownContent.append($('<button>').attr('id', 'allButton').text('All').on('click', function() {
				categoryButtonClick(this);
			}));

			response.forEach(function(category) {
				catdropdownId.append($('<option>').text(category.title).val(category.categoryId));

				$dropdownContent.append($('<button>').attr('id', category.title.toLowerCase() + 'Button').text(category.title).data('categoryId', category.categoryId).on('click', function() {
					categoryButtonClick(this);
				}));


			})
		},

		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});
});


// Function to open the user creation popup
function openUserPopup() {
	$('#user-popup').addClass('active');
}

// Function to close the user creation popup
function closeUserPopup() {
	$('#user-popup').removeClass('active');
}

// create Product
$("#user-form").on("submit", function(e) {
	e.preventDefault();
	debugger;
	var formData = new FormData(this);

	var hiddenforeditId = $("#hiddenforeditId").val();
	if (hiddenforeditId !== "") {
		$.ajax({
			type: "PUT", // or "POST" depending on your API
			url: "http://localhost:8090/EcomBack/product/updateProduct/"
				+ hiddenforeditId,
			data: formData,
			cache: false,
			dataType: "json",
			contentType: false,
			processData: false,
			success: function(response) {
				alert("Product updated successfully");
				location.reload(true);
			},
			error: function(error) {
				alert("Error updating product");
				console.error("Error: " + error);
			}
		});
	} else {
		$.ajax({
			type: "POST",
			url: "http://localhost:8090/EcomBack/product/createProduct",
			data: formData,
			cache: false,
			dataType: "json",
			contentType: false,
			processData: false,
			success: function(data) {
				alert("product Created successfully!");
				location.reload(true);
			},
			error: function(error) {
				alert("Product not Added!");
				console.log(error);
			}
		});
	}
	closeUserPopup();
});

function categoryButtonClick(button) {
	// Get the category ID of the clicked button
	var selectedCategoryId = $(button).data('categoryId');
	getProductData(selectedCategoryId);
}

function getProductData(categoryId) {
	var url;
	if (categoryId == undefined) {
		url = "http://localhost:8090/EcomBack/product/viewAllProduct?pageNumber=0&pageSize=100";
	} else {
		url = "http://localhost:8090/EcomBack/product/getProductbyCategory/" + categoryId;
	}

	$.ajax({
		type: "GET",
		url: url,
		dataType: "json",
		success: function(response) {
			var products = response.content;
			if (categoryId == undefined) {
				populateDataOfProduct(products);
			} else {
				populateDataOfProduct(response);
			}

		},

		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});

	function populateDataOfProduct(products) {
		$('#productContainer').empty();

		products.forEach(function(product) {
			/*if (product.product_quantity > 0) {
				addToCartButton = '<button type="button" onclick="addToCart('
					+ product.productId
					+ ', '
					+ product.product_quantity
					+ ')" class="btn btn-sm btn-outline-secondary addToCartBtn" id="'
					+ product.productId
					+ '">AddToCart</button>';
			} else {
				addToCartButton = '<button type="button" class="btn btn-sm btn-outline-secondary" disabled>Out of Stock</button>';
			}*/
			// Create a card element
			var card = $('<div class="col">'
				+ '<div class="card shadow-sm">'
				+ '<img src="/EcomBack/static/image/'
				+ product.product_imageName
				+ '" class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">'
				+ '<div class="card-body">'
				+ '<p class="card-text"><strong>'
				+ product.product_name
				+ '</strong></p>'
				+ '<p class="card-text">'
				+ product.product_desc
				+ '</p>'
				+ '<div class="d-flex justify-content-between align-items-center">'
				+ '<div class="btn-group">'
				+ '<button type="button" class="btn btn-sm btn-outline-secondary" id="' + product.productId + '" onclick="ViewProduct(\'' + product.productId + '\')">View</button>'
				+ '<button type="button" class="btn btn-sm btn-outline-secondary" id="' + product.productId + '" onclick="EditProduct(\'' + product.productId + '\')">Edit</button>'
				+ '<button type="button" class="btn btn-sm btn-outline-secondary" id="' + product.productId + '" onclick="deleteProduct(\'' + product.productId + '\')">Delete</button>'
				//+ addToCartButton
				+ '</div>'
				//+ '<small class="text-muted">Quantity <strong>'
				//+ product.product_quantity
				+ '</strong>, </small>'
				+ '<small class="text-muted"><strong>&#x20b9; '
				+ product.product_prize
				+ '</strong></small>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '</div>');

			// Append the card to the container
			$('#productContainer')
				.append(card);
		});
	}
}

function deleteProduct(product_id) {
	if (confirm("Are you Sure ?") === false) {
		return;
	} else {
		$.ajax({
			type: "DELETE",
			url: "http://localhost:8090/EcomBack/product/deleteProduct/"
				+ product_id,
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
	$("#viewpopupContainer").fadeOut();
}

function EditProduct(product_id) {
	$("#viewpopupContainer").fadeOut();
	$('#user-popup').addClass('active');
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/product/viewProductById/"
			+ product_id,
		dataType: "json", // Change the data type according to your API response
		success: function(product) {
			$("#hiddenforeditId").val(product.productId);
			$("#product_name").val(product.product_name);
			$("#product_prize").val(product.product_prize);
			$("#product_quantity").val(product.product_quantity);
			$("#product_description").val(product.product_desc);
			if (product.stock) {
				$("#stock").prop("checked", product.stock);
			}
			if (product.live) {
				$("#product_live").prop("checked", product.live);
			}
			$('#product_category option[value="' + product.categoryDto.categoryId + '"]').prop('selected', true);
			//$("#product_image_input").val(product.product_imageName);
		},
		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});
}

//vew product

$(document).ready(function() {
	$("#viewclosePopup").click(function() {
		$("#viewpopupContainer").fadeOut();
	});
});

function ViewProduct(product_id) {
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/product/viewProductById/"
			+ product_id,
		dataType: "json", // Change the data type according to your API response
		success: function(product) {

			var htmlContent = `
        <img src="/EcomBack/static/image/${product.product_imageName}" alt="Product_Image" width="300" height="200">
        <h2>${product.product_name}</h2>
        <p>Description: ${product.product_desc}</p>
        <p>Quantity: ${product.product_quantity}</p>
        <p>Price: $${product.product_prize}</p>
        <p>Category: ${product.categoryDto.title}</p>
        <button class="addToCartButton viewbutton" onclick="addToCart(${product.productId},${product.product_quantity})">AddToCart</button>
      `;
			$("#popupContent").html(htmlContent);
		},
		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});
	$("#viewpopupContainer").fadeIn();
}

