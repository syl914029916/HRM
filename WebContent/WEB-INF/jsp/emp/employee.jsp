<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 引入分页标签 -->
    <%@ taglib prefix="fkjava" uri="/page-tag"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>人事管理系统 ——员工管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<!-- 引入分页样式 -->
    	<!-- 引入分页样式 -->
    <link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
		
		/** 生成Excel文件 */
		function excelFn(){

            //将表单数据序列化
            var params = $("#empform").serialize();
            window.location = "${ctx}/emp/downDataToExcel.action?"+params;
		};
		
		//删除员工信息
		function depeteEmp(id){
			if(window.confirm("是否确认删除该记录？")){
				window.location = "${ctx}/emp/deleteEmp.action?pageModel.pageIndex=${pageModel.pageIndex}&employee.jobId=${employee.jobId}&employee.name=${employee.name}&employee.cardId=${employee.cardId}&employee.sex=${employee.sex}&employee.phone=${employee.phone}&employee.deptId=${employee.deptId}&employee.id="+id;
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
				margin-top: 0px;
				margin-left: 10px;
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
	margin-left: 10px;
	}
	.font3{
	color:#606266;
	margin-left:30;
	height="170";
	}
	.search{
	margin-left: 60px;
	margin-top: 30px;
	}
	.search2{
	margin-left: 0px;
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
	margin-left: 250px;	
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
			width: 200px;
			border: solid;
			border-width: 1px;
			border-color: #C0C4CC;
			text-align:center;
			;
		}
			
	</style>
	
	
</head>
<body>
	<!-- 导航 -->	
	<div class="usr">
			<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;员工查询</font>			
	</div>
	<br/>
<!-- 	<table width=100% border="0" cellpadding="0" cellspacing="0" >
		 <tr><td height="30"></td></tr>
	</table> -->
	
	
	
	<table class="search" width=90%  border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td >
		  <table class="sel" width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			 
					<s:form name="empform" method="post" id="empform" action="/emp/selectEmp.action" theme="simple">
	

				    <table class="search" width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
					  <tr>
					    <td class="font3" height=30px>
					    	
					    	职位:&nbsp;&nbsp;&nbsp;&nbsp;
					    	<s:select list="jobs" class="form" name="employee.jobId" placeholder="请输入职位名" style="border-radius:5px;width: 200px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  headerKey="0" headerValue="--请选择职位--" listKey="id" listValue="name">
					    	</s:select>
					    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	性别:&nbsp;&nbsp;&nbsp;&nbsp;
					    	<s:select list="#{'1':'男','2':'女'}" class="form" name="employee.sex" placeholder="请输入性别" style="border-radius:5px;width: 200px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  headerKey="0" headerValue="--请选择性别--"></s:select>
					    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	所属部门ID:&nbsp;&nbsp;&nbsp;&nbsp;
					    	<s:select list="depts" class="form" name="employee.deptId" placeholder="请输入所属部门ID" style="border-radius:5px;width: 200px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  headerKey="0" headerValue="--请选择部门--" listKey="id" listValue="name"></s:select>
					    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	 </td>
					   
					  </tr>	
					  
					  
					  
					    <tr>
					    <td class="font3"  height=30px>
					    	姓名:&nbsp;&nbsp;&nbsp;&nbsp;
					    	<s:textfield name="employee.name"  class="form" placeholder="请输入姓名" style="border-radius:5px;width: 200px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"></s:textfield>
					    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	手机:&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input type="text" class="form"  placeholder="请输入手机号" style="border-radius:5px;width: 200px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.phone"/>
					    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	身份证号码:&nbsp;&nbsp;&nbsp;&nbsp;
					    	<s:textfield name="employee.cardId"  class="form" maxlength="18" placeholder="请输入身份证号码" style="border-radius:5px;width: 200px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"></s:textfield>
					    	
					    	 </td>
					  </tr>	
					    
					
					   
					  
					    <tr>
					    <td class="font3" height=30px>
					    	<br />
					    	
					    	<input class="button" type="submit" value="搜索"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input class="button" type="button" value="导出EXCEL" onclick="excelFn();"/>&nbsp;<font color="red">${requestScope.tip}</font>
					    	
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
	    <td height="10">
	    <div class="res">
			<font color=#606266 size="3">&nbsp;&nbsp;搜索结果
			
		</div> 
		  <table class="t1" width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit">
			  <td width="200px;">编号</td>
			  <td width="200px;">姓名</td>
			  <td width="200px;">性别</td>
			  <td width="200px;">手机号码</td>
			  <td width="200px;">邮箱</td>
			  <td width="500px;">职位</td>
			  <td width="200px;">学历</td>
			  <td width="200px;">身份证号码</td>
			  <td width="200px;">部门</td>
			  <td width="200px;">地址</td>
			  <td width="200px;">建档日期</td>
			  <td colspan="2" align="center"><font color=#606266 size="3" face="黑体">操作</td>
			</tr>
			
			<s:iterator value="#request.employees" status="stat">
			  <tr class="main_trbg" id="tr_${stat.index+1}">
			  <td>${stat.index+1}</td>
			  <td><s:property value="name"/> </td>
			  <td>
                  <s:if test="sex==1">
                                                           男
                  </s:if>
                  <s:else>
                                                         女
                  </s:else>
			  </td>
			  <td>${phone}</td>
			  <td>${email}</td>
			  <td>${job.name}</td>
			  <td>${education}</td>
			  <td>${cardId}</td>
			  <td>${dept.name}</td>
			  <td>${address}</td>
			  <td>
				 <s:date name="createDate" format="yyyy/MM/dd"/>
			  </td>
			  <td align="center" width="20px;"><a href="${pageContext.request.contextPath}/emp/showUpdateEmp.action?employee.id=${id}">
					<img title="修改" src="${ctx}/images/update.gif"/></a>
			  </td>
			  <td align="center"  width="20px;"><a href="javascript:depeteEmp('${id}')">
					<img title="删除" src="${ctx}/images/delete.gif"/></a>
			  </td>
			</tr>
			
			</s:iterator>
			
		
			
		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	 
 <tr valign="top"><td align="center" class="font3">
	  	  	   <br /><br />
	  	  <tr valign="top">
	  
	  	  
	  	  <td align="center" class="font3">
	  	    <!-- 
          fkjava:标签前缀
          pager：标签名字：在tld文件中指定
          pageIndex：当前页码
          pageSize：每页显示的记录数
          recordCount：总记录数
          submitUrl：请求地址
       -->
       
     <fkjava:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.totalNum}" submitUrl="${ctx}/emp/selectEmp.action?pageModel.pageIndex={0}&employee.jobId=${employee.jobId}&employee.name=${employee.name}&employee.cardId=${employee.cardId}&employee.sex=${employee.sex}&employee.phone=${employee.phone}&employee.deptId=${employee.deptId}" pageStyle="manu"></fkjava:pager>
    
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>