<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<!-- 1.导入样式 -->
<!-- 默认主题样式文件 -->
<link rel="stylesheet" type="text/css"
	href="/web/css/themes/default/easyui.css" />
<!-- 图标样式 -->
<link rel="stylesheet" type="text/css" href="/web/css/themes/icon.css" />

<!-- 2.导入js -->
<!-- 一定要先于easyUI导入 -->
<script type="text/javascript" src="/web/jQuery/jquery.min.js"></script>
<!-- easyui库文件 -->
<script type="text/javascript" src="/web/jQuery/jquery.easyui.min.js"></script>
<!-- 本地化库文件 -->
<script type="text/javascript" src="/web/jQuery/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#formWindow").window({
			onClose:function(){
				$("#phoneForm").form("clear");
			}
		});
		
		$("#phoneForm").form({
			success:function(){
				$("#phoneDataGridWithPage").datagrid("reload");
			}
		});
		
		$("#formSubmitBtn").linkbutton({
			onClick:function(){
				$("#phoneForm").form("submit");
				$("#formWindow").window("close");
				$("#phoneForm").form("clear");
			}
		});
		
		$("#phoneDataGridWithPage").datagrid({
			url:"${ctp}/list",
			fit:true, 
			pagination:true,
			singleSelect:true,
			columns:[[
				        {field:'phoneId',title:'手机编号'},    
				        {field:'phoneName',title:'手机品牌'},    
				        {field:'phonePrice',title:'价格'},  
				        {field:'phoneColor',title:'颜色'} 
				    ]],
		    toolbar:[{
		    	iconCls:'icon-add',
		    	text:'添加手机信息',
		    	handler:function(){
		    		$("#formWindow").window("open");
		    		$("#phoneForm").form({url:"/EasyUICRUD/saveEmployee"});
		    	}
		    },{
		    	iconCls:'icon-remove',
		    	text:'删除手机信息',
		    	handler:function(){
		    		var selectedRow = $("#phoneDataGridWithPage").datagrid("getSelected");
		    		console.log(selectedRow);
		    		
		    		if(selectedRow == null) {
		    			
		    			$.messager.alert("CRUD练习","亲，你是不是忘了选中一条呢？你还想不想混了？","info");
		    			
		    		}else{
		    			
		    			$.messager.confirm("CRUD练习","亲，你真的要删除这一条吗？现在后悔还来得及！",function(result){
		    				if(result) {
		    					
		    					var empId = selectedRow.empId;
		    					
		    					$.post("/EasyUICRUD/removeEmp/"+empId,function(){
		    						$("#phoneDataGridWithPage").datagrid("reload");
		    					});
		    					
		    				}else{
		    					$.messager.show({
		    						title:'CRUD练习',
		    						msg:'你做出了一个正确的决定！',
		    						timeout:3000,
		    						showType:'slide'
		    					});
		    				}
		    			});
		    			
		    		}
		    		
		    	}
		    },{
		    	iconCls:'icon-edit',
		    	text:'编辑手机信息',
		    	handler:function(){
		    		
		    		var selectedRow = $("#phoneDataGridWithPage").datagrid("getSelected");
		    		
		    		if(selectedRow == null) {
		    			$.messager.alert("请选择你要修改的手机信息");
		    		}else{
			    		$("#formWindow").window("open");
			    		$("#phoneForm").form({url:"/EasyUICRUD/updateEmployee"}).form("load",selectedRow);
		    		}
		    		
		    	}
		    }]
		});
	});
	
</script>

</head>
<body class="easyui-layout"> 
<!--"region:'center',title:'<span style='font-size:20px;align:center'>手机展览会</span>'"  -->  
    <div data-options="region:'center',title:'<h1>手机展览会</h1>'" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,selected:0">
    		<table id="phoneDataGridWithPage"></table>
    	</div>
    </div>   
    
    <div id="formWindow" class="easyui-window" data-options="closed:true,modal:true" style="width: 300px;height: 250px;text-align: center;padding-top: 30px;">
    	<form id="phoneForm" class="easyui-form" method="post">
    		手机编号：<input disabled="disabled" type="text" name="phoneId"/><br/><br/>
    		手机品牌：<input type="text" name="phoneName"/><br/><br/>
    		手机价格：<input type="text" name="phonePrice"/><br/><br/>
    		手机颜色：<input type="text" name="phoneColor"/><br/><br/>
    		<a id="phoneSubmitBtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
    	</form>
    </div>
</body>  
</html>