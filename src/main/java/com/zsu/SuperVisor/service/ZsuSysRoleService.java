package com.zsu.SuperVisor.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsu.SuperVisor.mapper.ZsuSysRoleMapper;
import com.zsu.SuperVisor.model.ZsuSysRole;

@Service
public class ZsuSysRoleService extends BaseService<ZsuSysRole> {

	@Autowired
	private ZsuSysRoleMapper zsuSysRoleMapper;

	@Autowired
	private ZsuSysResourceService zsuSysResourceService;

	public ZsuSysRole createRole(ZsuSysRole role) {
		zsuSysRoleMapper.insert(role);
		return role;
	}

	public ZsuSysRole updateRole(ZsuSysRole role) {
		zsuSysRoleMapper.updateByPrimaryKey(role);
		return role;
	}

	public void deleteRole(Long roleId) {
		zsuSysRoleMapper.deleteByPrimaryKey(roleId);
	}

	public ZsuSysRole findOne(Long roleId) {
		return zsuSysRoleMapper.selectByPrimaryKey(roleId);
	}

	public List<ZsuSysRole> findAll() {
		return (List<ZsuSysRole>) zsuSysRoleMapper.selectList();
	}

	public Set<String> findRoles(Long... roleIds) {
		Set<String> roles = new HashSet<String>();
		for (Long roleId : roleIds) {
			ZsuSysRole role = findOne(roleId);
			if (role != null) {
				roles.add(role.getRole());
			}
		}
		return roles;
	}

	public Set<String> findPermissions(Long[] roleIds) {
		Set<Long> resourceIds = new HashSet<Long>();
		for (Long roleId : roleIds) {
			ZsuSysRole role = findOne(roleId);
			if (role != null) {
				resourceIds.addAll(role.getResourceIdsList());
			}
		}
		return zsuSysResourceService.findPermissions(resourceIds);
	}

}
