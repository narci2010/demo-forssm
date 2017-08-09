package com.zsu.SuperVisor.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;

@ApiModel(value = "用户对象", description = "权限模块用户对象：代表一个用户")
public class ZsuSysUser {
	
	private static final Logger log = Logger.getLogger(ZsuSysUser.class);
	
	@ApiModelProperty(value="用户ID",required = false)
	private Long id;
	@ApiModelProperty(value="用户名称",required = true)
	private String username;
	@ApiModelProperty(value="用户密码",required = true)
	private String password;
	@ApiParam(hidden = true) 
	private String salt;
	@ApiModelProperty(value="用户拥有的角色ID（多个角色用','分隔）",required = false)
	private String roleIds;
	@ApiModelProperty(hidden=true) 
	@JsonIgnore
	private List<Long> roleIdsList; // 拥有的角色列表
	@ApiModelProperty(value="用户状态",required = true)
	private Boolean locked;

	public ZsuSysUser() {
	}

	public ZsuSysUser(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String roleIds) {
		log.debug("enter setRoleIds:"+roleIds);
		this.roleIds = roleIds;
	
		if (roleIds != null) {
			String[] roleIdStrs = roleIds.split(",");
			roleIdsList = new ArrayList<Long>();
			for (String roleIdStr : roleIdStrs) {
				if (StringUtils.isEmpty(roleIdStr)) {
					continue;
				}
				roleIdsList.add(Long.valueOf(roleIdStr));
			}
		}
		//log.debug("exit setRoleIds:"+roleIds);
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public String getCredentialsSalt() {
		return username + salt;
	}

	public List<Long> getRoleIdsList() {
		if (roleIdsList == null) {
			roleIdsList = new ArrayList<Long>();
		}
		return roleIdsList;
	}

	public void setRoleIdsList(List<Long> roleIdsList) {
		this.roleIdsList = roleIdsList;
		if (roleIdsList != null && CollectionUtils.isEmpty(roleIdsList)) {
			StringBuilder s = new StringBuilder();
			for (Long roleId : roleIdsList) {
				s.append(roleId);
				s.append(",");
			}
			this.roleIds = s.toString();
		}
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ZsuSysUser user = (ZsuSysUser) o;

		if (id != null ? !id.equals(user.id) : user.id != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		return id != null ? id.hashCode() : 0;
	}

	@Override
	public String toString() {
		return "ZsuSysUser{" + "id=" + id + ", username='" + username + '\'' + ", password='" + password + '\''
				+ ", salt='" + salt + '\'' + ", roleIds=" + roleIds + ", locked=" + locked + '}';
	}
}