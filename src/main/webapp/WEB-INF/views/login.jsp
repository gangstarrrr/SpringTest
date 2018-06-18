
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>로그인</title>
	<meta charset="UTF-8">
</head>
<body>
	<h1>로그인</h1>
	<form action="userSelect" method="post">
	<input type="email" name="userEmail" placeholder="이메일ㄱㄱ" maxlength="100" required="required"><br>
	<input type="password" name="userPassword" placeholder="비밀번호 입력 ㄱㄱ" maxlength="10" required="required"><br>
	<input type="submit" value="로긴">
	</form>
</body>
</html>
