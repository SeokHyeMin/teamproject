<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>템플렛4번입니다.</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">

<link rel="stylesheet" href="template4/css/animate.css">
<link rel="stylesheet" href="template4/css/icomoon.css">
<link rel="stylesheet" href="template4/css/ionicons.min.css">
<link rel="stylesheet" href="template4/css/bootstrap.min.css">
<link rel="stylesheet" href="template4/css/magnific-popup.css">
<link rel="stylesheet" href="template4/css/flexslider.css">
<link rel="stylesheet" href="template4/css/owl.carousel.min.css">
<link rel="stylesheet" href="template4/css/owl.theme.default.min.css">
<link rel="stylesheet" href="template4/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="template4/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="template4/css/style.css">

</head>
<body>

	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-sm-7 col-md-9">
						<div id="colorlib-logo">
							<a href="#">${list[1].store_name}</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</nav>
		<!--================  카테고리 시작 =================-->
		<div class="colorlib-product">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="row">
							<div class="col-sm-12">
								<div class="side border mb-1">
									<h3>카테고리1</h3>
									<ul>
										<li><a href="#">카테고리1</a></li>
									</ul>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="side border mb-1">
									<h3>카테고리2</h3>
									<ul>
										<li><a href="#">카테고리2</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /col-lg-3 -->

					<!--================  상품 시작 =================-->
					<div class="col-lg-9 col-xl-9">
						<form action="StoreProductListAction.st" method="post"
							enctype="multipart/form-data">
							<div class="row row-pd-md">
								<c:set var="loop" value="true" />
								<c:if test="${list.size() ne 0 }">
									<c:forEach var="i" begin="${p.beginPerPage }" step="1"
										end="${p.endPerPage}">
										<c:if test="${p.total == i }">
											<c:set var="loop" value="false" />
										</c:if>
										<c:if test="${loop }">
											<div class="col-lg-4 mb-4 text-center"">
												<div style="width: 250px; height: 400px;">
													<a
														href="StoreProductDetail.st?product_num=${list[i].product_num}"
														class="prod-img"> <img width="250" height="350"
														src="product_img_upload/${list[i].product_img}"
														>
													</a>
												</div>
												<div class="desc">
													<h4>
														<a
															href="StoreProductDetail.st?product_num=${list[i].product_num}">${list[i].product_name}</a>
													</h4>
													<h6>${list[i].product_brand}</h6>

													<h6>
														<span class="price">${list[i].product_price}</span>원
													</h6>
												</div>
											</div>

										</c:if>
									</c:forEach>
								</c:if>
								<!-- <div class="w-100"></div> -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>

	<script src="template4/js/jquery.min.js"></script>
	<script src="template4/js/popper.min.js"></script>
	<script src="template4/js/bootstrap.min.js"></script>
	<script src="template4/js/jquery.easing.1.3.js"></script>
	<script src="template4/js/jquery.waypoints.min.js"></script>
	<script src="template4/js/jquery.flexslider-min.js"></script>
	<script src="template4/js/owl.carousel.min.js"></script>
	<script src="template4/js/jquery.magnific-popup.min.js"></script>
	<script src="template4/js/magnific-popup-options.js"></script>
	<script src="template4/js/bootstrap-datepicker.js"></script>
	<script src="template4/js/jquery.stellar.min.js"></script>
	<script src="template4/js/main.js"></script>
</body>
</html>