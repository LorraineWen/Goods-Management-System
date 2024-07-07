<%@ page import="functioninterface.Regist" %>
<%@ page import="functioninterfaceimp.Registimp" %>
<%@ page import="java.util.Random" %>
<%--Created by IntelliJ IDEA.
  User: 罗湘文
  Date: 2023/5/31
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <title>吉首大学商品管理系统</title>
</head>
<body>
<div class="container-fluid text-primary bg-white">
    <div class="text-uppercase"><img src="../../Picture/jsu.jpeg" style="width: 220px;height: 100px;"><a class="text-center text-decoration-none" href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Regist/Regist.html">Welcome to jsumanagementsystem</a></div>
</div>
<div class="text-center container-fluid bg-primary mt-0 pt-lg-3" style="height: 100px">
    <a href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Regist/Regist.html" class="mt-5 btn-lg text-white  text-decoration-none"><h3>吉首大学商品管理系统</h3></a>
</div>
<div class="container-fluid text-center">
    <form action="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Regist/Regist.jsp">
        <h1 class="text-success mt-5 ">注册界面</h1>
        <label for="name" class="form-label mt-5">名称:</label>
        <input type="text"  id=name name="name" class="text-center w-25" placeholder="请输入名称"><br>
        <label for="password" class="form-label mt-5">密码:</label>
        <input type="password" id="password" name="password" placeholder="请输入密码" class="w-25 text-center h-auto"><br>
        <p class="text-center text-success">你想应聘成为管理员吗?</p>
        No<input type="radio"  name="power" value="Manager" class="form-check-input"> Yes<input type="radio"  name="power" value="Manager" class="form-check-input"><br>
        <button type="submit" class="text-center text-white btn-success h-auto ms-4 mt-4" style="width:150px ">注册</button><a class="ms-5 text-decoration-none text-success"href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Log/Log.html">已有账号？登录</a>
    </form>
</div>
</body>
<body>
<%
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    String power=request.getParameter("power");
    int numaccount=0;
    Random r=new Random();
    if(null==name||null==password||null==power)
    {
        out.print("<h1 class=\"container bg-danger text-center\">请完善注册信息</h1>");
    }
    else
    {
        for(int i=0;i<10;i++)
        {
            numaccount+=numaccount*10+r.nextInt(10);
        }
        if(numaccount<0)
        {
            numaccount=-numaccount;
        }
        String account=String.valueOf(numaccount);
        Regist re=new Registimp();
        re.regist(name,account,password,power);
        out.print("<h1 class=\"bg-success text-center container\">注册成功<h1>");
    }
%></body>
</html>
