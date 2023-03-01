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
<script type="text/javascript" src="${ctx}/js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE
			.init({
				// General options
				mode : "textareas",//匹配模式     textareas：对页面中所有的textareas标签生效
				theme : "advanced",//主题样式
				language : "zh-cn",//语言
				plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",

				// Theme options
				theme_advanced_buttons1 : "newdocument,save,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
				theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
				theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
				theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
				theme_advanced_statusbar_location : "bottom",
				theme_advanced_resizing : true,//是否可拖动

			});

	$(function() {

		$("#btn").click(function() {

			var title = $("#title").val();
			var content = tinyMCE.get('content').getContent();

			if ($.trim(title) == null || $.trim(title) == "") {
				alert("请输入公告标题！");
				$("#title").focus();
			} else if ($.trim(content) == null || $.trim(content) == "") {
				alert("请输入公告内容！");
			} else {
				//提交表单
				$("#noticeForm").submit();
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
	margin-left: 200px;	
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

.button2
	{
    text-decoration:none;
	background:#fffffff;
	color:rgb(17,97,235);
	padding: 6px 25px 6px 25px;
	font-size:15px;		
	border-radius:3px;
	font-family: 微软雅黑;
	-webkit-transition:all linear 0.30s;
	-moz-transition:all linear 0.30s;
	transition:all linear 0.30s;
	border: 0px solid;
	box-shadow: inset 0 0px 0px rgba(0,0,0,.075);
	margin-left: 60px;
	border:1px solid;
	border-color:rgb(17,97,235);	
	}
   





	
	</style>
</head>
<body>
<div class="usr">
			<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;修改公告</font>
			
	</div>
	<br/>
	<table width=70% border="0" cellpadding="0" cellspacing="0" >
		 <tr><td height="30"></td></tr>
		 
	</table>
	
<%-- 	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
			<td class="main_locbg font2"><img
				src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：公告管理
				&gt; 修改公告</td>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
		</tr>
	</table> --%>


		<table width="90%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
				  <table class="font3t" width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
				  	
				  	
				  	<!-- 表单 -->
				  	<form id="noticeForm" name="noticeForm" action="${ctx}/notice/updateNotice.action" method="post">
                        
                        <s:token></s:token>
                        
                        <s:actionerror/>
                         
                         <%-- <input type="hidden" value="${notice.id}" name="notice.id"/> --%>
                         <s:hidden name="notice.id"/>
  
					    <tr><td class="font3 fftd">公告标题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    
					    
					    <input class="form" type="text" placeholder="请输入公告标题" style="border-radius:5px" name="notice.title" size="30" value="${notice.title}" id="title"/>
					    	
					    	&nbsp;<font color="red">${tip}</font><br/><br/></td>
					    </tr>
						<tr><td class="main_tdbor"></td></tr>
						
						
					    
						<tr><td class="main_tdbor"></td></tr>
						
						
						
						
						
						<tr><td class="font3 fftd">公告内容<br/><br/>
							<textarea name="notice.content" cols="88" rows="11" id="content">${notice.content}</textarea>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						
						
						
						<tr><td class="main_tdbor"></td></tr>
						<tr><td class="font3 fftd">
								<input class="button" type="button" id="btn" value="确定">
								<input class="button" type="reset" value="重置">
							    
						</td></tr>
						
						
						
						
						<tr><td class="main_tdbor"></td></tr>
					</form>
					
					
					
					<form id="picForm" name="picForm" action="notice/showAddNotice.action" method="post" enctype="multipart/form-data">
					<tr><td class="font3 fftd" style="margin-left:60px">附件<br/>
							<p id="attachment"></p>
						</td></tr>
						<tr><td>
						<a href="javascript:;" class="upload">选择文件    
					   		
							<input class="file1" type="file" name="pic"  size="200"/>
							</a>
							<input class="button2" type="submit" value="上传"/>
							<br/><br/><br/>
						</td></tr>
						
					</form>




						
					



				  </table>
			</td>
		</tr>
	</table>
	<div style="height: 10px;"></div>
</body>
</html>
