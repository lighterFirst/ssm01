<%@ page import="java.util.List" %>
<%@ page import="SSM01.pojo.User" %>
<%@ page import="com.github.pagehelper.PageInfo" %>
<% PageInfo pageInfo =(PageInfo)request.getAttribute("ss"); %>
<% List<User> list =  pageInfo.getList(); %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/2/13
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="<%=request.getContextPath()%>/static/jquery-3.6.0.min.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/static/css/bootstrap.min.css"  rel="stylesheet" />
    <script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
    <title>展示表格</title>
</head>
<body>
<div class="container" >
    <div class="row" align="center">
        <div class="col-lg-12">
            <h1><p style="color: gold" align="center">展示表格</p></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button class="btn-success">新增</button>
            <button class="btn-primary">删除</button>
        </div>
    </div>
    <div class="row" align="center">
        <table class="col-md-6 col-md-offset-3" border="1" align="center" width="10" cellpadding="5">
            <tr>
                <th><p align="center">id</p></th>
                <th align="center">姓名</th>
                <th align="center">密码</th>
                <th align="center">修改</th>
                <th align="center">删除</th>
            </tr>
            <%
                for(User user:list){
            %>
            <tr>
                <td><%=user.getId()%></td>
                <td><%=user.getUsername()%></td>
                <td><%=user.getPassword()%></td>
                <td><button class="btn-success ">修改<span class="glyphicon glyphicon-wrench"></span></button></td>
                <td><button class="btn-primary">删除</button></td>
            </tr>
            <% }%>
        </table>
    </div>
    <br>
    <div class="row" >
        <div class="col-md-3 ">
        <p>当前第<%=pageInfo.getPageNum()%>页,总共<%=pageInfo.getPages()%>页,共<%=pageInfo.getTotal()%>条记录</p>
        </div>


        <div class="col-md-4 col-md-offset-8">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <%if(1!=pageInfo.getPageNum()){
                    %>
                <li>
                    <a href="<%=request.getContextPath()%>/user/select?pn=<%=pageInfo.getPageNum()-1%>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <%} %>
                <li><a href="<%=request.getContextPath()%>/user/select">首页</a></li>
                <!-- 在页面中连续显示的页码 -->
                <% int i= pageInfo.getPages();%>
                <%
                    for(int k =1;k<=i;k++){
                %>
                <li class="<%=(k==pageInfo.getPageNum())?"active":"" %>"><a href="<%=request.getContextPath()%>/user/select?pn=<%=k%>"><%=k%></a></li>
                <% }%>
                <li><a href="<%=request.getContextPath()%>/user/select?pn=<%=pageInfo.getPages()%>">末页</a></li>
                <%
                if(pageInfo.getPageNum()!=pageInfo.getPages()){
                %>
                <li>
                    <a href="<%=request.getContextPath()%>/user/select?pn=<%=pageInfo.getPageNum()+1%>"  aria-label="next"%>
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <%
                    }
                %>
            </ul>

        </nav>
        </div>
    </div>
    <div class="col-md-6"></div>



</div>
</body>
</html>
