<%@ page language="java" import="java.util.*,com.ml.dao.CoffeeDAO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>咖啡厅后台管理咖啡</title>
     <script>
         //咖啡记录删除
         function del(id){
             if(confirm("确认要删除该条咖啡记录嘛？")){
                 location.href="admin_del_coffee.jsp?id="+id;
             }
         }      
         //咖啡记录分页
         function toPage(pageNo){
              var pageform=document.getElementById("pageform");
              pageform.action="admin_list_coffee.jsp?toPage="+pageNo;
              pageform.submit();
         }
     </script>  
  </head>
  <body>
  <!-- 把通用的后台头部文件引入 -->
  <%@ include file="admin_top.jsp"%>
   <%
          //设置请求的编码为UTF-8，防止发送过来的中文乱码
          //request.setCharacterEncoding("utf8");
          //获取当前页（即要查看的页码）
          String toPage=request.getParameter("toPage");
          //如果没有发送当前页码，则设置为1
          if(toPage==null || toPage.equals("")){
              toPage="1";
          }
          //定义整型的当前页
          int curPage=Integer.parseInt(toPage);
          //定义页大小
          int pageSize=8;
          //计算当前页的记录开始索引值
          int pageStartIndex=(curPage-1)*pageSize;  
          
          //定义筛选的条件
          String where=" where 1=1";
          //获取分页的筛选条件
          String name=request.getParameter("name");
          //说明要根据名称来筛选(模糊搜索)
          if(name!=null && !name.equals("")){
              where+=" and name like '%"+name+"%'";
              //把筛选的值传回页面
              request.setAttribute("name",name);
          }
          //咖啡系列筛选(精确搜索)
          String series=request.getParameter("series");
          if(series!=null && !series.equals("")){
              where+=" and series='"+series+"'";
              request.setAttribute("series",series);
          }
          //价格区间筛选
          String start_price=request.getParameter("start_price");
          if(start_price!=null && !start_price.equals("")){
              where+=" and price>"+start_price;
              request.setAttribute("start_price",start_price);
          }
          String end_price=request.getParameter("end_price");
          if(end_price!=null && !end_price.equals("")){
              where+=" and price<"+end_price;
              request.setAttribute("end_price",end_price);
          }  
          
          //创建CoffeeDAO
          CoffeeDAO dao=new CoffeeDAO();             
          //调用dao的list方法，查询出当前页的商品
          List<Object> data=dao.List(where,pageStartIndex,pageSize);   
          //获取当前页的商品数据列表
          List<Map<String,String>> datalist=(List<Map<String,String>>)data.get(0);
          //把商品数据列表存入request作用域中
          request.setAttribute("datalist",datalist);
          //获取商品表的总记录数
          int totalCount=Integer.parseInt(data.get(1).toString());
          //定义总页数变量
          int totalPage=0;
          //计算总页数
          if(totalCount%pageSize==0){ //可以整除
             totalPage=totalCount/pageSize;
          }else{ //不可以整数
             totalPage=(totalCount/pageSize)+1;
          }
          //把分页相关的数据存入request作用域中
          request.setAttribute("curPage",curPage);
          request.setAttribute("pageSize",pageSize);
          request.setAttribute("totalCount",totalCount);
          request.setAttribute("totalPage",totalPage);            
   %>
   
   
   <!-- 商品筛选界面 -->
   <form action="admin_list_coffee.jsp" method="post">
   <table style="width:1000px;color:white;background-color:#81b88e;font-family:幼圆" border="3"
     align="center" cellpadding="2" cellspacing="2">
     
     <tr height="32">
        <td style="padding-left:15px">
           咖啡名称：<input type="text" name="name" value="${name}"/> 
        </td>
        <td style="padding-left:15px">
              咖啡系列： <input type="text" name="series" value="${series}"/> 
        </td>
     <tr>
         <td style="padding-left:15px" colspan="2">
             价格区间（元）： 
             <input type="text" name="start_price" style="width:80px" value="${start_price}"/> 至
             <input type="text" name="end_price" style="width:80px" value="${end_price}">
         </td>  
     </tr>
     <tr height="32">
        <td style="text-align:center" colspan="2">
             <input type="submit" value="搜索" style="background-color:#381f1e;color:white"/>
        </td>
     </tr>  
   </table>
   </form>
   

   
  <table style="width:1000px;text-align:center;color:white;background-color:#81b88e;font-family:幼圆" border="3" 
       align="center" cellspacing="2" cellpadding="2">
       <tr height="32px">
           <th colspan="7">咖啡列表</th>
       </tr>
       <tr height="32px">
           <th style="width:150">咖啡名称</th>
           <th style="width:20%">所属系列</th>
           <th style="width:20%">销售价格</th>
           <th >咖啡介绍</th>
           <th style="width:80">操作</th>
       </tr> 
        <c:forEach items="${datalist}" var="coffee">
           <tr height="32px">
	           <td style="width:200">${coffee.name}</td>
	           <td style="width:200">${coffee.series}</td>
	           <td>${coffee.price}</td>
	           <td>${coffee.description}</td>
	           <td>
	                <a href="javascript:window.open('admin_show_coffee.jsp?id=${coffee.id}','咖啡详情','width=500,height=620,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1');" style="color:#4d2725">咖啡详情</a>
	                <a href="admin_edit_coffee.jsp?id=${coffee.id}" style="color:#4d2725">修改记录</a>
	                <a href="javascript:del('${coffee.id}')" style="color:#4d2725">删除记录</a>
	           </td>
            </tr>  
       </c:forEach>
   </table><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td><td valign="top"><br></td>   
   
   <form id="pageform" method="post">
   <!-- 分页数据 -->
   <div align="center" style="color:white">
	   共找到${totalCount}条数据，当前第${curPage}页，每页${pageSize}条，共${totalPage}页
	   <c:if test="${curPage==1}">首页</c:if>
	   <c:if test="${curPage>1}">
	       <a href="javascript:toPage('1')" style="color:#e8a6a2">首页</a>
	   </c:if>
	   <c:if test="${curPage==1}">上一页</c:if>
	   <c:if test="${curPage>1}">
	       <a href="javascript:toPage('${curPage-1}')" style="color:#e8a6a2">上一页</a>
	   </c:if>
	   <c:if test="${curPage==totalPage}">下一页</c:if>
	   <c:if test="${curPage<totalPage}">
	       <a href="javascript:toPage('${curPage+1}')" style="color:#e8a6a2">下一页</a>
	   </c:if>
	   <c:if test="${curPage==totalPage}">尾页</c:if>
	   <c:if test="${curPage<totalPage}">
	       <a href="admin_list_product.jsp?toPage=${totalPage}" style="color:#e8a6a2">尾页</a>
	   </c:if>  
	   
	   <!-- 传递咖啡筛选的字段 -->
	   <input type="hidden" name="name" value="${name}"/>
	   <input type="hidden" name="series" value="${series}"/>
	   <input type="hidden" name="start_price" value="${start_price}"/>
	   <input type="hidden" name="end_price" value="${end_price}"/>
   </div>
   </form>
   
   <!-- 把通用的后台底部文件引入 -->
   <%@ include file="admin_foot.jsp"%> 
  </body>
</html>
