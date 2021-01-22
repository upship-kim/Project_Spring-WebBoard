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
		<h3>Private Board</h3>
		${list}
		<br>
		<span><button id="create" class="btn btn-default">글쓰기</button></span>
		<br>
		<div class="option">
			<div class="sortOption">
				<div class="sort">
					<span><a href="#">최신순</a></span>
					<span><a href="#">등록순</a></span>
					<span style="visibility: hidden;"><a href="#">none</a></span>
					<span style="visibility: hidden;"><a href="#">none</a></span>
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
			<!-- foreach 시작  -->
			<li class="list">
				<div class="first-wrap">
					<div class="prop">
						<span id="no">#12312</span>
					</div>
					<h4 id="title">게시판은 어떻게 만드는건가요??</h4>
				</div>
				<div class="second-wrap">
				</div>
				<div class="third-wrap">
					<div class=third-wrap-block>
						<div class="userInfo">
							<span id="id">아이디</span>
						</div>
						<div class="writeDate">
							<span id="date">2020.02.21</span>
						</div>
					</div>
				</div>
			</li>
			<!-- foreach 끝  -->
			</ul>
		</div>
		<!-- <table class="board">
			<tr>
				<td id="no">(#게시글번호)</td>
				<td id="icon">(분류 아이콘)</td>
				<td id="like" rowspan="2">(좋아요)</td>
				<td id="reply" rowspan="2">댓글수</td>
				<td id="id">아이디</td>
				<td id="view">조회수</td>
			</tr>
			<tr>
				<th id="title" colspan="2">게시글제목</th>
				<td id="date" colspan="2">(작성시간)</td>
			</tr>

		</table> -->
	<br>


</div>
</body>
</html>