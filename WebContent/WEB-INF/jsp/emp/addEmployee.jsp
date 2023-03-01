<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人事管理系统——添加员工</title>
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
<script type='text/javascript'
	src='${ctx}/js/My97DatePicker/WdatePicker.js'></script>



<script type="text/javascript">
	//发送异步请求加载职位以及部门信息
	$.post("${ctx}/emp/ajaxLoadDeptAndJob.action", function(data, status) {

		if (status == "success") {
			//获取部门以及职位信息
			var depts = data.depts;
			var jobs = data.jobs;
			$.each(depts, function(i, item) {
				// this  ==  item
				$("#deptId").append(
						"<option value='"+item.id+"'>" + item.name
								+ "</option>")

			})
			$.each(jobs, function(i, item) {
				// this  ==  item
				$("#jobId").append(
						"<option value='"+item.id+"'>" + item.name
								+ "</option>")

			})

		}

	}, "json")

	//头像上传  
	function changeFn(obj) {

		fileUpload.picUpload(obj, function(path) {

			$("#logoImage").attr("src", "${ctx}/" + path);

			//将头像路径存放在表单中
			//$("#picture").attr("value",path);
			$("#picture").val(path);

		})
	}
</script>

<style>
.usr {
	float: left;
	margin-top: 50px;
	margin-left: 60px;
	border-left: 5px solid #409EFF;
}

.form {
	height: 30px;
	width: 500px;
	border: solid;
	border-width: 1px;
	border-color: #C0C4CC;
	text-align: center;
}

.font3t {
	margin-top: 50px;
	margin-left: 160px;
}

.button {
	text-decoration: none;
	background: #66b3ff;
	color: #f2f2f2;
	padding: 6px 25px 6px 25px;
	font-size: 15px;
	border-radius: 10px;
	font-family: 微软雅黑;
	-webkit-transition: all linear 0.30s;
	-moz-transition: all linear 0.30s;
	transition: all linear 0.30s;
	border: 0px solid;
	box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
	margin-left: 100px;
}

.button:hover {
	background: #409EFF;
}

.font3 {
	color: #606266;
}

.upload {
	padding: 7px 20px;
	height: 20px;
	line-height: 20px;
	position: relative;
	border: 1px solid #999;
	text-decoration: none;
	color: #666;
	font-size: 16;
}

.file1 {
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
		<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;添加员工</font>

	</div>
	<br />
	<table width=70% border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="30"></td>
		</tr>

	</table>




	<table class="font3t" width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	<s:form theme="simple" action="/emp/addEmp.action" id="empForm" method="post">
    	  <!-- 隐藏表单用来传员工的肖像URL -->
    	  <input type="hidden" name="employee.picture" id="picture"/>
    	  <!-- 方表单重复添加 -->
    	  <s:token></s:token>
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
		    <td class="font3 fftd">
		    	<s:if test="tip != null">&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${tip }</font></s:if>
		    	<table>
		    		<tr>
		    		<td class="font3 fftd">照片&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${ctx}/images/none.jpg" width="139" height="147" id="logoImage"/>
		    		<br/><br/></td>
		    		</tr>
		    		
		    		<tr>
		    		
		    			<td width="50px" align="center">
		    				<div >
		    				
		    				<a href="javascript:;" class="upload">选择文件    
					   		
							<input class="file1" type='file' id="image" onchange="changeFn(this);" />
							</a>
		    				
					    	</div>
		    			</td>
		    		</tr>
		    		
		    		
		    		<tr>
		    			<td class="font3 fftd">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<input type="text" class="form" placeholder="请输入姓名" style="border-radius:5px"  name="employee.name" id="name" size="20"/>
		    			
		    		<br/><br/>
		    		
		    			</td>
		    		</tr>
		    		
		    		
		    		<tr>	
		    			<td class="font3 fftd">身份证号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<input type="text"  class="form" placeholder="请输入身份证号码" style="border-radius:5px" name="employee.cardId" id="cardId" size="20"/>
		    			
		    			<br/><br/></td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="font3 fftd">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<s:select  class="form" placeholder="请输入性别" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  list="#{1:'男', 2:'女' }" name="employee.sex" id="sex"/>
		    			<br/><br/></td>
		    		</tr>
		    		
		    		<tr>	
		    			<td class="font3 fftd">职位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<select   class="form" placeholder="请输入职位名" style="border-radius:5px" name="employee.job.id" id="jobId"></select>
		    			<br/><br/></td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="font3 fftd">学历&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<s:textfield class="form" placeholder="请输入学历" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  name="employee.education" id="education" size="20"/>
		    			<br/><br/></td>
		    		
		    		</tr>
		    		
		    		<tr>	
		    			<td class="font3 fftd">邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			
		    			
		    			<s:textfield class="form" placeholder="请输入邮箱" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  name="employee.email" id="email" size="20"/>
		    			<br/><br/></td>
		    		
		    		</tr>
		    		
		    		<tr>
		    			<td class="font3 fftd">手机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<s:textfield class="form" placeholder="请输入手机号" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.phone" id="phone" size="20"/>
		    			<br/><br/></td>
		    		</tr>
		    		
		    		<tr>	
		    			<td class="font3 fftd">电话&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    			<s:textfield class="form" placeholder="请输入电话号" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"  name="employee.tel" id="tel" size="20"/>
		    			<br/><br/></td>
		    		</tr>
		    		
		    		
		    				    				    		    			    					    		    
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					政治面貌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield  class="form" placeholder="请输入政治面貌" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.party" id="party" size="40"/>&nbsp;&nbsp;
					 
					<br/><br/></td>
					</tr>
					
					
					
		    		<tr>		    	
		    	<td class="font3 fftd">
					QQ号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入QQ号码" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.qqNum" id="qqNum" size="20"/>
				<br/><br/></td>
			</tr>
			
			
			
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					联系地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入联系地址" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.address" id="address" size="40"/>&nbsp;&nbsp;
					<br/><br/></td></tr>
		    		<tr>		    	
		    	<td class="font3 fftd">
					邮政编码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入邮政编码" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.postCode" id="postCode" size="20"/>
				<br/><br/></td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					出生日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入出生日期" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" cssClass="Wdate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});" 
					name="employee.birthday" id="birthday" size="40"/>&nbsp;&nbsp;
					<br/><br/></td></tr>
		    		<tr>		    	
		    	<td class="font3 fftd">
					民族&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入民族" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.race" id="race" size="20"/>
				<br/><br/></td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					所学专业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield  class="form" placeholder="请输入所学专业" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.speciality" id="speciality" size="40"/>&nbsp;&nbsp;
					<br/><br/></td></tr>
		    		<tr>		    	
		    	<td class="font3 fftd">
					爱好&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入爱好" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.hobby" id="hobby" size="20"/>
				<br/><br/></td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr>
				<td class="font3 fftd">
					备注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:textfield class="form" placeholder="请输入备注" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" name="employee.remark" id="remark" size="40"/>
					<br/><br/></td></tr>
		    		<tr>		    	
		    	<td class="font3 fftd">
					所属部门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select class="form" placeholder="请输入所属部门" name="employee.dept.id" id="deptId" style="border-radius:5px;width: 500px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;" ></select>
				<br/><br/></td>
			</tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr><td align="left" class="fftd">
			<input class="button" type="submit" value="确定 ">&nbsp;&nbsp;
			<input class="button" type="reset" value="取消 ">
			</td></tr>
			
			
			
			
		  </table>
	  	</s:form>
	</td>
  </tr>
</table>
	<div style="height: 10px;"></div>
</body>
</html>