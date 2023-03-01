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
<link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
		

		$(function(){
			//获取所有的子checkbox
			var boxes = $("input[id^='check_']");
			
			//为全选绑定事件
			$("#checkAll").click(function(){
			
				boxes.attr("checked",this.checked);
				
				//触发tr的mouseover或者mouseout事件
				$("tr[id^='tr_']").trigger(this.checked?"mouseover":"mouseout");
				
			})
			
			
			//为子checkbox绑定事件
			boxes.click(function(){
				//判断子checkbox的个数是否等于选中的个数
				var length =  $("input[id^='check_']:checked").length;//获取选中的checkbox个数
				$("#checkAll").attr("checked",length==boxes.length);
			})
			
			
			
			
		})
		
		
		//删除公告
		function deleteNotice(){
			
			//获取用户选中的checkbox
			var boxes = $("input[id^='check_']:checked");
			if(boxes.length==0){
				alert("请选择需要删除的公告！");
			}else{
				var flag = window.confirm("是否确认删除该记录?");
				if(flag){
					var arr = new Array();
					$.each(boxes,function(){
						//将公告id填充至数组中
						arr.push(this.value);
					}) 
					
					window.location = "${ctx}/notice/deleteNoticeByIds.action?ids="+arr.join(",")+"&pageModel.pageIndex=${pageModel.pageIndex}&notice.title=${notice.title}";
					
				}
			}
			
			
		}
		
		//预览公告
		function prevNotice(id){
			
			   //弹出模态窗体
			   //第一个参数：请求的地址   第二个参数：参数   第三个参数：样式
			   window.showModalDialog("${ctx}/notice/prevNotice.action?notice.id="+id,null,"dialogWidth:500px;dialogHeight:500px;dialogLeft:450px;");

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
	margin-left: 100px;
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
	margin-left: 50px;	
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
<body>
	<!-- 导航 -->
	
	<div class="usr">
			<font color=#606266 size="5">&nbsp;&nbsp;&nbsp;公告查询</font>
			
	</div>
	<br/>
	<table width=70% border="0" cellpadding="0" cellspacing="0" >
		 <tr><td height="30"></td></tr>
		 
	</table>
	
	
	
	<table width="90%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			  	<form name="empform" method="post" id="empform" action="${ctx}/notice/selectNotice.action" theme="simple">
				    <table width="100%" class="search"  border="0" cellpadding="0" cellspacing="0">
					  
					  <tr>
					    <td class="font3">
					    	
					    	公告标题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input type="text" class="form" placeholder="请输入公告标题" style="border-radius:5px" name="notice.title" value="${notice.title}"/>
					    	
					    	<input class="button"  type="submit" value="搜索"/>
					    	<input class="button"  type="button" value="删除" onclick="deleteNotice()"/>&nbsp;<font color="red">${tip}</font>
					    	
					    </td>
					  </tr>
					</table>
				</form>
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
		      <td><input type="checkbox" id="checkAll"/>全选</td>
			  <td>编号</td>
			  <td>标题</td>
			  <td>创建人</td>
			  <td>创建日期</td>
			  <td colspan="2" align="center">操作</td>
			</tr>
			
			<c:forEach items="${requestScope.notices}" var="notice" varStatus="stat">
			       
			  <tr class="main_trbg" id="tr_${stat.index+1}">
			  <td><input type="checkbox" id="check_${stat.index+1}" value="${notice.id}"/>${stat.index+1}</td>
			  <td>${notice.id}</td>
			  <td>${notice.title}</td>
			  <td>${notice.user.name}</td>
			  <td>
				<fmt:formatDate value="${notice.createDate}" pattern="yyyy年MM月dd日"/>
			  </td>
			 
			  <td align="center" width="40px;">
			  
			  <a href="${ctx}/notice/showUpdateNotice.action?notice.id=${notice.id}">
					<img title="修改" src="${ctx}/images/update.gif"/></a>
			  </td>
			  <%-- <td align="center"  width="40px;"><a href="javascript:prevNotice('${notice.id}')">
					<img title="预览" src="${ctx}/images/prev.gif"/></a>
			  </td> --%>
			</tr>
			</c:forEach>
		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="center" class="font3">
	  	   <br /><br />
	  	    <!-- 
          fkjava:标签前缀
          pager：标签名字：在tld文件中指定
          pageIndex：当前页码
          pageSize：每页显示的记录数
          recordCount：总记录数
          submitUrl：请求地址
       -->
       
     <fkjava:pager pageIndex="${pageModel.pageIndex}" pageSize="${pageModel.pageSize}" recordCount="${pageModel.totalNum}" submitUrl="${ctx}/notice/selectNotice.action?pageModel.pageIndex={0}&notice.title=${notice.title}" pageStyle="manu"></fkjava:pager>
    
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>