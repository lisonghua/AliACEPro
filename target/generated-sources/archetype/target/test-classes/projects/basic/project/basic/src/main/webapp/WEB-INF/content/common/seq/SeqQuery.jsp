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
	_list_panel_obj=$('#_list_panel').panel({
			//height:600,
			border:false,
			noheader:true,
			top:0,
			left:0
		});
	_list_grid_obj=$('#_list_table').datagrid({
		title:'',
		url:'${ctx}/common/seq/seq!search.action',//加载表格数据的URL
		singleSelect:true,
		height:500,
		idField:'id',
		pagination:true,
		pageSize:15,
		pageNumber:1,
		pageList:[10,15],
		rownumbers:true,
		sortName:'id',
	    sortOrder:'asc',
	    striped:true,
	    toolbar:[{
	        text:'<s:text name="button.common.add"></s:text>',
	        iconCls:'icon-add',
	        handler:function(){
	        	//点击添加按钮的URL
	    		window.location='${ctx}/common/seq/seq!forInsert.action';
	    		return false;
	        }
	    }]
	});
});
//点击修改按钮转向的URL
function  editRow(id){
	window.location='${ctx}/common/seq/seq!forUpdate.action?seqId='+id;
}
//点击删除按钮的URL
function  deleteRow(id){
	$.messager.confirm("Confirm","<s:text name='message.common.delete.confirm'></s:text>",function(flag){
		if(flag){
			$.ajax({
					url:'${ctx}/common/seq/seq!delete.action?id='+id,//删除调用的URL
					type: 'GET',
					dataType:'json',
					error:function(){
						$.messager.alert("<s:text name='label.common.error'></s:text>","<s:text name='message.common.delete.failure'></s:text>",'error');
					},
					success:function(data){
						if(data.success){
							_list_grid_obj.datagrid('reload',{});
							$.messager.alert("<s:text name='label.common.success'></s:text>",data.message,'info');
						}else{
							$.messager.alert("<s:text name='label.common.error'></s:text>",data.message,'error');
						}
					}
				}
			);
		}
	});
}
//输出每一行末尾的操作按钮
function actionFormatter(value,rowData,rowIndex){
	var id = rowData.seqId;
	var name = rowData.seqName;
	var e = '<img onclick="editRow(\''+id+'\')" src="${ctx}/image/edit.gif" title="'+"<s:text name='button.common.modify'></s:text>"+'" style="cursor:hand;"/>';   
    var d = '<img onclick="deleteRow(\''+id+'\')" src="${ctx}/image/delete.gif" title="'+"<s:text name='button.common.delete'></s:text>"+'" style="cursor:hand;"/>';
    if(name != "<%=CommonConstant._SEQUENCE_DEFAULT_SEQ_NAME%>")
   		return e+'&nbsp;'+d;
   	else
   	   	return "";
}
//点击查询按钮的操作函数
function searchByFilter(){
	var name=document.getElementById("filter_EQS_seqName").value;
	_list_grid_obj.datagrid('reload',{
		filter_LIKES_seqName:name
	});
}
//-->
</script>
<body>
<div id="_list_panel" style="padding:5px;">
<!--***************************查询部分开始*************************************-->
<!--
查询操作符规则如下：
	属性比较类型：EQ(=), LIKE(like), LT(<), GT(>), LE(<=), GE(>=)
	属性数据类型：S(String.class), I(Integer.class), L(Long.class), N(Double.class), D(Date.class), B(Boolean.class)
-->
	<div id="filter">
	<table border="0">
		<tr>
			<td><s:text name='label.pm.seq.name'></s:text>:</td>
			<td><input type="text" id="filter_EQS_seqName" name="filter_EQS_seqName" value="" size="9"/></td>
			<td><a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchByFilter();"><s:text name='button.common.search'></s:text></a></td>
		</tr>
	</table>
	</div>
<!--***************************查询部分结束*************************************-->
<!--***************************表格部分开始*************************************-->
<div id="content">
<table id="_list_table">
	<thead>
		<tr>
			<th field="seqId" width="100" align="middle" sortable="true"><s:text name='label.pm.seq.id'></s:text></th>
			<th field="seqName" width="150" align="middle" ><s:text name='label.pm.seq.name'></s:text></th>
			<th field="seqMin" width="100" align="middle" ><s:text name='label.pm.seq.min'></s:text></th>
			<th field="seqLength" width="100" align="middle" ><s:text name='label.pm.seq.length'></s:text></th>
			<th field="next" width="100" align="middle" ><s:text name='label.pm.seq.next'></s:text></th>
			<th field="rules" width="100" align="middle" ><s:text name='label.pm.seq.rules'></s:text></th>
			<th field="action" width="100" align="middle" formatter="actionFormatter"><s:text name='label.sm.common.action'></s:text></th>
		</tr>
	</thead>
</table>
</div>
<!--***************************表格部分结束*************************************-->
</div> 
</body>
</html>
