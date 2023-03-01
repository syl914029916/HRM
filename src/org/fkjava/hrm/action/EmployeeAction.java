package org.fkjava.hrm.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.Dept;
import org.fkjava.hrm.bean.Employee;
import org.fkjava.hrm.bean.Employee_demo;
import org.fkjava.hrm.bean.Job;
import org.fkjava.hrm.bean.User;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.service.impl.HrmServiceImpl;
import org.fkjava.hrm.service.proxy.ServiceProxy;
import org.fkjava.hrm.util.HrmContant;
import org.fkjava.hrm.util.excelpoi.ExcelUtil;
import org.fkjava.hrm.util.webTag.PageModel;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends  ActionSupport{

    private Employee employee;
    private List<Employee> employees;
    private List<Dept> depts;
    private List<Job> jobs;
    
    private PageModel pageModel = new PageModel();
    private String tip;
	
	//创建代理对象
	ServiceProxy serviceProxy = new ServiceProxy();
	HrmService hrmService = serviceProxy.bind(new HrmServiceImpl());
	
	//员工分页查询
	public String selectEmpByPage(){
		
		try {
			depts = hrmService.findAllDepts();
			jobs = hrmService.findAllJobs();
			employees = hrmService.selectEmpByPage(employee,pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new HrmException(e.getMessage());
		}
		return SUCCESS;
		
	}
	
	//删除员工信息
	public String deleteEmp(){
		try {
			hrmService.deleteEmpById(employee.getId());
			tip = "删除成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "删除失败！";
		}
		return SUCCESS;
	}
	
	//添加员工信息
	public String addEmp(){
		try {
			hrmService.addEmp(employee);
			tip = "添加成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "添加失败！";
		}
		return SUCCESS;
	}
	
	//跳转至修改员工信息
	public String showUpdateEmp(){
		try {
			//根据员工id获取员工信息
			employee = hrmService.getEmpById(employee.getId());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return SUCCESS;
	}
	
	//修改员工信息
		public String updateEmp(){
			try {
				hrmService.updateEmp(employee);
				tip = "修改成功！";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				tip = "修改失败！";
			}
			return SUCCESS;
		}
	
	
	//导出员工信息
	public String downDataToExcel(){
		try {
			String[] titles = {"编号","姓名","性别","手机","邮箱","职位","学历","身份证号码","部门","联系地址","建档日期"};
			
			//根据用户输入的条件获取需要导出的数据
			List<Employee_demo> emps = hrmService.getEmpByDatas(employee);

			ExcelUtil.exportDataToExcel("员工信息表.xls","员工信息",titles,emps);
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return NONE;
	}
	
	
	   //异步加载部门以及职位信息
		public String ajaxLoadDeptAndJob(){
			
			try {
				depts = hrmService.findAllDepts();
				jobs = hrmService.findAllJobs();
				
				Map<String,Object> map = new HashMap<>();
				map.put("depts", depts);
				map.put("jobs", jobs);
				
				//将数据转成json格式的字符窜
				Gson gson = new Gson();
				String jsonStr = gson.toJson(map);
				System.out.println("jsonStr:"+jsonStr);
				//{"depts":[{},{}],"jobs":[{},{}]}
				
				ServletActionContext.getResponse().getWriter().print(jsonStr);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				throw new HrmException(e.getMessage());
			}
			return NONE;
			
		}
		

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public List<Dept> getDepts() {
		return depts;
	}

	public void setDepts(List<Dept> depts) {
		this.depts = depts;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public String getTip() {
		return tip;
	} 
	
	public void setTip(String tip) {
		 this.tip = tip;
	} 
	

}
