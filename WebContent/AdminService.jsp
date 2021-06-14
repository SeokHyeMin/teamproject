<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>AdminService</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700"
	rel="stylesheet">
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/receiver.js"></script> 

<style type="text/css">
.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.check {
	color: red;
	font-size: 13px;
}

.check2 {
	color: green;
	font-size: 13px;
}
input[type="text"] {
  width: 40%;
  border: 1px solid DarkGray;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}

</style>

</head>
<body>

	<div class="colorlib-product">
		<div class="container">
			<div class="row row-pb-lg">
				<div class="col-md-12">
					<div class="product-name d-flex">
						<div class="one-forth text-left px-2">
							<span>스토어 정보</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>신고 상품</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>신고 사유</span>
						</div>
						<div class="one-eight text-left px-2">
							<span>신고자</span>
						</div>
					</div>
					
					<c:set var="loop" value="true"/>
					<c:if test="${list.size() ne 0 }">
					<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
						<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
						</c:if>
						<c:if test="${loop }">
						<div class="product-cart d-flex">
							<div class="one-forth text-left px-4">
							<c:forEach var="j" begin="0" step="1" end="${slist.size()-1}">
									<c:if test="${slist[j].store_num eq rlist[i].store_num }">
									<div class="row d-flex">
										<div style="margin-right: 10px;">
											<img alt="" src="upload_profile/${slist[j].profile_img}" style="height: 100px; width: 100px;">
										</div>
										<div>
											<span style="font-weight: bold; font-size: 15px;">${slist[j].store_name }</span>
										</div>
									</div>
									</c:if>
							</c:forEach>
							</div>
							<div class="one-forth text-left px-4">
							<c:forEach var="j" begin="0" step="1" end="${plist.size()-1}">
								<c:if test="${plist[j].product_num eq rlist[i].product_num }">
								
									<div >
										상품 : <span style="font-weight: bold;">${plist[j].product_name}</span><br>
										가격 : <span style="color: red;">${plist[j].product_price}</span>원
									</div>
							
								</c:if>
							</c:forEach>
								
							</div>
							<div class="one-forth text-left px-4">
							<div class="row d-flex">
								<div style="margin-bottom: 10px;">
									<c:if test="${rlist[i].reportDetail eq 0 }">불법 및 미취급 상품</c:if>
									<c:if test="${rlist[i].reportDetail eq 1 }">상품가격 다름</c:if>
									<c:if test="${rlist[i].reportDetail eq 2 }">품절, 스펙/구성품/부가정보 다름</c:if>
									<c:if test="${rlist[i].reportDetail eq 3 }">상품제목 표기 위반</c:if>
									<c:if test="${rlist[i].reportDetail eq 4 }">직거래 유도, 에스크로 미적용 등 판매행위 위반</c:if>
									<c:if test="${rlist[i].reportDetail eq 5 }">기타</c:if>
								</div><br>
								<div class="display-tc">
								<c:if test="${rlist[i].detailText eq null }">상세사유 없음.</c:if>
								<c:if test="${rlist[i].detailText ne null }">상세 사유 : <span>${rlist[i].detailText}</span></c:if>
																
								</div>
							</div>
							</div>
							<div class="one-eight text-left px-2">
								<div class="display-tc">
								<c:forEach var="j" begin="0" step="1" end="${mlist.size()-1}">
									<c:if test="${mlist[j].member_num eq rlist[i].member_num }">
										<span style="font-weight: bold;">${mlist[j].id}</span>
								</c:if>
								</c:forEach>
								</div>
							</div>	
						</div>	
						</c:if>	
					</c:forEach>
					</c:if>		
				</div>
				
				
				
				<div class="row" style="margin-left: 100px" >
				<div style="margin-right: 20px" >
					<input type="button" class="myButton" value="뒤로" name="close_btn" id="close_btn" onClick="location.href='/AdminMain.ad'">
				</div>
			</div>
			
			<%--페이징 --%>
			<div class="row">
				<div class="col-md-6 offset-4 paging" style="height: 120px;" align="right">
 					<ul class="pagination">
       					<c:if test="${p.prev }">
           					 <li class="page-item previous">
              					  <a class="page-link" onclick="paging(${p.startPage-1 });">Previous</a>
           					 </li>
        				</c:if>
				        <c:forEach var="num" begin="${p.startPage }" step="1" end="${p.endPage }">
				            <li class="page-item">
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="AdminService.ad?page=true&nowPage=${num }" >${num }</a>
				            </li>
				        </c:forEach>
				   
				        <c:if test="${p.next }">
				            <li class="page-item next">
				                <a class="page-link" onclick="paging(${p.endPage + 1 });">Next</a>
				            </li>
				        </c:if>
   					 </ul>
				</div>
			</div>
			</div>
		</div>
		</div>
		
	<script src="js/popper.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>