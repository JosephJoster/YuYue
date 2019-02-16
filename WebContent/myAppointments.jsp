<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.AppointDao"%>
<%@ page import="dao.DeviceDao"%>
<%@ page import="entity.Record"%>
<%@ page import="entity.User"%>
<%@ page import="entity.Device"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的预约</title>
<style type="text/css">
.td_title {
	width: 320px;
	height: 80px;
}
.row_title{
	background-color:#999;
	width:150px;
}
</style>
</head>
<body style="text-align: center">
	<table style="margin: 0 auto">
		<tr>
			<td class="td_title"></td>
			<td class="td_title"
				style="text-align: center; vertical-align: bottom; font-size: 32px; font-weight: bold;">实验仪器预约系统</td>
			<td class="td_title"></td>
		</tr>
	</table>
	<hr />
	<%
		User myUser = (User) (request.getSession().getAttribute("myUser"));
		String username = myUser.getUsername();
	%>
	<p>
		你好，<%=username%></p>
	<table id="info" style="margin: 0 auto">
		<tr>
			<td class="row_title" style="width:300px;">设备名称</td>
			<td class="row_title">预约日期</td>
			<td class="row_title">设备时间</td>
		</tr>
		<%
			AppointDao appointDao = new AppointDao();
			DeviceDao deviceDao = new DeviceDao();
			ArrayList<Record> list = appointDao.getMyAppointments(username);
			for (int i = 0; i < list.size(); i++) {
				//获得设备名称
				int device_id = list.get(i).getDevice_id();
				Device device = deviceDao.getDevice(device_id);
				//获得预约时间
				int time = list.get(i).getTime();
				String timeString = "";
				switch (time) {
				case 1:
					timeString = "上午";
					break;
				case 2:
					timeString = "下午";
					break;
				case 3:
					timeString = "晚上";
					break;
				}
		%>
		<tr>
			<td class="row_info"><%=device.getName()%></td>
			<td class="row_info"><%=list.get(i).getDate()%></td>
			<td class="row_info"><%=timeString%></td>
		</tr>
		<tr><td colspan="3" style="background-color:#999;"></td></tr>
		<%
			}
		%>
	</table>
	<br/>
	<button onclick="javascript:history.back(-1);">返回</button>
</body>
</html>