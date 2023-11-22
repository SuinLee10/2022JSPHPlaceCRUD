<%--
  Created by IntelliJ IDEA.
  User: leesu-in
  Date: 2023/11/21
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.example.dao.HPlaceDAO, com.example.bean.HPlaceVO"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view</title>
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
    .col-md-6 {
        font-family: 'Times New Roman', Times, serif;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
    }

    .box_2{
        display: flex;
    }
    .content {
        padding-left: 200px;
        padding-top: 30px;
        box-sizing: border-box;
        font-family: 'Times New Roman', Times, serif;
    }
    .text-container {
        font-family: 'Times New Roman', Times, serif;
        flex-grow: 1;
        padding-left: 30px;
        padding-top: 30px;
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hot Place</title>
<!-- 부트스트랩 CSS 포함 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            <h2>View of Place</h2>
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
<div class="content">
    <div class="box_2">
    <img style="opacity: 0.4;" class="profile" src="img/place.jpeg">
    <div class = "info">
        <div class="text-container">
        <%=u.getSeq() %>.<br>
        제목: <%= u.getTitle()%><br>
        장소명: <%= u.getPlaceName()%><br>
        주소: <%= u.getAddress()%><br>
        전화번호: <%= u.getMobile()%><br>
        운영시간: <%= u.getRunTime()%><br>
        휴무일: <%= u.getDayOff()%><br>
        장소구분: <%= u.getPlaceType()%><br>
        별점: <%= u.getStar()%><br>
        내용: <%= u.getContent()%><br>
        게시일: <%= u.getRegdate()%><br>
    </div>
    </div>
</div>
    <div>
</body>
<footer class="footer">
    &copy; 2023 Project2
</footer>
</html>
