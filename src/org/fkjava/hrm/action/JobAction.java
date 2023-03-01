package org.fkjava.hrm.action;

import java.util.List;

import org.fkjava.hrm.bean.Job;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.service.impl.HrmServiceImpl;
import org.fkjava.hrm.service.proxy.ServiceProxy;
import org.fkjava.hrm.util.webTag.PageModel;

import com.opensymphony.xwork2.ActionSupport;

public class JobAction extends ActionSupport{
	private List<Job> jobs;
	private Job job;
	
	private PageModel pageModel = new PageModel();
	private String tip;
	
	//创建代理对象
	ServiceProxy serviceProxy = new ServiceProxy();
	HrmService hrmService = serviceProxy.bind(new HrmServiceImpl());
	
	private String ids;
	//职位分页查询
	public String selectJobByPage(){
		try {
			
			jobs = hrmService.selectJobByPage(job,pageModel);
			System.out.println("=查询======job============="+job);
		} catch (Exception e) {
			e.printStackTrace();
			throw new HrmException(e);
		}
		return SUCCESS;
		
	}
	
	public String deleteJobById() {
		System.out.println("删除部门id："+job.getId());
		try {
			hrmService.deleteJobById(job.getId());
			System.out.println("=删除======job============="+job);
			tip = "删除成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "删除失败！";
		}
		return SUCCESS;
		
	}
	
	//跳转到部门修改页面
	public String showUpdateJob() {
		try {
			//根据员工id获取员工信息
			job = hrmService.getJobById(job.getId());
			System.out.println("=更新页面======job============="+job);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return SUCCESS;
		
	}
	
	public String updateJob() {
		try {
			hrmService.updateJob(job);
			System.out.println("=更新======job============="+job);
			tip = "修改成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "修改失败！";
		}
		return SUCCESS;
	}
	
	public String addJob() {
		try {
			hrmService.addJob(job);
			tip = "添加成功！";
		} catch (Exception e) {
			e.printStackTrace();
			tip = "添加失败！";
		}
		return SUCCESS;
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

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
