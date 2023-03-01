package org.fkjava.hrm.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.Dept;
import org.fkjava.hrm.bean.Document;
import org.fkjava.hrm.bean.Employee;
import org.fkjava.hrm.bean.Employee_demo;
import org.fkjava.hrm.bean.Job;
import org.fkjava.hrm.bean.Notice;
import org.fkjava.hrm.bean.User;
import org.fkjava.hrm.mapper.DeptMapper;
import org.fkjava.hrm.mapper.DocumentMapper;
import org.fkjava.hrm.mapper.EmployeeMapper;
import org.fkjava.hrm.mapper.JobMapper;
import org.fkjava.hrm.mapper.NoticeMapper;
import org.fkjava.hrm.mapper.UserMapper;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.util.ConnectionFactory;
import org.fkjava.hrm.util.HrmContant;
import org.fkjava.hrm.util.annotation.AutoMapper;
import org.fkjava.hrm.util.webTag.PageModel;

public class HrmServiceImpl implements HrmService {
	

	@AutoMapper
	private UserMapper userMapepr;
	
	@AutoMapper
	private NoticeMapper noticeMapper;
	
	@AutoMapper
	private DocumentMapper documentMapper;
	
	@AutoMapper
	private EmployeeMapper employeeMapper;
	
	@AutoMapper
	private DeptMapper deptMapper;
	
	@AutoMapper
	private JobMapper jobMapper;
	
	
	//根据用户名以及密码获取用户信息
	@Override
	public User findUserByNameAndPass(User user) {
		// TODO Auto-generated method stub
		user = userMapepr.findUserByNameAndPass(user);
		return user;
	}


	//公告分页查询
	@Override
	public List<Notice> selectNoticeByPage(Notice notice, PageModel pageModel) {
		// TODO Auto-generated method stub
		//不仅需要实现分页查询，还需要查询总记录数
		
		//创建Map集合存储查询参数
		Map<String,Object> params = new HashMap<>();
		params.put("notice", notice);
		
		//查询总记录数
		int totalNum = noticeMapper.findTotalNum(params);
		
		//将总记录数存放在pageModel中
		pageModel.setTotalNum(totalNum);
		if(totalNum==0){
			return null;
		}
		
		//实现分页查询
		params.put("pageModel", pageModel);
		return noticeMapper.selectNoticeByPage(params);
	}


	//删除公告
	@Override
	public void deleteNoticeByIds(String[] ids) {
		// TODO Auto-generated method stub
		noticeMapper.deleteNoticeByIds(ids);
	}


	//添加公告
	@Override
	public void addNotice(Notice notice) {
		// TODO Auto-generated method stub
		notice.setCreateDate(new Date());
		notice.setUser(HrmContant.getCurrentUser());
		
		noticeMapper.addNotice(notice);
	}


	//根据公告id获取公告信息
	@Override
	public Notice getNoticeById(int id) {
		// TODO Auto-generated method stub
		return noticeMapper.getNoticeById(id);
	}

