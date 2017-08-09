package com.zsu.SuperVisor.service;

import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsu.SuperVisor.mapper.ZsuSysUserMapper;
import com.zsu.SuperVisor.model.ZsuSysUser;
import com.zsu.SuperVisor.permission.util.PasswordHelper;

@Service
public class ZsuSysUserService extends BaseService<ZsuSysUser> {
	@Autowired
	private ZsuSysUserMapper zsuSysUserMapper;
    @Autowired
    private PasswordHelper passwordHelper;
    @Autowired
    private ZsuSysRoleService zsuSysRoleService;
	 /**
     * 创建用户
     * @param user
     */
    public ZsuSysUser createUser(ZsuSysUser user) {
        //加密密码
        passwordHelper.encryptPassword(user);
        zsuSysUserMapper.insert(user);
        return user;
    }

  
    public ZsuSysUser updateUser(ZsuSysUser user) {
        //加密密码
        passwordHelper.encryptPassword(user);
    	zsuSysUserMapper.updateByPrimaryKey(user);
        return user;
    }

    public void deleteUser(Long userId) {
    	zsuSysUserMapper.deleteByPrimaryKey(userId);
    }

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public void changePassword(Long userId, String newPassword) {
    	ZsuSysUser user =zsuSysUserMapper.selectByPrimaryKey(userId);
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        zsuSysUserMapper.update(user);
    }

   
    public ZsuSysUser findOne(Long userId) {
        return zsuSysUserMapper.selectByPrimaryKey(userId);
    }

   
    public List<ZsuSysUser> findAll() {
        return (List<ZsuSysUser>)zsuSysUserMapper.selectList();
    }

	
    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public ZsuSysUser findByUsername(String username) {
        return zsuSysUserMapper.findByUsername(username);
    }

    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> findRoles(String username) {
    	ZsuSysUser user =findByUsername(username);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return zsuSysRoleService.findRoles(user.getRoleIdsList().toArray(new Long[0]));
    }

    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     */
    public Set<String> findPermissions(String username) {
    	ZsuSysUser user =findByUsername(username);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return zsuSysRoleService.findPermissions(user.getRoleIdsList().toArray(new Long[0]));
    }

}
