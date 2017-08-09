package com.zsu.SuperVisor.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zsu.SuperVisor.common.pojo.AjaxResult;
import com.zsu.SuperVisor.model.ZsuSysUser;
import com.zsu.SuperVisor.service.ZsuSysUserService;

/**
 * <p>
 * User: Narci Lee
 * <p>
 * Date: 17-8-4
 * <p>
 * Version: 1.0
 */
@Controller
@RequestMapping("/zsuSysUser")
public class ZsuSysUserController {
	@Autowired
	private ZsuSysUserService zsuSysUserService;
	private static final Logger log = Logger.getLogger(ZsuSysUserController.class);

	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public AjaxResult createUser(@ModelAttribute("user") ZsuSysUser user) {
		log.debug("createUser" + user.getRoleIds());
		// 后面采用spring mvc validation框架完成
		zsuSysUserService.createUser(user);

		return new AjaxResult(0, "创建用户成功", user);
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public AjaxResult updateUser(@ModelAttribute("user") ZsuSysUser user) {
		log.debug("updateUser");
		zsuSysUserService.updateUser(user);
		return new AjaxResult(0, "更新用户成功", user);
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public AjaxResult deleteUser(Long userId) {
		log.debug("deleteUser");
		zsuSysUserService.deleteUser(userId);
		return new AjaxResult(0, "删除用户成功");
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAny", method = RequestMethod.POST)
	public AjaxResult deleteUserAny(@RequestBody List<Long> userIds) {

		log.debug("deleteUserAny");

		if (userIds != null)
			for (Long userId : userIds)
				zsuSysUserService.deleteUser(userId);

		return new AjaxResult(0, "删除用户成功");
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public AjaxResult listAll() {
		log.debug("listAll");
		List<ZsuSysUser> lzsu = zsuSysUserService.findAll();
		return new AjaxResult(0, "显示所有用户", lzsu);

	}
}