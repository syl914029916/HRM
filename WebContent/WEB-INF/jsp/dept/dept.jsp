<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 引入分页标签 -->
    <%@ taglib prefix="fkjava" uri="/page-tag"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>人事管理系统 ——部门管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<!-- 引入分页样式 -->
    <link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
		
		//删除部门信息
		function depeteDept(id){
			if(window.confirm("是否确认删除该部门？删除部门会删除部门下面所有的部门！")){
			window.location = "${ctx}/dept/depeteDept.action?pageModel.pageIndex=${pageModel.pageIndex}&dept.id="+id;
			}
			
		} 
	</script>
	<style>
	.usr{
				float:left;
				margin-top: 50px;
				margin-left: 60px;
				border-left: 5px solid #409EFF;
			}
	.res{
				width: 200px;
				margin-top: 50px;
				margin-left: 60px;
				border-left: 5px solid rgb(17,97,235);
			}
	.main_trbg_tit{
	border: 1px solid #E4E7ED;
	color:#909399;
	font-weight:bold;
	}
	.main_trbg{
	border: 1px solid #E4E7ED;
	color:#606266;
	}
	.table tr,td,th{
		border:  #E4E7ED;
		
	}
	.t1{
	margin-top: 30px;
	margin-left: 140px;
	}
	.font3{
	color:#606266;
	
	}
	.search{
	margin-left: 100px;
	margin-top: 30px;
	}
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
   
   
   input::-webkit-input-placeholder{
            color:#C0C4CC;
            font-size: 15px;
            text-align: center;
        }
        input::-moz-placeholder{   /* Mozilla Firefox 19+ */
            color:#C0C4CC;
        }
        input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
            color:#C0C4CC;
        }
        input:-ms-input-placeholder{  /* Internet Explorer 10-11 */ 
            color:#C0C4CC;
            
        }
        
        .form{
			height: 30px;
			width: 500px;
			border: solid;
			border-width: 1px;
			border-color: #C0C4CC;
			text-align:center;
			;
		}
			
	</style>
</head>
<body >
	<!-- 导航 -->
	<div class="usr">
			<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;部门查询</font>
			
	</div>
	<br/>
	<table background="#f0f0f0" width=70% border="0" cellpadding="0" cellspacing="0" >
		 <tr><td height="30"></td></tr>
		 
	</table>
	
	<table width="90%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			 		<s:if test="tip != null">&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${tip }</font></s:if>
					<s:form name="empform" method="post" id="empform" action="/dept/selectDept.action" theme="simple">
				    <table class="search" width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input class="form" type="text"  placeholder="请输入部门名" style="border-radius:5px" name="dept.name"/> &nbsp;
					    	<input class="button" type="submit" value="搜索"/>
					    </td>
					  </tr>
					</table>
				</s:form>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
	    <div class="res">
			<font color=#606266 size="3">&nbsp;&nbsp;搜索结果
			
		</div>
		  <table  class="t1" width="79%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit">
			  <td>编号</td>
			  <td>姓名</td>
			  <td>备注</td>
			  <td colspan="2" align="center">操作</td>
			</tr>
			
			<s:iterator value="#request.depts" status="stat">
			  <tr class="main_trbg" id="tr_${stat.index+1}">
				  <td>${stat.index+1}</td>
				  <td>${name}</td>
				  <td>${remark}</td>
				  <td align="center" width="40px;"><a href="${pageContext.request.contextPath}/dept/showUpdateDept.action?dept.id=${id}">
						<img title="修改" src="${ctx}/images/update.gif"/></a>
				  </td>
				  <td align="center"  width="40px;"><a href="javascript:depeteDept('${id}')">
						<img title="删除" src="${ctx}/images/delete.gif"/></a>
				  </td>
			</tr>
			
			</s:iterator>
			
		
			
		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="left" class="font3">
	  	
	  	  <tr valign="top">
	  	  
	  	  
	  	  <td align="left" class="font3">
	  	  
	  	  
	  	    <!-- 
          fkjava:标签前缀
          pager：标签名字：在tld文件中指定
          pageIndex：当前页码
          pageSize：每页显示的记录数
          recordCount：总记录数
          submitUrl：请求地址
       -->

       
       
     <fkjava:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.totalNum}" submitUrl="${ctx}/dept/selectDept.action?pageModel.pageIndex={0}&dept.name=${dept.name}" pageStyle="manu"></fkjava:pager>
    
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>