<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "modifuPro.jsp" method="post">
		<h4> 이메일 수정</h4>
		<p>당신의 id와 수정하고 싶은 새 이메일을 작성하세요</p>
		id : <input type = "text" name = "id"/><br/>
		이메일 : <input type = "text" name = "email"/><br/>
			<input type = "submit" value = "수정"/>
	</form>

</body>
</html>