#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML ${version} Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Home Page</title>
	<%@ include file="/common/header.jsp" %>
</head>
<script type="text/javascript">
<!--
${symbol_dollar}(function(){
	_assignPrivilegePanelObj = ${symbol_dollar}('${symbol_pound}assignPrivilegePanel').panel({
		//width:1010,
		//height:430
	});
	_assignPrivilegeObj=${symbol_dollar}('${symbol_pound}assignPrivilege').accordion({
			//fit:true
		});
});
//-->
</script>
<body>
<div id="assignPrivilegePanel">
<div id="assignPrivilege">
    <div title="<s:text name='label.pm.module.assign.user'></s:text>"  selected="true" style="overflow:hidden;padding:5px;" href="${symbol_dollar}{ctx}/pm/module/module!forAssignUser.action?moduleId=${symbol_dollar}{moduleId}">
<!--		<iframe src="${symbol_dollar}{ctx}/pm/module/module!forAssignUser.action?moduleId=${symbol_dollar}{moduleId}" frameborder="0" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no"></iframe>-->
    </div>
	
    <div title="<s:text name='label.pm.module.assign.role'></s:text>"  style="overflow:hidden;padding:5px;" href="${symbol_dollar}{ctx}/pm/module/module!forAssignRole.action?moduleId=${symbol_dollar}{moduleId}">
<!--    	<iframe src="${symbol_dollar}{ctx}/pm/module/module!forAssignRole.action?moduleId=${symbol_dollar}{moduleId}" frameborder="0" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no"></iframe>-->
    </div>
</div>
</div>
</body>
</html>