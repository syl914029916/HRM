package org.fkjava.hrm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.fkjava.hrm.bean.Notice;

/**
 * NoticeMapper 数据访问类
 * @author CHUNLONG.LUO
 * @email 584614151@qq.com
 * @date 2016-10-16 09:26:49
 * @version 1.0
 */
public interface NoticeMapper {

	//获取公告总记录数
	int findTotalNum(Map<String, Object> params);

	//公告分页查询
	List<Notice> selectNoticeByPage(Map<String, Object> params);

	void deleteNoticeByIds(@Param("ids")String[] ids);

	@Insert("insert into hrm_notice(title,content,create_date,user_id) values(#{title},#{content},#{createDate},#{user.id})") 
	void addNotice(Notice notice);

	@Select("select * from hrm_notice where id = #{id}")
	Notice getNoticeById(int id);

	@Update("update hrm_notice set title = #{title} ,content =#{content} where id = #{id}")
	void updateNotice(Notice notice);



}