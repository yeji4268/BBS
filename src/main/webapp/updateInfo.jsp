<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device=width", initial-scale="1">
<link rel="stylesheet" href ="css/bootstrap.css">
<link rel = "stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null ; 
		userID = (String)session.getAttribute("userID"); 
	%>
	<nav class = "navbar navbar-default">
		<div class = "navbar=header">
			<button type = "button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-exxpanded = "false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
			</button>
			<a class = "navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li><a href= "main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
  					<a href="#" class="dropdown-toggle"
  						data-toggle="dropdown" role="button" aria-haspopup="true"
  						aria-expanded="false"><%=userID%>님<span class="caret"></span></a>
  					<ul class="dropdown-menu">
  						<li><a href="updateInfo.jsp">회원정보</a></li>
  						<li><a href="logoutAction.jsp">로그아웃</a></li>
  					</ul>
  				</li>
			</ul>
		</div>
	</nav>
	<div class = "container">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<div class = "jumbotron" style="padding-top : 20px; ">
				<form method = "post" action = "updateInfoAction.jsp">
					<h3 style = "text-align:center; ">회원정보 수정</h3>
					<div class = "form-group">
						<input type = "password" class = "form-control" placeholder="비밀번호" name = "userPassword" maxlength= "20">
					</div>
					<div class = "form-group">
						<input type = "text" class = "form-control" placeholder="이름" name = "userName" maxlength= "20">
					</div>
					<div class = "form-group" style = "text-align : center; ">
						<div class = "btn-group" data-toggle="buttons">
							<label class = "btn btn-primary active">
								<input type = "radio" name = "userGender" autocomplete="off" value = "남자" checked>남자
							</label>
							<label class = "btn btn-primary">
								<input type = "radio" name = "userGender" autocomplete="off" value = "여자" checked>여자
							</label>
						</div>
					</div>
					<div class = "form-group">
						<input type = "email" class = "form-control" placeholder = "이메일" name = "userEmail" maxlength="20">
					</div> 
					<input type ="submit" class = "btn btn-primary form-control" value = "수정">
				</form>
			</div>
		</div>
	</div>
	<div class = "col-lg-4"></div>
	<script src = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>