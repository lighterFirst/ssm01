<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/2/19
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="static/jquery-3.6.0.min.js" type="text/javascript"></script>
  <script src="static/js/bootstrap.min.js"></script>
    <link href="static/css/bootstrap.min.css"  rel="stylesheet" />

  <title>$Title$</title>
</head>
<body>
<h1 align="center">hello</h1>
<a href="<%=request.getContextPath()%>/user/select">点击查询</a><br>
<button type="button" class="btn btn-success">点击</button><br>

<form action="<%=request.getContextPath()%>/user/select01/1" method="post">
  <input type="submit" value="ajax"><br>
</form>



</body>
</html>

