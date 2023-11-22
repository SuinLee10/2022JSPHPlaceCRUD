<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.HPlaceDAO, com.example.bean.HPlaceVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>

.top {
	background-color: #838383;
	color: #fff;
	font-family: 'Times New Roman', Times, serif;
	padding: 10px;
}

.navbar-brand {
	font-family: 'Times New Roman', Times, serif;
}

.nav-link {
	font-family: 'Times New Roman', Times, serif;
}

.col-md-6 {
	font-family: 'Times New Roman', Times, serif;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
}

.box {
	padding-left: 80px;
	align-items: center;
	padding-top: 30px;
	box-sizing: border-box;
}
.box_2{
	display: flex;
}

.profile {
	max-width: 300px;
	height: 300px;
	object-fit: cover;
	border-radius: 50%;
	margin-right: 10px;
}

.info {
	background: #ffffff;
	display: flex;
	flex-direction: column;
}
.footer{
	background-color: #838383;
	color:#fff;
	text-align: center;
	font-family: 'Times New Roman', Times, serif;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	text-align: center;

}
.text-container {
	font-family: 'Times New Roman', Times, serif;
	flex-grow: 1;
	padding-left: 20px;
}
input[type="text"],
button,
select {
	height: 40px;
	line-height: 40px;
}
button{
	border: 1px solid #ccc;
	outline: none;
}
button#add {
	background-color: #c9bcf9 ; /* Change this to your desired color */
}

button#add:hover {
	background-color:#a68efd;
}
button:hover {
	background-color: #f0f0f0;
}
.edit,.delete{
	height:40px;
	width:40px;
	cursor: pointer;
}
.title{
	opacity: 0;
	transition: opacity 0.3s ease;
	padding: 10px;
	transform: translate(1%, 50%);
	top: 10%;
	background-color: rgba(255, 247, 216, 0.8);
	margin: 0;
}

.box:hover .title{
	opacity: 1;
}
a {
	color: black; /* 현재 텍스트의 색을 상속받음 */
	text-decoration: none; /* 밑줄 제거 */
	font-family: 'Times New Roman', Times, serif;
}
a:link {
	color: black; /* 방문하지 않은 링크의 색상 (기본 상태) */
}


a:visited {
	color: black; /* 방문한 링크의 색상 */
}

a:hover {
	color: black; /* 링크에 마우스를 올렸을 때의 색상 */
}

a:active {
	color: black; /* 링크를 클릭했을 때의 색상 */
}


</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Hot Place</title>
	<!-- 부트스트랩 CSS 포함 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<header class="top">
	<h1>A Record of Hot Place</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="posts.jsp">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="메뉴 토글">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="#">Intro</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Service</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Information</a>
			</li>
		</ul>
	</div>
</nav>

<div class="container mt-4">
	<div class="row">
		<div class="col-md-6">
			<h2>The List of Hot Place</h2>
		</div>
		<div class="col-md-6 justify-content-end align-items-center">
			<select name="rating" id="rating">
				<option value="0">Select Rating</option>
				<option value="1">*</option>
				<option value="2">**</option>
				<option value="3">***</option>
				<option value="4">****</option>
				<option value="5">*****</option>
			</select>
			<input type="text" name="search" placeholder="Search...">
			<button name="Search">Search</button>
			<a href="addpostform.jsp">
				<button name="add">Add</button>
			</a>
		</div>
	</div>

</div>    <hr>
</div>

<%
	HPlaceDAO hplaceDAO = new HPlaceDAO();
	List<HPlaceVO> list = hplaceDAO.getBoardList();
	request.setAttribute("list",list);
%>

<div class="box" onmouseover="showDetails(this)" onmouseout="hideDetails(this)">
	<div class="box_2">
	<img style="opacity: 0.4;" class="profile" src="img/place.jpeg">
	<div class="info">
		<div class="text-container">
			<p class="title">0.title<br>
			내용: 장소에서 기억에 남았던 일을 기록해주세요.<br>
			2023-11-21</p>
			<p>장소명: 특별한 추억을 선물해준 장소를 기록해주세요.</p>
			<p>주소: 000도 00시 북구 00동 00로</p>
			<p>전화번호: 000-000-0000 </p>
			<p>운영시간: 00:00 ~ 23:00 </p>
			<p>휴무일: 0요일/0요일</p>
			<p>장소구분: 디저트 카페 /서점 / 식당</p>
			<p>별점: 5</p>
			<div class="edelt">
				<img class="edit" src="img/pen.jpeg">
				<img class="delete" src="img/garbage.jpeg">
			</div>
			<hr>
		</div>
	</div>
</div>
</div>
<table>
<c:forEach items="${list}" var="u" varStatus="status">
	<c:if test="${status.index % 2 == 0}">
	<tr>
</c:if>
<td class="box" onmouseover="showDetails(this)" onmouseout="hideDetails(this)">
	<div class="box_2">
	<img style="opacity: 0.4;" class="profile" src="img/place.jpeg" onclick="location.href='view.jsp?id=${u.getSeq()}'">
	<div class="info">
		<div class="text-container">
			<p class="title">${u.getSeq()}.${u.getTitle()}<br>
				내용: ${u.getContent()}<br>
					${u.getRegdate()}</p>
		<p>장소명: ${u.getPlaceName()}</p>
		<p>주소: ${u.getAddress()}</p>
		<p>전화번호: ${u.getMobile()}</p>
		<p>운영시간: ${u.getRunTime()}</p>
		<p>휴무일: ${u.getDayOff()}</p>
		<p>장소구분: ${u.getPlaceType()}</p>
		<p>별점: ${u.getStar()}</p>
			<div class="edelt">
				<img class="edit" src="img/pen.jpeg" alt="Edit" onclick="location.href='editform.jsp?id=${u.getSeq()}'">
				<img class="delete" src="img/garbage.jpeg" alt="Delete" onclick="delete_ok('${u.getSeq()}')">
			</div>
			<hr>
	</div>
</div>
	</div>
</td>
	<c:if test="${status.index % 2 != 0 or status.last}">
		</tr>
	</c:if>
</c:forEach>
</table>
<br/>
</body>
<footer class="footer">
	&copy; 2023 Project2
</footer>

<!-- 부트스트랩 JS 및 Popper.js (네비게이션 바 토글러용) 포함 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
