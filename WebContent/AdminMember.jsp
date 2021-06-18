<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>AdminMember</title>
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
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="js/adminmember.js"></script>
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
						<div class="one-forth text-left px-4">
							<span>회원아이디</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>회원이름</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>이메일</span>
						</div>
						<div class="one-forth text-left px-4">
							<span>가입날짜</span>
						</div>
						<div class="one-eight text-center">
							<span>상태</span>
						</div>
					</div>
					
					<c:set var="loop" value="true"/>
					<c:if test="${list.size() ne 0 }">
					<c:forEach var="i" begin="${p.beginPerPage }" step="1" end="${p.endPerPage}">
						<c:if test="${p.total == i }">
						<c:set var="loop" value="false"/>
						</c:if>
						<c:if test="${loop }">
						<div class="product-cart d-flex" align="center" >
							<div class="one-forth text-left px-4">
								<div class="display-tc">
									<span class="price">${list[i].id}</span>
								</div>
							</div>
							<div class="one-forth text-left px-4">
								<div class="display-tc">
									<span class="price">${list[i].name}</span>
								</div>
							</div>
							<div class="one-forth text-left px-4">
								<div class="display-tc">
									<span class="price">${list[i].email}</span>
								</div>
							</div>
							<div class="one-forth text-left px-4">
								<div class="display-tc">
								<span class="price">${list[i].regdate}</span>								
								</div>
							</div>
							<div class="one-eight text-center">
								<input type="hidden" value="${list[i].member_num}" class="member_num">
								<div class="display-tc">
										<select form="" disabled="disabled" class="state">
											<option value="" selected="selected">
											<c:if test="${list[i].member_code eq 1}">일반</c:if>
											<c:if test="${list[i].member_code eq 2}">플래티넘</c:if>
											<c:if test="${list[i].member_code eq 3}">다이아</c:if>
											<c:if test="${list[i].member_code eq 4}">판매회원</c:if>
											<c:if test="${list[i].member_code eq 5}">스몰</c:if>
											<c:if test="${list[i].member_code eq 6}">빅</c:if>
											<c:if test="${list[i].member_code eq 7}">문의함 관리자</c:if>
											<c:if test="${list[i].member_code eq 8}">최고 관리자</c:if>
											</option>
											<c:if test="${list[i].member_code ne 1}"><option value="1">일반회원</option></c:if>
											<c:if test="${list[i].member_code ne 2}"><option value="2">플래티넘</option></c:if>
											<c:if test="${list[i].member_code ne 3}"><option value="3">다이아</option></c:if>
											<c:if test="${list[i].member_code ne 4}"><option value="4">판매회원</option></c:if>
											<c:if test="${list[i].member_code ne 5}"><option value="5">스몰</option></c:if>
											<c:if test="${list[i].member_code ne 6}"><option value="6">빅</option></c:if>
											<c:if test="${list[i].member_code ne 7}"><option value="8">문의함 관리자</option></c:if>
											<c:if test="${list[i].member_code ne 8}"><option value="9"> 최고 관리자</option></c:if> 
										</select>	
								<div style="margin-right: 20px">
									<input type="button" class="edit_btn" value="수정" name="edit_btn" id="edit_btn">
									<input type="button" class="ok_btn" value="완료" name="ok_btn" id="ok_btn">
								</div>
								
						</div>	
						</div>
						</div>
					</c:if>	
					</c:forEach>
					</c:if>	
				</div>

				<div class="row" style="margin-left: 100px">
					<div style="margin-right: 20px">
						<input type="button" class="myButton" value="뒤로" name="close_btn"
							id="close_btn" onClick="location.href='AdminMain.ad'">
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
				            	 <a class="page-link" ${p.cri.nowPage == num ? 'style="color:red;border-color:black"':''} href="AdminMember.ad?page=true&nowPage=${num }" >${num }</a>
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
	
	<!-- 	</div> -->
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