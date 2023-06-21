<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>咖啡厅点单系统后台登录</title>
    <script>
        //更换验证码
        function changeCode(){
             document.getElementById("imgcode").src="checkCode?n="+Math.random();
        }
    
    </script>
  </head>
  <body style="background:url(img/bg.png);background-size:100%100%;background-attachment:fixed">   
    <form action="admin_login_do.jsp" method="post">
        <h1 style="text-align:center;margin-top:100px;color:white;font-family:黑体"> 咖啡厅点单系统</h1>
	    <table style="width:600px;text-align:center;color:white;font-family:幼圆;font-size:20px;background-color:#81b88e" border="5" 
	        align="center" cellspacing="3" cellpadding="3">
	       <tr height="40px">
	           <th colspan="5">后台登录</th>
	       </tr>
	       <tr height="40px">
	           <td>账号：</td>
	           <td colspan="2"><input type="text" name="adminname"/></td>
	       </tr>
	       <tr height="40">
	           <td>密码：</td>
	           <td colspan="2"><input type="password" name="password"/></td>
	       </tr>
	       <tr height="40">
	          <td>验证码：</td> 
	          <td>
	             <input type="text" name="code" style="width:80px"/>  
	          </td>
	          <td style="width:90px">
	             <img id="imgcode" src="checkCode" style="cursor:pointer" alt="看不清，点击更换" 
	                 onclick="changeCode()"/>
	          </td>
	       </tr> 
	       <tr height="40px">
	           <td colspan="4">
	                <input type="submit" value="登录" style="background-color:#4a3928;color:white"/>
	           </td>
	       </tr>   
	    </table>
    </form>
  </body>
</html>
