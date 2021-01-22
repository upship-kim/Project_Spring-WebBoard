<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="/board/view/css/infoBoard.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		var session = '${id}';
		var likeBtn = '';
			likeBtn +='<div class="likePart" >';
			likeBtn +='<button type="button" class="btn btn default" value="likeDone" style="background: white; color: #9292f5">';
			likeBtn +='좋아요 취소</button></div>';
			
		var cancleBtn = '';
			cancleBtn +='<div class="likePart" >';
			cancleBtn +='<button type="button" class="btn btn default" value="like" style="background: #9292f5; color: white">';
			cancleBtn +='<img alt="" src="/board/view/img/like.png">좋아요</button></div>';
		
	
			
			
		//목록	
		$("button#list").click(function(){
			location.href="/board/view/contents/main.jsp";
		})
		
		
		//좋아요
		$(document).on('click', '.likePart button', function(){
			alert('click');
			console.log($(".likePart button").val());
			if(session!=''){
				if($(".likePart button").val()=='like'){
					$.ajax({
						url: '/board/likeSelect.do',
						type: 'GET',
						dataType: 'text',
						data: {uno:'${id}', cno:${info.cno}},
						success:function(v){
							console.log(v);
							alert('select okay');
						likeOkay(v);
						},error:function(v){
							alert('시작에러');
						}
					});//ajax 종료
				}//if문 종료

			else {
				console.log($(".likePart button").val());
				$.ajax({
					url: '/board/likeCancle.do',
					type: 'POST',
					dataType: 'text',
					data: {uno:'${id}', cno:${info.cno}},
					success:function(v){
						console.log(v);
						$(".likePart").html(cancleBtn);
						$(".likePart button").val('like');
						alert('bb');
					}
				});
			}
			
			} else{
				alert('로그인을 해주세요.');
				location.href="/board/view/contents/login.jsp";
			}
		}); 
		
		function likeOkay(v){
			if(v=='okay'){
				$.ajax({
					url: '/board/likeFun.do',
					type: 'POST',
					dataType: 'text',
					data: {lCount:1, uno:'${id}', cno:${info.cno}},
					success:function(v){
						$(".likePart").html(likeBtn);
						$(".likePart button").val('likeDone');
						alert('aa');
					},error:function(v){
						alert('error');
					}
				});//내부 ajax 종료
			}//if문
			
			else if(v=='update'){
				$.ajax({
					url: '/board/likeReFun.do',
					type: 'POST',
					dataType: 'text',
					data: {uno:'${id}', cno:${info.cno}},
					success:function(v){										
						$(".likePart button").val('likeDone');
						$(".likePart").html(likeBtn);
						alert('aa22');
					},error:function(v){
						alert('error2');
					}
				}); // success exit
			}//else if문 
		}
	});

</script>

</head>

<body>
	<header>
 		<jsp:include page="../include/header.jsp"/>
	</header>

	<nav>
		<jsp:include page="../include/menuBar.jsp"/>
	</nav>
	<div class="page">
		<h3>${info.infoCategory}</h3>  
		<br>
		${info }<br>
		${id }
		<div class="infoBtns">
			<span><button id="list" class="btn btn-default listBtn">목록</button></span>
			<span><button id="mod" class="btn btn-default modBtn">수정</button></span>
			<span><button id="del" class="btn btn-default delBtn">삭제</button></span>
		</div>
		<hr>
		<div class="board">
			<div class="panel panel-default infoFrame">
				<div class="pannel-heading infoHead">
					<div class="infoFirstWrap">
						<h4 id="title">${info.title}</h4>
						<small><span id="nickName">${info.uno}</span></small>
					</div>
					<div class="infoSecondWrap">
						<div>조회수: <span id="view">${info.viewCount}</span></div>
						<div>좋아요: <span id="like">1</span></div>
						<div>등록일: <span id="regdate">${info.regdate }</span></div>
					</div>
				</div>
				<div class="panel panel-body infoBody">
					<div class="pannel contentsPart">
						${info.contents}
					</div>
				</div>
				<div class="filePart">
					${info.fileName}
				</div>
			</div>
			
			 <c:choose>
				<c:when test="${likeState eq 0}">
			<div class="likePart">
					<button type="button" class="btn btn default" value="like" style="background: #9292f5; color: white">
					<img alt="" src="/board/view/img/like.png">좋아요</button>
			</div>
				</c:when>
				<c:otherwise>
			<div class="likePart">
					<button type="button" class="btn btn default" value="likeDone" style="background: white; color: #9292f5">
					좋아요 취소</button>
			</div> 
				</c:otherwise>
			</c:choose> 
		</div><!-- board -->
	</div>
</body>
</html>