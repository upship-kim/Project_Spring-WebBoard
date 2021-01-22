<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<style>
	/* 게시판 공통 */
	.page{
		position: absolute;
		top: 10%;
		left: 20%;
		width: 75.2%;
	}
	.board{
		width: 100%;
		text-align: center;
		font-size: 0.8em;
		/* border: 1px solid red; */
		background-color: gray;
	}
	.board td,th{
		/* border: 1px solid red; */
	}
	.row{
		background-color: white;
	}
	.board #no{
		width: 10%;
	}
	.board #icon{
		width: 50%;
	}
	.board #title{
		font-size: 1.2em;
		text-align: left;
		padding-left: 2%;
	}
	.board #like, .board #reply{
		width: 10%;
	}
	.board #id{
		width: 14%;
	}
	


</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
	});

</script>

</head>

<body>
	<div class="page">
		<span><strong>public board</strong></span>
		<br>
		<br>
		
		
		
		<span><button id="create">새 글 쓰기</button></span>
		<div class="option">
			<div class="sortOption">
				<div class="sort">
					<span>최신순</span>
					<span>좋아요순</span>
					<span>댓글순</span>
					<span>조회순</span>
				</div>
			</div>
			<div class="searchOption">
				<div class="searchForm">
					<input type="text" placeholder="search">
					<span><button>아이콘</button></span>
					
				</div>
			</div>
		</div>
		
		
		
		<div class="board">
			<ul>
			<li class="list">
				<div class="first-wrap">
					<div class="prop">
						<span id="no">#12312</span>
						<span id="icon">(분류 아이콘)</span>
					</div>
					<h5 id="title">게시글제목</h5>
				</div>
				<div class="second-wrap">
					<div class="second-wrap-inline">
						<div class="like-info">
							<div class="like-info-icon">(아이콘)</div>
							<div id="like">32</div>
						</div>
						<div class="reply-info">
							<div class="reply-info-icon">(아이콘)</div>
							<div id="reply">11</div>
						</div>
					</div>
				</div>
				<div class="third-wrap">
					<div class=third-wrap-block>
						<div class="userInfo">
							<span id="id">아이디</span>
							<div class="viewInfo">
								<span class="viewIcon">(아이콘)</span>
								<span id="view">조회수</span>
							</div>
						</div>
						<div class="writeDate">
							<span id="date">2020.02.21</span>
						</div>
					</div>
				</div>
			</li>
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