<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>人事管理系统-资源不存在!</title>
</head>
<body style="background-color:#fff; ">
    <center><font color="red">${exception.message}</font></center>
	<div style="margin:0 auto; width:500px; height:306px;">
		 <input type="image" src="${ctx}/images/error.png" style="padding-top: 150px;"/>
	</div>
</body>
</html>