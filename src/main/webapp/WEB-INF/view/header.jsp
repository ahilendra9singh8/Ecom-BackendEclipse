<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Headers · Bootstrap v5.0</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/headers/">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/headers.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/dashboard.css">

</head>

<body>

	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="ecommerce" viewBox="0 0 118 94">
          <title>E-commerce</title>
          <path fill="#000000"
			d="M9 2C8.447 2 8 2.447 8 3V4H2V6H3L4.592 11.325L4 13l-1 6h12l1.385-6.616A1 1 0 0 0 16 12V6H9V4h4V3c0-1.104.896-2 2-2s2 .896 2 2v1h2v2H9V6h1V4H9z" />

        </symbol>
        <symbol id="home" viewBox="0 0 16 16">
          <path
			d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
        </symbol>
        <symbol id="speedometer2" viewBox="0 0 16 16">
          <path
			d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z" />
          <path fill-rule="evenodd"
			d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z" />
        </symbol>
        <symbol id="table" viewBox="0 0 16 16">
          <path
			d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z" />
        </symbol>
        <symbol id="people-circle" viewBox="0 0 16 16">
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
          <path fill-rule="evenodd"
			d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
        </symbol>
        <symbol id="grid" viewBox="0 0 16 16">
          <path
			d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z" />
        </symbol>
        <symbol id="category" viewBox="0 0 16 16">
            <path
			d="M1 2.5A1.5 1.5 0 0 1 2.5 1h11A1.5 1.5 0 0 1 15 2.5v8a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 1 10.5v-8zM2.5 2a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-11zm1.5 6a2 2 0 0 0 2 2h5a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-5a2 2 0 0 0-2 2v3z" />
        
          </symbol>
        <symbol id="cart" viewBox="0 0 16 16">
          <path
			d="M14.293 3.293a1 1 0 0 0-1.414 0L11 5.586 7.707 2.293a1 1 0 0 0-1.414 0L2.293 7.293a1 1 0 0 0 0 1.414L5 11.586V14a1 1 0 0 0 2 0v-2h4v2a1 1 0 0 0 2 0v-2.414l2.707-2.707a1 1 0 0 0 0-1.414zM10 13H6v-2h4v2zM6.414 8L8 6.414 9.586 8H6.414z" />
        </symbol>
        <symbol id="about" viewBox="0 0 16 16">
          <path
			d="M0 1.5C0 1.224 0.224 1 0.5 1s0.5 0.224 0.5 0.5S0.776 2 0.5 2 0 1.776 0 1.5zM3.293 14.5L2.074 6.803 2 6.5V6C2 4.346 3.346 3 5 3h8c1.654 0 3 1.346 3 3v0.5c0 0.276-0.224 0.5-0.5 0.5h-10c-0.149 0-0.289 0.033-0.414 0.092l-0.004-0.004L2.707 14.5H3.293zM5.5 4C4.672 4 4 4.672 4 5s0.672 1 1.5 1 1.5-0.672 1.5-1S6.328 4 5.5 4zM13 5.5c0-0.276 0.224-0.5 0.5-0.5s0.5 0.224 0.5 0.5-0.224 0.5-0.5 0.5-0.5-0.224-0.5-0.5zM5 14h8c0.551 0 1-0.449 1-1s-0.449-1-1-1H5c-0.551 0-1 0.449-1 1S4.449 14 5 14zM6.5 9C7.328 9 8 9.672 8 10s-0.672 1-1.5 1-1.5-0.672-1.5-1S5.672 9 6.5 9zM12 9c0.828 0 1.5 0.672 1.5 1s-0.672 1-1.5 1-1.5-0.672-1.5-1S11.172 9 12 9z" />
        </symbol>
        <symbol id="contact-us" viewBox="0 0 16 16">
          <path
			d="M0 1.5C0 1.224 0.224 1 0.5 1s0.5 0.224 0.5 0.5S0.776 2 0.5 2 0 1.776 0 1.5zM3 4.5C3 4.224 3.224 4 3.5 4S4 4.224 4 4.5S3.776 5 3.5 5S3 4.776 3 4.5zM5 4.5C5 4.224 5.224 4 5.5 4S6 4.224 6 4.5S5.776 5 5.5 5S5 4.776 5 4.5zM8 4.5C8 4.224 8.224 4 8.5 4S9 4.224 9 4.5S8.776 5 8.5 5S8 4.776 8 4.5zM12 1.5C12 1.224 12.224 1 12.5 1S13 1.224 13 1.5S12.776 2 12.5 2S12 1.776 12 1.5zM14 4.5C14 4.224 14.224 4 14.5 4S15 4.224 15 4.5S14.776 5 14.5 5S14 4.776 14 4.5zM16 4.5C16 4.224 16.224 4 16.5 4S17 4.224 17 4.5S16.776 5 16.5 5S16 4.776 16 4.5zM11 14.5C11 13.672 10.328 13 9.5 13S8 13.672 8 14.5 8.672 16 9.5 16 11 15.328 11 14.5zM4 14.5C4 13.672 3.328 13 2.5 13S1 13.672 1 14.5 1.672 16 2.5 16S4 15.328 4 14.5zM14 14.5C14 13.672 13.328 13 12.5 13S11 13.672 11 14.5 11.672 16 12.5 16S14 15.328 14 14.5z" />
        </symbol>
      </svg>

	<main>
		<header>
			<div class="px-3 py-2 bg-dark text-white">
				<div class="container">
					<div
						class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
						<a href="#"
							class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 118 94"
								width="40" height="32" class="bi me-2" role="img"
								aria-label="E-commerce">
                    <use xlink:href="#ecommerce" />
                  </svg> Ecomerce
						</a>

						<ul
							class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
							<li><a href="#" class="nav-link text-secondary"> <svg
										class="bi d-block mx-auto mb-1" width="24" height="24">
                        <use xlink:href="#home" />
                      </svg> Home
							</a></li>
							<li><a href="/EcomBack/dashboard"
								class="nav-link text-white"> <svg
										class="bi d-block mx-auto mb-1" width="24" height="24">
                        <use xlink:href="#speedometer2" />
                      </svg> Dashboard
							</a></li>
							<li><a href="/EcomBack/order" class="nav-link text-white">
									<svg class="bi d-block mx-auto mb-1" width="24" height="24">
                        <use xlink:href="#table" />
                      </svg> Orders
							</a></li>
							<li><a href="/EcomBack/category" class="nav-link text-white">
									<svg class="bi d-block mx-auto mb-1" width="24" height="24"
										viewBox="0 0 16 16">

                        <use xlink:href="#category" />
                      </svg> Products Category
							</a></li>
							<li><a href="/EcomBack/product" class="nav-link text-white">
									<svg class="bi d-block mx-auto mb-1" width="24" height="24">
                        <use xlink:href="#grid" />
                      </svg> Products
							</a></li>
							<li><a href="/EcomBack/shopingcart"
								class="nav-link text-white"> <svg
										class="bi d-block mx-auto mb-1" width="24" height="24">
                        <use xlink:href="#cart" />
                      </svg> Cart(<span id="cartItemCount">0</span>)
							</a></li>
							<li><a href="/EcomBack/about" class="nav-link text-white">
									<svg class="bi d-block mx-auto mb-1" width="24" height="24"
										xmlns="http://www.w3.org/2000/svg" fill="currentColor"
										class="bi bi-cart" viewBox="0 0 16 16">
                        <use xlink:href="#about" />
                      </svg> About
							</a></li>
							<li>
								<div class="col-lg-6 col-md-8 mx-auto">
									<div class="dropdown">
										<a href="#" class="nav-link text-white"> <svg
												class="bi d-block mx-auto mb-1" width="24" height="24"
												xmlns="http://www.w3.org/2000/svg" fill="currentColor"
												class="bi bi-chat-dots" viewBox="0 0 16 16">
                            <use xlink:href="#contact-us" />
                          </svg> Contact Us
										</a>
										<div class="dropdown-content">
											<a href="https://www.whatsapp.com">Whatsapp</a> <a
												href="https://www.facebook.com">Facebook</a> <a
												href="https://www.instagram.com">Instagram</a>
										</div>
									</div>
								</div>
							</li>
							<li><a href="/EcomBack/user" class="nav-link text-white">
									<svg class="bi d-block mx-auto mb-1" width="24" height="24">
                        <use xlink:href="#people-circle" />
                      </svg> Users
							</a></li>
							<li><a href="#" class="nav-link text-white"> <%
 HttpSession session1 = request.getSession(false);
 String username = null;

 if (session1 != null) {
 	username = (String) session1.getAttribute("username");
 }
 %> <%
 if (username != null) {
 %> <svg class="bi d-block mx-auto mb-1" width="24" height="24">
                          <use xlink:href="#people-circle" />
                        </svg>
									<p>
										Welcome,
										<%=username%>!
									</p> <%
 } else {
 %> <%
 }
 %>

							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="px-3 py-2 border-bottom mb-3">
				<div class="container d-flex flex-wrap justify-content-center">
					<form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto">
						<input type="search" class="form-control" placeholder="Search..."
							aria-label="Search">
					</form>

					<div class="text-end">

						<%
						HttpSession session2 = request.getSession(false);
						String username1 = null;

						if (session2 != null) {
							username1 = (String) session2.getAttribute("username");
						}
						%>

						<%
						if (username1 != null) {
						%>
						<a href="/EcomBack/loginpage"><button type="button"
								class="btn btn-primary text-dark me-2">Logout</button></a>
						<%
						} else {
						%>
						<a href="/EcomBack/loginpage"><button type="button"
								class="btn btn-light text-dark me-2">Login</button></a> <a
							href="/EcomBack/signup"><button type="button"
								class="btn btn-primary">Sign-up</button></a>
						<%
						}
						%>


					</div>
				</div>
			</div>
		</header>

		<div class="b-example-divider"></div>
	</main>

	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<script>
	var totalCartItems = sessionStorage.getItem('totalCartItems');
	document.getElementById('cartItemCount').textContent = totalCartItems
			|| '0';
</script>