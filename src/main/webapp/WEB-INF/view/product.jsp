<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Album example · Bootstrap v5.0</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/album/">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/carousel/">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/carousel.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/product.css">
</head>

<body>
	<main>
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="100%" fill="#777" />
							</svg>

					<div class="container">
						<div class="carousel-caption text-start">
							<h1>Example headline.</h1>
							<p>Some representative placeholder content for the first
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="100%" fill="#777" />
							</svg>

					<div class="container">
						<div class="carousel-caption">
							<h1>Another example headline.</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
								<rect width="100%" height="100%" fill="#777" />
							</svg>

					<div class="container">
						<div class="carousel-caption text-end">
							<h1>One more for good measure.</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<section class="py-5 text-center container">
			<div class="col-lg-6 col-md-8 mx-auto">
				<div class="dropdown">
					<button class="dropbtn">Category of products</button>
					<div class="dropdown-content"></div>

				</div>
				<button class="btn btn-primary addproductbtn"
					onclick="openUserPopup()">Add Product</button>
			</div>
		</section>

		<!-- Product Creation Popup -->
		<div id="user-popup">
			<span class="close-btn" onclick="closeUserPopup()">&times;</span>
			<!-- Form to capture user details -->
			<form id="user-form" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="form-group">
						<label for="product_name">Product Name</label> <input type="text"
							id="product_name" name="product_name" required>
					</div>
					<div class="form-group">
						<label for="product_prize">Product Prize</label> <input
							type="text" id="product_prize" name="product_prize" required>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="product_quantity">Product Quantity</label> <input
							type="text" id="product_quantity" name="product_quantity"
							required>
					</div>
					<div class="form-group">
						<label for="product_image">Product Image</label> <input
							type="file" id="product_image_input" name="product_image"
							accept="image/*" required>

					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="product_description">Product Description</label>
						<textarea id="product_description" name="product_description"
							required></textarea>
					</div>

					<div class="form-group">
						<label for="product_category">Product Category</label> <select
							id="product_category" name="product_category" required>
						</select>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group">
						<label for="stock">Stock</label> <input type="checkbox" id="stock"
							name="stock" required>
					</div>
					<div class="form-group">
						<label for="product_live">Product Live</label> <input
							type="checkbox" id="product_live" name="product_live" required>
					</div>
				</div>

				<!-- <button type="button" onclick="createProduct()">Add Product</button> -->
				<button type="submit">Add Product</button>

			</form>
		</div>


		<!--  Show Product -->
		<div class="album py-5 bg-light">
			<div class="container">

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
					id="productContainer"></div>
			</div>
		</div>

		<!-- view Single product -->
		<div id="viewpopupContainer">
			<div class="viewpopup">
				<span class="viewclose" id="viewclosePopup">&times;</span>
				<div id="popupContent">
					<!-- Dynamic content will be inserted here -->
				</div>
			</div>
		</div>

		<input type="text" id="hiddenforeditId" name="" value="" hidden>
	</main>

	<footer class="text-muted py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
			<p class="mb-1">Album example is &copy; Bootstrap, but please
				download and customize it for yourself!</p>
			<p class="mb-0">
				New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a
					href="../getting-started/introduction/">getting started guide</a>.
			</p>
		</div>
	</footer>



	<!--  JS  -->
	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/product.js"></script>

</body>
</html>