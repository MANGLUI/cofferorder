package com.ml.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//登录权检查过滤器，判断用户是否有访问相应页面的权限
public class LoginFilterServlet implements Filter {

    //进行登录权限的检查
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//将request转换为HttpServletRequest类型的对象
		HttpServletRequest http_request=(HttpServletRequest)request;	
		//获取当前的JSP文件名称或Servlet路径
	    String jspfile=http_request.getServletPath();
	    System.out.println("jspfile:"+jspfile);
	    //对不进行权限检查的文件或路径进行放行
	    if(jspfile.contains("admin_login.jsp") || 
	      jspfile.contains("admin_login_do.jsp") ||
	      jspfile.contains("/img") ||
	       jspfile.contains("checkCode") ){
	    	//放行，不进行权限检查
	    	chain.doFilter(request, response);	
	    }else{//除了上面3个文件或路路径外，其它请求都进行权限检查
	    	
	    	//从request对象获取session对象
			HttpSession session=http_request.getSession();
			//从session中获取登录的用户名信息
			String adminname=(String)session.getAttribute("adminname");
			if(adminname==null || adminname.equals("")){
				//设置响应的编码为utf-8
				response.setContentType("text/html;charset=utf-8");
				//获取out对象
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('您还没有登录，请先登录！');");
				out.println("location.href='admin_login.jsp';");
				out.println("</script>");	
			}else{
				//放行，调用下一个过滤器
				chain.doFilter(request, response);
			}	
	    }
	}

	public void init(FilterConfig chain) throws ServletException {
	
	}
	public void destroy() {

	}

}