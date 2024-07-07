<%@ page import="functioninterfaceimp.Changeimp" %>
<%@ page import="functioninterface.Change" %>
<%@ page import="functioninterface.Query" %>
<%@ page import="functioninterfaceimp.Queryimp" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: 罗湘文
  Date: 2023/5/31
  Time: 15:33
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
<div class=" container-fluid " style="margin:auto;padding:150px;width: 500px;height: 500px">
    <form action="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Add/Add.jsp" method="post">
        <label for="name" class="form-label mt-2 ">名称:</label>
        <input type="text" name="name" id="name" placeholder="请输入要更改的商品名称" class="text-center "style="width: 250px;height: 50px"><br>
        <label for="insteadname" class="form-label mt-2">名称:</label>
        <input type="text" name="insteadname" id="insteadname" placeholder="请输入更改之后的商品名称" class="text-center "style="width: 250px;height: 50px"><br>
        <label for="price"class="form-label mt-2">价格:</label>
        <input type="text" name="price" id="price" placeholder="请输入更改之后的商品价格" class="text-center "style="width: 250px;height: 50px"><br>
        <label for="number" class="mt-2 form-label">件数:</label>
        <input type="text" name="number" id="number" placeholder="请输入更改之后的商品件数" class="text-center "style="width: 250px;height: 50px">
        <button type="submit" class="btn-primary mt-5 ms-5"style="width: 150px ">更改</button>
        <div class="mt-5" id="warn"></div>
    </form>
</div>
</body>
<body>
<%
    request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String insteadname=request.getParameter("insteadname");
String price=request.getParameter("price");
String number=request.getParameter("number");
    Query q=new Queryimp();
    if(q.query(name)==null)
    {
       out.print("<script>\n" +
"    document.getElementById(\"warn\").innerHTML=\"<div class=\\\" bg-danger text-white text-center\\\" style=\\\"width:250px\\\">你输入的商品不存在</div>\"\n" +
"</script>");
    }
    else {
        Change c=new Changeimp();
     c.change(name,insteadname,price,number);
     response.sendRedirect("http://localhost:8080/WebGoodsManagementSystem_war_exploded/ManagerSystem/ManagerSystem.jsp");
    }
%>
</html>
