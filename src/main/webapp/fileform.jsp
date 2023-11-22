<%--
  Created by IntelliJ IDEA.
  User: leesu-in
  Date: 2023/11/17
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form method="post" action="fileupload.jsp" enctype="multipart/form-data">
    이미지를 선택하세요 : <input type="file" name="photo"/>
    <input type="submit" value="Upload"/>
</form>
</body>
</html>
