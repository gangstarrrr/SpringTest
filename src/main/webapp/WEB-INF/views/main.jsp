<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false"%> --%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>Hello App Server!  </h1>
	<a href="bList">게시판</a><br>
<%-- 	<c:choose>
		<when test="${sessionScope.user.status==1}"></when>
		<when test="${sessionScope.user.status==0}"></when>
		<otherwise></otherwise>
		</c:choose> --%>
	
<!-- choose는 case같은거고 otherwise는 default 같은 거 주석처리하면 네트워크 소스에서 볼 수 있으니 주석 안하는게 좋다. 필요한 코드만 넣는것이 좋 -->
	
	<c:if test="${empty sessionScope }">
		<a href="login">로그인</a>
		<a href="user">회원가입</a>
	</c:if>

 	<c:if test="${sessionScope.user.status==1}">
		${sessionScope.user.userName}
		<a href="logout">로그아웃</a>
	</c:if>
	
	<c:if test="${sessionScope.user.status==0}">
		<a href="login">로그인</a>
		<a href="user">회원가입</a>
		로그인한 계정은 가입돼 있지않아
	</c:if>
</body>
</html>