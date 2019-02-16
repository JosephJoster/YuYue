<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.User"%>
<%@ page import="dao.AppointDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约仪器</title>
<style>
.td_title {
	width: 320px;
	height: 80px;
}
</style>
</head>
<body style="text-align:center">
	<%
		/*获得4个参数*/
		String device_id = request.getParameter("device_id");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		Object userObject = request.getSession().getAttribute("myUser");
		User user = (User) (userObject);
		String username = user.getUsername();

		/*获得预约结果*/
		AppointDao appointDao = new AppointDao();
		String resultInfo = "";
		int appointResult = appointDao.appoint(device_id, date, time, username);
		if (appointResult == 1) {
			resultInfo = "预约成功";
		} else if (appointResult == 2){
			resultInfo = "该时间段已经被预约";
		} else if (appointResult == -1){
			resultInfo = "无效请求";
		} else {
			resultInfo = "链接异常";
		}
	%>
	
	<!-- 标题 -->
	<table style="margin: 0 auto">
		<tr>
			<td class="td_title"></td>
			<td class="td_title"
				style="text-align: center; vertical-align: bottom; font-size: 32px; font-weight: bold;">实验仪器预约系统</td>
			<td class="td_title"
				style="text-align: right; vertical-align: bottom; font-size: 20px; font-weight: bold;">
				欢迎你：<%=username%> 
			</td>
		</tr>
	</table>
	<hr />
	<p><%=resultInfo%></p>
	<button onclick="javascript:history.back(-1);">返回</button>
</body>
</html>