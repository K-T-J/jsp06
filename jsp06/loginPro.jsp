<%@page import="web.jsp06.test.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	//넘어온 id, pw 꺼내서 해당 id,pw가 db상에도 동일하게 저장되어 있으면 로그인 시키기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//db 접근  TestDAO로 이동	
	
	TestDAO dao = new TestDAO();
	boolean res = dao.loginCheck(id, pw);
	System.out.println("jsp res : " + res);
	
	//res == true 면, 로그인처리
	 if(res){
		 System.out.println("쿠키 생성 완료");
		 //쿠키생성
		 Cookie c1 = new Cookie("cookieId",id);
		 Cookie c2 = new Cookie("cookiePw",pw);
		 c1.setMaxAge(60*60*24); //1day
		 c2.setMaxAge(60*60*24); //1day
		 response.addCookie(c1);// 쿠키 추가
		 response.addCookie(c2);
		 
		 response.sendRedirect("main.jsp");// 그냥 main 패이지로 이동
		 
	 }else{	//res == false면, 뒤로가기 
	 		System.out.println("else 탔다. 아이디비번 오류네");%>
	 			
		 <script>
		 	alert("ID 또는 PW가 일치하지 않습니다. 다시 시도 해주세요..")
		 	history.go(-1); // 다시 form 페이지 (이전페이지)로 이동 시킴
		 </script>
		 
	<%}
			
	
%>
<body>




</body>
</html>