$(document).ready(function() {
	$.ajax({
		type: "GET",
		url: "http://localhost:8090/EcomBack/order/findAllOrders/findAll?pageSize=100&pageNumber=0",
		dataType: "json",
		success: function(response) {
			console.log(response);
			populateDataInOrder(response);
		},
		error: function(error) {
			console.error(error);
			alert("Error fetching user data");
		}
	});

	function populateDataInOrder(data) {
		// Assuming 'data' is the variable containing your AJAX response

		// Accessing the content array
		var contentArray = data.content;


		// Looping through each item in the content array
		contentArray.forEach(function(order) {
			// Accessing properties of each order
			var orderId = order.orderId;
			var orderStatus = order.orderStatus;
			var orderDelivered = order.orderDelivered;
			if (orderDelivered == null) {
				orderDelivered = "";
			}
			var paymentStatus = order.paymentStatus;
			var orderAmt = order.orderAmt;
			var billingAddress = order.billingAddress;

			// Accessing user information
			var userId = order.user.userId;
			var userName = order.user.name;
			var userEmail = order.user.email;
			// ... and so on

			// Looping through order items
			// var orderItemsHTML = order.orderItem.forEach(function (orderItem) {
			// var orderItemId = orderItem.orderItemId;
			// var totalProductPrice = orderItem.totalProductprice;

			// // Accessing product information
			// var productId = orderItem.product.productId;
			// var productName = orderItem.product.product_name;
			// var productPrice = orderItem.product.product_prize;
			// ... and so on

			var orderItemsHTML = order.orderItem.map(function(orderItem) {
				return `
                                <div class="order-item">
                                    <p class="card-text">Product Name: <strong>${orderItem.product.product_name}</strong></p>
                                    <p class="card-text">Product Price: <strong>${orderItem.product.product_prize}</strong></p>
                                    <!-- Add more order item details as needed -->
                                </div>`;
			}).join('');



			// Update HTML content
			$('#orderDetails').append('<div class="row"><div class="col-sm-6"><h6>ORDER NUMBER :' + orderId + '</h6><p class="card-text">ADDRESS : <strong>' + billingAddress + '</strong></p><p class="card-text">Order Status : <strong>' + orderStatus + '</strong></p><p class="card-text">Bill Amount : <strong>' + orderAmt + '</strong></p></div><div class="col-sm-6"><h5>Create At :</h5><p class="card-text">Payment Status : <strong>' + paymentStatus + '</strong></p><p class="card-text">Order Delivered : <strong>' + orderDelivered + '</strong></p></div></div><a href="#" class="btn btn-primary">Pay Now</a><a href="#" class="btn btn-primary" style="margin-left:5px">View Product</a><div class="card-footer text-muted"></div>');

		});
	}
});