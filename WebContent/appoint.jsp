<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.User"%>
<%@ page import="entity.Device"%>
<%@ page import="dao.DeviceDao"%>
<%@ page import="dao.AppointDao"%>
<!DOCTYPE html>
<!-- 后续可以考虑做图形选择框，不让选择已经预约的时间 -->
<html>
<head>
<meta charset="UTF-8">
<title>预约仪器</title>
<style type="text/css">
.td_title {
	width: 320px;
	height: 80px;
}

.row_title {
	background-color: #999;
}

.row_info {
	width: 300px;
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
				%> 
				欢迎你：<%=username%> 
				<%
 					} else {
 						response.sendRedirect("loginRequired.jsp");
 					}
 				%>
			</td>
		</tr>
	</table>
	<hr />
	<!-- 选择框 -->
	<%
		int device_id = Integer.parseInt(request.getParameter("id"));
		DeviceDao dao = new DeviceDao();
		Device device = dao.getDevice(device_id);
		AppointDao appointDao = new AppointDao();
		String[] nextDays = appointDao.getNextDays();
		int lengthOfDays = nextDays.length;
	%>
	<form action="appointProcess.jsp">		
		<table style="margin: 0 auto">
			<tr>
				<td colspan="2" style="border-bottom: 2px solid #000"></td>
			</tr>
			<tr>
				<td class="row_title">仪器名称</td>
				<td class="row_info"><%=device.getName()%></td>
			</tr>
			<tr>
				<td class="row_title">预约时间</td>
				<td class="row_info">
					<select name="date">
							<%
								for (int i = 0; i < lengthOfDays; i++) {
									String day = nextDays[i];
							%>
							<option value=<%=day%>><%=day%></option>
							<%
								}
							%>
					</select>
				</td>
			</tr>
			<tr>
				<td class="row_title">选择时间段</td>
				<td class="row_info">
					<select name="time">
						<option value="1">上午</option>
						<option value="2">下午</option>
						<option value="3">晚上</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 2px solid #000"></td>
			</tr>
		</table>
		<button>预约仪器</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button formaction="javascript:history.back(-1);">返回</button>
		<br />
		<input name="device_id" value=<%=device_id+""%> style="visibility:hidden;"/>
	</form>
</body>
</html>