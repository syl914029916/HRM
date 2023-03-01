<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人事管理系统</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${ctx}/js/metronic/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${ctx}/js/metronic/plugins/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${ctx}/js/metronic/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/js/metronic/css/style-metro.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/js/metronic/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/js/metronic/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/js/metronic/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="${ctx}/js/metronic/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${ctx}/js/metronic/css/pages/lock.css" rel="stylesheet"
	type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="favicon.ico" />


<script type="text/javascript">
	if (window.location != top.window.location) {
		//将当前页面作为最顶级页面
		top.window.location = window.location;

	}

	$(function() {
		//给验证码绑定点击事件
		$("#vimg").click(function() {
			//$(this).attr("src","${ctx}/verifyCode.action?date="+new Date());
			this.src = "${ctx}/verifyCode.action?date=" + new Date();
		})

		//为’看不清‘按钮绑定事件
		$("#see").on("click", function() {
			//$("#vimg").attr("src","${ctx}/verifyCode.action?date="+new Date());
			//触发验证码的点击事件
			$("#vimg").trigger("click");
		})

		//为登录按钮绑定事件   
		$("#loginBtn").bind("click", function() {
			//获取用户名 密码  验证码
			var loginName = $("#loginName").val();
			var password = $("#passWord").val();

			var vcode = $("#vcode").val();

			if ($.trim(loginName) == null || $.trim(loginName) == "") {
				alert("请输入登录名！");
				$("#loginName").focus();
			} else if (!/^[0-9a-zA-Z]{5,16}$/.test(loginName)) {
				alert("您输入的登录名不合法，请重新输入！");
				$("#loginName").focus();
			} else if ($.trim(password) == null || $.trim(password) == "") {
				alert("请输入密码！");
				$("#passWord").focus();
			} else if (!/^[0-9a-zA-Z]{5,16}$/.test(password)) {
				alert("您输入的密码不合法，请重新输入！");
				$("#passWord").focus();
			} else if (!/^[0-9]{4}$/.test(vcode)) {
				alert("您输入的验证码不合法，请重新输入！");
				$("#vcode").focus();
			} else {
				//异步登录   == >根据用户名 密码 验证码进行异步校验  校验通过跳转至首页（window.location = ）  否则给出提示信息
				$.post("${ctx}/user/userLogin.action", {
					"user.name" : loginName,
					"user.passWord" : password,
					"vcode" : vcode
				}, function(data, status) {
					//status=="success"：后台响应成功   status=="error"：后台响应失败   
					if (status == "success") {
						//隐式boolean类型
						if (data) {
							alert(data);
							//刷新验证码
							$("#vimg").trigger("click");
						} else {
							window.location = "${ctx}/main.action";
						}

					}
				}, "text"

				)

			}

		})

	})

	$(window).keydown(function(e) {
		if (e.keyCode == 13) {

			//触发登录按钮的点击事件
			$("#loginBtn").trigger("click");

		}
	});
</script>
<style>
.form {
	height: 30px;
	width: 200px;
	border-radius: 5px;
	border: solid;
	border-width: 1px;
	border-color: #C0C4CC;
	text-align: center;
	;
}
.button
	{
    text-decoration:none;
	background:#70dbdb;
	color:#f2f2f2;
	width:250px;
	padding: 6px 25px 6px 25px;
	font-size:15px;		
	border-radius:10px;
	font-family: 微软雅黑;
	-webkit-transition:all linear 0.30s;
	-moz-transition:all linear 0.30s;
	transition:all linear 0.30s;
	border: 0px solid;
	box-shadow: inset 0 0px 0px rgba(0,0,0,.075);
	margin-left: 0px;	
	}
   .button:hover { background:#409EFF; }
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="font-family: 微软雅黑;">
	<div class="page-lock">
		<br /><br /><br /><br /><br />
		<div class="page-body">
			<!--   <!-- <div class="page-logo" style="margin-bottom: 10px;margin-top: 30px">
			<a class="brand" href="login.html"
				style="font-size: 35px; color: #FFF;"> 西交人事管理系统
			</a>
		</div> -->
			<div class="page-logo" style="margin-bottom: 2px">
				<a class="brand" href="login.html"
					style="font-size: 22px; color: #FFF;"> XJTU人事管理<font
					color="#FFCC00">HRM</font><span style="font-size: 13px;"></span> 系统
				</a>
			</div>

			<br /> <img class="page-lock-img"
				src="${ctx}/js/metronic/img/profile/logo1.jpg" alt="">
			<div class="page-lock-info">
				<span
					style="text-align:center;padding-top: 5px; font-size: 22px; color: #FFF;"><b>用&nbsp;&nbsp;户&nbsp;&nbsp;登&nbsp;&nbsp;录</b></span>
				<div class="control-group">

					<div class="controls">
						<div class="input-icon left">
							<i style="height: 30px;text-align:center;margin-top:5px;margin-left: 10px"><b>user</b></i> 
							<input
								style="width:150px; height: 30px; border-radius: 5px;margin-left: 100px;" type="text"
								placeholder="帐号" id="loginName" name="loginName" value="admin"
								required="required">
						</div>
					</div>
				</div>
				<div class="control-group">

					<div class="controls">
						<div class="input-icon left">
							<i style="height: 30px;text-align:left;margin-top:5px；"><b>password</b></i>  <input
								style="width:150px; height: 30px; border-radius: 5px;margin-left: 100px;" type="passWord"
								placeholder="密码" id="passWord" name="passWord" value="123456"
								required="required">
						</div>
					</div>
				</div>
				<div class="relogin">
					
					<img align="left" title="验证码" width="55" style="cursor: pointer;margin-left: 10px;" height="20"
						id="vimg" src="${ctx}/verifyCode.action"> 
						<a style="text-align: left" href="#"
						id="see" >看不清楚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
						<input class="" type="text" id="vcode" name="vcode"
						maxlength="4" style="width: 90px; height: 25px;">
					
				</div>
				<div><button  type="button" id="loginBtn" class="btn green"
						style="height: 30px;border-radius:10px;border: 1px solid;width:150px;background: #3299cc;">
						登录 </button></div>
					
			</div>
		</div>
		<div class="page-footer" style="color: #fff">

			<form id="loginForm" name="loginForm" method="post"
				action="j_security_check">
				<input type="hidden" id="j_username" name="j_username" value="">
				<input type="hidden" id="j_passWord" name="j_passWord" value="">
			</form>
		</div>
	</div>
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script
		src="${ctx}/js/metronic/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="${ctx}/js/metronic/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!--[if lt IE 9]>
   <script src="${ctx}/js/metronic/plugins/excanvas.js"></script>
   <script src="${ctx}/js/metronic/plugins/respond.js"></script>  
   <![endif]-->
	<script src="${ctx}/js/metronic/plugins/breakpoints/breakpoints.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! jquery.slimscroll.min.js depends on jquery-ui-1.10.1.custom.min.js -->
	<script src="${ctx}/js/metronic/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${ctx}/js/metronic/plugins/backstretch/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${ctx}/js/metronic/scripts/app.js"></script>
	<script src="${ctx}/js/metronic/scripts/lock.js"></script>
	<script>
		$(function() {
			App.init();
			Lock.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-37564768-1' ]);
		_gaq.push([ '_setDomainName', 'keenthemes.com' ]);
		_gaq.push([ '_setAllowLinker', true ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://'
					: 'http://')
					+ 'stats.g.doubleclick.net/dc.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
<!-- END BODY -->
</html>

