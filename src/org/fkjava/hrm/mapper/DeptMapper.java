package org.fkjava.hrm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.fkjava.hrm.bean.Dept;

/**
 * DeptMapper 数据访问类
 * @author CHUNLONG.LUO
 * @email 584614151@qq.com
 * @date 2016-10-16 09:26:49
 * @version 1.0
 */
public interface DeptMapper {

	@Select("select * from hrm_dept")
	List<Dept> findAllDepts();

	int findTotalNum(Map<String, Object> params);

	List<Dept> selectDeptByPage(Map<String, Object> params);

	@Delete("delete from hrm_dept where id = #{id}")
	void deleteDeptById(int id);

	Dept getDeptById(int id);

	void updateDept(Dept dept);

	void addDept(Dept dept);



}