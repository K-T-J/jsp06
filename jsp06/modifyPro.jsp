<%@page import="web.jsp06.test.SignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8"); 

	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	SignupDAO dao = new SignupDAO(); 
	int result = dao.updateEmail(id, email); 

%>
<body>

	<%
		if(result == 1) { %>
			 
			 <h3> <%= id %> 님의 이메일 정보가 '<%= email %>'로 잘 수정 되었습니다. </h3>
			 
	<%	}else{ %>
		
			<h3> 수정 실패... </h3>
			
	<%	}
	%>


</body>
</html>