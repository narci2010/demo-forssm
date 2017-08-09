package com.zsu.SuperVisor.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.zsu.SuperVisor.common.pojo.PageAjax;
import com.zsu.SuperVisor.mapper.BaseMapper;

/**
 * 通用业务层
 * 
 * @author 蔡泽华
 */
public class BaseService<T> {

	@Autowired
	private BaseMapper<T> baseMapper;
	

	/**
	 * 通过ID查询
	 * 
	 * @param id
	 * @return
	 */
	public Object selectById(Serializable id) {
		return baseMapper.selectById(id);
	}

	/*
	 * 修改全部参数类型为Integer为Object类型，以适应各种需求
	 * by Narci Lee
	 * 2017.7.31
	 * 
	 */
	public int deleteByPrimaryKey(Object id) {

		return baseMapper.deleteByPrimaryKey(id);
	}
	public int deleteByTempId(Object id) {

		return baseMapper.deleteByTempId(id);
	}

	public int insert(T record) {
		return baseMapper.insert(record);
	}

	public int insertSelective(T record) {
		return baseMapper.insertSelective(record);
	}

	public T selectByPrimaryKey(Object id) {
		return baseMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(T record) {
		return baseMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(T record) {
		return baseMapper.updateByPrimaryKey(record);
	}

	/**
	 * 查询单条记录
	 * 
	 * @param entity
	 * @return
	 */
	public Object selectOne(Object obj) {
		return baseMapper.selectOne(obj);
	}

	/**
	 * 查询集合
	 * 
	 * @param t
	 * @return
	 */
	public List<?> selectList(Object obj) {
		return (List<?>) baseMapper.selectList(obj);
	}

	public List<?> selectList() {
		return (List<?>) baseMapper.selectList();
	}

	/**
	 * 分页查询
	 * 
	 * @param t
	 * @param page
	 * @return
	 */
	public PageAjax<T> selectPage(Object obj, PageAjax<T> page) {
		List<T> list = baseMapper.selectPage(obj, page);
		return new PageAjax<T>(list);
	}

	/**
	 * 通用的保存方法
	 * 
	 * @param <T>
	 * @param entity
	 */
	public void save(Object obj) {
		baseMapper.save(obj);
	}

	/**
	 * 批量保存
	 * 
	 * @param list
	 */
	public int batchSave(List<?> list) {
		return baseMapper.batchSave(list);
	}

	/**
	 * 通用的修改方法
	 * 
	 * @param <T>
	 * @param entity
	 */
	public void update(Object obj) {
		baseMapper.update(obj);
	}

	/**
	 * 删除方法
	 * 
	 * @param id
	 */
	public int delById(Serializable id) {
		return baseMapper.delById(id);
	}

	/**
	 * 批量删除
	 * 
	 * @param list
	 * @return
	 */
	public int delList(List<?> list) {
		return baseMapper.delList(list);
	}

	/**
	 * 批量删除方法
	 * 
	 * @param ids
	 */
	public int delArray(int[] ids) {
		return baseMapper.delArray(ids);
	}

	public int updateArray(int[] ids, int employStatus) {

		return baseMapper.updateArray(ids, employStatus);

	}

	/**
	 * 统计查询
	 * 
	 * @param <T>
	 * @param params
	 *            查询参数
	 * @return 总记录条数
	 */
	public int count(T t) {
		return baseMapper.count(t);
	}

	/**
	 * 批量更新
	 * 
	 * @param list
	 * @return
	 */
	public int batchUpdate(List<?> list) {
		return baseMapper.batchUpdate(list);
	}

	public int deleteByCodition(T record) {
		return baseMapper.deleteByCodition( record);
	}

	public int updateByCodition(T record) {
		return baseMapper.updateByCodition( record);
	}

	public int selectByCodition(T record) {
		return baseMapper.selectByCodition( record);
	}
	/*
	 * @Autowired private SqlSessionTemplate sqlSessionTemplate;
	 * 
	 *//**
		 * 批量更新
		 * 
		 * @param str
		 * @param obj
		 * @return
		 * @throws Exception
		 *//*
		 * public int batchUpdate(String str, List<?> objs) { SqlSessionFactory
		 * sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory(); //
		 * 批量执行器 SqlSession sqlSession =
		 * sqlSessionFactory.openSession(ExecutorType.BATCH, false); int succ =
		 * 0; try { if (objs != null) { for (int i = 0, size = objs.size(); i <
		 * size; i++) { sqlSession.update(str, objs.get(i)); }
		 * sqlSession.flushStatements(); sqlSession.commit();
		 * sqlSession.clearCache(); } } finally { sqlSession.close(); } return
		 * succ; }
		 */
	public T selectByPrimaryKey(String id) {
		return baseMapper.selectByPrimaryKey(id);
	}
}
