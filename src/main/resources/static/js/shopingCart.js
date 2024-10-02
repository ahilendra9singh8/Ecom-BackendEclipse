$(document).ready(function() {
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/cart/getCart",
		dataType: "json",
		success: function(response) {
			console.log(response);
			populateCartItem(response);
		},

		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});

	function populateCartItem(response) {
		// Assuming 'response' is your JSON response
		var totalItems = response.items.length;
		$('#totalItems').text(totalItems);

		sessionStorage.setItem('totalCartItems', totalItems);

		$('#hiddenfield1').empty();
		$('#hiddenfield1').val(response.cartId);

		// Assuming 'container' is the container element where you want to append the items
		var container = document.getElementById('yourContainerId');
		// var container = $('#yourContainerId');

		var alltottalprice = 0;
		// Loop through each cart item
		response.items.forEach(function(cartItem) {
			var productId = cartItem.product.productId;
			var productName = cartItem.product.product_name;
			var productColor = cartItem.product.color; // Replace 'color' with the actual property name
			var productSize = cartItem.product.size; // Replace 'size' with the actual property name
			var product_imageName = cartItem.product.product_imageName;

			var cartItemId = cartItem.cartItemId;
			var quantity = cartItem.quantity;
			var totalPrice = cartItem.totalprice;

			alltottalprice += totalPrice;

			// Create a new row for each cart item
			var newRow = document.createElement('div');
			newRow.classList.add('row');

			// Image column
			var imageCol = document.createElement('div');
			imageCol.classList.add('col-lg-3', 'col-md-12', 'mb-4', 'mb-lg-0');
			var imageDiv = document.createElement('div');
			imageDiv.classList.add('bg-image', 'hover-overlay', 'hover-zoom', 'ripple', 'rounded');
			var image = document.createElement('img');
			image.classList.add('w-100');
			image.src = '/EcomBack/static/image/' + product_imageName + '';
			image.width = '300';
			image.height = '200';
			var imageMask = document.createElement('div');
			imageMask.classList.add('mask');
			imageMask.style.backgroundColor = 'rgba(251, 251, 251, 0.2)';
			imageDiv.appendChild(image);
			imageDiv.appendChild(imageMask);
			imageCol.appendChild(imageDiv);
			newRow.appendChild(imageCol);

			// Data column
			var dataCol = document.createElement('div');
			dataCol.classList.add('col-lg-5', 'col-md-6', 'mb-4', 'mb-lg-0');
			var dataParagraph = document.createElement('p');
			dataParagraph.innerHTML = '<strong>' + productName + '</strong><br>Color: ' + productColor + '<br>Size: ' + productSize;
			var removeButton = document.createElement('button');
			removeButton.classList.add('btn', 'btn-primary', 'btn-sm', 'me-1', 'mb-2');
			removeButton.setAttribute('data-mdb-toggle', 'tooltip');
			removeButton.setAttribute('title', 'Remove item');
			removeButton.innerHTML = '<span>&#10006;</span>';
			// Add an event listener to call the removeItem function when the button is clicked
			removeButton.addEventListener('click', function() {
				removeItem(productId);
			});
			var wishlistButton = document.createElement('button');
			wishlistButton.classList.add('btn', 'btn-danger', 'btn-sm', 'mb-2');
			wishlistButton.setAttribute('data-mdb-toggle', 'tooltip');
			wishlistButton.setAttribute('title', 'Move to the wish list');
			wishlistButton.innerHTML = '<span>&#10084;</span>';
			dataCol.appendChild(dataParagraph);
			dataCol.appendChild(removeButton);
			dataCol.appendChild(wishlistButton);
			newRow.appendChild(dataCol);

			// Quantity and Price column
			var quantityPriceCol = document.createElement('div');
			quantityPriceCol.classList.add('col-lg-4', 'col-md-6', 'mb-4', 'mb-lg-0');
			var quantityDiv = document.createElement('div');
			quantityDiv.classList.add('d-flex', 'mb-4');
			var decreaseButton = document.createElement('button');
			decreaseButton.classList.add('btn', 'btn-primary', 'px-3', 'me-2');
			decreaseButton.onclick = function() {
				decreaseQuantity(quantityInput);
			};
			decreaseButton.innerHTML = '<span>&#8212;</span>';
			var quantityInput = document.createElement('input');
			quantityInput.id = 'form1'; // Set a unique ID for each quantity input
			quantityInput.min = '1';
			quantityInput.max = quantity.toString();
			quantityInput.name = 'quantity';
			quantityInput.value = '1';
			quantityInput.type = 'number';
			quantityInput.classList.add('form-control');
			var quantityLabel = document.createElement('label');
			quantityLabel.htmlFor = 'form1';
			quantityLabel.classList.add('form-label');
			// quantityLabel.innerText = 'Quantity';
			var increaseButton = document.createElement('button');
			increaseButton.classList.add('btn', 'btn-primary', 'px-3', 'ms-2');
			increaseButton.onclick = function() {
				increaseQuantity(quantityInput);
			};

			increaseButton.innerHTML = '<span>&#43;</span>';
			quantityDiv.appendChild(decreaseButton);
			quantityDiv.appendChild(quantityInput);
			quantityDiv.appendChild(quantityLabel);
			quantityDiv.appendChild(increaseButton);

			var priceParagraph = document.createElement('p');
			priceParagraph.classList.add('text-start', 'text-md-center');
			priceParagraph.innerHTML = '<strong>$' + totalPrice.toFixed(2) + '</strong>';

			quantityPriceCol.appendChild(quantityDiv);
			quantityPriceCol.appendChild(priceParagraph);
			newRow.appendChild(quantityPriceCol);

			// Append the new row to the container
			container.appendChild(newRow);

			// Add <hr class="my-4" /> after each product
			var hrElement = document.createElement('hr');
			hrElement.classList.add('my-4');
			container.appendChild(hrElement);
		});

		$('#totalPriceItem span').text('$' + alltottalprice.toFixed(2));
		$('#totalPriceItem1 span').text('$' + alltottalprice.toFixed(2));

		// Function to decrease quantity
		function decreaseQuantity(input) {
			var currentValue = parseInt(input.value, 10);
			if (currentValue > 0) {
				input.value = (currentValue - 1).toString();
			}
		}

		// Function to increase quantity
		function increaseQuantity(input) {
			var currentValue = parseInt(input.value, 10);
			input.value = (currentValue + 1).toString();
		}
	}
});

