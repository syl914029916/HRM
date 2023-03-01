<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人事管理系统 ——部门管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
	// 退出函数
	function exit(){
		
	};
	$(function(){
		$("a[href]").click(function(e){
			
			//阻止事件的默认行为
			e.preventDefault();
			
			//重新指定指定跳转地址
			$("#right",parent.document).attr("src",this.href);
			
		})
		
	})
</script>
<style>
        ul,li,a{
            list-style: none;
            margin: 0;
            padding: 0;
        }
        .nav{
            /*也可利用position对导航进行定位*/
            
            height: 30px;
            background-color: #c4e1ff;
            margin-top: 30px;
            margin-left: 60px;
            
            display: block; /*链接整个元素，而不仅是文本*/
            padding: 10px;
            text-decoration: none;
            text-align:left ;
            color: #FFFFFF;
            font-weight:530;
            
        }
        .usr{
            /*也可利用position对导航进行定位*/
            
            height: 30px;
            
            margin-left: 60px;
            margin-top: 0px;
            
            display: block; /*链接整个元素，而不仅是文本*/
            padding: 0px;
            text-decoration: none;
            text-align: center;
            color: #606266;
            background-color: white;
            
            
        }
        
        
        a:link,a:visited{
            display: block; /*链接整个元素，而不仅是文本*/
            padding: 10px;
            text-decoration: none;
            text-align: center;
            color: #606266;
            background-color: white;

        }
        a:hover,a:active{
        	background-color: rgb(236,245,255);
            
        }

</style>

</head>


<body style="background: url(images/back.png)">
	<div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
		    
		    <td>
		      	<ul class="nav">
			        <li><font size=4.3  >职位管理</font></a></li>
			        
			        
			    </ul>
			    <ul class="usr">
			        
			        <li><a href="job/selectJob.action" target="main"><font size=3.9  ><b>职位查询</b></font></a></li>
			        <li><a href="job/showAddJob.action" target="main"><font size=3.9  ><b>添加职位</b></font></a></li>
			        
			    </ul>

			  
		    </td>
			<td class="topbg">
				
				
			</td>
		  </tr>
		</table>
	</div>
	
</body>
</html>
