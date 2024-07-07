<%@ page import="functioninterfaceimp.Logimp" %>
<%@ page import="functioninterface.Log" %>
<%--
  Created by IntelliJ IDEA.
  User: 罗湘文
  Date: 2023/5/31
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>吉首大学商品管理系统</title>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
</head>
<body>
<div class="container-fluid text-primary bg-white">
    <div class="text-uppercase"><img src="../../Picture/jsu.jpeg" style="width: 220px;height: 100px;"><a class="text-center text-decoration-none" href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Log/Log.html">Welcome to jsumanagementsystem</a></div>
</div>
<div class="text-center container-fluid bg-primary mt-0 pt-lg-3" style="height: 100px">
    <a href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Log/Log.html" class="mt-5 btn-lg text-white  text-decoration-none"><h3>吉首大学商品管理系统</h3></a>
</div>
<div class="container-fluid text-center">
    <form action="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Log/Log.jsp">
        <h1 class="text-primary mt-5 ">登录界面</h1>
        <label for="account" class="form-label mt-5">账号:</label>
        <input type="text" id="account" name="account" placeholder="请输入账号" class="w-25 text-center h-auto"><br>
        <label for="password" class="form-label mt-5">密码:</label>
        <input type="password" id="password" name="password" placeholder="请输入密码" class="w-25 text-center h-auto"><br>
        <button type="submit" class="text-center h-auto ms-1 mt-4 text-white btn-primary" style="width:150px">登录</button>
        <a href="http://localhost:63342/WebGoodsManagementSystem/web/Function/Regist/Regist.html?_ijt=fb2j3d2e6nn1covqthdq760eun" class="text-decoration-none text-success mt-4 ms-5 ">没有账号？注册</a>
    </form>
</div>
</body>
<body>
<%
Log l=new Logimp();
   int command= l.log(request.getParameter("account"),request.getParameter("password"));
if(command==1)
{
    response.sendRedirect("http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp");}
else if (command==-1)
{
    out.print("<h1 class=\"container text-center bg-danger text-white\">您输入的密码或者账号错误,请您重新输入</h1>");
}

%></body>
</html>
