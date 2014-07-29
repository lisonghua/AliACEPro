<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
//alert("${ctx}/pm/group/group!getUserTreeOfGroup.action");
<!--
jq(function(){
	/*
	jq('#candidate-users-tree-list').treegrid({
			title:"",
			//width:980,
			height:450,
			//iconCls:'icon-save',
			url : '${ctx}/pm/group/group!getUserTreeOfGroup.action',
			animate : true,
			nowrap : false,
			rownumbers : true,
			collapsible : true,
			idField : 'id',
			treeField : 'id',
			frozenColumns:[[
			                {field:'id',width:200,align:'center'},
			                {field:'text',width:200,align:'center'}
			]],
			columns:[[
			          {field:'name',title:"name",width:200,align:'center'}
			]],
			toolbar:[
			         {
			        	text:"<s:text name='button.common.save'></s:text>",
			 	        iconCls:'icon-add',
			 	        handler:function(){
			 	    		//return false;
			 	        }
				     }	
			]	
		});
	
	jq('#candidate-users-tree').tree({
		checkbox: true,
		url: '${ctx}/pm/group/group!getUserTreeOfGroup.action',
		onClick:function(node){
			jq(this).tree('toggle', node.target);
			//alert('you dbclick '+node.text);
		}
	});
	*/
	_task_unselected_candidate_user_panel=jq('#task-unselect-candidate-user-panel').panel({
		border:false,
		noheader:true,
		top:0,
		left:0
		//fit:true
	});
	_task_unselect_candidate_user_list=jq('#task-unselect-candidate-user-list').datagrid({
		title:"Users",
		url:'${ctx}/wf/procdef/procdef!searchCandidateUser.action',
		//singleSelect:true,
		//width:900,
		height:400,
		idField:'userId',
		pagination:true,
		pageSize:15,
		pageNumber:1,
		pageList:[10,15],
		rownumbers:true,
		sortName:'userId',
	    sortOrder:'asc',
	    striped:true,
	    onLoadSuccess:function(data){
		   	var rows = data.rows;
		    for(var i=0;i<rows.length;i++){
			    if(task.getCandidateUser(rows[i].sso)!=null){
					jq(this).datagrid('selectRow',i);
				}
			}
		},
	    toolbar:[{
        	text:"<s:text name='button.common.save'></s:text>",
 	        iconCls:'icon-save',
 	        handler:function(){
        		addCandidateUsers();
 	        }
	     }]
	});
	_task_unselect_candidate_user_group=jq('#task-unselect-candidate-user-group').combobox({
	    url:'${ctx}/pm/group/group!getAllGroups.action',
	    //editable:false,
	    valueField:'groupId',
	    textField:'name'
	});
});
function searchCandidateUser(){
	var name=jq("#task-unselect-candidate-user-userName").val();
	var sso=jq("#task-unselect-candidate-user-sso").val();
	var group=_task_unselect_candidate_user_group.combobox('getValue');
	//alert(group);
	var email=jq("#task-unselect-candidate-user-email").val();
	//alert(sso);
	_task_unselect_candidate_user_list.datagrid('reload',{
			filter_LIKES_name:name,
			filter_EQS_sso:sso,
			group_EQI_groupId:group,
			filter_LIKES_email:email
		});
}
function addCandidateUsers(){
	var rows = _task_unselect_candidate_user_list.datagrid("getSelections");
	for(var i=0;i<rows.length;i++){
		var user = rows[i];
		task.addCandidateUser({
				userId:user.userId,
				sso:user.sso,
				name:user.name,
				title:user.title,
				email:user.email
			});
	}
	loadTaskCandidateUsers();
	_task_candidate_win.window('close');
}
//-->
</script>
<!--<table id="candidate-users-tree-list">-->
<!--</table>-->
<!--<ul id="candidate-users-tree"></ul>-->
<div id="task-unselect-candidate-user-panel" style="padding:5px;">
<table border="0">
	<tr>
		<td>Group:</td>
		<td><input type="text" id="task-unselect-candidate-user-group" name="task-unselect-candidate-user-group" value="" readonly="readonly"/></td>
		<td>SSO:</td>
		<td><input type="text" id="task-unselect-candidate-user-sso" name="task-unselect-candidate-user-sso" value="" size="9"/></td>
		<td>Name:</td>
		<td><input type="text" id="task-unselect-candidate-user-userName" name="task-unselect-candidate-user-userName" value="" size="9"/></td>
		<td>Email:</td>
		<td><input type="text" id="task-unselect-candidate-user-email" name="task-unselect-candidate-user-email" value="" size="9"/></td>
		<td><a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchCandidateUser();">Search</a></td>
	</tr>
</table>
       <table id="task-unselect-candidate-user-list">
			<thead>
				<tr>
					<th field="userId" align="middle" checkbox="true"></th>
					<th field="sso" width="80" align="middle" sortable="true"><s:text name='label.pm.user.sso'></s:text></th>
					<th field="name" width="100" align="middle" sortable="true"><s:text name='label.pm.user.name'></s:text></th>
					<th field="title" width="100" align="middle" sortable="true"><s:text name='label.pm.user.title'></s:text></th>
					<th field="email" width="200" align="middle"><s:text name='label.pm.user.email'></s:text></th>
					<th field="userStatus" width="200" align="middle"><s:text name='label.pm.user.status'></s:text></th>
				</tr>
			</thead>
		</table>
</div>