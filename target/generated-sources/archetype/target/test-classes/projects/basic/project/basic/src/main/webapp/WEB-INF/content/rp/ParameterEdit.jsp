<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 0.1-SNAPSHOT Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="/common/header.jsp" %>
</head>
<script type="text/javascript">
<!--
$(function(){
	_editor_panel_obj=$('#_editor_panel').panel({
			height:600,
			border:false,
			noheader:true,
			top:0,
			left:0
		});
	_editor_form_obj=$('#_editor_form');
	_editor_form_obj.validate({
			rules:{
				rpParamId:{
						required: true,
						maxlength:255
				},
				definition:{
						required: true,
						maxlength:255
				},
				name:{
						required: true,
						maxlength:50
				},
				expression:{
						maxlength:200
				},
				type:{
						required: true,
						maxlength:2
				},
				remark:{
						maxlength:200
				}
			},
			showErrors:showErrors
		});
});
function save(){
	_editor_form_obj.ajaxSubmit({
			url:"${ctx}/genpact/parameter/parameter!save.action",
			type: 'POST',
			dataType:'json',
			beforeSubmit:function(formData, jqForm, options){
				if(_editor_form_obj.valid())
					return true;
				else
					return false;
			},
			success:function(responseText, statusText, xhr, jqForm){
				if(responseText.success){
	                $.messager.alert("<s:text name='label.common.success'></s:text>",responseText.message,"info");
	        	}else{
	        		$.messager.alert("<s:text name='label.common.error'></s:text>",responseText.message,"error");
	            }
			}
		});
}
function goBack(){
	window.location='${ctx}/genpact/parameter/parameter!forQuery.action';
}
//-->
</script>
<body>
<div id="_editor_panel" style="background:#fafafa;padding:5px;" >
	<form id="_editor_form" method="post">
	<input type="hidden" name="rpParamId" value="${rpParamId}"/>
		<table>
				<tr>
					<td>Definition：</td>
					<td><input type="text" id="definition" name="definition" value="${definition}" size="100"></input></td>
				</tr>
				<tr>
					<td>Name：</td>
					<td><input type="text" id="name" name="name" value="${name}" size="100"></input></td>
				</tr>
				<tr>
					<td>Expression：</td>
					<td><input type="text" id="expression" name="expression" value="${expression}" size="100"></input></td>
				</tr>
				<tr>
					<td>Type：</td>
					<td><input type="text" id="type" name="type" value="${type}" size="100"></input></td>
				</tr>
				<tr>
					<td>Remark：</td>
					<td><input type="text" id="remark" name="remark" value="${remark}" size="100"></input></td>
				</tr>
		</table>
		<br />
		<div style="text-align: center;">
			<a href="##" onclick="save()" class="easyui-linkbutton" id="btn-save" icon="icon-save"><s:text name='button.common.save'></s:text></a>
			<a href="##" onclick="goBack()" class="easyui-linkbutton" id="btn-undo" icon="icon-cancel"><s:text name='button.common.return'></s:text></a>
		</div>
	</form>
</div>
</body>
</html>