<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="/board/view/css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#create").click(function(){
			location.href="/board/view/contents/boardWrite.jsp?category=1";
		})
		/* $.ajax({
			url: '/board/select.do',
			type: 'POST',
			dataType: 'json',
			success:function(v){
				console.log(v);
			}
		}) */
	/* 	location.href="/board/select.do"; */
		/* $(document).on(function(){
		 	
	 		location.href="/board/select.do"; 
		}); */
	});

</script>

</head>

<body>
	<header>
		<jsp:include page="../include/header.jsp"/>
	</header>

	<nav>
		<jsp:include page="../include/menuBar.jsp"/>
<%-- <%@ include file="../include/menuBar.jsp"%> --%>
	</nav>
	<div class="page">
		<h3>Public Board</h3>
		<%=session.getAttribute("id") %>
		<br>
		<span><button id="create" class="btn btn-default">글쓰기</button></span>
		<br>
		<div class="option">
		<%-- ${list}  --%>
			<div class="sortOption">
				<div class="sort">
					<span><a href="/board/select.do?sort=cno">최신순</a></span>
					<span><a href="/board/select.do?sort=lcount">좋아요순</a></span>
					<span><a href="#">댓글순</a></span>
					<span><a href="/board/select.do?sort=viewcount">조회순</a></span>
				</div>
			</div>
			<div class="searchOption">
				<div class="searchForm">
					<input type="text" class="form-control" placeholder="search">
					<span><button type="submit" class="btn btn-default">아이콘</button></span>
					
				</div>
			</div>
		</div>
		
		<div class="board">
			<ul class="board-list">
			<c:forEach var="i" items="${list}">
			<li class="list">
				<div class="first-wrap">
					<div class="prop">
						<span id="no">#${i.cno}</span>
						<span id="icon">${i.infoCategory}</span>
					</div>
					<h4 id="title"><a href="/board/infoBoard.do?cno=${i.cno}">${i.title}</a></h4>
				</div>
				<div class="second-wrap">
					<div class="second-wrap-inline">
						<div class="like-info">
							<ul>
								<li class="like-info-icon"><img alt="" src="/board/view/img/like2.png"></li>
								<li id="like"><h3>${i.lCount}</h3></li>
					 		</ul>
						</div>
						<div class="reply-info">
							<ul>
							<li class="reply-info-icon"><img alt="" src="/board/view/img/reply.png"></li>
							<li id="reply"><h3>32</h3></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="third-wrap">
					<div class=third-wrap-block>
						<div class="userInfo">
							<span id="id">${i.uno}</span>
							<div class="viewInfo">
								<span class="viewIcon">조회수:</span>
								<span id="view">${i.viewCount}</span>
							</div>
						</div>
						<div class="writeDate">
							<span id="date">${i.regdate}</span>
						</div>
					</div>
				</div>
			</li>
			</c:forEach>
			</ul>
		</div>
	<br>


</div>
</body>
</html>