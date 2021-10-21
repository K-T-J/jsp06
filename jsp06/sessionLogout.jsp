<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그아웃 처리 -> session sid 속성 삭제
	//삭제 #1. name주고 원하는 속성 각각 삭제
	session.removeAttribute("sid");
	
	//삭제 #2. 세션의 모든 속성을 삭제
	session.invalidate();
	
	
	response.sendRedirect("sessionMain.jsp");
%>



</body>
</html>