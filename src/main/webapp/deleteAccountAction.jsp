<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	String userID = (String)session.getAttribute("userID"); 
	User user = new UserDAO().getUser(userID);
	UserDAO userDAO = new UserDAO(); 
	int result = userDAO.deleteAccount(userID, user.getUserPassword());
	
	if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원 탈퇴에 실패했습니다. ')");
		script.println("location.href = 'info.jsp'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter(); 
		script.println("<script>"); 
		script.println("alert('성공적으로 탈퇴되었습니다.')"); 
		script.println("location.href = 'logoutAction.jsp'"); 
		script.println("</script>"); 
	}
%>
</body>
</html>