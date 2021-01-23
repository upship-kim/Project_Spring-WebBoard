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
						alert("제목이나 내용을 채워주세요");
					} else {
						$("form#bbs").submit();
					}
				});
	});
	function fileUpload(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "post",
			url : '/board/fileUpload.do',
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
				$("#fileName").val(data.savedFileName);
			}

		});
}
	 function fileDelete(src) {
		 alert(src);
		$.ajax({
			data : {"src":src},
			type : "post",
			url : '/board/fileDelete.do',
			cache : false,
			success : function(data) {
				alert("성공");
			}
		});
	}
</script>


</head>
<body>

	<form id="bbs" method="post" action="/board/summerWrite.do" enctype="multipart/form-data">
			<input type="hidden" name="uno" value="${id }">
		<div>
			<label>게시판</label>
			<input type="radio" name="category" value="public" >Public Board
			<input type="radio" name="category" value="private">Private Board
		</div>
		<div>
			<label>세부 카테고리</label>
			<input type="radio" name="infoCategory" value="테크">테크
			<input type="radio" name="infoCategory" value="리빙">리빙
			<input type="radio" name="infoCategory" value="기타">기타
		</div>
		<input type="text" id="title" name="title" maxlength="100" size="100%" placeholder="제목">
		<textarea id="summernote" name="contents"></textarea>
		<input type="hidden" id="file" name=fileName>
	</form>
	<input type="button" class="btn btn-default" name="cancle" id="cancle" value="취소"
		style="float: right">
	<input type="button" class="btn btn-default" name="save" id="save" value="저장"
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
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							fileUpload(files[i], this);
						}
					},
					onMediaDelete : function(target){
						fileDelete(target[0].src);
					}
				}
			});
		});
	</script>

</body>
</html>