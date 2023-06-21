<%@ page language="java" import="java.util.*,com.ml.dao.CoffeeDAO" pageEncoding="utf-8"%>
<%

   //获取要修改的咖啡ID
   String id=request.getParameter("id");
   //查询该条记录原来的数据信息
   CoffeeDAO dao=new CoffeeDAO();
   Map<String,String> coffee=dao.get(id);
   //把该商品数据存入request对象中
   request.setAttribute("coffee",coffee);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>咖啡介绍详情</title>
  </head>
  
  <body style="background:url(img/bg.png);background-size:100%100%;background-attachment:fixed">
   
       <table style="width:580px;text-align:center;width:780px;text-align:center;color:white;background-color:#81b88e;font-family:幼圆" border="1" 
	       align="center" cellspacing="3" cellpadding="3">
	       <tr height="32">
	           <th>${coffee.name}</th>
	       </tr>
	       <tr height="200">
	          <td>
	              ${coffee.description}
	          </td>
	       </tr>
	       
   
     </table>
   
   
  </body>
</html>
