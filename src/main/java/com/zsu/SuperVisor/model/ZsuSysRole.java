package com.zsu.SuperVisor.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "角色对象", description = "权限模块角色对象：代表一个角色")
public class ZsuSysRole {
	
	@ApiModelProperty(value="角色ID",required = false)
	private Long id;
	@ApiModelProperty(value="角色名称",required = true)
	private String role;
	@ApiModelProperty(value="角色描述",required = true)
	private String description;
	@ApiModelProperty(value="角色拥有的资源ID（多个资源用','分隔）",required = false)
	private String resourceIds;
	@ApiModelProperty(hidden=true) 
	@JsonIgnore
	private List<Long> resourceIdsList; // 拥有的资源
	@ApiModelProperty(value="角色状态",required = true)
	private Boolean available;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResourceIds() {
		return resourceIds;
	}

	public void setResourceIds(String resourceIds) {
		this.resourceIds = resourceIds;
		if (resourceIds != null) {
			String[] resourceIdStrs = resourceIds.split(",");
			resourceIdsList = new ArrayList<Long>();
			for (String resourceIdStr : resourceIdStrs) {
				if (StringUtils.isEmpty(resourceIdStr)) {
					continue;
				}
				resourceIdsList.add(Long.valueOf(resourceIdStr));
			}
		}
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public List<Long> getResourceIdsList() {
		if (resourceIdsList == null) {
			resourceIdsList = new ArrayList<Long>();
		}
		return resourceIdsList;
	}

	public void setResourceIdsList(List<Long> resourceIdsList) {
		this.resourceIdsList = resourceIdsList;
		if (resourceIdsList != null && CollectionUtils.isEmpty(resourceIdsList)) {

			StringBuilder s = new StringBuilder();
			for (Long resourceId : resourceIdsList) {
				s.append(resourceId);
				s.append(",");
			}
			resourceIds = s.toString();
		}
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ZsuSysRole role = (ZsuSysRole) o;

		if (id != null ? !id.equals(role.id) : role.id != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		return id != null ? id.hashCode() : 0;
	}

	@Override
	public String toString() {
		return "ZsuSysRole{" + "id=" + id + ", role='" + role + '\'' + ", description='" + description + '\''
				+ ", resourceIds=" + resourceIds + ", available=" + available + '}';
	}
}