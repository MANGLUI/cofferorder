<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%   
    //下面进行权限验证   
    //从session中获取登录成功的管理员用户名
    String adminname=(String)session.getAttribute("adminname");
    //判断adminname是否为null(进行权限验证)
    if(adminname==null){ //说明没有登录，或者登录已失效
        //进行提示，并跳转
        out.println("<script>");
        //弹窗
        out.println("alert('你还没有登录，请先登录!');");
        //跳转到登录页面
        out.println("location.href='admin_login.jsp';");    
        out.println("</script>");
        //中止这个页面
        return;
    }
%>