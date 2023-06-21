<%@ page language="java" import="java.util.*,com.ml.dao.AdminDAO" pageEncoding="utf-8"%>
<%
	//设置请求编码为utf-8，防止发送过来的中文数据乱码
   //request.setCharacterEncoding("utf-8");
   
   //获取用户输入的验证码
   String code=request.getParameter("code"); 
   //获取session中的验证码
   String scode=(String)session.getAttribute("scode");
   //用户输入的验证码和系统显示的验证码一样，才说明验证码输入正确
   //验证码正确才能登录
   if(code.equals(scode)){
	   //获取用户名和密码
	   String adminname=request.getParameter("adminname");
	   String password=request.getParameter("password");
	   //创建AdminDAO对象
	   AdminDAO dao=new AdminDAO();
	   //调用登录验证方法
	   int flag=dao.Login(adminname,password);
	   //如果flag>0说明成功，否则失败
	   if(flag>0){
	       //把登录成功的用户名存入session中
	       session.setAttribute("adminname",adminname);
	       //重定向到系统后台主页面
	       response.sendRedirect("admin_index.jsp");
	   }else{
	       //输出JS提示，并跳转到登录页面
	       out.println("<script>");
	       out.println("alert('用户或密码错误!');");
	       out.println("location.href='admin_login.jsp';");
	       out.println("</script>");
	   }
   
   }else{
           //输出JS提示，并跳转到登录页面
	       out.println("<script>");
	       out.println("alert('验证码错误');");
	       out.println("location.href='admin_login.jsp';");
	       out.println("</script>");
   }
%>

