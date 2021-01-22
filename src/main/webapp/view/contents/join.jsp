<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/join.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//중복 아이디 체크
		$("#idCk").click(function(){
			$.ajax({
				url:'/board/selectId.do', 
				dataType: 'text',
				data:{id:$("#id").val()},
				type:'GET',
				success:function(v){
					console.log(v);
					if(v=="okay"){
						alert("사용 가능한 아이디 입니다.");
						$("#checkId").val('1');	//중복확인 했는지 여부 판별
					}
					else if(v=="no"){
						alert("중복된 아이디 입니다.")
						$("#id").val('');
						$("#checkId").val('0');
					}
				}
				
			})
			//console.log($("#id").val());
		});
		//중복 닉네임 체크
		$("#nameCk").click(function(){
			$.ajax({
				url:'/board/selectName.do', 
				dataType: 'text',
				data:{name:$("#name").val()},
				type:'GET',
				success:function(v){
					console.log(v);
					if(v=="okay"){
						alert("사용 가능한 닉네임 입니다.");
						$("#checkName").val('1'); //중복확인 했는지 여부 판별
					}
					else if(v=="no"){
						alert("중복된 닉네임 입니다.")
						$("#name").val('');
						$("#checkName").val('0');
					}
				}
				
			})
			//console.log($("#id").val());
		});
		//중복체크 후 id 변경하면 중복체크 안된 상태로 변경
		$("#id").change(function(){
			$("#checkId").val('0');
		})
		//중복체크 후 name 변경하면 중복체크 안된 상태로 변경
		$("#name").change(function(){
			$("#checkName").val('0');
		})
		
		//메일주소_아이디 입력
		$("#emailId").keyup(function(){
			$("#email").val($("#emailId").val()+'@'+$("#select").val());
		})
		
		//메일주소 _셀렉 값 입력
		$("#select").change(function(){
			console.log($("#emailId").val());
			if($("#emailId").val()==''){
				alert('메일주소를 입력해주세요');
			}else{
			$("#email").val($("#emailId").val()+'@'+$("#select").val());
			}
		})
		//휴대폰 번호
		$(".hp").keyup(function(){
			console.log($(this).val().length);
			//입력 완료시 뒷번호 입력자리로 포커스 이동
			if($("#hp2").val().length==4){
				$("#hp3").focus();
			}
			//번호 입력 글자수를 초과하였을때 알람 & 초과 글자 지우기
			if($(this).val().length>4){
				alert("입력 가능한 번호를 초과하였습니다.");
				$(this).val($(this).val().substring(0,4));
			} 
			//글자가 입력되었을 떄 알람 및 전체 지우기
			if(isNaN($(this).val())){
				alert("숫자를 입력해주세요.");
				$(this).val('');	
			}
			//입력하는 대로 통합
			$("#hp").val($("#hp1").val()+'-'+$("#hp2").val()+'-'+$("#hp3").val());
			})
		
		 $("#submitBtn").click(function(){
			if($("#id").val()==''|| $("#checkId").val()=='0' || $("#pw").val()=='' || $("#name").val()==''|| 
				$("#checkName").val()=='0' || $("#emailId").val()=='' || $("select").val()=='empty' || 
				$("#email").val()=='' || $("#hp").val()=='' || $("#hp2").val().length<4 || $("#hp3").val().length<4){
					
					if($("#id").val()=='') alert('id를 입력하세요');
					if($("#checkId").val()=='0') alert('ID 중복 확인이 필요합니다');
					if($("#pw").val()=='') alert('pw를 입력하세요');
					if($("#name").val()=='') alert('NickName을 입력하세요');
					if($("#checkName").val()=='0') alert('NickName 중복 확인이 필요합니다');
					if($("#emailId").val()=='') alert('메일주소 아이디를 입력하세요');
					if($("select").val()=='empty') alert('메일주소를 선택하세요');
					if($("#email").val()=='') alert('메일주소를 확인해주세요');
					if($("#hp").val()=='') alert('휴대폰 번호를 확인해주세요');
					if($("#hp2").val().length<4) alert('휴대폰 번호를 확인해주세요');
					if($("#hp3").val().length<4) alert('휴대폰 번호를 확인해주세요');
				return false;
			}else{
				alert('뚱이 안녕? ');
				$("form #frm").submit();
			}
					
		});
		
	});

</script>

</head>

<body>
	<header>
		<%@ include file="../include/loginHeader.jsp" %>
	</header>
	<div class="mainPage">
		<div class="joinBox">
			<div class="panel panel-default join">
  				<div class="panel-heading boxHead"><h4>UpShip-Web Join</h4></div>
  				<div class="panel boxBody">
  					<form class="form-horizontal" action="/board/insertUser.do" method="post" id="frm">
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="id">ID</label>
    						<div class="col-sm-8 idDiv">
    							<input type="text" class="form-control" id="id" name="id" placeholder="Insert Here">
   								<button type="button" class="btn btn-default idBtn" id="idCk">중복 확인</button>
    							<input type="hidden" readonly="readonly" value="0" id="checkId"> <!-- 중복체크 했는지 여부 -->
   							</div>
  						</div>
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="pwd">Password</label>
   							<div class="col-sm-8">
      							<input type="password" class="form-control" id="pw" name="pw" placeholder="Insert Here">
   							</div>
  						</div>
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="name">NickName</label>
   							<div class="col-sm-8 nameDiv">
      							<input type="text" class="form-control" id="name" name="name" placeholder="Insert Here">
   								<button type="button" class="btn btn-default idBtn" id="nameCk">중복 확인</button>
    							<input type="hidden" readonly="readonly" value="0" id="checkName"><!-- 중복체크 했는지 여부 -->
   							</div>
  						</div>
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="email">E-Mail</label>
   							<div class="col-sm-8">
      							<input type="text" class="form-control" id="emailId" placeholder="Insert Here"> @
      							<select class="form-control" id="select">
      								<option value="empty">Select Email</option>
      								<option value="gmail.com">gmail.com</option>
      								<option value="naver.com">naver.com</option>
      								<option value="daum.net">daum.net</option>
      							</select>
      							<input type="hidden" id="email"  name="email">
   							</div>
  						</div>
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="hp">Phone</label>
   							<div class="col-sm-8 hpDiv">
      							<input type="text" class="form-control" id="hp1" readonly="readonly" value="010" > -
      							<input type="text" class="form-control hp" id="hp2" placeholder="Insert Here"> -
      							<input type="text" class="form-control hp" id="hp3" placeholder="Insert Here">
      							<input type="hidden" class="form-control hp" id="hp"  name="hp">
   							</div>
  						</div>
  						<br>
  						<hr>
  						<br>
  						<div class="form-group">
    						<div class="col-sm-offset-3 col-sm-8 btnGroup">
      						<button type="submit" class="btn btn-default submitBtn" id="submitBtn">SUBMIT</button>
      						<button type="button" class="btn btn-default cancleBtn">CANCLE</button>
    						</div>
  						</div>
					</form>
				</div>
				</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	


</body>
</html>