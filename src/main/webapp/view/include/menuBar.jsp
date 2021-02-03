<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="/board/view/css/menuBar.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
	});

</script>

</head>

<body>
	<nav id="sideBar">
		<ul id="menuTitle">
			<li><strong>Menu</strong></li>
			
		</ul>
		<ul id="menuList">
			<li><a href="/board/select.do?category=public&sort=cno">Public Board</a></li>
			<c:if test="${id != null}">
			<li><a href="/board/select.do?category=private&sort=cno">Private Board</a></li>
			</c:if>
			<li><a href="/board/select.do?category=storage&sort=cno">Data Storage</a></li>
		</ul>
	
	</nav>




</body>
</html>