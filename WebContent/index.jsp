<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
img {
	float: left;
}

td {
	width: 320px;
	height: 80px;
}

.leftBox {
	float: right;
	position: absolute;
	right: 55%;
	width: 400px;
	height: 118px;
	border-style: solid;
	border-width: 2px;
	border-color: #6b6b6b;
}

.rightBox {
	float: left;
	position: absolute;
	left: 55%;
	width: 400px;
	height: 118px;
	border-style: solid;
	border-width: 2px;
	border-color: #6b6b6b;
}

.next {
	height: 135px;
}

.devices {
	display: block;
	margin-top: 45px;
	font-size: 20px;
	font-weight: bold;
	color: #000;
	text-decoration: none;
}
</style>
<title>实验仪器预约系统</title>
</head>
<body style="text-align: center">
	<table style="margin: 0 auto">
		<tr>
			<td></td>
			<td
				style="text-align: center; vertical-align: bottom; font-size: 32px; font-weight: bold;">实验仪器预约系统</td>
			<td
				style="text-align: right; vertical-align: bottom; font-size: 20px; font-weight: bold;">
				<%
					Object userObject = request.getSession().getAttribute("myUser");
					if (userObject != null) {
						User user = (User) (userObject);
						String username = user.getUsername();
				%> 欢迎你：<%=username%><br/>
				<a style="color: #000; text-decoration: none;" href="myAppointments.jsp">我的预约</a>
				|&nbsp;<a	style="color: #000; text-decoration: none;" href="loginOut.jsp">退出</a>
				<%
					} else {
				%> <a style="color: #000; text-decoration: none;" href="login.jsp">登录</a>
				<%
					}
				%>
			</td>
		</tr>
	</table>
	<hr />
	<!-- 第一行 -->
	<div class="leftBox">
		<img src="images/1.jpg" /> <a class="devices" href="details.jsp?id=1">高性能计算机集群系统</a>
	</div>
	<div class="rightBox">
		<img src="images/2.jpg" /> <a class="devices" href="details.jsp?id=2"
			style="margin-top: 36px;">深井环境与安全人工智能仿真实验系统</a>
	</div>
	<div class="next"></div>
	<!-- 第二行 -->
	<div class="leftBox">
		<img src="images/3.jpg" /> <a class="devices" href="details.jsp?id=3">地质电导率测量系统</a>
	</div>
	<div class="rightBox">
		<img src="images/4.jpg" /> <a class="devices" href="details.jsp?id=4">声发射系统</a>
	</div>
	<div class="next"></div>
	<!-- 第三行 -->
	<div class="leftBox">
		<img src="images/5.jpg" /> <a class="devices" href="details.jsp?id=5">地下空腔三维激光扫描系统</a>
	</div>
	<div class="rightBox">
		<img src="images/6.jpg" /> <a class="devices" href="details.jsp?id=6">地下成像系统</a>
	</div>
	<div class="next"></div>
	<hr />
	<!-- 底部 -->
	<p style="float: right; color: #888;">@wangwenjian</p>
</body>
</html>