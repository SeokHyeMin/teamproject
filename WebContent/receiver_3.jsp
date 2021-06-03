<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>배송지 정보</title>
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

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Ion Icon Fonts-->
<link rel="stylesheet" href="css/ionicons.min.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript"> 
function select_btn_onclick(i){ 
	
	opener.new_check.click();
	opener.document.getElementById("receiver_name").value = document.getElementById("receiver_name"+i).innerText;
	opener.document.getElementById("address_name").value = document.getElementById("address_name"+i).innerText;
	opener.document.getElementById("receiver_phone").value = document.getElementById("receiver_phone"+i).innerText;
	opener.document.getElementById("addr1").value = document.getElementById("addr1"+i).innerText;
	opener.document.getElementById("addr2").value = document.getElementById("addr2"+i).innerText;
	opener.document.getElementById("addr3").value = document.getElementById("addr3"+i).innerText;
	window.close();
	
} 

function close_btn_onclick(){ 

	window.close();
	
}


</script>

<style type="text/css">
table
{
    border-collapse: collapse;
    width: 90%;
}
th, td
{
    text-align: left;
    padding: 8px;
}
tr:nth-child(even)
{
    background-color: white;
}
th
{
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
	
	<div class="row">
			<div class="col-md-3" align="right">
				 <img
					src="images/modooLogo.png"
					alt="Logo" style="height: 30px">
			
			</div>
	</div>
	<h6 align="center">배송지 목록</h6>

	<table align="center">
	<tr>
		<th>배송지</th>
		<th>주소</th>
		<th>연락처</th>
		<th>선택</th>
	</tr>
	<c:forEach var="i" begin="0" step="1" end="${list.size()-1}" >
	<c:if test="${list[i].basic_num eq 1}">
		<tr>
			<td>
				<span id="address_name${i}">${list[i].address_name}</span><br>
				<strong id="receiver_name${i}">${list[i].receiver_name}</strong>
				<br>기본 배송지
			</td>
			
			<td>
				<span id="addr1${i}">${list[i].receiver_addr1}</span><br>
				<span id="addr2${i}">${list[i].receiver_addr2}</span><br>
				<span id="addr3${i}">${list[i].receiver_addr3}</span>
			</td>
			<td id="receiver_phone${i}">${list[i].receiver_phone}</td>
			<td><input type="button" value="선택" onclick="select_btn_onclick(${i});"/></td>
		<tr>
	</c:if>
	</c:forEach>
	<c:forEach var="i" begin="0" step="1" end="${list.size()-1}" >
	<c:if test="${list[i].basic_num eq 0}">
		<tr>
			<td>
				<span id="address_name${i}">${list[i].address_name}</span><br>
				<strong id="receiver_name${i}">${list[i].receiver_name}</strong>
				
			</td>
			
			<td>
				<span id="addr1${i}">${list[i].receiver_addr1}</span><br>
				<span id="addr2${i}">${list[i].receiver_addr2}</span><br>
				<span id="addr3${i}">${list[i].receiver_addr3}</span>
			</td>
			<td id="receiver_phone${i}">${list[i].receiver_phone}</td>
			<td><input type="button" value="선택" onclick="select_btn_onclick(${i});"/></td>
		<tr>
	</c:if>
	</c:forEach>
	
	</table>
		
			<div class="row" style="margin-left: 100px">
				<div style="margin-right: 20px">
					<input type="button" class="myButton" value="닫기" onclick="close_btn_onclick()">
				</div>
			</div>

	<!-- 	</div> -->
	<!-- popper -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap 4.1 -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>