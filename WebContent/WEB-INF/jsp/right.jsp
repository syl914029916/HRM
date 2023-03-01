<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>人事管理系统 ——后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
		<style>
			.l1{
				margin-left: 70px;
				margin-top: 90px;
				height: 60px;
				width:50%;
				text-align: left;
				
								
			}
			.l2{
				margin-left: 70px;
				
				height: 60px;
				width:50%;
				text-align: left;
								
			}
			.l3{
				margin-left: 70px;
				
				height: 60px;
				width:50%;
				text-align: left;
								
			}
			.usr{
				float:left;
				/* background:url(images/) */
				margin-top: 50px;
				margin-left: 60px;
				border-left: 5px solid #409EFF;
			}
		</style>
		
	</head>
	<body style="background: url(images/back2.png)">
		<div class="usr">
			<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;当前用户</font>
			
		</div>
		<br/>
		<table width=70% border="0" cellpadding="0" cellspacing="0" >
			 <tr><td height="30"></td></tr>
			 
		</table>
		<br /><br /><br /><br /><br /><br />
	      <div class="l1" style="background:#ecf5ff">
	      	<br />
	      	<font color=#606266 size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户姓名：</font>
		    <font color=#303133 size="3">admin</font>
	      </div>
	      
	      <div class="l2" style="background:#F2F6FC">
	      	<br />
	      	<font color=#606266 size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户状态：</font>
		    <font color=#303133 size="3">已审核</font>
	      </div>
	      
	     <%--  <div class="l3" style="background:#ecf5ff">
	      	<br />
	      	<font color=#606266 size="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建时</font>
		    <font color=#303133 size="3"><s:date name="#session.session_admin.createDate" format="yyyy-MM-dd HH:mm:ss"/></font>
	      </div> --%>
			      
			      
			      
				  
				
		<div style="height:10px;"></div>
	</body>
</html>