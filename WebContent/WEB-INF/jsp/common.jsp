<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 引入struts标签 -->
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- 给项目取简称 -->
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<!-- 引入jquery -->
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>

<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />

<!-- 引入项目公告的js文件 -->
<script type="text/javascript" src="${ctx}/js/common.js"></script>