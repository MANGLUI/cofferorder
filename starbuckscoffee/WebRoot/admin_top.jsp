<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<center >
    <h2 style="color:white; font-family:黑体">咖啡厅点单系统后台</h2>
    <p style="color:white">
        欢迎您，<%=session.getAttribute("adminname") %>！
        <a href="admin_index.jsp" style="color:white; font-family:幼圆">系统首页</a> | 
        <a href="admin_list_coffee.jsp" style="color:white; font-family:幼圆" >咖啡管理</a> | 
        <a href="admin_add_coffee.jsp" style="color:white; font-family:幼圆">咖啡添加</a> |
        <a href="#" style="color:white; font-family:幼圆">订单管理</a> |
        <a href="#" style="color:white; font-family:幼圆">会员管理</a> |
        <a href="admin_logout.jsp" style="color:white; font-family:幼圆">退出系统</a> 
    </p>
</center>
  <body style="background:url(img/bg.png);background-size:100%100%;background-attachment:fixed" ></body>