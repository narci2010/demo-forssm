package com.zsu.SuperVisor.controller;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zsu.SuperVisor.common.pojo.AjaxResult;

/**
 * <p>User: Narci Lee
 * <p>Date: 17-2-27
 * <p>Version: 1.0
 */
@Controller
@RequestMapping("/organization")
public class OrganizationController {

	private static final Logger log = Logger.getLogger(OrganizationController.class);

    @RequiresPermissions("organization:view")
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult index(Model model) {
        log.debug("enter index organization:view");
        return new AjaxResult(1,"enter index organization:view");
    }

    @RequiresPermissions("organization:view")
    @RequestMapping(value = "/tree", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult showTree(Model model) {
        log.debug("enter showTree organization:view");
        return new AjaxResult(1,"enter showTree organization:view");
    }

    @RequiresPermissions("organization:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult showAppendChildForm(@PathVariable("parentId") Long parentId, Model model) {
        log.debug("enter showAppendChildForm organization:create");
        return new AjaxResult(1,"enter showAppendChildForm organization:create");
    }

    @RequiresPermissions("organization:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult create() {
        log.debug("enter create organization:create");
        return new AjaxResult(1,"enter create organization:create");
    }

    @RequiresPermissions("organization:update")
    @RequestMapping(value = "/{id}/maintain", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult showMaintainForm(@PathVariable("id") Long id, Model model) {
        log.debug("enter showMaintainForm organization:update");
        return new AjaxResult(1,"enter showMaintainForm organization:update");
    }

    @RequiresPermissions("organization:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult update() {
        log.debug("enter update organization:update");
        return new AjaxResult(1,"enter update organization:update");
    }

    @RequiresPermissions("organization:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        log.debug("enter delete organization:delete");
        return new AjaxResult(1,"enter delete organization:delete");
    }


    @RequiresPermissions("organization:update")
    @RequestMapping(value = "/{sourceId}/move", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult showMoveForm(@PathVariable("sourceId") Long sourceId, Model model) {
        log.debug("enter showMoveForm organization:update");
        return new AjaxResult(1,"enter showMoveForm organization:update");
    }

    @RequiresPermissions("organization:update")
    @RequestMapping(value = "/{sourceId}/move", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult move(
            @PathVariable("sourceId") Long sourceId,
            @RequestParam("targetId") Long targetId) {
        log.debug("enter move organization:update");
        return new AjaxResult(1,"enter move organization:update");
    }

    @RequiresPermissions("organization:view")
    @RequestMapping(value = "/success", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult success() {
        log.debug("enter success organization:view");
        return new AjaxResult(1,"enter success organization:view");
    }


}
