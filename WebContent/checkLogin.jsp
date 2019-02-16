<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Login</title>
</head>
<body style="text-align: center">
	<%
	//获得返回地址
	Object pathObject = request.getSession().getAttribute("returnPath");
	String path = "index.jsp";
	if (pathObject != null) {
		path = (String)pathObject;
	}

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String resultInof = "";
	String returnPath = "";
	if (username == "" || password == "") {
		response.sendRedirect("login.jsp");
	} else {
		UserDao userDao = new UserDao();
		if(userDao.userLogin(username, password)){
			User myUser = new User();
			myUser.setUsername(username);
			myUser.setPassword(password);
			request.getSession().setAttribute("myUser", myUser);
			response.sendRedirect(path);
		} else {
			path = "login.jsp";
		}
	}
	%>
	<h1>登录页面</h1>
	<hr />
	<p>用户名不存在或密码错误</p>
	<a href=<%=path%>><button>返回</button></a>
</body>
</html>