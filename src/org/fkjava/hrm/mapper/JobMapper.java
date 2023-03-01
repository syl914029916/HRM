package org.fkjava.hrm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.fkjava.hrm.bean.Job;

/**
 * JobMapper 数据访问类
 * @author CHUNLONG.LUO
 * @email 584614151@qq.com
 * @date 2016-10-16 09:26:49
 * @version 1.0
 */
public interface JobMapper {

	@Select("select * from hrm_job")
	List<Job> findAllJobs();

	int findTotalNum(Map<String, Object> params);

	List<Job> selectJobByPage(Map<String, Object> params);

	@Delete("delete from hrm_job where id = #{id}")
	void deleteJobById(int id);

	Job getJobById(int id);

	void updateJob(Job job);

	void addJob(Job job);



}