<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>템플렛3번입니다.</title>
<link rel="icon" href="template3/img/core-img/favicon.ico">
<link rel="stylesheet" href="template3/css/core-style.css">
<link rel="stylesheet" href="template3/style.css">

<script src="template3/js/jquery/jquery-2.2.4.min.js"></script>
<script src="template3/js/popper.min.js"></script>
<script src="template3/js/bootstrap.min.js"></script>
<script src="template3/js/plugins.js"></script>
<script src="template3/js/active.js"></script>
</head>

<body>

	<!--================ Start Header Menu Area =================-->
	<form action="StoreProductListAction.st" method="post"
		enctype="multipart/form-data">

		<div class="search-wrapper section-padding-100" style="height: 30px;">
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

		<!-- ##### Main Content Wrapper Start ##### 꼭 있어야함-->
		<div class="main-content-wrapper d-flex clearfix">
			<!-- Mobile Nav (max width 767px)  -->
			<div class="mobile-nav">
				<!-- Navbar Brand  -->
				<div class="amado-navbar-brand">
					<a href="#"><img src="img/core-img/logo.png" alt="">
						${list[1].store_name }</a>
				</div>
				<!--Navbar Toggler -->
				<div class="amado-navbar-toggler">
					<span></span><span></span><span></span>
				</div>
			</div>

			<div class="shop_sidebar_area">
				<!-- 	##### Single Widget ##### -->
				<div class="widget catagory mb-50">
					<!-- Widget Title -->
					<div class="logo">
						<a href="#"> <img src="img/core-img/logo.png" alt="">
							<h2>
								<font color="#FFBB00">${list[1].store_name }</font>
								<h2></a>
					</div>
				</div>
				<div class="widget brands mb-50">
					<!-- 카테고리2 시작 -->
					<h3>
						<font color="#FFBB00">브랜드</font>
					</h3>
					<div class="widget-desc">
						<!-- 카테고리2 폼체크 -->
						<div class="form-check">
							<c:if test="${blist.size() ne 0 }">
								<c:forEach var="i" begin="0" step="1" end="${blist.size()-1 }">
									<div>
										<label class="form-check-label" for="amado">
										<a	href="./BrandProductAction.st?store_num=${store_num}&brand=${blist[i].brand_name}">	${blist[i].brand_name}(${blist[i].count })</a> </label>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="amado_product_area section-padding-20">
				<div class="container-fluid">

					<div class="row" align="right" style="height: 100px;">
						<div class="col-12">
							<div style="height: 100px;" product-topbar d-xl-flexalign-items-endjustify-content-between" >

								<div class="total-products"></div>

								<header class="header-area clearfix"> <!-- Cart Menu -->
								<div class="cart-fav-search mb-100" >
									<a href="#" class="search-nav"><img
										src="img/core-img/search.png" alt=""></a>
								</div>
								</header>
								
							</div>
						</div>
					</div>

					<div class="row">

						<c:set var="loop" value="true" />
						<c:if test="${list.size() ne 0 }">
							<c:forEach var="i" begin="${p.beginPerPage }" step="1"
								end="${p.endPerPage}">
								<c:if test="${p.total == i }">
									<c:set var="loop" value="false" />
								</c:if>
								<c:if test="${loop }">
									<div class="col-12 col-sm-6 col-md-12 col-xl-6">
										<div class="single-product-wrapper">
											<!-- Product Image -->
											<div class="product-img">
												<a
													href="StoreProductDetail.st?product_num=${list[i].product_num}">
													<img src="product_img_upload/${list[i].product_img}"
													width="370px" height="370px" alt="">
												</a>
											</div>

											<!-- Product Description -->
											<div align="center" style="margin-top: 10px;">
												<div class="product-meta-data" align="center">
													<h3>
														<font color="#FFBB00">${list[i].product_price } 원</font>
													</h3>
													<a
														href="StoreProductDetail.st?product_num=${list[i].product_num}">
														<h5>${list[i].product_name}</h5>
													</a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					<div class="row">
						<div class="col-md-4 offset-4 paging" style="height: 120px;">
							<ul class="pagination justify-content-center">
								<c:if test="${p.prev }">
									<li class="page-item previous"><a class="page-link"
										onclick="paging(${p.startPage-1 });">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${p.startPage }" step="1"
									end="${p.endPage }">
									<li class="page-item"><a class="page-link"
										${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''}
										href="StoreProductListAction.st?store_num=${list[1].store_num}&nowPage=${num}&page='true'">${num}</a></li>
								</c:forEach>
								<c:if test="${p.next }">
									<li class="page-item next"><a class="page-link"
										href="StoreProductListAction.st?store_num=${list[1].store_num}&&nowPage=${p.endPage + 1 }&page='true'">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
	</form>
	<%--  </c:forEach> --%>

</body>
</html>