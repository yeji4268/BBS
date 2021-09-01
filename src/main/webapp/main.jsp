<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width", initial-scale="1">
<link rel="stylesheet" href ="css/bootstrap.css">
<link rel = "stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
	a, a:hover {
		color: #000000; 
		text-decoration : none ; 
	}
	p input{
		background-color: #EEEEEE; 
	}
	div div h2{
		font-size : 45px; 
	}
</style>
<script>
	function toggleText() {
	  var text = document.getElementById("info");
	  if (text.style.display === "none") {
	    text.style.display = "block";
	  } else {
	    text.style.display = "none";
	  }
	}
	function copy_to_clipboard() {    
		  var copyText = document.getElementById('emailCopy');
		  copyText.select();
		  copyText.setSelectionRange(0, 99999);
		  document.execCommand("Copy");
		  alert('이메일이 복사되었습니다. ');
		}

</script>
</head>
<body>
	<%
		String userID = null ; 
		// 로그인이 되어있을 경우 
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded = "false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
			</button>
			<a class = "navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li class = "active"><a href="main.jsp">메인</a></li> 
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null){
			%>
			<%--로그인이 되어있지 않은 상태--%>
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
  					<a href="#" class="dropdown-toggle"
  						data-toggle="dropdown" role="button" aria-haspopup="true"
  						aria-expanded="false">접속하기<span class="caret"></span></a>
  					<ul class="dropdown-menu">
  						<li><a href="login.jsp">로그인</a></li>
  						<li><a href="join.jsp">회원가입</a></li>
  					</ul>
  				</li>
			</ul>	
			<%
				} else {
			%>
			<%--로그인이 되어있는 상태--%>
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
  					<a href="#" class="dropdown-toggle"
  						data-toggle="dropdown" role="button" aria-haspopup="true"
  						aria-expanded="false"><%=userID%>님<span class="caret"></span></a>
  					<ul class="dropdown-menu">
  						<li><a href="info.jsp">회원정보</a></li>
  						<li><a href="logoutAction.jsp">로그아웃</a></li>
  					</ul>
  				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class = "container">
		<%--사이트 정보--%>
		<div class = "jumbotron">
			<div class = "container">
				<h1>웹 사이트 소개</h1>
				<p>JSP 게시판 웹 사이트입니다.</p>
				<p id = 'info' style = 'display:none'>
					디자인 템플릿 : BootStrap<br>
					관리자 이메일 : 
        			<input id="emailCopy" value="yeji4268@naver.com" readonly>
        			<button onclick="copy_to_clipboard()"><img src="https://blog.kakaocdn.net/dn/N1wUc/btqIl7XZtKM/b44qX9Six1vczz2ISWj4LK/img.png" alt="복사하기"></button>
    			</p>
				<button type = 'button' onclick = "toggleText()">자세히 알아보기</button>
			</div>
		</div>
		<%--최신글(최신 5개글)--%>
		<div class = "jumbotron">
			<div class = "container">
				<h2>최신글</h2>
				<div class = "row">
				<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th style= "background-color: #eeeeee; text-align : center; ">번호</th>
							<th style= "background-color: #eeeeee; text-align : center; ">제목</th>
							<th style= "background-color: #eeeeee; text-align : center; ">작성자</th>
							<th style= "background-color: #eeeeee; text-align : center; ">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO(); 
							int pageNumber = 1 ; 
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber); 
							for(int i = 0 ; i < 5; i ++){
							
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><a href= "view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%=list.get(i).getUserID() %></td>
							<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분 " %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
				</div>
			</div>
			<a href = "bbs.jsp" class = "btn btn-primary pull-right">전체 글 보기</a>
		</div>
		<%--인기글(상위 5개글)--%>
		<div class = "jumbotron">
			<div class = "container">
				<h2>인기글</h2>
				<div class = "row">
				<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th style= "background-color: #eeeeee; text-align : center; ">번호</th>
							<th style= "background-color: #eeeeee; text-align : center; ">제목</th>
							<th style= "background-color: #eeeeee; text-align : center; ">작성자</th>
							<th style= "background-color: #eeeeee; text-align : center; ">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO2 = new BbsDAO(); 
							ArrayList<Bbs> list2 = bbsDAO.getList(pageNumber); 
							for(int i = 0 ; i < 5; i ++){
							
						%>
						<tr>
							<td><%=i + 1%></td>
							<td><a href= "view.jsp?bbsID=<%=list2.get(i).getBbsID()%>"><%=list2.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%=list2.get(i).getUserID() %></td>
							<td><%=list2.get(i).getBbsDate().substring(0, 11) + list2.get(i).getBbsDate().substring(11, 13) + "시" + list2.get(i).getBbsDate().substring(14, 16) + "분 " %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
				</div>
			</div>
			<a href = "bbs.jsp" class = "btn btn-primary pull-right">전체 글 보기</a>
		</div>
		
		
	</div>
	<script src = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>