<%
	request.getSession().setAttribute("myUser", null);
	String returnPath = request.getHeader("referer");
	response.sendRedirect(returnPath);
%>