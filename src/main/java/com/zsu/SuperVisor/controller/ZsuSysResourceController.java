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
import com.zsu.SuperVisor.model.ZsuSysResource;
import com.zsu.SuperVisor.model.ZsuSysRole;
import com.zsu.SuperVisor.service.ZsuSysResourceService;

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
@RequestMapping("/zsuSysResource")
public class ZsuSysResourceController {
	@Autowired
	private ZsuSysResourceService zsuSysResourceService;
	private static final Logger log = Logger.getLogger(ZsuSysResourceController.class);

	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ApiOperation(value="创建资源 - CREATE",response=AjaxResult.class,notes="实现创建资源功能")
	public AjaxResult createResource(@ModelAttribute("resource") ZsuSysResource resource) {
		log.debug("createResource");
		zsuSysResourceService.createResource(resource);
		return new AjaxResult(0, "创建资源成功", resource);
	}

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ApiOperation(value="更新资源 - UPDATE",response=AjaxResult.class,notes="实现更新资源功能")
	public AjaxResult updateResource(@ModelAttribute("resource") ZsuSysResource resource) {
		log.debug("updateResource");
		zsuSysResourceService.updateResource(resource);
		return new AjaxResult(0, "更新资源成功", resource);
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ApiOperation(value="删除资源 - DELETE",response=AjaxResult.class,notes="实现删除资源功能")
	public AjaxResult deleteResource(Long resourceId) {
		log.debug("deleteResource");
		zsuSysResourceService.deleteResource(resourceId);
		return new AjaxResult(0, "删除资源成功");
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAny", method = RequestMethod.POST)
	@ApiOperation(value="删除多个资源 - DELETEANY",response=AjaxResult.class,notes="实现删除多个资源功能")
	public AjaxResult deleteResourceAny(@RequestBody List<Long> resourceIds) {
		log.debug("deleteResourceAny");
		for (Long resourceId : resourceIds)
			zsuSysResourceService.deleteResource(resourceId);
		return new AjaxResult(0, "删除资源成功");
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ApiOperation(value="显示全部资源 - LIST",response=AjaxResult.class,notes="实现显示全部资源功能")
	public AjaxResult listAll() {
		log.debug("listAll");
		List<ZsuSysResource> lzsr = zsuSysResourceService.findAll();
		return new AjaxResult(0, "显示全部资源", lzsr);

	}
}
