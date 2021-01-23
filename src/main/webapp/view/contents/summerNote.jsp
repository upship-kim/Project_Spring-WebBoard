<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="function"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"	href="/board/view/css/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="summerNote/summernote-lite.js"></script>
<script src="summerNote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(function() {
		$("input#save").click(
				function() {
					if ($("textarea[name='contents']").val() == ""
							|| $("input#title").val() == "") {
						alert("제목 또는 내용을 채워주세요");
						return false;
					} else {
						$("form#bbs").submit();
					}
				});
	});
</script>


</head>
<body>

	<form id="bbs" method="post" action="/board/boardWrite.do" enctype="multipart/form-data">
			<input type="hidden" name="uno" value="${id}">
		<div>
			<label>게시판 선택</label>&nbsp;&nbsp; | &nbsp;&nbsp;
			<label class="radio-inline"><input type="radio" name="category" value="public">Public Board</label>
			<label class="radio-inline"><input type="radio" name="category" value="private">Private Board</label>
		</div>
		<div>
			<label>세부 카테고리</label>&nbsp;&nbsp; | &nbsp;&nbsp;
			<label class="radio-inline"><input type="radio" name="infoCategory" value="테크">테크</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="리빙">리빙</label>
			<label class="radio-inline"><input type="radio" name="infoCategory" value="기타">기타</label>
		</div>
		<input type="text" id="title" name="title" maxlength="100" size="100%" placeholder="제목">
		<textarea id="summernote" name="contents"></textarea>
		<div class="panel panel-default">
 			 <div class="panel-body">
				<input type="file" name="file"  >
 			 </div>
		</div>
	</form>
	
	<input type="button" class="btn btn-default" name="cancle" id="cancle" value="취소"
		style="float: right">
	<input type="submit" class="btn btn-primary" name="save" id="save" value="저장"
		style="float: right">
	<script>
		$('document').ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : 300, // 최소 높이
				maxHeight : 500, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				callbacks : { //이미지 업로드 콜백함수
				}
			});
		});
	</script>

</body>
</html>