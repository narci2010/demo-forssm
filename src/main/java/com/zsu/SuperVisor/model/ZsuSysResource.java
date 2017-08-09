package com.zsu.SuperVisor.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "资源对象", description = "权限模块资源对象：代表一个资源")
public class ZsuSysResource {
	@ApiModelProperty(value="资源ID",required = false)
	private Long id;
	@ApiModelProperty(value="资源名称",required = true)
	private String name;
	@ApiModelProperty(value="资源类型",required = true)
	private String type;
	@ApiModelProperty(value="资源URL",required = true)
	private String url;
	@ApiModelProperty(value="父资源ID",required = false)
	private Long parentId;
	@ApiModelProperty(value="全部父资源ID",required = false)
	private String parentIds;
	@ApiModelProperty(value="资源权限表示",required = true)
	private String permission;
	@ApiModelProperty(value="资源状态",required = true)
	private Boolean available;

	private ResourceType resType = ResourceType.menu; // 资源类型

	public static enum ResourceType {
		menu("菜单"), button("按钮");

		private final String info;

		private ResourceType(String info) {
			this.info = info;
		}

		public String getInfo() {
			return info;
		}
	}
	
	public ResourceType getResType() {
		return resType;
	}

	public void setResType(ResourceType resType) {
		this.resType = resType;
	}	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.setResType(ResourceType.valueOf(type));
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public boolean isRootNode() {
		return parentId == 0;
	}

	public String makeSelfAsParentIds() {
		return getParentIds() + getId() + "/";
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ZsuSysResource resource = (ZsuSysResource) o;

		if (id != null ? !id.equals(resource.id) : resource.id != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		return id != null ? id.hashCode() : 0;
	}

	@Override
	public String toString() {
		return "ZsuSysResource{" + "id=" + id + ", name='" + name + '\'' + ", type=" + type + ", permission='"
				+ permission + '\'' + ", parentId=" + parentId + ", parentIds='" + parentIds + '\'' + ", available="
				+ available + '}';
	}
}