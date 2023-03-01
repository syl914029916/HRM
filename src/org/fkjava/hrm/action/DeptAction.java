package org.fkjava.hrm.action;

import java.util.List;

import org.fkjava.hrm.bean.Dept;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.service.impl.HrmServiceImpl;
import org.fkjava.hrm.service.proxy.ServiceProxy;
import org.fkjava.hrm.util.webTag.PageModel;

import com.opensymphony.xwork2.ActionSupport;

public class DeptAction extends ActionSupport{
	private List<Dept> depts;
	private Dept dept;
	
	private PageModel pageModel = new PageModel();
	private String tip;
	
	//创建代理对象
	ServiceProxy serviceProxy = new ServiceProxy();
	HrmService hrmService = serviceProxy.bind(new HrmServiceImpl());
	
	private String ids;
	//公告分页查询
	public String selectDeptByPage(){
		try {
			
			depts = hrmService.selectDeptByPage(dept,pageModel);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new HrmException(e);
		}
		return SUCCESS;
		
	}
	
	public String deleteDeptById() {
		System.out.println("删除部门id："+dept.getId());
		try {
			hrmService.deleteDeptById(dept.getId());
			tip = "删除成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "删除失败！";
		}
		return SUCCESS;
		
	}
	
	//跳转到部门修改页面
	public String showUpdateDept() {
		try {
			//根据员工id获取员工信息
			dept = hrmService.getDeptById(dept.getId());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return SUCCESS;
		
	}
	
	public String updateDept() {
		try {
			hrmService.updateDept(dept);
			tip = "修改成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "修改失败！";
		}
		return SUCCESS;
	}
	
	public String addDept() {
		try {
			hrmService.addDept(dept);
			tip = "添加成功！";
		} catch (Exception e) {
			e.printStackTrace();
			tip = "添加失败！";
		}
		return SUCCESS;
	}
	public List<Dept> getDepts() {
		return depts;
	}
	public void setDepts(List<Dept> depts) {
		this.depts = depts;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public PageModel getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public ServiceProxy getServiceProxy() {
		return serviceProxy;
	}
	public void setServiceProxy(ServiceProxy serviceProxy) {
		this.serviceProxy = serviceProxy;
	}
	public HrmService getHrmService() {
		return hrmService;
	}
	public void setHrmService(HrmService hrmService) {
		this.hrmService = hrmService;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
}
