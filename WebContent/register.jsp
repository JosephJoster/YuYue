<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新用户注册</title>
<style>
div {
	border: solid;
	border-color: grey;
	width: 360px;
	height: 150px;
	margin: 20px auto;
}
</style>
</head>
<body style="text-align: center">
	<h1>新用户注册</h1>
	<hr />
	<div>
	<form action="checkRegister.jsp">
		<table style="margin: 20px auto">
			<tr>
				<td>请输入账号：</td>
				<td><input name="username" /></td>
			</tr>
			<tr>
				<td>请输入密码：</td>
				<td><input type="password" name="password" /></td>
			</tr>
		</table>
		<button type="submit">注册</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button formaction="login.jsp" type="submit">返回</button>
	</form>
	</div>
</body>
</html>