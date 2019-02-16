<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>预约仪器</title>
<style type="text/css">
.td_title {
	width: 320px;
	height: 80px;
}
</style>
</head>
<body style="text-align: center;">
	<!-- 标题 -->
	<table style="margin: 0 auto">
		<tr>
			<td class="td_title"></td>
			<td class="td_title"
				style="vertical-align: bottom; font-size: 32px; font-weight: bold;">实验仪器预约系统</td>
			<td class="td_title"></td>
		</tr>
	</table>
	<hr />
	<p>请先登录</p>
	<%
		String returnPath = request.getHeader("referer");
	%>
	<a href=<%=returnPath%>><button>返回</button></a>
</body>
</html>