<%@ page contentType="text/html;charset=UTF-8"%>
<%
		String ssoId = request.getParameter("j_remoteuser");
		response.sendRedirect(request.getContextPath()+"/j_spring_security_check?j_username="+ssoId);
%>