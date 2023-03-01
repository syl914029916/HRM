<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人事管理系统 ——后台登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
	// 退出函数
	// 退出函数     
	function exit(){
		//parent：父级页面      top:最顶级页面
    	top.window.location = "${ctx}/user/userLogout.action";  
	};
</script>
<style>
        ul,li{
            list-style: none;
            margin: 0;
            padding: 0;
            
        }
        
        li{
            display:inline;
            float:left;
        }
        
        .nav{           
            margin-left: 50px;
            margin-top:0px;           
            font-size:50;
            color: #606266;
            
            
        }
        .fon{           
            margin-left: 0px;
            margin-top:0px;           
            font-size:100;
            color: #606266;
            
            
        }
        
        .t1{
            width:90%;
            margin-right: 50px;
        	margin-left: 100px;
        	margin-top: 0px;
        	margin-bottom: 5px;
        	font-size:100;
        	color: #606266;
        }
        
        
        
        a:link{
            text-decoration: none;
            text-align: center;
            padding: 30px;
            display: block;
            width: 70px;
            color: #606266;;
        }
        a:visited{
            text-decoration: none;
            text-align: center;
            padding: 7px;
            display: block;
            width: 75px;
            
            color: #606266;;
            background-color:#c4e1ff;
        }
        a:hover,a:active{
            background-color:#c4e1ff;
            color: white;
            font-weight:600;
            
            
            
        }
        .box{
        -webkit-box-shadow:0px 3px 3px #c8c8c8 ;
-moz-box-shadow:0px 3px 3px #c8c8c8 ;
box-shadow:0px 3px 3px #c8c8c8 ;
height:70px;
margin-top:0px;
}
</style>

</head>


<body style="background-color:#ffffff">
	<div class="box" >
	   
		<table class="t1"  cellpadding="0" cellspacing="0">
		  <tr>
		    <td width="200"  class="topbg">
		    	<img src="images/logo.png" width="200" >
		    </td>
		    
		    <td >
		      	<ul class="nav">
			        <li class="fon"><a href="left1.action" target="tree"><font size=3.9 ><b>首页</b></a></li>
			        
			        <li class="fon"><a href="left3.action" target="tree"><font size=3.9  ><b>部门管理</b></a></li>
			        <li class="fon"><a href="left4.action" target="tree"><font size=3.9  ><b>职位管理</b></a></li>
			        <li class="fon"><a href="left5.action" target="tree"><font size=3.9  ><b>员工管理</b></a></li>
			        <li class="fon"><a href="left6.action" target="tree"><font size=3.9  ><b>公告管理</b></a></li>
			        <li class="fon"><a href="left7.action" target="tree"><font size=3.9  ><b>下载中心</b></a></li>
			        
			        
			    </ul>			    			    			  
		    </td>
		    <td >
		       <a href="javascript:exit()">&nbsp;<font size=3.9  ><b>退出登录</b></a>
		    </td>
		    				    
		  </tr>
		</table>
		<hr/>
		
		
	</div>
	
</body>
</html>