<%@ page language="java" import="java.util.*,com.ml.dao.CoffeeDAO" pageEncoding="utf-8"%>

<%
   //获取要删除的咖啡ID
   String id=request.getParameter("id");
   //创建CoffeeDAO对象
   CoffeeDAO dao=new CoffeeDAO();
   //调用咖啡添加方法
   int flag=dao.del(id);
   //操作的提示信息
   String msg="咖啡删除失败";
   //操作完成后跳转地址
   String url="admin_list_coffee.jsp";
   //如果flag>0说明成功，否则失败
   if(flag>0){
       msg="咖啡删除成功!";
   }
   //输出JS提示，并跳转到相应页面
   out.println("<script>");
   out.println("alert('"+msg+"');");
   out.println("location.href='"+url+"';");
   out.println("</script>");  
%>

