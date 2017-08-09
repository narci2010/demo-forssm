package com.zsu.SuperVisor.controller;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zsu.SuperVisor.common.pojo.AjaxResult;

/**
 * <p>
 * User: Narci Lee
 * <p>
 * Date: 17-2-27
 * <p>
 * Version: 1.0
 */
@Controller
@RequestMapping("/role")
public class RoleController {

	private static final Logger log = Logger.getLogger(RoleController.class);

	@RequiresPermissions("role:view")
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult list(Model model) {
		log.debug("enter list role:view");
		return new AjaxResult(1, "enter list role:view");
	}

	@RequiresPermissions("role:create")
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult showCreateForm(Model model) {
		log.debug("enter showCreateForm role:create");
		return new AjaxResult(1, "enter showCreateForm role:create");
	}

	@RequiresPermissions("role:create")
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult create(RedirectAttributes redirectAttributes) {
		log.debug("enter create role:create");
		return new AjaxResult(1, "enter create role:create");
	}

	@RequiresPermissions("role:update")
	@RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult showUpdateForm(@PathVariable("id") Long id, Model model) {
		log.debug("enter showUpdateForm role:update");
		return new AjaxResult(1, "enter showUpdateForm role:update");
	}

	@RequiresPermissions("role:update")
	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(RedirectAttributes redirectAttributes) {
		log.debug("enter update role:update");
		return new AjaxResult(1, "enter update role:update");
	}

	@RequiresPermissions("role:delete")
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	@ResponseBody
	public AjaxResult showDeleteForm(@PathVariable("id") Long id, Model model) {
		log.debug("enter showDeleteForm role:delete");
		return new AjaxResult(1, "enter showDeleteForm role:delete");
	}

	@RequiresPermissions("role:delete")
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		log.debug("enter delete role:delete");
		return new AjaxResult(1, "enter delete role:delete");
	}

}
