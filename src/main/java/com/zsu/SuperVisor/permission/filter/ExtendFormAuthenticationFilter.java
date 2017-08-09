package com.zsu.SuperVisor.permission.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

public class ExtendFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final Logger log = Logger.getLogger(ExtendFormAuthenticationFilter.class);
	private static final int HTTP_STATUS_SESSION_EXPIRE=301;

	/**
	 * 表示当访问拒绝时
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		log.debug("onAccessDenied");
		if (isLoginRequest(request, response)) {
			log.debug("enter isLoginRequest");
            if (isLoginSubmission(request, response)) {
            	log.debug("enter isLoginSubmission");
                return executeLogin(request, response);
            } else {
            	log.debug("enter login page");
                // 放行 allow them to see the login page ;)
                return true;
            }
        } else {
        	    log.debug("session invalidate");                  
                HttpServletResponse httpServletResponse = WebUtils.toHttp(response);  
                httpServletResponse.sendError(HTTP_STATUS_SESSION_EXPIRE);
                 
                return false;
    

        }

	}


	/**
	 * 当登录成功
	 * 
	 * @param token
	 * @param subject
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
			ServletResponse response) throws Exception {
		log.debug("onLoginSuccess");
		// 通常我们使用shiro，登录之后就会跳到我们上一次访问的URL
		// FormAuthenticationFilter默认实现：issueSuccessRedirect(request, response);
		// 以下代码改为每次登录成功，跳转到successUrl
		// 清楚之前的URL
		WebUtils.getAndClearSavedRequest(request);
		WebUtils.redirectToSavedRequest(request, response, getSuccessUrl());
		return false;
	}

	/**
	 * 当登录失败
	 * 
	 * @param token
	 * @param e
	 * @param request
	 * @param response
	 * @return
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request,
			ServletResponse response) {
		log.debug("onLoginFailure");
		if (!"XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"))) {// 不是ajax请求
			setFailureAttribute(request, e);
			return true;
		}
		log.debug("onLoginFailure: XMLHttpRequest ajax");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			String message = e.getClass().getSimpleName();
			if ("IncorrectCredentialsException".equals(message)) {
				out.println("{\"success\":false,\"message\":\"密码错误\"}");
			} else if ("UnknownAccountException".equals(message)) {
				out.println("{\"success\":false,\"message\":\"账号不存在\"}");
			} else if ("LockedAccountException".equals(message)) {
				out.println("{\"success\":false,\"message\":\"账号被锁定\"}");
			} else {
				out.println("{\"success\":false,\"message\":\"未知错误，请联系管理员\"}");
			}

		} catch (IOException e1) {
			out.println("{\"success\":false,\"message\":\"未知错误，请联系管理员\"}");

		} finally {
			out.flush();
			out.close();
		}
		return false;
	}
}
