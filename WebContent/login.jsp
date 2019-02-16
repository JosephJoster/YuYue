<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<style>
div {
	border: solid;
	border-color: grey;
	width: 360px;
	height: 150px;
	margin: 20px auto;
}

a {
	font-size: 20px;
	color: #000;
	text-decoration: none;
}
</style>
</head>
<body style="text-align: center">
	<h1 style="text-align: center">登录页面</h1>
	<hr />
	<div>
		<form action="checkLogin.jsp" method="post">
			<table style="margin: 20px auto">
				<tr>
					<td>账号：</td>
					<td><input name="username" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password" /></td>
				</tr>
			</table>
			<%
				//获得返回地址
				String sourcePath = request.getHeader("referer");
				//如果是index和details过来的则更新sourcePath
				//out.print("sourcePath:"+sourcePath);
				//out.print("<br>");
				if (sourcePath.equals("http://localhost:8080/YuYue/index.jsp")
						|| sourcePath.matches("http://localhost:8080/YuYue/details.jsp.*")) {
					request.getSession().setAttribute("returnPath", sourcePath);
				}
				String returnPath = (String) (request.getSession().getAttribute("returnPath"));
				//out.print("returnPath:"+returnPath);
			%>
			<button type="submit">登录</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button formaction=<%=returnPath%>>返回</button>
		</form>
	</div>
	<div style="height: 30px;">
		<a href="register.jsp">新用户注册</a>
	</div>
</body>
</html>