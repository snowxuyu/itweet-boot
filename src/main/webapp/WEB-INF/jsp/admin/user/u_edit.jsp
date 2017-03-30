<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>User_Edit</title>
    <link href="<%=basePath%>/style/admin/licence/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/style/admin/licence/css/style.css?v=4.1.0" rel="stylesheet">


    <link href="<%=basePath%>/style/admin/system/css/amazeui.chosen.css" rel="stylesheet">
    <link href="<%=basePath%>/style/admin/system/css/amazeui.min.css" rel="stylesheet">

    <script src="<%=basePath%>/style/admin/licence/js/jquery.min.js"></script>
    <script src="<%=basePath%>/style/admin/system/js/amazeui.chosen.js"></script>

    <script>
        $(function() {
            $('#my-select').chosen();
        });
    </script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>添加修改</h5>
            </div>
            <div class="ibox-content">
                <div style="text-align: center;color: red;margin-bottom: 10px;">
                    ${errorMessage}
                </div>
                <form action="<%=basePath%>/admin/user/edit" class="form-horizontal" method="POST">
                    <input type="hidden" name="id" value="${form.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" value="${form.username}">
                            <span class="help-block m-b-none">用户名唯一&nbsp;&nbsp;<b style="color: red;">*</b></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  name="email" value="${form.email}">
                            <span class="help-block m-b-none">用户邮箱&nbsp;&nbsp;<b style="color: red;">*</b></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="password" value="${form.password}" >
                            <span class="help-block m-b-none">默认密码:123456&nbsp;&nbsp;</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10">

                            <select name="rIds" id="my-select" multiple="multiple" data-placeholder="选定角色" multiple class="chosen-select-width" style="width: 100%;" tabindex="18">
                                <c:forEach items="${rids}" var="ids">
                                <c:forEach items="${roleList}" var="role">

                                        <c:if test="${ids eq role.id}">
                                            <option value="${role.id}" selected="true">${role.name}</option>
                                        </c:if>
                                        <c:if test="${ids ne role.id}">
                                            <option value="${role.id}">${role.name}</option>
                                        </c:if>
                                    </c:forEach>

                                    <%--<c:forEach items="${rids}" var="ids">
                                        <c:if test="${ids ne role.id}">
                                            <option value="${role.id}">${role.name}</option>
                                        </c:if>
                                    </c:forEach>--%>
                                </c:forEach>

                            </select>
                            <span class="help-block m-b-none">可以多选</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button class="btn btn-primary" type="submit">保存内容</button>
                            <button class="btn btn-white" type="submit">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>