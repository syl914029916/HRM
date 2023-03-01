<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人事管理系统——修改员工</title>
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

			//获取当前用户的部门以及职位
			var deptId = "${employee.dept.id}";
			var jobId = "${employee.job.id}";

			$.each(depts, function(i, item) {
				// this  ==  item
				//$("#deptId").append("<option value='"+item.id+"'>"+item.name+"</option>")
				$("<option>").val(this.id).text(this.name).attr("selected",
						this.id == deptId).appendTo("#deptId");
			})
			$.each(jobs, function(i, item) {
				// this  ==  item
				//$("#jobId").append("<option value='"+item.id+"'>"+item.name+"</option>")
				$("<option>").val(this.id).text(this.name).attr("selected",
						this.id == jobId).appendTo("#jobId");

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
<style type="text/css">
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
	margin-left: 250px;
}

.form {
	height: 30px;
	width: 300px;
	border: solid;
	border-radius: 5px;
	border-width: 1px;
	border-color: #C0C4CC;
	text-align: center;
	;
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
</style>
</head>
<body>

	<%-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
			<td class="main_locbg font2"><img
				src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理
				&gt; 修改员工</td>
			<td width="15" height="32"><img
				src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
		</tr>
	</table> --%>
	<table width="100%" height="90%" border="0" cellpadding="5"
		cellspacing="0" class="main_tabbor">
		<tr valign="top">
			<td><s:form theme="simple" action="/emp/updateEmp.action"
					id="empForm" method="post">
					<!-- 隐藏表单用来传员工的肖像URL -->
					<input type="hidden" name="employee.picture"
						value="${employee.picture}" id="picture" />

					<s:hidden name="employee.id"></s:hidden>

					<!-- 方表单重复添加 -->
					<s:token></s:token>
					<table width="100%" border="0" cellpadding="0" cellspacing="10"
						class="main_tab">
						<tr>
							<td class="font3 fftd"><s:if test="tip != null">&nbsp;&nbsp;&nbsp;&nbsp;<font
										color="red">${tip }</font>
								</s:if>
								<table>
									<tr>
										<td rowspan="5"><img src="${ctx}/${employee.picture}"
											width="139" height="147" id="logoImage" /></td>
									</tr>
									<tr>
										<td class="font3 fftd">姓名：<input class="form" type="text"
											name="employee.name" value="${employee.name}" id="name"
											size="20" /></td>
										<td class="font3 fftd">身份证号码：<input class="form"
											type="text" name="employee.cardId" value="${employee.cardId}"
											id="cardId" size="20" /></td>
									</tr>
									<tr>
										<td class="font3 fftd">性别：<s:select
												style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
												list="#{1:'男', 2:'女' }" name="employee.sex" id="sex" /></td>
										<td class="font3 fftd">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：<select
											style="border-radius: 5px; width: 300px; height: 30px; border: solid; border-color: #C0C4CC; border-width: 1px; text-align: center;"
											name="employee.job.id" id="jobId"></select></td>
									</tr>
									<tr>
										<td class="font3 fftd">学历：<s:textfield class="form"
												style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
												name="employee.education" id="education" size="20" /></td>
										<td class="font3 fftd">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<s:textfield
												style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
												name="employee.email" id="email" size="20" /></td>
									</tr>
									<tr>
										<td class="font3 fftd">手机：<s:textfield class="form"
												style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
												name="employee.phone" id="phone" size="20" /></td>
										<td class="font3 fftd">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<s:textfield
												class="form"
												style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
												name="employee.tel" id="tel" size="20" /></td>
									</tr>
									<tr>
										<td width="135px" align="center">
											<div
												style="width:90px;height:25px;background-image:url('${ctx}/images/bt_file.png');overflow:hidden;">
												<input type='file' id="image" onchange="changeFn(this);"
													style="filter: alpha(opacity = 0); opacity: 0.0; width: 70px; height: 17px;" />
											</div>
										</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td class="font3 fftd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;政治面貌：<s:textfield
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									name="employee.party" id="party" size="40" />&nbsp;&nbsp;
								&nbsp;Q&nbsp;&nbsp;Q&nbsp;&nbsp;号&nbsp;码：<s:textfield name="employee.qqNum" id="qqNum"
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									size="20" />
							</td>
						</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td class="font3 fftd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系地址：<s:textfield
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									name="employee.address" id="address" size="40" />&nbsp;&nbsp;
								&nbsp;邮&nbsp;政&nbsp;&nbsp;编&nbsp;码：<s:textfield name="employee.postCode" id="postCode"
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									size="20" />
							</td>
						</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td class="font3 fftd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出生日期：<s:textfield
									cssClass="Wdate"
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'});"
									name="employee.birthday" id="birthday" size="40" />&nbsp;&nbsp;
								&nbsp;民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：<s:textfield name="employee.race"
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									id="race" size="20" />
							</td>
						</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td class="font3 fftd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所学专业：<s:textfield
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									name="employee.speciality" id="speciality" size="40" />&nbsp;&nbsp;
								&nbsp;爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;好：<s:textfield name="employee.hobby"
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									id="hobby" size="20" />
							</td>
						</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td class="font3 fftd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<s:textfield
									style="border-radius:5px;width: 300px;height: 30px;border: solid;border-color: #C0C4CC;border-width: 1px;text-align:center;"
									name="employee.remark" id="remark" size="40" />
								&nbsp;&nbsp;&nbsp;所&nbsp;属&nbsp;部&nbsp;门：<select name="employee.dept.id" id="deptId"
								style="border-radius: 5px; width: 300px; height: 30px; border: solid; border-color: #C0C4CC; border-width: 1px; text-align: center;"
								style="width: 120px;"></select>
							</td>
						</tr>
						<tr>
							<td class="main_tdbor"></td>
						</tr>

						<tr>
							<td align="left" class="fftd"><input class="button"
								type="submit" value="确定 ">&nbsp;&nbsp;<input
								class="button" type="reset" value="取消 "></td>
						</tr>
					</table>
				</s:form></td>
		</tr>
	</table>
	<div style="height: 10px;"></div>
</body>
</html>