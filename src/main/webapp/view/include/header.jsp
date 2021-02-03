<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/board/view/css/header.css">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"> -->
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>

<body>
	<header id="header">
		<div id="logo">
			<div><a href="/board/view/contents/main.jsp"><strong>UpShip-Web</strong></a></div>		
		</div>
		<c:choose>
		<c:when test="${id eq null}">
		<ul id="nav">
			<li><strong><a href="/board/view/contents/login.jsp">LOGIN</a></strong></li>
			<li><strong><a href="/board/view/contents/join.jsp">JOIN</a></strong></li>
		</ul>
		</c:when>
		<c:otherwise>
		<ul id="nav">
			<li><img src="/board/view/img/online.png">${id}</li>
			<li><strong><a href="/board/logout.do?id=${id }">LOGOUT</a></strong></li>
		</ul>
		</c:otherwise>
		</c:choose>
	
	
	</header>


</body>
</html>