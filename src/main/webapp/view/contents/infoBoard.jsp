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
		
		//수정
		$("#mod").click(function(){
			/* var url="/board/contentsModify.do?cno=${info.cno}";
			var name="수정하기";
			var option="width=700px, height=600px, top=100px, left=650px, location=no, scrollbars=yes, status=no";
			window.open(url, name, option); */
			location.href="/board/contentsModify.do?cno=${info.cno}"
		})
		
		//삭제
		$("#del").click(function(){
			var question = confirm("게시물을 삭제하시겠습니까?");
			if(question){
				location.href="/board/contentsDelete.do?cno=${info.cno}";
			}
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
		
		$(".tf_cmt").keydown(function(){
			//console.log($(".tf_cmt").val().size);
			$(".txt_byte").html($(".tf_cmt").val().length);
			if($(".tf_cmt").val().length>300){
				alert('입력 가능한 글자 수를 초과하였습니다.');
				$(".tf_cmt").val($(".tf_cmt").val().substring(0,299));
			}
		})
		
		$.ajax({
			url: '/board/replySelect.do',
			type: 'post',
			dataType: 'json',
			success:function(data){
				console.log(data);
				printList(data);
			}
		})
		
		$("form button").click(function(){
			 if($("#replyId").text()==null || $("#contents").val().length<1 ){
				alert('내용을 입력해주세요.');
			}else{
				$.ajax({
					url: '/board/reply.do',
					type: 'post',
					dataType: 'json',
					data: $("form[name='replyFrm']").serialize(),
					success:function(data){
						console.log(data);
						printList(data);
					}
				})
			} 
		})
		function printList(data){
			var temp="";
			var id = '${id}';
			 /*  $(data).each(function(index, dom){
				//console.log(dom.uno==id);
				if(id==dom.uno){
					temp+='<blockquote>';
					temp+='<h5>'+dom.rContents+'</h5>';
					temp+='<footer>';
					temp+='<span>'+dom.uno+'</span>,&nbsp;&nbsp;';
					temp+='<span>'+dom.rRegdate+'</span>';
					temp+='<button type="button" class="btn btn-danger">삭제</button>';
					temp+='</footer>';
					temp+='</blockquote>';
				} else{
					temp+='<blockquote>';
					temp+='<h5>'+dom.rContents+'</h5>';
					temp+='<footer>';
					temp+='<span>'+dom.uno+'</span>,&nbsp;&nbsp;';
					temp+='<span>'+dom.rRegdate+'</span>';
					temp+='</footer>';
					temp+='</blockquote>';
				}
			})   */
			  for(var i=0; i<data.length;i++){
				if(id==data[i].uno){
					temp+='<blockquote>';
					temp+='<h5>'+data[i].rContents+'</h5>';
					temp+='<footer>';
					temp+='<span>'+data[i].uno+'</span>,&nbsp;&nbsp;';
					temp+='<span>'+data[i].rRegdate+'</span>';
					temp+='<button type="button" class="btn btn-danger">삭제</button>';
					temp+='</footer>';
					temp+='</blockquote>';
				}else{
					temp+='<blockquote>';
					temp+='<h5>'+data[i].rContents+'</h5>';
					temp+='<footer>';
					temp+='<span>'+data[i].uno+'</span>,&nbsp;&nbsp;';
					temp+='<span>'+data[i].rRegdate+'</span>';
					temp+='</footer>';
					temp+='</blockquote>';
				}
			}  
			 
			$(".replyInfo").html(temp);
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
		<div class="infoBtns">
			<span><button id="list" class="btn btn-default listBtn">목록</button></span>
			<c:set var="uno" value="${ info.uno }"/>
			<c:if test="${id == uno }">
			<span><button id="mod" class="btn btn-default modBtn">수정</button></span>
			<span><button id="del" class="btn btn-default delBtn">삭제</button></span>
			</c:if>
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
						<div>좋아요: <span id="like">${info.lCount }</span></div>	<!-- 전체 좋아요 수  -->
						<div>등록일: <span id="regdate">${info.regdate }</span></div>
					</div>
				</div>
				<div class="panel panel-body infoBody">
					<div class="pannel contentsPart">
						<c:if test="${info.fileName != null }">
						<img alt="" src="/board/resources/fileupload/${info.fileName}" width="20%">
						</c:if>
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
		</div>
		<!-- board -->
		
		<!-- reply -->
		<div class="cmt_comm">
		<!-- reply form -->
     		<form action="#" name="replyFrm" method="post">
        		<h4 class="screen_out">댓글 작성</h4>
        		<hr>
        		<p><label id="replyId">${id }</label></p>
            	<textarea class="tf_cmt" cols="90" rows="5" placeholder="한줄 토크를 달아주세요" id="contents" name="rContents" ></textarea>
          		<button type="button" class="btn btn-default">등록</button>
           		<p class="info_append"><small>
              	<span class="screen_out"></span><span class="txt_byte">0</span> / 300자
           		</small></p>
           		<input type="hidden" name="cno" value="${info.cno}">
           		<input type="hidden" name="uno" value="${id}">
     		</form>
      <!-- form -->
      
      	<h4 class="screen_out">전체 댓글</h4>
		<hr>
     	<div class="replyInfo">
		 
		</div>
			
			
     		<hr>
      
      	</div>
	</div>
</body>
</html>