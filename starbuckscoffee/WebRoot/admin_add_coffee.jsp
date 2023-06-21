<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>咖啡厅后台添加咖啡</title>
     <script>
         //添加咖啡的输入数据验证
         function add_coffee(){
             var name=document.getElementById("name");
             if(name.value==null || name.value==""){
                 alert("请输入咖啡名称");
                 name.focus();
                 return;
             }
             var series=document.getElementById("series");
             if(series.value==null || series.value==""){
                 alert("请输入所属系列");
                 series.focus();
                 return;
             }
             var price=document.getElementById("price");
             if(price.value==null || price.value==""){
                 alert("请输入咖啡售卖价格");
                 price.focus();
                 return;
             }
             var description=document.getElementById("description");
             if(description.value==null || description.value==""){
                 alert("请输入咖啡介绍");
                 description.focus();
                 return;
             }
             //提交表单数据
             document.getElementById("myform").submit();
         }
     </script>
     
     <!-- 引入kindeditor富文本编辑器 -->
     <link rel="stylesheet" href="kindeditor/themes/default/default.css" />
     <script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
     
  </head>
  <body>
  <!-- 把通用的后台头部文件引入 -->
  <%@ include file="admin_top.jsp"%>
  <form action="admin_add_coffee_do.jsp" id="myform" method="post">  
	  <table style="width:780px;text-align:center;color:white;background-color:#81b88e;font-family:幼圆" border="1" 
	       align="center" cellspacing="3" cellpadding="3">
	       <tr height="32px">
	           <th colspan="2">咖啡添加</th>
	       </tr>
	       <tr height="32px">
	           <td style="width:30%">咖啡名称：</td>
	           <td><input type="text" id="name" name="name" style="width:280px"/></td>
	       </tr>
	       <tr height="32px">
	           <td>所属系列：</td>
	           <td><input type="text" id="series" name="series" style="width:280px"/></td>
	       </tr>
	        <tr height="32px">
	           <td>销售价格：</td>
	           <td><input type="text" id="price" name="price" style="width:280px"/></td>
	       </tr>   
	       <tr height="32px">
	           <td>商品描述：</td>
	           <td>
	              <textarea id="description" name="description" style="width:280px;height:180px"/></textarea>
	           </td>
	       </tr>
	       <tr height="32px">
	           <td colspan="2"><input type="button" value="添加" onclick="add_coffee();" style="background-color:#381f1e;color:white"/></td>
	       </tr> 
	   </table>
   </form>
   <!-- 把通用的后台底部文件引入 -->
   <%@ include file="admin_foot.jsp"%> 
  </body>
</html>
