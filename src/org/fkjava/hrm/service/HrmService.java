package org.fkjava.hrm.service;

import java.io.File;
import java.util.List;

import org.fkjava.hrm.bean.Dept;
import org.fkjava.hrm.bean.Document;
import org.fkjava.hrm.bean.Employee;
import org.fkjava.hrm.bean.Employee_demo;
import org.fkjava.hrm.bean.Job;
import org.fkjava.hrm.bean.Notice;
import org.fkjava.hrm.bean.User;
import org.fkjava.hrm.util.webTag.PageModel;

public interface HrmService {

	//根据用户名以及密码获取用户信息
	User findUserByNameAndPass(User user);

	//公告分页查询
	List<Notice> selectNoticeByPage(Notice notice, PageModel pageModel);

	//删除公告
	void deleteNoticeByIds(String[] ids);

	//添加公告
	void addNotice(Notice notice);

	//根据公告id获取公告信息
	Notice getNoticeById(int id);

	//更新公告
	void updateNotice(Notice notice);

	/**************************************文档模块**********************************************/
    //文档分页查询
	List<Document> selectDocumentByPage(Document document, PageModel pageModel);

	//删除文档信息
	void deleteDocumentById(int id);

	//添加文档
	void addDocument(File pic, String picFileName, Document document);

	//获取文档
	Document getDocumentById(int id);

	//修改文档
	void updateDocument(File pic, String picFileName, Document document);

	/**************************************员工模块**********************************************/
	//员工分页查询
	List<Employee> selectEmpByPage(Employee employee, PageModel pageModel);

	List<Dept> findAllDepts();

	List<Job> findAllJobs();

	//删除员工数据
	void deleteEmpById(int id);

	
	//获取需要导出的员工数据
	List<Employee_demo> getEmpByDatas(Employee employee);

	//添加员工信息
	void addEmp(Employee employee);

	//根据员工id获取员工信息
	Employee getEmpById(int id);

	//修改
	void updateEmp(Employee employee);

	List<Dept> selectDeptByPage(Dept dept, PageModel pageModel);

	void deleteDeptById(int id);

	Dept getDeptById(int id);

	void updateDept(Dept dept);

	void addDept(Dept dept);

	List<Job> selectJobByPage(Job job, PageModel pageModel);

	void deleteJobById(int id);

	Job getJobById(int id);

	void updateJob(Job job);

	void addJob(Job job);

	

}
