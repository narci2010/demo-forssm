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
import com.zsu.SuperVisor.model.ZsuSysRole;
import com.zsu.SuperVisor.model.ZsuSysUser;
import com.zsu.SuperVisor.service.ZsuSysRoleService;

import io.swagger.annotations.ApiOperation;

/**
 * <p>
 * User: Narci Lee
 * <p>
 * Date: 17-8-5
 * <p>
 * Version: 1.0
 */
@Controller
@RequestMapping("/zsuSysRole")
public class ZsuSysRoleController {
	@Autowired
	private ZsuSysRoleService zsuSysRoleService;
	private static final Logger log = Logger.getLogger(ZsuSysRoleController.class);

	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ApiOperation(value="创建角色 - CREATE",response=AjaxResult.class,notes="实现创建角色功能")
	public AjaxResult createRole(@ModelAttribute("role") ZsuSysRole role) {
		log.debug("createRole");
		// 后面采用spring mvc validation框架完成
		zsuSysRoleService.createRole(role);
		return new AjaxResult(0, "创建角色成功", role);
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ApiOperation(value="更新角色 - UPDATE",response=AjaxResult.class,notes="实现更新角色功能")
	public AjaxResult updateRole(@ModelAttribute("role") ZsuSysRole role) {
		log.debug("updateRole");
		zsuSysRoleService.updateRole(role);
		return new AjaxResult(0, "更新角色成功", role);
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ApiOperation(value="删除角色 - DELETEANY",response=AjaxResult.class,notes="实现删除角色功能")
	public AjaxResult deleteRole(Long roleId) {
		log.debug("deleteRole");
		zsuSysRoleService.deleteRole(roleId);
		return new AjaxResult(0, "删除角色成功");
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAny", method = RequestMethod.POST)
	@ApiOperation(value="删除多个角色 - DELETEANY",response=AjaxResult.class,notes="实现删除多个角色功能")
	public AjaxResult deleteRoleAny(@RequestBody List<Long> roleIds) {
		log.debug("deleteRoleAny");
		for (Long roleId : roleIds)
			zsuSysRoleService.deleteRole(roleId);
		return new AjaxResult(0, "删除角色成功");
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ApiOperation(value="显示全部角色 - LIST",response=AjaxResult.class,notes="实现显示全部角色功能")
	public AjaxResult listAll() {
		log.debug("listAll");
		List<ZsuSysRole> lzsr = zsuSysRoleService.findAll();
		return new AjaxResult(0, "显示全部角色", lzsr);

	}

}
