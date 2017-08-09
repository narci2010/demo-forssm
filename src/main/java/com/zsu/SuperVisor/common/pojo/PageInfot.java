package com.zsu.SuperVisor.common.pojo;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * 封装分页请求结果
 * 
 * @author CZH
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class PageInfot<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	/** 当前页 */
	private int pageNum;
	/** 每页的数量 */
	private int pageSize;
	/** 当前页的数量 */
	private int size;

	/** 总记录数 */
	private long total;

	/** 总页数 */

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public PageInfot() {
	}

	public PageInfot(int size, int pageSize, int pageNum, long total) {
		this.size = size;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.total = total;

	}
}
