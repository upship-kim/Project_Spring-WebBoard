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
	var category = '${category}';
		
	$(function(){
		$("#create").click(function(){
			location.href="/board/view/contents/boardWrite.jsp?category="+category;
		})
		
		
		//search
		$("#search").click(function(){
			var sort = '<%= request.getParameter("sort") %>';
			var search= $("#searchText").val();
			var page = ${pageVo.page};
			var range = ${pageVo.range}; 
			if(search.length == 0){
				alert('검색어를 입력해주세요');
				return false;
			}else{
				location.href="/board/select.do?category="+category+"&sort="+sort+"&search="+search+'&page='+page+'&range='+range;
				
			}
		})		
		//sort - 최신순
		$("#sort-cno").click(function(){
			//alert('a');
			var sort = '<%= request.getParameter("sort") %>';
			var category = '${category}';
			var page = ${pageVo.page};
			var range = ${pageVo.range}; 
			var search= $("#searchText").val();
			location.href="/board/select.do?category="+category+"&sort=cno&search="+search+'&page='+page+'&range='+range;
		})
		//sort - 좋아요순
		$("#sort-lcount").click(function(){
			//alert('a');
			var sort = '<%= request.getParameter("sort") %>';
			var category = '${category}';
			var page = ${pageVo.page};
			var range = ${pageVo.range};
			var search= $("#searchText").val();
			location.href="/board/select.do?category="+category+"&sort=lcount&search="+search+'&page='+page+'&range='+range;
		})
		//sort - 댓글순
		$("#sort-reply").click(function(){
			//alert('a');
			var sort = '<%= request.getParameter("sort") %>';
			var category = '${category}';
			var page = ${pageVo.page};
			var range = ${pageVo.range};
			var search= $("#searchText").val();
			location.href="/board/select.do?category="+category+"&sort=reply&search="+search+'&page='+page+'&range='+range;
		})
		//sort - 조회순
		$("#sort-view").click(function(){
		//	alert('a');
			var sort = '<%= request.getParameter("sort") %>';
			var category = '${category}';
			var page = ${pageVo.page};
			var range = ${pageVo.range};
			var search= $("#searchText").val();
			location.href="/board/select.do?category="+category+"&sort=viewcount&search="+search+'&page='+page+'&range='+range;
		})
		
		
	});
	function infoBoard(cno){
		sort= '${sort}';
		search= '${search}';
		var page = ${pageVo.page};
		var range = ${pageVo.range};
		var url="/board/infoBoard.do?category="+category+"&sort="+sort+"&search="+search+'&page='+page+'&range='+range+'&cno='+cno;
		location.href= url; 
	}
	/* 이전버튼 */
	function paging_pre(page, range, rangeSize){
		console.log(page+' '+range+' '+rangeSize);		
		var search= $("#searchText").val();
		var category = '${category}';
		sort= '${sort}';
		search= '${search}';
		page = parseInt((range-2)*rangeSize)+1; 
		range = range -1;
		url= '/board/select.do?category='+category+'&sort='+sort+'&page='+page+'&range='+range+'&search='+search;
		location.href= url; 
	}
	
	/* 페이징 버튼 */
	function paging(page, range, rangeSize){		//search 값 연동해야함 
		//console.log(page+' '+range+' '+rangeSize);		
		var category = '${category}';
		sort= '${sort}';
		search= '${search}';
		url= '/board/select.do?category='+category+'&sort='+sort+'&page='+page+'&range='+range+'&search='+search;
		location.href= url; 
	}
	
	/* 다음버튼 */
	function paging_next(page, range, rangeSize){
		//console.log(page+' '+range+' '+rangeSize);		
		var category = '${category}';
		sort= '${sort}';
		search= '${search}';
		page = parseInt((range * rangeSize))+1; 
		range = parseInt(range) +1;
		url= '/board/select.do?category='+category+'&sort='+sort+'&page='+page+'&range='+range+'&search='+search;
		location.href= url; 
	}
	

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
		<h3>
		<c:choose>
			<c:when test="${category eq 'public'}">
				Public Board
			</c:when>
			<c:when test="${category eq 'private'}">
				Public Board
			</c:when>
			<c:otherwise>
				Data Storage
			</c:otherwise>
		</c:choose>
		</h3>
		
		<br>
		<c:if test="${id != null}">
		<span><button id="create" class="btn btn-default">글쓰기</button></span>
		</c:if>
		<br>
		<div class="option">
			<div class="sortOption">
				<!-- 전체 -->
				<div class="sort">
			  		<span id="sort-cno"><a href="#">최신순</a></span>
					<span id="sort-lcount"><a href="#">좋아요순</a></span>
					<span id="sort-reply"><a href="#">댓글순</a></span>
					<span id="sort-view"><a href="#">조회순</a></span>
				</div>
			</div>
			<div class="searchOption">
				<div class="searchForm">
					<input type="text" class="form-control" placeholder="Search" id="searchText" value="${search}">
					<span><button type="submit" class="btn btn-default" id="search">
					<img alt="" src="/board/view/img/search.png" width="18px">
					</button></span>
				</div>
			</div>
		</div>
		<%-- ${list } --%>
		<div class="board">
			<ul class="board-list">
			<c:if test="${empty list}">
			<h5>검색 결과가 없습니다.</h5>
			</c:if>
			<c:forEach var="i" items="${list}">
			<li class="list">
				<div class="first-wrap">
					<div class="prop">
						<span id="no">#${i.cno}</span>
						<span id="icon">${i.infoCategory}</span>
					</div>
					<h4 id="title" class="title" onclick="infoBoard(${i.cno});"><a href="#">${i.title}
					<c:if test="${i.fileName!=null}">
					<img alt="" src="/board/view/img/file.png" width="16px">
					</c:if>
					</a></h4>
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
							<li id="reply"><h3>${i.rCount}</h3></li>
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
			<c:choose>
			<c:when test="${pageVo eq null}">
			</c:when>
			
			<c:otherwise>
			<ul class="pagination">
  			<c:if test="${pageVo.prev}"> 
  					<li onclick="paging_pre('${p}', '${pageVo.range}', '${pageVo.rangeSize}');"><a href="#">이전</a></li>
  			</c:if>
  			
  			<c:forEach var="p"  begin="${pageVo.startPage}" end="${pageVo.endPage}">
  			<c:choose>
  				 <c:when test="${p eq pageVo.page}">
  					<li class="active" onclick="paging('${p}', '${pageVo.range}', '${pageVo.rangeSize}');"><a href="#">${p}</a></li>
  				 </c:when>
  				 <c:otherwise>
  					<li onclick="paging('${p}', '${pageVo.range}', '${pageVo.rangeSize}');"><a href="#">${p}</a></li>
  				 </c:otherwise> 
  			</c:choose>
    		</c:forEach>
  			<c:if test="${pageVo.next}">
  					<li onclick="paging_next('${p}', '${pageVo.range}', '${pageVo.rangeSize}');"><a href="#">다음</a></li>
  			</c:if>
			</ul>
			</c:otherwise>
			</c:choose>
		</div>
	<br>
	


</div>
</body>
</html>