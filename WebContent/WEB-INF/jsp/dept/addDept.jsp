<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>人事管理系统——添加部门</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
    <!-- 导入dwr相关js文件 -->
    <script type='text/javascript' src='${ctx}/dwr/engine.js'></script>
    <script type='text/javascript' src='${ctx}/dwr/interface/fileUpload.js'></script>
    <script type='text/javascript' src='${ctx}/dwr/util.js'></script>
    <!-- 引入My97 时间控件-->
    <script type='text/javascript' src='${ctx}/js/My97DatePicker/WdatePicker.js'></script>
	<script type="text/javascript">
	
	
	

	</script>
	
	<style>
	.usr{
				float:left;
				margin-top: 50px;
				margin-left: 60px;
				border-left: 5px solid #409EFF;
			}
			
			
	.form{
			height: 30px;
			width: 500px;
			border: solid;
			border-width: 1px;
			border-color: #C0C4CC;
			text-align:center;
			
		}
	.font3t{
	margin-top: 50px;
	margin-left:160px;}
	.button
	{
    text-decoration:none;
	background:#66b3ff;
	color:#f2f2f2;
	padding: 6px 25px 6px 25px;
	font-size:15px;		
	border-radius:10px;
	font-family: 微软雅黑;
	-webkit-transition:all linear 0.30s;
	-moz-transition:all linear 0.30s;
	transition:all linear 0.30s;
	border: 0px solid;
	box-shadow: inset 0 0px 0px rgba(0,0,0,.075);
	margin-left: 100px;	
	}
   .button:hover { background:#409EFF; }
   .font3{
	color:#606266;
	
	}		
	
	</style>
	
	
	
</head>
<body >
	<div class="usr">
		<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;添加部门</font>
			
	</div>
	<br/>
	<table width=70% border="0" cellpadding="0" cellspacing="0" >
		 <tr><td height="30"></td></tr>
		 
	</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  
</table>
<table width="90%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	<s:form theme="simple" action="/dept/addDept.action" id="deptForm" method="post">
    	
    	
    	
    	
    	
    	
    	  <!-- 方表单重复添加 -->
    	  <s:token></s:token>
		  <table class="font3t" width=90% border="0" cellpadding="0" cellspacing="10" class="main_tab">
			<tr ><td class="font3 fftd">部门名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="form" type="text" placeholder="请输入部门名" style="border-radius:5px" name="dept.name"  id="name" size="20"/>
			<br/>
			<br/>
			</td>
				<s:if test="tip != null">&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${tip }</font></s:if>
			</tr>
			<tr><td class="font3 fftd">
					备注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入部门名" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="dept.remark" id="remark" size="40"/>
					<br/>
					<br/>																			
				</td>
			</tr>
			<tr><td align="left" class="fftd">
			<input class="button" type="submit" value="确定 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="button" type="reset" value="取消 ">
			</td></tr>
		  </table>
	  	</s:form>
	</td>
  </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>