<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		if (request.getParameter("userPassword") == null 
					|| request.getParameter("userName") == null
					|| request.getParameter("userGender").equals("") 
					|| request.getParameter("userEmail").equals("")) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력하지 않은 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script");
				} else {
					UserDAO userDAO = new UserDAO();
					int result = userDAO.updateInfo(userID, request.getParameter("userPassword"), request.getParameter("userName"),request.getParameter("userGender"),request.getParameter("userEmail")); 
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'main.jsp'");
						script.println("</script>");
				}
	%>
</body>
</html>