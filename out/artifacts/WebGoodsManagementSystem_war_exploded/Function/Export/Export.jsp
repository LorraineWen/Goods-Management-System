<%@ page import="java.sql.Statement" %>
<%@ page import="JDBCutils.JDBCutilsgoods" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="functioninterface.Export" %>
<%@ page import="functioninterfaceimp.Exportimp" %>
<%@ page import="functioninterface.Query" %>
<%@ page import="functioninterfaceimp.Queryimp" %><%--
  Created by IntelliJ IDEA.
  User: 罗湘文
  Date: 2023/6/15
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"http-equiv="refresh">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="referrer" content="never">
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <script type="text/javascript" src=../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.bundle.min.js"></script>
    <title>吉首大学商品管理系统</title>
</head>
<style>
    .part2:hover
    {
        background: #0dcaf0;
    }
</style>
<body style="background: #86b7fe">
<div class="container-fluid text-primary bg-white">
    <div class="text-uppercase"><img src="../../Picture/jsu.jpeg" style="width: 220px;height: 100px;"><a class="text-center text-decoration-none" href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp">Welcome to jsumanagementsystem</a></div>
</div>
<div class="text-center container-fluid bg-primary mt-0 pt-lg-3" style="height: 100px">
    <a href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp" class="mt-5 btn-lg text-white  text-decoration-none"><h3>吉首大学商品管理系统</h3></a>
</div>
<div class="container-fluid float-start bg-primary mt-0" style="width: 220px;">
    <button type="button" class=" mt-5 ms-0 btn btn-primary dropdown-toggle" style="width:200px;border: #0dcaf0 solid 5px" data-bs-toggle="dropdown"><h2>商品管理</h2></button>
    <div class="dropdown-menu bg-primary">
        <a class=" text-white h1 dropdown-item  part2" href="#">添加商品</a>
        <a class=" text-white h1  dropdown-item part2" href="#">删除商品</a>
        <a class=" text-white h1  dropdown-item part2" href="#">查询商品</a>
        <a class=" text-white h1  dropdown-item part2" href="#">更改商品</a>
        <a class=" text-white h1  dropdown-item part2" href="#">商品出货</a>
    </div>
    <li class=" list-unstyled mt-5">   </li><br>
    <button type="button" class="mt-5 h1 ms-0 btn btn-primary dropdown-toggle" style="width:200px;border: #0dcaf0 solid 5px" data-bs-toggle="dropdown"><h2>用户管理</h2></button>
    <div class="dropdown-menu bg-primary">
        <a class="text-center text-white h1  dropdown-item part2" href="#">移除用户</a>
        <a class="text-center  text-white h1  dropdown-item part2" href="#">查询用户</a>
        <a class="text-center  text-white h1  dropdown-item part2" href="#">修改用户</a>
        <a class="text-center  text-white h1  dropdown-item part2" href="#">权力更改</a>
    </div>
    <li class=" list-unstyled mt-5">   </li><br>
    <div class="part2 mt-5 h2 text-center "><a class="par2 text-white text-decoration-none" href="#">总金额统计</a></div>
    <li class=" list-unstyled mt-5">   </li><br>
    <div class="part2 mt-5 h2 text-center "><a class="par2 text-white text-decoration-none" href="#">系统使用情况</a></div>
    <li class=" list-unstyled mt-5">   </li><br>
    <li class=" list-unstyled mt-3">   </li><br>
    <li class="part2 list-unstyled text-center mt-5 mb-3 "><a class="h3 text-white  text-decoration-none" href="#">关于我自己</a> </li>
</div>
<div class="container-fluid  text-center" style="margin:auto;padding:150px;width: 500px;height: 500px">
    <form action="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Export/Export.jsp" method="post">
        <label for="name" class="form-label mt-5">名称:</label>
        <input type="text" name="name" id="name" placeholder="请输入出货商品名称" class="text-center"style="width: 250px;height: 50px"><br>
        <label for="number" class="mt-5 form-label">件数:</label>
        <input type="text" name="number" id="number" placeholder="请输入出货商品件数" class="text-center "style="width: 250px;height: 50px">
        <label for="method" class="mt-5 form-label">出货方式:</label>
        <select class="form-select" id="method" name="method"style="width: 250px">
            <option >中通快递</option>
            <option>顺丰快递</option>
            <option>邮政快递</option>
            <option>圆通快递</option>
            <option>申通快递</option>
        </select>
        <button type="submit" class="btn-primary mt-5 ms-3"style="width: 150px ">出货</button>
    </form>
</div>
</body>
<body>
<%
    Query q=new Queryimp();
    request.setCharacterEncoding("UTF-8");
    String name=request.getParameter("name");
    String number=request.getParameter("number");
    String method=request.getParameter("method");
    if(q.query(name)!=null)
    {
        Export e=new Exportimp();
        if(e.export(name,number,method)!=null)
        {
            response.sendRedirect("http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp");

        }
        else
        {
            out.print("<script>\n" +
                    "    document.getElementById(\"warn\").innerHTML=\"<div class=\\\" bg-danger text-white text-center\\\" style=\\\"width:250px\\\">商品数量为零无法出货</div>\"\n" +
                    "</script>");
        }
    }
    else
    {
        out.print("<script>\n" +
                "    document.getElementById(\"warn\").innerHTML=\"<div class=\\\" bg-danger text-white text-center\\\" style=\\\"width:250px\\\">你输入的商品不存在</div>\"\n" +
                "</script>");
    }
%>
</body>