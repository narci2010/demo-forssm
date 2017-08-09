package com.zsu.SuperVisor.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authz.permission.WildcardPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.zsu.SuperVisor.mapper.ZsuSysResourceMapper;
import com.zsu.SuperVisor.model.ZsuSysResource;

@Service
public class ZsuSysResourceService extends BaseService<ZsuSysResource> {
	@Autowired
	private ZsuSysResourceMapper zsuSysResourceMapper;

	public ZsuSysResource createResource(ZsuSysResource resource) {
		zsuSysResourceMapper.insert(resource);
		return resource;
	}

	public ZsuSysResource updateResource(ZsuSysResource resource) {
		zsuSysResourceMapper.update(resource);
		return resource;
	}

	public void deleteResource(Long resourceId) {
		zsuSysResourceMapper.deleteByPrimaryKey(resourceId);
	}


	public ZsuSysResource findOne(Long resourceId) {
		return zsuSysResourceMapper.selectByPrimaryKey(resourceId);
	}

	public List<ZsuSysResource> findAll() {
		return (List<ZsuSysResource>)zsuSysResourceMapper.selectList();
	}


	public Set<String> findPermissions(Set<Long> resourceIds) {
		Set<String> permissions = new HashSet<String>();
		for (Long resourceId : resourceIds) {
			ZsuSysResource resource = findOne(resourceId);
			if (resource != null && !StringUtils.isEmpty(resource.getPermission())) {
				permissions.add(resource.getPermission());
			}
		}
		return permissions;
	}

	public List<ZsuSysResource> findMenus(Set<String> permissions) {
		List<ZsuSysResource> allResources = findAll();
		List<ZsuSysResource> menus = new ArrayList<ZsuSysResource>();
		for (ZsuSysResource resource : allResources) {
			if (resource.isRootNode()) {
				continue;
			}
			if (resource.getResType() != ZsuSysResource.ResourceType.menu) {
				continue;
			}
			if (!hasPermission(permissions, resource)) {
				continue;
			}
			menus.add(resource);
		}
		return menus;
	}

	private boolean hasPermission(Set<String> permissions, ZsuSysResource resource) {
		if (StringUtils.isEmpty(resource.getPermission())) {
			return true;
		}
		for (String permission : permissions) {
			WildcardPermission p1 = new WildcardPermission(permission);
			WildcardPermission p2 = new WildcardPermission(resource.getPermission());
			if (p1.implies(p2) || p2.implies(p1)) {
				return true;
			}
		}
		return false;
	}

}
