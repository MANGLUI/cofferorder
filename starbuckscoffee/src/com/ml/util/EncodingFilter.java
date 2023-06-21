package com.ml.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//编码过滤器，对指定的请求进行拦截，把请求的编码设置为UTF-8
public class EncodingFilter implements Filter {
    //进行过滤处理
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//设置请求的编码为utf-8，防止发送的中文乱码
		request.setCharacterEncoding("utf-8");
		//把请求转交给下一个过滤器
		chain.doFilter(request, response);
	}

	public void init(FilterConfig chain) throws ServletException {
	}
	public void destroy() {

	}

}
