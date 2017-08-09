package com.zsu.SuperVisor.mapper;

import com.zsu.SuperVisor.model.ZsuSysUser;

public interface ZsuSysUserMapper extends BaseMapper<ZsuSysUser> {

	ZsuSysUser findByUsername(String username);
}