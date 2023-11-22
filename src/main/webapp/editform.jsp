<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.dao.HPlaceDAO, com.example.bean.HPlaceVO"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
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

		.footer{
			background-color: #838383;
			color:#fff;
			text-align: center;
			font-family: 'Times New Roman', Times, serif;
		}

		* {
			box-sizing: border-box;
		}

		input[type=text], select, textarea {
			width: 50%;
			padding: 12px;
			border: 1px solid #ccc;
			border-radius: 4px;
			resize: vertical;
		}

		label {
			padding: 10px 10px 10px 0;
			display: inline-block;
		}

		input[type=submit],input[type=button] {
			background-color: #e4f1fd;
			color: black;
			padding: 8px 10px;
			border: 0.5px;
			border-color: black;
			border-radius: 4px;
			cursor: pointer;
			margin: 0 auto;
			margin-bottom: 10%;
			font-family: 'Times New Roman', Times, serif;
		}

		input[type=submit]:hover,input[type=button]:hover {
			background-color: #7189ff;
		}

		.container {
			border-radius: 5px;
			background-color: #ffffff;
			padding: 20px;
		}

		.col-25 {
			float: left;
			width: 25%;
			margin-top: 6px;
			font-family: 'Times New Roman', Times, serif;
			padding-left: 180px;
		}

		.col-75 {
			float: left;
			width: 75%;
			margin-top: 6px;
			font-family: 'Times New Roman', Times, serif;
		}

		/* Clear floats after the columns */
		.row::after {
			content: "";
			display: table;
			clear: both;
		}
		.header{
			font-family: 'Times New Roman', Times, serif;
			text-align: center;
			background-color: #838383 ;
			color: white;

		}

		/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
		@media screen and (max-width: 600px) {
			.col-25, .col-75, input[type=submit],input[type=button] {
				width: 100%;
				margin-top: 0;
			}
		}
	</style>
</head>
<body>

<%
	HPlaceDAO hplaceDAO = new HPlaceDAO();
	String id=request.getParameter("id");
	HPlaceVO u=hplaceDAO.getBoard(Integer.parseInt(id));
%>
<header class="top">
	<h1>A Record of Hot Place</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.jsp">Home</a>
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
			<h2>Edit the place</h2>
		</div>
	</div>
	<hr>
</div>

<form action="editpost.jsp" method="post">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
<div class="row">
	<div class="col-25">
	제목:
</div>
<div class="col-75">
	<input type="text" name="title" value="<%= u.getTitle()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	장소명:
</div>
<div class="col-75">
	<input type="text" name="placeName" value="<%= u.getPlaceName()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	주소:
</div>
<div class="col-75">
	<input type="text" name="address" value="<%= u.getAddress()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	전화번호:
</div>
<div class="col-75">
	<input type="text" name="mobile" value="<%= u.getMobile()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	운영시간:
</div>
<div class="col-75">
	<input type="text" name="runTime" value="<%= u.getRunTime()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	휴무일:
</div>
<div class="col-75">
	<input type="text" name="dayOff" value="<%= u.getDayOff()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	장소구분:
</div>
<div class="col-75">
	<input type="text" name="placeType" value="<%= u.getPlaceType()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	별점:
</div>
<div class="col-75">
	<input type="text" name="star" value="<%= u.getStar()%>"/>
</div>
</div>
<div class="row">
	<div class="col-25">
	내용:
</div>
<div class="col-75">
	<textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea>
</div>
</div>
<div class="row">
<div class="col-25">
	<input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/>
		</div>
	</div>
</form>

</body>

<footer class="footer">
	&copy; 2023 Project2
</footer>
</html>