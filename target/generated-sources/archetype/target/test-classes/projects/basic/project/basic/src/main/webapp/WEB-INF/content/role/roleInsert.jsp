<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 0.1-SNAPSHOT Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Home Page</title>
	<%@ include file="/common/header.jsp" %>
</head>
<script type="text/javascript">
<!--
$(function(){
	_role_editor_obj=$('#_role_editor_panel').panel({
			//height:430
		border:false,
		noheader:true,
		top:0,
		left:0
		});
	_role_form_obj=$('#roleForm');
	_role_form_obj.validate({
			rules:{
				name:{
					required: true,
					remote: "${ctx}/pm/role/role!checkName.action?oldName=" + encodeURIComponent('${name}'),
					maxlength:50
				},
				remark:{
					maxlength:200
				}
			},
			messages:{
				name:{
					remote:"<s:text name='message.pm.role.name.isExist'></s:text>"
				}
			},
			showErrors:showErrors
		});
});
function save(){
	_role_form_obj.form('submit',{
		url:'${ctx}/pm/role/role!save.action',
		success:function(data){
			eval('data='+data);
			if(data.success){
				$.messager.alert('Info',data.message,'info');
			}else{
				$.messager.alert('Error',data.message,'error');
			}
		},
		onSubmit:function(){
			if(_role_form_obj.valid())
				return true;
			else
				return false;
		}
	});
}
function toBack(){
	window.location='${ctx}/pm/role/role!forQuery.action';
}
//-->
</script>
<body>
<div id="_role_editor_panel" style="background:#fafafa;padding:10px;" >
	<form id="roleForm" method="post">
	<input type="hidden" name="roleId" value="${roleId}"/>
		<table>
			<tr>
				<td><s:text name='label.pm.role.name'></s:text>：</td>
				<td><input type="text" id="name" name="name" value="${name}" size="50"></input></td>
			</tr>
			<tr>
				<td><s:text name='label.pm.role.remark'></s:text>：</td>
				<td><textarea id="remark" name="remark" rows="5" cols="100">${remark}</textarea></td>
			</tr>
		</table>
		<br />
		<div style="text-align: center;">
			<a href="##" onclick="save()" class="easyui-linkbutton" id="btn-save" icon="icon-save"><s:text name='button.common.save'></s:text></a>
			<a href="##" onclick="toBack()" class="easyui-linkbutton" id="btn-undo" icon="icon-undo"><s:text name='button.common.return'></s:text></a>
		</div>
	</form>
</div>
</body>
</html>