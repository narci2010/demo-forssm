package com.zsu.SuperVisor.common.pojo;

import java.util.Set;

public class CurrentUser {

	private UserLoginInfos userLoginInfos;
	private Set<String> roles;
	private Set<String> permissions;
	
	public void setUserLoginInfos(UserLoginInfos userLoginInfos){
		this.userLoginInfos=userLoginInfos;
	}
	
	public UserLoginInfos getUserLoginInfos(){
		return this.userLoginInfos;
	}
	public Set<String> getRoles() {
		return this.roles;
	}
	public void setRoles(Set<String> roles) {
		this.roles = roles;
	}
	public Set<String> getPermissions() {
		return this.permissions;
	}
	public void setPermissions(Set<String> permissions) {
		this.permissions = permissions;
	}

}
