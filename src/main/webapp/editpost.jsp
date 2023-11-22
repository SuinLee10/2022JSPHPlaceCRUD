<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.HPlaceDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.bean.HPlaceVO" />
<jsp:setProperty property="*" name="u"/>

<%
	HPlaceDAO hplaceDAO = new HPlaceDAO();
	int i=hplaceDAO.updateBoard(u);
	response.sendRedirect("posts.jsp");
%>