<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.DeviceDao"%>
<%@ page import="entity.Device"%>
<%@ page import="entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>设备详情</title>
<style>
td {
	text-align: center;
}

.td_title {
	width: 320px;
	height: 80px;
}

.leftCell {
	background-color: #999;
}
</style>
</head>
<body style="text-align: center">
	<!-- 标题 -->
	<table style="margin: 0 auto">
		<tr>
			<td class="td_title"></td>
			<td class="td_title"
				style="text-align: center; vertical-align: bottom; font-size: 32px; font-weight: bold;">实验仪器预约系统</td>
			<td class="td_title"
				style="text-align: right; vertical-align: bottom; font-size: 20px; font-weight: bold;">
				<%
					Object userObject = request.getSession().getAttribute("myUser");
					if (userObject != null) {
						User user = (User) (userObject);
						String username = user.getUsername();
				%> 欢迎你：<%=username%><br/>
				<a style="color: #000; text-decoration: none;" href="myAppointments.jsp">我的预约</a>
				|&nbsp; <a style="color: #000; text-decoration: none;" href="loginOut.jsp">退出</a>
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
	<!-- 详细信息 -->
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		DeviceDao dao = new DeviceDao();
		Device device = dao.getDevice(id);
		String imagePath = "images/" + id + ".jpg";
	%>
	<table style="width: 500px; margin: 10px auto;">
		<tr>
			<td colspan="2" style="border-bottom: 2px solid #000"></td>
		</tr>
		<tr>
			<td style="width: 100px"><img src=<%=imagePath%>></td>
			<td style="margin-top: 45px; font-size: 20px; font-weight: bold;"><%=device.getName()%></td>
		</tr>
		<tr>
			<td colspan="2" style="border-bottom: 2px solid #000"></td>
		</tr>
		<tr>
			<td class="leftCell">联系人</td>
			<td><%=device.getContacts()%></td>
		</tr>
		<tr>
			<td class="leftCell">E-mail</td>
			<td><%=device.getEmail()%></td>
		</tr>
		<tr>
			<td class="leftCell">电话</td>
			<td><%=device.getTel()%></td>
		</tr>
		<tr>
			<td class="leftCell">生产厂家</td>
			<td><%=device.getFrom()%></td>
		</tr>
		<tr>
			<td class="leftCell">型号</td>
			<td><%=device.getModel()%></td>
		</tr>
		<tr>
			<td class="leftCell">购买时间</td>
			<td><%=device.getBuy_date()%></td>
		</tr>
		<tr>
			<td class="leftCell">备注</td>
			<td style="text-align: left"><%=device.getNote()%></td>
		</tr>
		<tr>
			<td colspan="2" style="border-bottom: 2px solid #000"></td>
		</tr>
	</table>
	<a href="appoint.jsp?id=<%=id%>"><button>预约</button></a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp"><button>返回</button></a>
	<hr />
	<!-- 底部 -->
	<p style="float: right; color: #888;">@wangwenjian</p>
</body>
</html>