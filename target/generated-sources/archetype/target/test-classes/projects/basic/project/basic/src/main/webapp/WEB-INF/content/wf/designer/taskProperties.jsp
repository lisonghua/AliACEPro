<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
<!--
var tid = "<%=request.getParameter("taskId")%>";
var task = workflow.getFigure(tid);

jq(function(){
	jq('#performerType').combobox({
			editable:false,
			onChange:function(newValue, oldValue){
				switchTaskCandidatesList(newValue);
			}
		});
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
	jq('#task-listeners-list').datagrid({
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
	    toolbar:[{
	        text:'New',
	        iconCls:'icon-add',
	        handler:function(){
	    		_listener_win.window('open');
	    		//_listener_frame.src="";
	    		_listener_win.window('refresh','${ctx}/wf/procdef/procdef!forTaskListenerConfig.action');
	    		//alert(_listener_frame.document.body.innerHTML);
	        }
	    }]
	});
	jq('#task-form-properties-list').datagrid({
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
	    toolbar:[{
	        text:'New',
	        iconCls:'icon-add',
	        handler:function(){
	        }
	    }]
	});
	task_candidate_panel=jq('#task-candidate-panel').panel({
		border:false,
		//minimized:true,
		height:450
		//width:
		//fit:true
	});
	populateTaskProperites();
	//switchTaskCandidatesList(jq('#performerType').combobox('getValue'));
});
function switchTaskCandidatesList(performerType){
	if(performerType == 'candidateUsers'){
		task_candidate_panel.panel("refresh","${ctx}/wf/procdef/procdef!forTaskCandidateUsersConfig.action");
	}else if(performerType == 'candidateGroups'){
		task_candidate_panel.panel("refresh","${ctx}/wf/procdef/procdef!forTaskCandidateGroupsConfig.action");
	}
}
function listenerActionBt(value,rowData,rowIndex){
	var id = rowData.id;
	var e = '<img onclick="editListener(\''+id+'\')" src="${ctx}/image/edit.gif" title="'+"<s:text name='button.common.modify'></s:text>"+'" style="cursor:hand;"/>';   
    var d = '<img onclick="deleteListener(\''+id+'\')" src="${ctx}/image/delete.gif" title="'+"<s:text name='button.common.delete'></s:text>"+'" style="cursor:hand;"/>';
	return e+'&nbsp;'+d;
}
function editListener(id){
	_listener_win.window('open');
	_listener_win.window('refresh','${ctx}/wf/procdef/procdef!forTaskListenerConfig.action?listenerId='+id);
}
function deleteListener(id){
	task.deleteListener(id);
	loadTaskListeners();
}
function formActionBt(value,rowData,rowIndex){
	var id = rowData.id;
	var e = '<img onclick="editForm('+id+')" src="${ctx}/image/edit.gif" title="'+"<s:text name='button.common.modify'></s:text>"+'" style="cursor:hand;"/>';   
    var d = '<img onclick="deleteForm('+id+')" src="${ctx}/image/delete.gif" title="'+"<s:text name='button.common.delete'></s:text>"+'" style="cursor:hand;"/>';
	return e+'&nbsp;'+d;
}
function editForm(id){
	
}
function deleteForm(id){
	
}
function saveTaskProperties(){
	//alert(tid);
	task.taskId=jq('#id').val();
	task.taskName=jq('#name').val();
	task.setContent(jq('#name').val());
	task.performerType=jq('#performerType').combobox('getValue');
	task.expression=jq('#expression').val();
	task.formKey=jq('#formKey').val();
	task.documentation=jq('#documentation').val();
	jq.messager.alert('Info','Save Successfully!','info');
}
function populateTaskProperites(){
	jq('#id').val(task.taskId);
	jq('#name').val(task.taskName);
	jq('#performerType').combobox('setValue',task.performerType);
	jq('#expression').val(task.expression);
	jq('#formKey').val(task.formKey);
	jq('#documentation').val(task.documentation);
	loadTaskListeners();
}
function loadTaskListeners(){
	var listeners = task.listeners;
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
	jq('#task-listeners-list').datagrid('loadData',listener_grid_data);
}
//-->
</script>
<div id="task-properties-layout" class="easyui-layout" fit="true">
	<div id="task-properties-toolbar-panel" region="north" border="false" style="height:30px;background:#E1F0F2;">
		<a href="##" id="sb2" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="saveTaskProperties()">Save</a>
	</div>
	<div id="task-properties-panel" region="center" border="true">
		<div id="task-properties-accordion" class="easyui-accordion" fit="true" border="false">
			<div id="general" title="Main Config" selected="true" class="properties-menu">
				<table id="general-properties">
					<tr>
						<td align="right">Id:</td>
						<td><input type="text" id="id" name="id" size="50" value=""/></td>
					</tr>
					<tr>
						<td align="right">Name:</td>
						<td><input type="text" id="name" name="name" size="50" value=""/></td>
					</tr>
					<tr>
						<td align="right">Form Key:</td>
						<td><input type="text" id="formKey" name="formKey" value=""/></td>
					</tr>
					<tr>
						<td align="right">Documentation:</td>
						<td><textarea id="documentation" name="documentation" cols="20" rows="5"></textarea></td>
					</tr>
				</table>
			</div>
			<div id="main-config" title="Performer Config" class="properties-menu">
				<table id="main-properties">
					<tr>
						<td align="right">Performer Type:</td>
						<td width="85%">
							<select id="performerType" name="performerType">
<!--								<option value="assignee">Assignee</option>-->
								<option></option>
								<option value="candidateUsers">Candidate Users</option>
								<option value="candidateGroups">Candidate Groups</option>
							</select>
						</td>
					</tr>
					<input type="hidden" id="expression" name="expression" value=""/>
					<tr>
						<td></td>
						<td>
							<div id="task-candidate-panel">
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="formProperties" title="Form Properties" style="overflow: hidden;">
				<table id="task-form-properties-list">
					<thead>
					<tr>
					<th field="id" width="100" align="middle" sortable="false">Id</th>
					<th field="name" width="100" align="middle" sortable="false">Name</th>
					<th field="type" width="100" align="middle" sortable="false">Type</th>
					<th field="value" width="100" align="middle" sortable="false">Value</th>
					<th field="action" width="100" align="middle" formatter="formActionBt">Action</th>
					</tr>
					</thead>
				</table>
			</div>
			<div id="listeners" title="Listeners" style="overflow: hidden;">
				<table id="task-listeners-list">
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