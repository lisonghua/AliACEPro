<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Home Page</title>
	<%@ include file="/common/header.jsp" %>
</head>
<script type="text/javascript">
<!--
$(function(){
	_assignPrivilegePanelObj = $('#assignPrivilegePanel').panel({
		//width:1010,
		//height:430
		//fit:true
	});
	_assignPrivilegeObj=$('#assignPrivilege').accordion({
			//fit:true
		});
});
//-->
</script>
<body>
<div id="assignPrivilegePanel">
<div id="assignPrivilege">
    <div title="${name}--<s:text name='label.pm.user.privilege.functionality'></s:text>"  selected="true" style="overflow:auto;padding:5px;" href="${ctx}/pm/user/user!forAssignFunc.action?userId=${userId}">
<!--		<iframe src="${ctx}/pm/module/module!forAssignUser.action?moduleId=${moduleId}" frameborder="0" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no"></iframe>-->
    </div>
	
    <div title="${name}--<s:text name='label.pm.user.privilege.data'></s:text>"  style="overflow:auto;padding:5px;" href="${ctx}/pm/user/user!forAssignData.action?userId=${userId}">
<!--    	<iframe src="${ctx}/pm/module/module!forAssignRole.action?moduleId=${moduleId}" frameborder="0" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no"></iframe>-->
    </div>
</div>
</div>
</body>
</html>