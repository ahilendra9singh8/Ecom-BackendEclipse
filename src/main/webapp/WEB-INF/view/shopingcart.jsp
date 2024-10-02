<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Include jQuery from a CDN -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<jsp:include page="header.jsp" />

<style>
.gradient-custom {
	/* fallback for old browsers */
	background: #6a11cb;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1),
		rgba(37, 117, 252, 1));
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, rgba(106, 17, 203, 1),
		rgba(37, 117, 252, 1))
}
</style>

<section class="h-100 gradient-custom">
	<div class="container py-5">
		<div class="row d-flex justify-content-center my-4">
			<div class="col-md-8">
				<div class="card mb-4">
					<div class="card-header py-3">
						<!-- <h5 class="mb-0">Cart - 2 items</h5> -->
						<h5 class="mb-0" id="cartItemCount">
							Cart - <span id="totalItems"></span> items
						</h5>

					</div>
					<div class="card-body" id="yourContainerId"></div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<p>
							<strong>Expected shipping delivery</strong>
						</p>
						<p class="mb-0">12.10.2020 - 14.10.2020</p>
					</div>
				</div>
				<div class="card mb-4 mb-lg-0">
					<div class="card-body">
						<p>
							<strong>We accept</strong>
						</p>
						<img class="me-2" width="45px"
							src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
							alt="Visa" /> <img class="me-2" width="45px"
							src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
							alt="American Express" /> <img class="me-2" width="45px"
							src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
							alt="Mastercard" /> <img class="me-2" width="45px"
							src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.webp"
							alt="PayPal acceptance mark" />
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h5 class="mb-0">Summary</h5>
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li
								class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0"
								id="totalPriceItem">Products <span>$53.98</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center px-0">
								Shipping <span>Gratis</span>
							</li>
							<li
								class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3"
								id="totalPriceItem1">
								<div>
									<strong>Total amount</strong> <strong>
										<p class="mb-0">(including VAT)</p>
									</strong>
								</div> <span><strong>$53.98</strong></span>
							</li>
						</ul>

						<button type="button" class="btn btn-primary btn-lg btn-block"
							id="placeOrderBtn">Go to checkout</button>
					</div>
				</div>
				<div class="card mb-4" id="addressCard">
					<div class="card-header py-3">
						<h5 class="mb-0">Add Address</h5>
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<textarea id="address" name="address" required></textarea>
							<br>
						</ul>
						<button type="button" class="btn btn-primary btn-lg btn-block"
							id="placeOrder" onclick="placeOrder()">Place order</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input value="" id="hiddenfield1" hidden />

</section>

<script
	src="${pageContext.request.contextPath}/static/js/shopingCart.js"></script>


