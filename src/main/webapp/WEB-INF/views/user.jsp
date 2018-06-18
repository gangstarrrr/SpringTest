<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="userInsert" method="post">
		<input type="email" name="userEmail" placeholder="이메일ㄱㄱ" maxlength="100" required="required"><br>
		<!-- maxlength이상쓰면 값이 써지질 않는다 / required 걸어주면 not null 제약시키는거 -->
		<input type="password" name="userPassword" placeholder="비밀번호 입력 ㄱㄱ" maxlength="10" required="required"><br>
		<input type="text" name="userName" placeholder="이름 입력 ㄱㄱ" maxlength="50" required="required"><br>
		<input type="submit" value="가입">
	
	</form>
</body>
</html>
