<%@ page language="java" import="java.util.*,com.ml.dao.CoffeeDAO" pageEncoding="utf-8"%>

<%
	//设置请求编码为utf-8，防止发送过来的中文数据乱码
   //request.setCharacterEncoding("utf-8");
   //获取发送过来的商品数据
   String name=request.getParameter("name");
   String series=request.getParameter("series");
   String price=request.getParameter("price");
   String description=request.getParameter("description");
   //把商品数据装入Map集合中
   Map<String,String> coffee=new HashMap<String,String>(); 
   coffee.put("name",name);
   coffee.put("series",series);
   coffee.put("price",price);
   coffee.put("description",description);
   //创建CoffeeDAO对象
   CoffeeDAO dao=new CoffeeDAO();
   //调用咖啡添加方法
   int flag=dao.add(coffee);
   //操作的提示信息
   String msg="咖啡记录添加失败";
   //操作完成后跳转地址
   String url="admin_add_coffee.jsp";
   //如果flag>0说明成功，否则失败
   if(flag>0){
       msg="咖啡记录添加成功!";
       url="admin_add_coffee.jsp";
   }
   //输出JS提示，并跳转到相应页面
   out.println("<script>");
   out.println("alert('"+msg+"');");
   out.println("location.href='"+url+"';");
   out.println("</script>");  
%>