	//更新公告
	@Override
	public void updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		noticeMapper.updateNotice(notice);
	}


	@Override
	public List<Document> selectDocumentByPage(Document document, PageModel pageModel) {
		// TODO Auto-generated method stub
		//创建Map集合存储查询参数
		Map<String,Object> params = new HashMap<>();
		params.put("document", document);
		
		//查询总记录数
		int totalNum = documentMapper.findTotalNum(params);
		
		//将总记录数存放在pageModel中
		pageModel.setTotalNum(totalNum);
		if(totalNum==0){
			return null;
		}
		
		//实现分页查询
		params.put("pageModel", pageModel);
		return documentMapper.selectDocumentByPage(params);
	}
	
	//删除文档
	@Override
	public void deleteDocumentById(int id) {
		// TODO Auto-generated method stub
		 Document document = documentMapper.getDocumentById(id);
		 //获取文件的路径
		 String path = document.getUrl();
		 
		 //删除数据库记录
		 documentMapper.deleteDocumentById(id);
		 
		 //删除本地文件
		
		 //获取项目部署路径
		 String projectPath = ServletActionContext.getServletContext().getRealPath("/");
		 
		 File file = new File(projectPath+path);   
		 if(file.exists()){
			file.delete();
		 }
	}

	//添加文档
	@Override
	public void addDocument(File pic, String picFileName, Document document) {
		// TODO Auto-generated method stub
		String path = HrmContant.fileUpload(pic, picFileName, "/images/document");
		document.setUrl(path);
        document.setCreateDate(new Date());
        document.setUser(HrmContant.getCurrentUser());
        
        //将文件名保存在数据库
        document.setFileName(picFileName);
        documentMapper.saveDocument(document);
        
        
	}


	@Override
	public Document getDocumentById(int id) {
		// TODO Auto-generated method stub
		return documentMapper.getDocumentById(id);
	}


	@Override
	public void updateDocument(File pic, String picFileName, Document document) {
		// TODO Auto-generated method stub
		
		//判断用是否选择了新的文件
		if(pic!=null){
			String oldPath = document.getUrl();
			//删除历史文件
			 //获取项目部署路径
			 String projectPath = ServletActionContext.getServletContext().getRealPath("/");
			 
			 File file = new File(projectPath+oldPath);   
			 if(file.exists()){
				file.delete();
			 }
			//用户选择了新的文件，历史文件需要删除
			String path = HrmContant.fileUpload(pic, picFileName, "/images/document");
            //新的文件的路径
			document.setUrl(path);

		}else{
			//没有上传新的文件，将文档路径设置空
			document.setUrl("");
		}
		
		documentMapper.updateDocument(document);
		
	}

	/**************************************员工模块**********************************************/
	//员工分页查询
	@Override
	public List<Employee> selectEmpByPage(Employee employee, PageModel pageModel) {
		// TODO Auto-generated method stub
		//创建Map集合存储查询参数
			Map<String,Object> params = new HashMap<>();
			params.put("employee", employee);
			
			//查询总记录数
			int totalNum = employeeMapper.findTotalNum(params);
			
			//将总记录数存放在pageModel中
			pageModel.setTotalNum(totalNum);
			if(totalNum==0){
				return null;
			}
			
			//实现分页查询
			params.put("pageModel", pageModel);
			return employeeMapper.selectEmployeeByPage(params);
	}


	@Override
	public List<Dept> findAllDepts() {
		// TODO Auto-generated method stub
		return deptMapper.findAllDepts();
	}
	
	
	@Override
	public List<Job> findAllJobs() {
		// TODO Auto-generated method stub
		return jobMapper.findAllJobs();
	}

	//删除员工数据
	@Override
	public void deleteEmpById(int id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteEmpById(id);
	}


	//获取需要导出的员工数据
	@Override
	public List<Employee_demo> getEmpByDatas(Employee employee) {
		// TODO Auto-generated method stub
		return employeeMapper.getEmpByDatas(employee);
	}


	//添加员工信息
	@Override
	public void addEmp(Employee employee) {
		// TODO Auto-generated method stub
		employee.setCreateDate(new Date());
		employeeMapper.addEmp(employee);
	}


	//根据员工id获取员工信息
	@Override
	public Employee getEmpById(int id) {
		// TODO Auto-generated method stub
		return employeeMapper.getEmpById(id);
	}


	//修改员工信息
		@Override
		public void updateEmp(Employee employee) {
			// TODO Auto-generated method stub
			employeeMapper.updateEmp(employee);
		}
		
		@Override
		public List<Dept> selectDeptByPage(Dept dept, PageModel pageModel) {
			//不仅需要实现分页查询，还需要查询总记录数
			
			//创建Map集合存储查询参数
			Map<String,Object> params = new HashMap<>();
			params.put("dept", dept);
			
			//查询总记录数
			int totalNum = deptMapper.findTotalNum(params);
			
			//将总记录数存放在pageModel中
			pageModel.setTotalNum(totalNum);
			if(totalNum==0){
				return null;
			}
			
			//实现分页查询
			params.put("pageModel", pageModel);
			return deptMapper.selectDeptByPage(params);
		}
		
		@Override
		public void deleteDeptById(int id) {
			deptMapper.deleteDeptById(id);
		}


		@Override
		public Dept getDeptById(int id) {
			return deptMapper.getDeptById(id);
		}


		@Override
		public void updateDept(Dept dept) {
			deptMapper.updateDept(dept);
		}


		@Override
		public void addDept(Dept dept) {
			deptMapper.addDept(dept);
		}


		@Override
		public List<Job> selectJobByPage(Job job, PageModel pageModel) {
			//不仅需要实现分页查询，还需要查询总记录数
			
			//创建Map集合存储查询参数
			Map<String,Object> params = new HashMap<>();
			params.put("job", job);
			
			//查询总记录数
			int totalNum = jobMapper.findTotalNum(params);
			
			//将总记录数存放在pageModel中
			pageModel.setTotalNum(totalNum);
			if(totalNum==0){
				return null;
			}
			
			//实现分页查询
			params.put("pageModel", pageModel);
			return jobMapper.selectJobByPage(params);
		}


		@Override
		public void deleteJobById(int id) {
			jobMapper.deleteJobById(id);
		}


		@Override
		public Job getJobById(int id) {
			// TODO Auto-generated method stub
			return jobMapper.getJobById(id);
		}


		@Override
		public void updateJob(Job job) {
			jobMapper.updateJob(job);
		}


		@Override
		public void addJob(Job job) {
			jobMapper.addJob(job);
		}
}
