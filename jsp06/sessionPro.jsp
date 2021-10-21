<%@page import="web.jsp06.test.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>]
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	System.out.println("pro id : " + id);
	System.out.println("pro pw : " + pw);

	TestDAO dao	= new TestDAO();
	boolean res = dao.loginCheck(id, pw);
	
	if(res){ //id,pw 확인 결과 true
		//세션 속성 추가
		session.setAttribute("sid", id);
		
		//main 으로 이동
		System.out.println("메인으로 이동합니다");
		response.sendRedirect("sessinMain.jsp");
	}else{//id,pw 확인결과 false %>
		
		<script >
			alert("ID가 일치하지 않습니다. 다시 시도 해주세요..");
			history.go(-1);
		</script>
			
	<%}
	
%>
<body>




</body>
</html>