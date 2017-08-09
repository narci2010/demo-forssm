package com.zsu.SuperVisor.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zsu.SuperVisor.common.pojo.AjaxResult;
import com.zsu.SuperVisor.common.pojo.CurrentUser;
import com.zsu.SuperVisor.common.pojo.UserLoginInfos;
import com.zsu.SuperVisor.service.ZsuSysUserService;

import io.swagger.annotations.ApiOperation;

/**
 * <p>
 * User: Narci Lee
 * <p>
 * Date: 17-2-27
 * <p>
 * Version: 1.0
 */

@Controller
public class LoginController {

	private static final Logger log = Logger.getLogger(LoginController.class);
	@Autowired
	private ZsuSysUserService zsuSysUserService;

	@RequestMapping(value = "/login")
	@ResponseBody
	@ApiOperation(value = "用户登录 - LOGIN", response = AjaxResult.class, notes = "实现用户登录功能")
	public AjaxResult login(@ModelAttribute("user") UserLoginInfos user, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		log.debug("login");
		AjaxResult ar = null;

		// 从shiro的session中取activeUser
		Subject subject = SecurityUtils.getSubject();
		if ((subject != null) && subject.getPrincipal() != null && !subject.getPrincipal().equals("")) {
			ar = new AjaxResult(0, "系统已经登录，请勿重复登录。");
		} else {
			ar = new AjaxResult(0, "用户尚未登录。");
		}
		String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
		String error = null;
		if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
			error = "登录失败：账号不存在！";
		} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
			error = "登录失败：密码错误！";
		} else if (exceptionClassName != null) {
			error = "登录失败：其他错误，请联系管理员-->" + exceptionClassName;
		}
		if (error != null) {
			ar = new AjaxResult(0, error);
		}

		return ar;
	}

	@RequestMapping(value = "/successLogin", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "登录成功提示 - SUCCESS", response = AjaxResult.class, notes = "实现登录成功提示功能")
	public AjaxResult successLogin() {
		log.debug("successLogin");
		UserLoginInfos userLoginInfos = new UserLoginInfos();
		// 从shiro的session中取activeUser
		Subject subject = SecurityUtils.getSubject();
		String username = (String) subject.getPrincipal();

		Set<String> roles = zsuSysUserService.findRoles(username);
		Set<String> permissions = zsuSysUserService.findPermissions(username);
		CurrentUser user = new CurrentUser();
		userLoginInfos.setUsername(username);
		user.setUserLoginInfos(userLoginInfos);
		user.setRoles(roles);
		user.setPermissions(permissions);
		return new AjaxResult(1, "登录成功！", user);
	}

	@RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "未授权提示 - UNAUTHORIZED", response = AjaxResult.class, notes = "实现未授权功能")
	public AjaxResult unauthorized() {
		log.debug("unauthorized");
		return new AjaxResult(0, "您没有足够的权限访问目标资源，请切换账号或联系管理员。");
	}

	@RequestMapping(value = "/goLogout", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "退出系统 - LOGOUT", response = AjaxResult.class, notes = "实现退出系统功能")
	public AjaxResult logout(HttpServletRequest req, HttpServletResponse resp) {
		// HttpSession s=req.getSession();
		// s.invalidate();
		log.debug("logout");
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) //手工退出，避免一些服务器跨域访问shiro自带退出功能无法成功的问题
			subject.logout(); // session删除、RememberMe cookie
		// 也将被删除
		return new AjaxResult(1, "用户登出系统成功。");
	}

	@RequestMapping(value = "/invalidSession", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "回话超时 - INVALIDSESSION", response = AjaxResult.class, notes = "实现回话超时功能")
	public AjaxResult invalidSession(HttpServletRequest req, HttpServletResponse resp) {
		// HttpSession s=req.getSession();
		// s.invalidate();
		// shiro比较难实现会话失效的判断，会话失效自动跳转到登录页面，跟首次登录很难区别
		// 客户端可以增加一个标志为：登录成功isLogin=true，如果服务器超时，返回尚未登录，则是会话超时
		log.debug("invalidSession");
		return new AjaxResult(0, "回话超时，请重新登录。");
	}

}
