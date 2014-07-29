<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
var fid = "<%=request.getParameter("flowId")%>";
var line = workflow.getLine(fid);
jq(function(){
	_listener_win = jq('#listener-win').window({
		//href:'${ctx}/wf/procdef/procdef!forTaskListenerConfig.action',   
	    closed:true,
	    //cache:false,
	    draggable:false,
	    collapsible:false,
	    minimizable:false,
	    maximizable:false,
	    modal:true,
	    shadow:true
	});
	jq('#line-listeners-list').datagrid({
		//title:"Listener",
		//url:'${ctx}/wf/procdef/procdef!search.action',//加载表格数据的URL
		singleSelect:true,
		//width:500,
		height:300,
		//idField:'id',
		//pagination:true,
		//pageSize:15,
		//pageNumber:1,
		//pageList:[10,15],
		rownumbers:true,
		//sortName:'id',
	    //sortOrder:'asc',
	    striped:true,
	    fitColumns:true,
	    toolbar:[{
	        text:'New',
	        iconCls:'icon-add',
	        handler:function(){
	    		_listener_win.window('open');
	    		//_listener_frame.src="";
	    		executionListenerId=null;
	    		_listener_win.window('refresh','${ctx}/wf/procdef/procdef!forLineListenerConfig.action');
	    		//alert(_listener_frame.document.body.innerHTML);
	        }
	    }]
	});
	populateLineProperites();
});
function listenerActionBt(value,rowData,rowIndex){
	var id = rowData.id;
	var e = '<img onclick="editListener(\''+id+'\')" src="${ctx}/image/edit.gif" title="'+"<s:text name='button.common.modify'></s:text>"+'" style="cursor:hand;"/>';   
    var d = '<img onclick="deleteListener(\''+id+'\')" src="${ctx}/image/delete.gif" title="'+"<s:text name='button.common.delete'></s:text>"+'" style="cursor:hand;"/>';
	return e+'&nbsp;'+d;
}
function editListener(id){
	executionListenerId=id;
	_listener_win.window('open');
	_listener_win.window('refresh','${ctx}/wf/procdef/procdef!forLineListenerConfig.action?listenerId='+id);
}
function deleteListener(id){
	line.deleteListener(id);
	executionListenerId=null;
	loadLineListeners();
}
function saveLineProperties(){
	//alert(tid);
	line.lineId=jq('#id').val();
	line.lineName=jq('#name').val();
	line.setLabel(jq('#name').val());
	line.condition=jq('#condition').val();
	jq.messager.alert('Info','Save Successfully!','info');
}
function populateLineProperites(){
	//alert(line.lineId);
	jq('#id').val(line.lineId);
	jq('#name').val(line.lineName);
	jq('#condition').val(line.condition);
	loadLineListeners();
}
function loadLineListeners(){
	var listeners = line.listeners;
	var listener_grid_rows=[];
	//alert(listeners.getSize());
	for(var i=0;i<listeners.getSize();i++){
		var listener = listeners.get(i);
		var nlistener = {
					id:listener.getId(),
					listenerImplimentation:listener.getServiceImplementation(),
					type:listener.serviceType,
					event:listener.event,
					fields:listener.getFieldsString(),
					action:''
				};
		listener_grid_rows[i]=nlistener;
	};
	//alert(listener_grid_rows);
	var listener_grid_data={
			total:listeners.getSize(),
			rows:listener_grid_rows
	};
	jq('#line-listeners-list').datagrid('loadData',listener_grid_data);
}
//-->
</script>
<div id="line-properties-layout" class="easyui-layout" fit="true">
	<div id="line-properties-toolbar-panel" region="north" border="false" style="height:30px;background:#E1F0F2;">
		<a href="##" id="sb2" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="saveLineProperties()">Save</a>
	</div>
	<div id="line-properties-panel" region="center" border="true">
		<div class="easyui-accordion" fit="true" border="false">
			<div id="general" title="General" selected="true" class="properties-menu">
				<table id="general-properties">
					<tr>
						<td align="right">Id:</td>
						<td><input type="text" id="id" name="id" size="50" value=""/></td>
					</tr>
					<tr>
						<td align="right">Name:</td>
						<td><input type="text" id="name" name="name" size="50" value=""/></td>
					</tr>
				</table>
			</div>
			<div id="main-config" title="Main Config" class="properties-menu">
				<table id="main-properties">
					<tr>
						<td align="right">Condition:</td>
						<td><textarea id="condition" name="condition" cols="30" rows="5"></textarea></td>
					</tr>
				</table>
			</div>
			<div id="listeners" title="Listeners" style="overflow: hidden;padding:5px;">
				<table id="line-listeners-list">
					<thead>
					<tr>
					<th field="listenerImplimentation" width="200" align="middle" sortable="false">Listener Implimentation</th>
					<th field="type" width="70" align="middle" sortable="false">Type</th>
					<th field="event" width="70" align="middle" sortable="false">Event</th>
					<th field="fields" width="100" align="middle" >Fields</th>
					<th field="action" width="100" align="middle" formatter="listenerActionBt">Action</th>
					</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>