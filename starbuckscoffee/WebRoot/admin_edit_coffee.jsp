<%@ page language="java" import="java.util.*,com.ml.dao.CoffeeDAO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
   //获取要修改的咖啡ID
   String id=request.getParameter("id");
   //查询该条咖啡记录原来的数据信息
   CoffeeDAO dao=new CoffeeDAO();
   Map<String,String> coffee=dao.get(id);
   //把该咖啡数据存入request对象中
   request.setAttribute("coffee",coffee);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>咖啡厅后台修改记录</title>
     <script>
         //修改咖啡的输入数据验证
         function edit_coffee(){
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
                 alert("请输入销售价格");
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
  <body >
  <!-- 把通用的后台头部文件引入 -->
  <%@ include file="admin_top.jsp"%>
  <form action="admin_edit_coffee_do.jsp" id="myform" method="post">  
	  <table style="width:780px;text-align:center;color:white;background-color:#81b88e;font-family:幼圆" border="1" 
	       align="center" cellspacing="0" cellpadding="0">
	       <tr height="32px">
	           <th colspan="2">咖啡修改</th>
	       </tr>
	       <tr height="32px">
	           <td style="width:30%">咖啡名称：</td>
	           <td><input type="text" id="name" name="name" style="width:280px" value="${coffee.name}"/></td>
	       </tr>      
	       <tr height="32px">
	           <td>所属系列：</td>
	           <td><input type="text" id="series" name="series" style="width:280px;" value="${coffee.series}"/></td>
	       </tr>
	        <tr height="32px">
	           <td>销售价格：</td>
	           <td><input type="text" id="price" name="price" style="width:280px" value="${coffee.price}"/></td>
	       </tr>   
	       <tr height="32px">
	           <td>咖啡介绍：</td>
	           <td>
	           
	             <textarea id="description" name="description" style="width:280px;height:180px"/>${coffee.description}</textarea>
	            <script>
	              var editor=KindEditor.create('textarea[name="description"]', {
						newlineTag:"br",
						allowFlashUpload:false,
						allowMediaUpload:true,
						allowFileUpload:false,
						height:"400px",
					    width:"95%",
						allowFileManager : true,
						afterFocus : function(){this.sync();},
						afterBlur : function(){ this.sync();}
					});	
	              
	              </script>
	           
	           
	           </td>
	       </tr>
	       <tr height="32px">
	           <td colspan="2">
	               <!-- 隐藏的咖啡ID -->
	               <input type="hidden" name="id" value="${coffee.id}"/>
	               <input type="button" value="修改" onclick="edit_coffee();" style="background-color:#381f1e;color:white"/>
	             
	           </td>
	       </tr> 
	   </table>
   </form>
   <!-- 把通用的后台底部文件引入 -->
   <%@ include file="admin_foot.jsp"%> 
  </body>
</html>
