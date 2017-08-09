package com.zsu.SuperVisor.mapper;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zsu.SuperVisor.common.pojo.PageAjax;

/**
 * Mybatis基础DAO
 * 
 * @author
 */
public interface BaseMapper<T> {

	/**
	 * 通过ID查询
	 * 
	 * @param id
	 * @return
	 */
	Object selectById(Serializable id);

	/**
	 * 查询单条记录
	 * 
	 * @param entity
	 * @return
	 */
	Object selectOne(@Param("item") Object obj);

	/**
	 * 查询记录集合
	 * 
	 * @param entity
	 * @return
	 */
	List<?> selectList(@Param("item") Object obj);

	List<?> selectList();
	// List<?> selectWith();

	/**
	 * 分页查询
	 * 
	 * @param t
	 * @param page
	 * @return
	 */
	List<T> selectPage(@Param("item") Object obj, @Param("page") PageAjax<T> page);

	/**
	 * 通用的保存方法
	 * 
	 * @param <T>
	 * @param entity
	 */
	void save(@Param("item") Object obj);

	/**
	 * 批量保存
	 * 
	 * @param list
	 */
	int batchSave(List<?> list);

	/**
	 * 通用的修改方法
	 * 
	 * @param <T>
	 * @param entity
	 */
	int update(@Param("item") Object obj);

	/**
	 * 批量更新
	 * 
	 * @param list
	 * @return
	 */
	int batchUpdate(List<?> list);

	/**
	 * 删除方法
	 * 
	 * @param id
	 */
	int delById(Serializable id);

	/**
	 * 批量删除
	 * 
	 * @param list
	 * @return
	 */
	int delList(List<?> list);

	/**
	 * 批量删除方法
	 * 
	 * @param ids
	 */
	int delArray(int[] ids);

	int updateArray(@Param("array") int[] ids, int employStatus);

	/**
	 * 统计查询
	 * 
	 * @param <T>
	 * @param params
	 *            查询参数
	 * @return 总记录条数
	 */
	/*
	 * 修改全部参数类型为Integer为Object类型，以适应各种需求
	 * by Narci Lee
	 * 2017.7.31
	 * 
	 */
	int count(Object obj);

	int deleteByPrimaryKey(Object id);

	int insert(T record);

	int insertSelective(T record);

	T selectByPrimaryKey(Object id);
	
	int updateByPrimaryKeySelective(T record);

	int updateByPrimaryKey(T record);

	int deleteByCodition(T record);

	int updateByCodition(T record);

	int selectByCodition(T record);
	int deleteByTempId(Object id);
	
	/**
	 * add by peng 2017-7-26
	 * @param id
	 * @return
	 */
	T selectByPrimaryKey(String id);

}
