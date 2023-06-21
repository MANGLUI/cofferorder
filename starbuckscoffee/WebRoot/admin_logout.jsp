<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
       //清空管理员登录后在session中存储的用户名
       session.removeAttribute("adminname");
       //重定向到登录页面
       response.sendRedirect("admin_login.jsp");
%>