// Function to handle the removal of an item
function removeItem(productId) {
	// Your logic to remove the item goes here
	if (!confirm("Are you sure you want to remove this item?")) {
		return;
	} else {
		$.ajax({
			type: "DELETE",
			url: "http://localhost:8090/EcomBack/cart/deleteCartItemFromCart/" + productId,
			success: function(response) {
				alert("Cart item deleted successfully");
				location.reload(true);
			},
			error: function(xhr, status, error) {
				console.error("Error deleting cart item:", status, error);
				alert("Error deleting cart item");
			}
		});
	}
}


$(document).ready(function() {
	// Initially hide the address card
	$('#addressCard').hide();

	// Attach click event listener to the button
	$('#placeOrderBtn').click(function() {
		// Toggle the visibility of the address card
		$('#addressCard').toggle();
	});
});

function placeOrder() {
	var cartId = $('#hiddenfield1').val();
	var orderAddress = $('#address').val();

	var orderData = {
		cartId: cartId,
		orderAddress: orderAddress
	};

	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "http://localhost:8090/EcomBack/order/createOrder/",
		data: JSON.stringify(orderData),
		success: function(data) {
			alert("Order added in cart!");
			location.reload(true);
		},
		error: function(error) {
			alert("Order not add in cart!");
			console.log(error);
		}
	});

}