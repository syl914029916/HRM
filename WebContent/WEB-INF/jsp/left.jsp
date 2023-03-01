<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>人事管理系统 ——后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script language="javascript" type="text/javascript"> 
			function showsubmenu(sid){
				for(var i = 1; i < 5; i++){
					if(sid == i){
						continue;
					}
					document.getElementById("submenu" + i).style.display = "none";
				}
				whichEl = document.getElementById("submenu" + sid);
				if (whichEl.style.display == "none"){
					document.getElementById("submenu" + sid).style.display = "";
					document.getElementById("navbg" + sid).className = "left_nav_expand";
				}else{
					document.getElementById("submenu" + sid).style.display = "none";
					document.getElementById("navbg" + sid).className = "left_nav_closed";
				}
			}
			
			
			//由于使用dwr上传文件之后导致所有的a标签  加上了 <a target='_blank'>
			$(function(){
				$("a[href]").click(function(e){
					
					//阻止事件的默认行为
					e.preventDefault();
					
					//重新指定指定跳转地址
					$("#right",parent.document).attr("src",this.href);
					
				})
				
			})
		</script>
	</head>
<body>
	<div style="margin:10px;background-color:#FFFFFF; text-align:left;">
		<table width="200" height="100%" border="0" cellpadding="0" cellspacing="0" class="left_nav_bg">
		 <!--  <tr><td class="left_nav_top"><div class="font1">用户管理</div></td></tr>
		  <tr valign="top">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif"/>&nbsp;&nbsp;<a href="user/selectUser.do" target="main">用户查询</a></p>
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif"/>&nbsp;&nbsp;<a href="user/showAddUser.do" target="main">添加用户</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr> -->
		  
		  <tr><td id="navbg1" class="left_nav_closed" onClick="showsubmenu(1)"><div class="font1">部门管理</div></td></tr>
		  <tr valign="top" id="submenu1" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="dept/selectDept.action" target="main">部门查询</a></p>
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="dept/showAddDept.action" target="main">添加部门</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg2" class="left_nav_closed" onClick="showsubmenu(2)"><div class="font1">职位管理</div></td></tr>
		  <tr valign="top" id="submenu2" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="job/selectJob.action" target="main">职位查询</a></p>
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="job/showAddJob.action" target="main">添加职位</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>

		  <tr><td id="navbg3" class="left_nav_closed" onClick="showsubmenu(3)"><div class="font1">员工管理</div></td></tr>
		  <tr valign="top" id="submenu3" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif"/>&nbsp;&nbsp;<a href="${ctx}/emp/selectEmp.action" target="main">员工查询</a></p>
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif"/>&nbsp;&nbsp;<a href="${ctx}/emp/showAddEmp.action" target="main">添加员工</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg4" class="left_nav_closed" onClick="showsubmenu(4)"><div class="font1">公告管理</div></td></tr>
		  <tr valign="top" id="submenu4" style="display: none">
		    <td class="left_nav_bgshw tdbtmline" height="50">
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${ctx}/notice/selectNotice.action" target="main">查询公告</a></p>
			  <p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${ctx}/notice/showAddNotice.action" target="main">添加公告</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg5" class="left_nav_closed" onClick="showsubmenu(5)"><div class="font1">下载中心</div></td></tr>
		  <tr valign="top" id="submenu5" style="display: none">
		    <td class="left_nav_bgshw tdbtmline" height="50">
		    	<p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${ctx}/document/selectDocument.action" target="main">下载文件</a></p>
			  	<p class="left_nav_link"><img src="images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${ctx}/document/showAddDocument.action" target="main">上传文件</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		 
		  <tr valign="top"><td height="100%" align="center"><div class="copycct"><br /><strong>技术支持：</strong><br><strong>广东为学教育有限公司</strong><br>Http://www.fkjava.org</div></td></tr>
		  <tr><td height="10"><img src="images/left_nav_bottom.gif" height="10"></td></tr>
		  <tr><td height="10" bgcolor="#e5f0ff">&nbsp;</td></tr>
		</table>
	</div>
</body>
</html>