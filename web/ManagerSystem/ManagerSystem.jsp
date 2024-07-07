<%@ page import="java.sql.Statement" %>
<%@ page import="JDBCutils.JDBCutilsgoods" %>
<%@ page import="java.sql.ResultSet" %><%--
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
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script type="text/javascript" src=../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/bootstrap.bundle.min.js"></script>
    <title>吉首大学商品管理系统</title>
</head>
<style>
    .part2:hover
    {
        background: #0dcaf0;
    }
</style>
<body style="background: #86b7fe">
<div class="container-fluid text-primary bg-white position-fixed">
    <div class="text-uppercase"><img src="../Picture/jsu.jpeg" style="width: 220px;height: 100px;"><a class="text-center text-decoration-none" href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp">Welcome to jsumanagementsystem 吉首大学商品管理系统</a></div>
</div>
<div class="text-center container-fluid bg-primary mt-0 pt-lg-3" style="height: 100px">
    <a href="http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp" class="mt-5 btn-lg text-white  text-decoration-none"><h3>吉首大学商品管理系统</h3></a>
</div>
<div class="container-fluid float-start bg-primary mt-0 position-fixed" style="width: 220px;">
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
    <div class="part2 mt-5 h2 text-center "><a class="par2 text-white text-decoration-none" href="#">商品出货详情</a></div>
    <li class=" list-unstyled mt-5">   </li><br>
    <div class="part2 mt-5 h2 text-center "><a class="par2 text-white text-decoration-none" href="#">系统使用情况</a></div>
    <li class=" list-unstyled mt-5">   </li><br>
    <li class="part2 list-unstyled text-center mt-5 mb-3 "><a class="h3 text-white  text-decoration-none" href="#">关于我自己</a> </li>
    <li class=" list-unstyled mt-5">   </li><br>
    <li class=" list-unstyled mt-5">   </li><br>
    <li class=" list-unstyled mt-3">   </li><br>
</div>
</body>
<body>
<%
    String sql="select*from goods.product";
    Statement stat= JDBCutilsgoods.getStatement(sql);
    ResultSet re=stat.executeQuery(sql);
    int flag=1;
    while(re.next()!=false)
    {
        if(flag==1)
        {
            out.print("<div class=\"text-center h1 text-dark bg-primary\">吉首大学商品库</div>");
            out.print("<table style=\"width: 1000px\" class=\"table table-hover mt-5 container-fluid bg-primary table-bordered  text-white\" border=\"1\">");
            out.println("<th ><tr class=\"h3\"><td>商品名称"+"</td><td>商品价格(元)"+"</td><td>商品数量(件)"+"</td></tr></th>");
            flag++;
        }

        out.println("<tr class=\"h3\"><td>"+re.getString("name")+"</td><td>"+re.getString("price")+"</td><td>"+re.getString("number")+"</td></tr>");
        if(re.getString("name")==null)
        {
            out.print("</table>");
        }
    }
%>
</body>
</html>
