package org.fkjava.hrm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.fkjava.hrm.bean.Employee;
import org.fkjava.hrm.bean.Employee_demo;

/**
 * EmployeeMapper 数据访问类
 * @author CHUNLONG.LUO
 * @email 584614151@qq.com
 * @date 2016-10-16 09:26:49
 * @version 1.0
 */
public interface EmployeeMapper {

	int findTotalNum(Map<String, Object> params);

	List<Employee> selectEmployeeByPage(Map<String, Object> params);

	@Delete("delete from hrm_employee where id = #{id}")
	void deleteEmpById(int id);

	//获取需要导出的员工数据
	List<Employee_demo> getEmpByDatas(Employee employee);

	void addEmp(Employee employee);

	//根据员工id获取员工信息
	Employee getEmpById(int id);

	void updateEmp(Employee employee);



}