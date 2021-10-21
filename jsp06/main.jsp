<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//로그인 처리를 쿠키로만 했을때,
	//로그인 / 비로그인 상태를 알기 위해 쿠키를 꺼내서 cookidId, cookiePw 가 있는지 체크 
	Cookie[] coos = request.getCookies();
	String cookieId = null, cookiePw = null;
	for(Cookie c : coos){//쿠키 다 꺼내기
		System.out.println(c.getName() + " = " + c.getValue()); //개발자 확인용으로 출력문 넣기
		if(c.getName().equals("cookieId")){//c가 현재 들고있는 쿠키 객체의 이름이 cookieId라면
			cookieId = c.getValue();// 해당 c가 들고있는 쿠키의 값을 꺼내서 변수에 담기
			
		} 
		if(c.getName().equals("cookiePw")){
			cookiePw = c.getValue();
		}
	}

%>
<body>
	
	<h1> Main Page</h1>
	
	<%-- 로그인 안된상태(비로그인) 쿠키가 있는지 없는지로 구분 --%>
	<%
		if(cookieId == null){%>
		
			<h2>로그인을 원하시면 , 아래 로그인 버튼을 눌러주세요</h2>
			<button onclick="window.location.href='form.jsp'">로그인</button>
		<%}else{// 로그인 된상태면%>
			<h2> <%=cookieId %>님, 환영합니다.</h2>
			<button onclick="window.location.href='logout.jsp'">로그아웃</button>
		<%}
	%>
	
	

</body>
</html>