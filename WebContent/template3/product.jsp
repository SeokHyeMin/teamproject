<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>���÷�3�� ���������Դϴ�.</title>
<link rel="icon" href="template3/img/core-img/favicon.ico">
<link rel="stylesheet" href="template3/css/core-style.css">
<link rel="stylesheet" href="template3/style.css">

<script> var contextPath = "${pageContext.request.contextPath}";</script>
<script src="js/addbasket.js"></script>
</head>

<body>
	<!-- Search Wrapper Area Start -->
	<div class="search-wrapper section-padding-100">
		<div class="search-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="search-content">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
							<button type="submit">
								<img src="img/core-img/search.png" alt="">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<!-- Mobile Nav (max width 767px)-->
		<div class="mobile-nav">
			<!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
			</div>
		</div>

		<!-- Header Area Start -->
		<header class="header-area clearfix"> <!-- Close Icon -->
		<div class="nav-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<!-- Logo -->
		<div class="logo">
					<a href="StoreProductListAction.st?store_num=${pdto.store_num}">
						<h2> <font color="#FFBB00">${pdto.store_name }</font><h2>
					</a>
				</div>
		</header>
		<!-- Header Area End -->

		<!-- Product Details Area Start -->
		<div class="single-product-area section-padding-100 clearfix">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-lg-7">
						<div class="single_product_thumb">

							<div id="product_details_slider" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<a class="gallery_img"
											href="product_img_upload/${pdto.product_img}"> <img
											class="d-block w-100"
											src="product_img_upload/${pdto.product_img}"
											alt="First slide">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-5">
						<div class="single_product_desc">
							<!-- Product Meta Data -->
							<div class="product-meta-data">
								<div class="line"></div>
								<p class="product-price">${pdto.product_price} ��</p>
								<h5>${pdto.product_name}</h5>
							</div>
						</div>

						<div class="short_overview my-5">
							<p>${pdto.product_description}</p>
						</div>

						<!-- Add to Cart Form -->
						<form class="cart clearfix" method="post">
							<div class="cart-btn d-flex mb-50">
								<p>���� ����</p>
								<div class="quantity" style="margin-left: 10px;">
									 <input type="number" class="qty-text" id="quantity" step="1" min="1" max="300" name="quantity" value="1" style="text-align: right;"> 
								</div>
							</div>
							<div>
							<input value="${pdto.product_num}" type="hidden" name="product_num" id="product_num" />
							<button type="button" id="addbasket" class="btn amado-btn" style="margin-bottom: 20px;">��ٱ��� ���</button>
							</div>
								<a type="button" class="btn amado-btn" href="StoreProductListAction.st?store_num=${pdto.store_num}">
									��ǰ������� ����
								</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Details Area End -->
	</div>
	<!-- ##### Main Content Wrapper End ##### -->


	<script src="template3/js/jquery/jquery-2.2.4.min.js"></script>
	<script src="template3/js/popper.min.js"></script>
	<script src="template3/js/bootstrap.min.js"></script>
	<script src="template3/js/plugins.js"></script>
	<script src="template3/js/active.js"></script>

</body>

</html>