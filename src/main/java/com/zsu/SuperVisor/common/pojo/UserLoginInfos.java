package com.zsu.SuperVisor.common.pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "用户登录对象", description = "持有用户请求登录的三项信息：userLoginInfos")
public class UserLoginInfos {
	@ApiModelProperty(value="username",required = true)
	private String username;
	@ApiModelProperty(value="password",required = true)
	private String password;
	@ApiModelProperty(value="rememberMe",required = false)
	private boolean rememberMe;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
