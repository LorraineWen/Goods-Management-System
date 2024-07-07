<%@ page import="functioninterface.Add" %>
<%@ page import="functioninterfaceimp.Addimp" %>
<%@ page import="functioninterface.Regist" %>
<%@ page import="functioninterfaceimp.Registimp" %>
<%@ page import="functioninterface.Queryuser" %>
<%@ page import="functioninterfaceimp.Queryuserimp" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="User.User" %><%--
  Created by IntelliJ IDEA.
  User: 罗湘文
  Date: 2023/6/2
  Time: 22:12
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
    <form action="http://localhost:8080/WebGoodsManagementSystem_war_exploded/Function/Queryuser/Queryuser.jsp" method="post">
        <label for="name" class="form-label mt-5">名称:</label>
        <input type="text" name="name" id="name" placeholder="请输入用户名称" class="text-center "style="width: 250px;height: 50px"required><br>
        <button type="submit" class="btn-primary mt-5 ms-3"style="width: 150px ">查询</button>
        <div class="mt-5" id="warn"></div>
    </form>
</div>
</body>
<body>
<%
   request.setCharacterEncoding("UTF-8");
    Queryuser q=new Queryuserimp();
    HashMap<String ,User> user=q.query(request.getParameter("name"));
    if(user.isEmpty())
    {
        out.print("<script>\n" +
                "    document.getElementById(\"warn\").innerHTML=\"<div class=\\\" bg-danger text-white text-center\\\" style=\\\"width:250px\\\">你查询的用户不存在</div>\"\n" +
                "</script>");
    }
    else
    {
        int flag=1;
        for(String  key:user.keySet())
        {
            if(flag==1)
            {
                out.print("<table style=\"width: 1000px\" class=\"table table-hover container-fluid bg-primary table-bordered  text-white\" border=\"1\">");
                out.println("<th ><tr class=\"h3 text-center\"><td>"+"</td><td>用户名单"+"</td><td>"+"</td></tr></th>");
                out.println("<th ><tr class=\"h3\"><td>用户名称"+"</td><td>用户账号"+"</td><td>用户密码"+"</td><td>用户权限</td></tr></th>");
                flag++;
            }
            out.println("<tr class=\"h3\"><td>"+user.get(key).getName()+"</td><td>"+user.get(key).getAccount()+"</td><td>"+user.get(key).getPassword()+"</td><td>"+user.get(key).getPower()+"</td></tr>");
        }
        out.print("</table>");
    }
%>
</body>
</html>
