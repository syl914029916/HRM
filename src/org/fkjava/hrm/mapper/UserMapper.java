package org.fkjava.hrm.mapper;

import org.apache.ibatis.annotations.Select;
import org.fkjava.hrm.bean.User;

/**
 * UserMapper 数据访问类
 * @author CHUNLONG.LUO
 * @email 584614151@qq.com
 * @date 2016-10-16 09:26:49
 * @version 1.0
 */
public interface UserMapper {

	@Select("select * from hrm_user where name = #{name} and pass_word = #{passWord}")
	User findUserByNameAndPass(User user);



}