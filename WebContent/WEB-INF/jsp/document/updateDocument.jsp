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
<script type="text/javascript">
	$(function() {

		$("#btn").click(function() {

			var title = $("#title").val();

			if ($.trim(title) == null || $.trim(title) == "") {
				alert("请输入文档标题！");
				$("#title").focus();
			} else {
				//提交表单
				$("#documentForm").submit();
			}
		})

	})
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
	background:rgb(17,97,235);
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
.upload{
    padding: 7px 20px;
    height: 20px;
    line-height: 20px;
    position: relative;
    border: 1px solid #999;
    text-decoration: none;
    color: #666;
    font-size:16;
}
.file1{
    position: absolute;
    overflow: hidden;
    right: 0;
    top: 0;
    opacity: 0;
}	
	</style>
</head>
<body>
	
		<div class="usr">
			<font color=#606266 size="5">&nbsp;&nbsp;&nbsp; 修改文档</font>
			
	</div>
	<br/>
	<table width=70% border="0" cellpadding="0" cellspacing="0" >
		 <tr><td height="30"></td></tr>
		 
	</table>
		
		<table width="90%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
				  <table class="font3t" width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
				  	
				  	
				  	<!-- 表单 -->
				  	<form id="documentForm" name="documentForm" action="${ctx}/document/updateDocument.action" method="post" enctype="multipart/form-data">
                        
                        <s:token></s:token>
                        
                        <s:actionerror/>
                        <s:fielderror></s:fielderror>
                        <!-- 传递document的id -->
                        <s:hidden name="document.id"></s:hidden>
                        <!-- 传递文件的路径 -->
                        <s:hidden name="document.url"></s:hidden>
                        
					    
						
						
						<tr><td class="font3 fftd">文档标题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <input class="form" type="text" placeholder="请输入公告标题" style="border-radius:5px" value="${document.title}"  name="document.title" size="30" id="title"/>
					    	
					    	&nbsp;<font color="red">${tip}</font><br/><br/></td>
					    </tr>
						<tr><td class="main_tdbor"></td></tr>
						
						
						
						<tr><td class="font3 fftd">上传文件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <a href="javascript:;" class="upload">选择文件
   																
					    		<input class="file1" type="file" name="pic" id="file"/>		
					    	</a>						  	
						  <br/><br/>									    	
					    	</td>
					    </tr>
						
						
						
						<tr><td class="font3 fftd">文档备注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br/>
							<textarea name="document.remark" style="border-radius:5px;border-color: #C0C4CC;border: solid;border-width: 1px;"cols="88" rows="11" id="content">${document.remark}</textarea>
						<br/><br/>
						</td></tr>
					
					
					
						
						<tr><td class="main_tdbor"></td></tr>
						
						
						<tr><td class="font3 fftd">
								<input class="button" type="button" id="btn" value="确定">
								<input class="button" type="reset" value="重置">
						</td></tr>
						
						
						
						<tr><td class="main_tdbor"></td></tr>
					</form>

				  </table>
				</td>
		  	</tr>
		</table>
		<div style="height:10px;"></div>
	</body>
</html>
