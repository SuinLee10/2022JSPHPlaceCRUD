<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.HPlaceDAO, com.example.bean.HPlaceVO"%>
<%@ page import="com.example.file.FileUpload"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		HPlaceVO u = new HPlaceVO();
		u.setSeq(id);
		HPlaceDAO boardDAO = new HPlaceDAO();
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload deleteFile(request, filename);
		boardDAO.deleteBoard(u);

	}
	response.sendRedirect("posts.jsp");
%>