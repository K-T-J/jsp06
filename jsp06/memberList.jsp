<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="web.jsp06.test.SignupDAO"%>
<%@page import="web.jsp06.test.SignupVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%//웹 브라우저에 회원정보 리스트가 모두 나오게 출력
	
	//DB에서 전체 회원 정보 가져오기
	SignupDAO dao = new SignupDAO();
	List list = dao.selectAll();



%>
<body>
	<h2> 회원 리스트 </h2>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>NAME</td>
			<td>EMAIL</td>
			<td>GENDER</td>
			<td>HOBBIES</td>
			<td>BIRTHDAY</td>
			<td>JOB</td>
			<td>BIO</td>
			<td>REG DATE</td>
		</tr>
	<%
		for(int i =0; i < list.size(); i++){
			SignupVO vo = (SignupVO)list.get(i); %>
			
			<tr>
				<td><%= vo.getId() %></td>
				<td><%= vo.getPw() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getEmail() %></td>
				<td><%= vo.getGender() %></td>
				<td><%= vo.getMusic() %>,<%= vo.getSports() %>,<%= vo.getTravel()%>, <%=vo.getMovies() %></td>
				<td><%= vo.getBirthYY() %>, <%= vo.getBirthMM() %>, <%=vo.getBirthDD() %></td>
				<td><%= vo.getJob() %></td>
				<td><%= vo.getBio() %></td>
				<td><%= vo.getReg() %></td>
			</tr>
			
		<%}
	%>
	
	</table>

</body>
</html>