<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
$(function(){
	_search_form_obj=$('#_search_form');
	_search_form_obj.validate({
		rules:{
			startDate:{
				required: true
			},
			endDate:{
				required: true
			}
		},
		showErrors:showErrors
	});
	var _filter_start_date=$('#startDate').datebox({
		formatter:simpleDateFormatter,
		parser:simpleDateParser
		});
	var _filter_end_date=$('#endDate').datebox({
		formatter:simpleDateFormatter,
		parser:simpleDateParser
		});
	$('#application').combobox({
	    url:'${ctx}/sm/datasource/datasource!searchAllAppName.action?dsId=${dsId}',
	    //editable:false,
	    valueField:'code',
	    textField:'value'
	});
});
function simpleDateFormatter(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+'-'+(m<10?'0'+m:m)+'-'+(d<10?'0'+d:d);
}
function simpleDateParser(s){
	var t = Date.parse(s);
	if (!isNaN(t)) {
		var a = s.split('-');
		var y = new Number(a[0]);
		var m = new Number(a[1]);
		var d = new Number(a[2]);
		var dd = new Date(y, m - 1, d);
		return dd;
	} else {
		return new Date();
	}
}
function searchByFilter(){
	_search_form_obj.ajaxSubmit({
			url:"${ctx}/sm/datasource/datasource!exportEverydayPermonthOnlineUserCountReport.action?dsId=${dsId}",
			type: 'POST',
			dataType:'html',
			
			beforeSubmit:function(formData, jqForm, options){
				if(_search_form_obj.valid())
					return true;
				else
					return false;
			},
			
			success:function(responseText, statusText, xhr, jqForm){
				//alert(responseText);
				$('#chartdiv').html(responseText);
			}
		});
}
function goBack(){
	window.location='${ctx}/sm/datasource/datasource!forQuery.action';
}
//-->
</script>
<form id="_search_form" method="post">
<table>
		<tr>
			<td><s:text name='label.sm.ds.application'></s:text>：</td>
			<td><input id="application" name="application" readonly="readonly"/></td>
			<td><s:text name='label.sm.ds.start.date'></s:text>:</td>
			<td><input id="startDate" name="startDate" ></input></td>
			<td>-</td>
			<td><s:text name='label.sm.ds.end.date'></s:text>:</td>
			<td><input id="endDate" name="endDate" ></input></td>
			<td><a href="##" class="easyui-linkbutton" iconCls="icon-search" onclick="searchByFilter();"><s:text name='button.common.search'></s:text></a></td>
			<td><a href="##" class="easyui-linkbutton" iconCls="icon-undo" onclick="goBack();"><s:text name='button.common.return'></s:text></a></td>
		</tr>
</table>
</form>
<div id="chartdiv" style="height:350px;width:900px; "></div>