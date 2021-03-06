insert into `t_common_dic`(`ID`,`CODE`,`VALUE`,`PARENT_ID`,`REMARK`,`STATUS`) values
('0','dictionary','字典',null,null,'1'),
('1','yes_or_no','判断','0',null,'1'),
('2','0','否','1',null,'1'),
('3','1','是','1',null,'1'),
('4','module_type','模块类型','0',null,'1'),
('5','0','模块','4',null,'1'),
('6','1','功能','4',null,'1'),
('7','module_status','模块状态','0',null,'1'),
('8','0','关闭','7',null,'1'),
('9','1','打开','7',null,'1'),
('10','field_type','域类型','0',null,'1'),
('11','0','按钮','10',null,'1'),
('12','1','文本框','10',null,'1'),
('13','org_type','组织机构类型','0',null,'1'),
('14','org_status','组织机构状态','0',null,'1'),
('15','0','无效','14',null,'1'),
('16','1','有效','14',null,'1'),
('17','privilege_type','权限类型','0',null,'1'),
('18','0','禁止','17',null,'1'),
('19','1','允许','17',null,'1'),
('20','sex','性别','0',null,'1'),
('21','0','男','20',null,'1'),
('22','1','女','20',null,'1'),
('23','user_status','用户状态','0',null,'1'),
('24','0','冻结','23',null,'1'),
('25','1','激活','23',null,'1'),
('26','db_type','数据源类型','0',null,'1'),
('27','0','Oracle','26',null,'1'),
('28','1','Mysql','26',null,'1'),
('29','2','Sqlserver','26',null,'1'),
('30','operator_type','操作符类型','0',null,'1'),
('31','0','=','30',null,'1'),
('32','1','like','30',null,'1'),
('33','project_sort','项目类型','0',null,'1'),
('34','0','Internal','33',null,'1'),
('35','1','External','33',null,'1'),
('36','application_type','申请类型','0',null,'1'),
('37','0','ProjectId','36',null,'1'),
('38','1','Branch','36',null,'1'),
('39','2','Release','36',null,'1'),
('40','project_type','项目类型','0',null,'1'),
('41','0','New','40',null,'1'),
('42','1','Remification','40',null,'1'),
('43','project_sub_type','项目子类型','0',null,'1'),
('44','0','Maintenance','43',null,'1'),
('45','1','CR','43',null,'1'),
('46','project_status','项目状态','0',null,'1'),
('47','0','OnGoing','46',null,'1'),
('48','1','Finished','46',null,'1'),
('49','2','Not Kick Off','46',null,'1'),
('50','3','Cancel','46',null,'1'),
('51','4','Pending','46',null,'1'),
('52','project_status1','项目状态1','0',null,'1'),
('53','0','OnGoing','52',null,'1'),
('54','2','Not Kick Off','52',null,'1'),
('55','current_phase','项目阶段','0',null,'1'),
('56','0','Initiation','55',null,'1'),
('57','1','Business Requirement','55',null,'1'),
('58','2','Project Plan','55',null,'1'),
('59','3','BSAR','55',null,'1'),
('60','4','BSDR','55',null,'1'),
('61','5','Coding','55',null,'1'),
('62','6','Test','55',null,'1'),
('63','7','UAT','55',null,'1'),
('64','8','Deployment','55',null,'1'),
('65','9','Pilot','55',null,'1'),
('66','10','Closure','55',null,'1'),
('67','current_phase_status','当前阶段','0',null,'1'),
('68','0','Normal','67',null,'1'),
('69','1','Delay','67',null,'1'),
('70','2','Ahead','67',null,'1'),
('71','3','Warning','67',null,'1'),
('72','sow_signed','合同签署','0',null,'1'),
('73','0','Not Signed','72',null,'1'),
('74','1','No Need','72',null,'1'),
('75','2','Signed','72',null,'1'),
('76','project_category','项目类型','0',null,'1'),
('77','0','BPR','76',null,'1'),
('78','1','Transaction','76',null,'1'),
('79','2','Productivity','76',null,'1'),
('80','3','Investment','76',null,'1'),
('81','4','Audit','76',null,'1'),
('82','5','Research','76',null,'1'),
('83','6','Others','76',null,'1'),
('84','program_type','项目种类','0',null,'1'),
('85','0','Unfinished','84',null,'1'),
('86','1','Finished','84',null,'1'),
('88','SvnFolderType','文件夹类型','0',null,'1'),
('89','0','Trunk','88',null,'1'),
('90','1','Branches','88',null,'1'),
('91','2','Tag','88',null,'1'),
('92','action','操作状态','0',null,'1'),
('93','0','submit','92',null,'1'),
('94','1','approval','92',null,'1'),
('95','2','reject','92',null,'1'),
('96','3','cancel','92',null,'1'),
('97','4','finished','92',null,'1'),
('98','platform','平台','0',null,'1'),
('99','0','.Java','98',null,'1'),
('100','1','.Net','98',null,'1'),
('101','project_privilege_tp','项目权限类型','0',null,null),
('102','0','Read','101',null,'1'),
('103','1','Write','101',null,'1');
insert into `t_common_seq`(`ID`,`NAME`,`MIN`,`LENGTH`,`NEXT`,`RULES`) values
('76','seq_svn_userId','0','10','93',null),
('77','seq_svn_groupId','0','10','19',null),
('78','seq_svn_userAuthzId','0','10','528',null),
('79','seq_svn_groupAuthzId','0','10','468',null),
('80','seq_svn_configId','0','10','8',null),
('75','seq_emailTemp_id','0','10','9',null),
('2','seq_test2','2','3','2','seq###max_id###'),
('3','seq_user','1','10','63',null),
('4','seq_module','1','10','63',null),
('5','seq_group','1','10','7',null),
('6','seq_org','1','10','5',null),
('7','seq_role','1','10','22',null),
('8','seq_privilege','1','10','42',null),
('9','seq_opt','1','10','6',null),
('10','seq_ug','1','10','30',null),
('11','seq_ur','1','10','33',null),
('12','seq_function','1','10','302',null),
('13','seq_field','1','10','12',null),
('14','seq_server','1','10','7',null),
('15','seq_connectionpool','1','10','10',null),
('16','seq_datasource','1','10','4',null),
('17','seq_log','1','10','1476',null),
('18','seq_qstring','1','10','418',null),
('19','seq_userorg','1','10','29',null),
('20','seq_wf_history','1','10','547',null),
('21','seq_apid','1','10','281',null),
('22','seq_pmtid','1','10','84',null),
('23','seq_hid','1','10','303',null),
('24','seq_pid','1','10','47',null),
('25','seq_mid','1','10','15',null),
('26','seq_wf_vid','1','10','89',null),
('81','seq_svn_usergroupId','0','10','112',null),
('0','seq_generator_id','1','10','82',null),
('74','seq_vacation_application','1','10','4',null);
insert into `t_pm_function`(`FUNCTION_ID`,`MODULE_ID`,`FIELD_ID`,`OPERATION_ID`,`PRIVILEGE_ID`) values
('160','2',null,'1','28'),
('161','3',null,'1','28'),
('162','6',null,'1','28'),
('163','8',null,'1','28'),
('164','10',null,'1','28'),
('165','11',null,'1','28'),
('166','12',null,'1','28'),
('167','25',null,'1','28'),
('168','26',null,'1','28'),
('169','27',null,'1','28'),
('170','29',null,'1','28'),
('278','53',null,'1','27'),
('296','2',null,'1','41'),
('297','6',null,'1','41'),
('298','10',null,'1','41'),
('299','51',null,'1','28'),
('300','51',null,'1','41'),
('301','29',null,'1','41');
insert into `t_pm_module`(`MODULE_ID`,`NAME`,`PARENT_ID`,`PATH`,`SYS_MODULE`,`PRIVILEGE_MODULE`,`INDEX_PAGE`,`ORDER_NUM`,`MODULE_STATUS`,`IS_LEAF`,`REMARK`) values
('53','Leave Apply','30','/wf/application/application!forInsert.action','0','0',null,'0','1','1',null),
('0','menu.text.root',null,null,'0','1',null,'5','1','0',null),
('1','menu.text.pm','0',null,'0','1',null,'1','1','0',null),
('2','menu.text.pm.user.management','1','/pm/user/user!forQuery.action','0','1',null,'1','1','1',null),
('3','menu.text.sysm.module.management','7','/pm/module/module!forQuery.action','1','0',null,'2','1','1',null),
('6','menu.text.pm.role.management','1','/pm/role/role!forQuery.action','0','1',null,'5','1','1',null),
('7','menu.text.sysm','0',null,'1','0',null,'1','1','0',null),
('8','menu.text.sysm.dic.management','7',null,'1','0',null,'1','1','1',null),
('10','menu.text.pm.group.management','1','/pm/group/group!forQuery.action','0','1',null,'7','1','1',null),
('11','menu.text.sysm.operation.management','7','/pm/opt/operation!forQuery.action','0','0',null,'8','1','1',null),
('12','menu.text.pm.org.management','1','/pm/org/organization!forQuery.action','0','1',null,'8','1','1',null),
('24','menu.text.sm','0','','1','0','','4','0','0',''),
('25','menu.text.sm.connectionpool.monitor','24','/sm/server/server!forQuery.action','1','0',null,'4','1','1',null),
('26','menu.text.sm.remote.log.analyze','24','/sm/datasource/datasource!forQuery.action','1','0',null,'2','1','1',null),
('27','menu.text.sm.local.log.analyze','24','/sm/appserver/appserver!forQuery.action','1','0',null,'3','1','1',null),
('28','menu.text.workflow.center','0',null,'1','0',null,'5','1','0',null),
('29','menu.text.workflow.center.process.monitor','28','/wf/procdef/procdef!forQuery.action','1','0',null,'1','1','1',null),
('30','menu.text.workflow.center.new.apply','28',null,'1','0',null,'2','1','0',null),
('31','menu.text.workflow.center.my.apply','28',null,'1','0',null,'3','1','0',null),
('32','menu.text.workflow.center.my.task','28','/wf/taskinst/taskinst!forQuery.action','1','0',null,'4','1','1',null),
('56','menu.text.workflow.center.email.template.management','28','/wf/emailtemp/emailtemp!forQuery.action','0','0',null,'1','1','1',null),
('51','menu.text.workflow.center.process.design','28','/wf/procdef/procdef!forDesign.action','0','0',null,'0','1','1',null),
('54','menu.text.sysm.sequence.management','7','/common/seq/seq!forQuery.action','1','0',null,'4','1','1',null),
('55','Form Design','28','/form/form!forDesign.action','1','0',null,'1','1','1',null);
insert into `t_pm_operation`(`OPERATION_ID`,`NAME`,`SIGN`,`REMARK`) values
('1','访问',null,null),
('2','删除',null,null),
('3','录入',null,null),
('4','修改',null,null),
('5','执行',null,null);
insert into `t_pm_privilege`(`PRIVILEGE_ID`,`ROLE_ID`,`USER_ID`,`TYPE`) values
('27','6',null,'0'),
('28','4',null,'0'),
('41','21',null,'0');
insert into `t_pm_role`(`ROLE_ID`,`NAME`,`ROLE_STATUS`,`REMARK`) values
('4','系统管理员',null,null),
('6','流程管理员',null,null),
('21','测试组',null,'');
insert into `t_pm_user`(`USER_ID`,`SSO`,`TITLE`,`SUPERVISOR`,`NAME`,`EN_NAME`,`JP_NAME`,`AGE`,`GENDER`,`NATIONALITY`,`PROVINCE`,`CITY`,`FOLK`,`TELEPHONE`,`CELLPHONE`,`FAX`,`EMAIL`,`ADDRESS`,`MSN`,`QQ`,`PW`,`USER_STATUS`,`REMARK`) values
('0','admin',null,null,'超级管理员','admin',null,null,null,null,null,null,null,null,null,null,'admin@test.com',null,null,null,'0d1fb562413a18a81c09f467d66d4820','1',null),
('40','test','','admin','演示用户','',null,'20','0','中国','辽宁','大连','汉','','','','admin@test.com','','','','098f6bcd4621d373cade4e832627b4f6','1','');
insert into `t_pm_userrole`(`ID`,`USER_ID`,`ROLE_ID`) values
('32','40','21');
