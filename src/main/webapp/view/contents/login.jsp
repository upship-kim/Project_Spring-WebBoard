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
<link rel="stylesheet" href="/board/view/css/login.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		/*  if(${state}=='fail'){
			alert('check');
		}  */
		$("#loginBtn").click(function(){
			if($("#id").val()=='' || $("#pw").val()==''){
				if($("#id").val()=='') alert('ID를 입력하세요');
				if($("#pw").val()=='') alert('PW를 입력하세요');
				return false;
			}else{
				alert('뚱이 안녕? ');
				$("form").submit();		
			}
		});
		$("#saveId").click(function(){
			$("#saveId").val($("#id").val());
			alert($("#saveId").val());
		});
		
		$(".joinBtn").click(function(){
			location.href="../contents/join.jsp";
		})
	});

</script>

</head>

<body>
	<header>
		<%@ include file="../include/loginHeader.jsp" %>
	</header>
	<div class="mainPage">
		<div class="loginBox">
			<div class="panel panel-default login">
  				<div class="panel-heading boxHead"><h4>UpShip-Web</h4></div>
  				<c:choose>
  					<c:when test="${state eq 'fail'}">
  					<br>
						<p style="text-align: center; color: red;">ID & PW를 확인해주세요</p>  					
  					</c:when>
  				</c:choose>
  				<% 
    						String cookie =null;
    						Cookie[] cook = request.getCookies(); 
    							for(int i=0; i<cook.length; i++){
    								 if(cook[i].getName().trim().equals("id")){
    									cookie=cook[i].getValue();
    								} 
    							}
    						
    						%>
  				<div class="panel boxBody">
  					<form class="form-horizontal" action="/board/login.do" method="post">
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="id">ID</label>
    						<div class="col-sm-9">
    						<input type="id" class="form-control" id="id" name="id" placeholder="Enter id" value="<%=cookie==null?"":cookie%>">
   							</div>
  						</div>
  						<div class="form-group">
  							<label class="control-label col-sm-3 nameLabel" for="pwd">Password</label>
   							<div class="col-sm-9">
      							<input type="password" class="form-control" id="pw" name="pw" placeholder="Enter password">
   							</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-3 col-sm-9">	<!-- offset: 빈칸 -->
    						
    						
    						
     							<div class="checkbox">
      							<label><input type="checkbox" id="saveId" name="saveId" <%= cookie!=null?"checked":"" %>
      							 >Remember me</label>
     							</div>
  							</div>
						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-3 col-sm-9 btnGroup">
      						<button type="submit" class="btn btn-default loginBtn" id="loginBtn">LOGIN</button>
      						<button type="button" class="btn btn-default joinBtn">JOIN</button>
    						</div>
  						</div>
					</form>
				</div>
				</div>
		</div>
	</div>
	


</body>
</html>