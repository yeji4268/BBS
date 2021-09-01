<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
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
		User user = new UserDAO().getUser(userID); 
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
		<%-- 로그인이 되어있는 상태  --%>
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
  						<li><a href="updateInfo.jsp">회원정보 수정</a></li>
  						<li><a href="logoutAction.jsp">로그아웃</a></li>
  					</ul>
  				</li>
			</ul>
		</div>
	</nav>
	<div class = "container">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan = "3" style= "background-color: #eeeeee; text-align : center; ">회원정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style = "width : 20%; ">이름</td>
						<td colspan = "2"><%=user.getUserName()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan = "2"><%=user.getUserGender() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan = "2"><%=user.getUserEmail() %></td>
					</tr>
				</tbody>
			</table>
			<a href = "updateInfo.jsp" class = "btn btn-primary">수정</a>
			<a href = "deleteAccount.jsp" class = "btn btn-primary">탈퇴</a>
		</div>
	</div>
	<div class = "col-lg-4"></div>
	<script src = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>