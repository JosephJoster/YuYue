<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新用户注册</title>
</head>
<body style="text-align: center">
	<%
		UserDao userDao = new UserDao();
		String result_inof = "";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username == "" || password == "") {
			result_inof = "用户名和密码不能为空";
		} else if (!userDao.isValidChar(username) || !userDao.isValidChar(password)) {
			result_inof = "账户和密码只能使用阿拉伯数字和英文字母";
		} else {
			int result = userDao.register(username, password);
			if (result == 1) {
				result_inof = "用户名已存在";
			} else if (result == 2) {
				result_inof = "注册成功";
			} else {
				result_inof = "连接异常";
			}
		}
	%>
	<h1>新用户注册</h1>
	<hr />
	<p><%=result_inof%></p>
	<%
		String returnPath = "register.jsp";
		if (result_inof.equals("注册成功")) {
			returnPath = "login.jsp";
		}
	%>
	<a href=<%=returnPath%>><button>返回</button></a>

</body>
</html>