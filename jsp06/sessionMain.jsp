<%@page import="java.util.Enumeration"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String sid = (String)session.getAttribute("sid");
	System.out.println("sid : " + sid);

	// 세션 내부객체를 사용 못하는 환경에서는 request에서 getSession() 메서드를 활용하여 
	// 세션 꺼낼 수 있다.
	HttpSession mySession = request.getSession(); 

	// 날짜 관련 객체 
	Date time = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss"); // 날짜 출력 형태(패턴) 지정 

%>

<body>

	<h2> Main Page </h2>
	
	<h3> 세션 기능 사용해보기 </h3>
	세션 ID : <%= session.getId() %>  		 	<br />
	<%     
		time.setTime(session.getCreationTime());         
	%>
	세션 생성시간 : <%= sdf.format(time) %> 	<br />
	<%		
		time.setTime(session.getLastAccessedTime());   
	%>
	최근 접근시간 : <%= sdf.format(time) %> <br />
	
	[세션 리스트] <br />
	<%
		Enumeration enu = session.getAttributeNames(); 
		while(enu.hasMoreElements()){
			String name = enu.nextElement().toString(); 
			String value = session.getAttribute(name).toString();
			out.println(name + " = " + value + "<br />");
		}
	
	%>

	<%
		if(sid == null) { // 로그인 안됨(비로그인 상태) %>
			
			<h4> 로그인 하시려면, 아래 버튼 클릭! </h4>
			<button onclick="window.location.href='sessionForm.jsp'" >로그인</button>
			
	<%	}else{ // 로그인 상태 %>
			
			<h4> <%= sid %>님, 환영합니다. </h4>	
			<button onclick="window.location.href='sessionLogout.jsp'" >로그아웃</button>
			
	<%	}
	%>
	



</body>
</html>