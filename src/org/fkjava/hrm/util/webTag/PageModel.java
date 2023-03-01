package org.fkjava.hrm.util.webTag;


//用于封装分页相关信息  比如说  当前页码   每页显示的记录  总记录数
public class PageModel {
	
	 private int pageIndex=1;//当前页码
	 
	 private int pageSize = 4;//每页显示的记录数
	 
	 private int totalNum;//总记录数

	public int getPageIndex() {
		
		//如果当前页码大于总的页码数，将总页码作为当前页码    
		int totalPage = this.totalNum % this.pageSize==0?this.totalNum / this.pageSize : this.totalNum / this.pageSize +1;
		
		return pageIndex>totalPage?totalPage:pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	 
	 
	//计算分页查询的开始行号  
	public int getStartPageSize(){
		return (this.getPageIndex() - 1) * this.getPageSize();
	}
	 
	 

}
