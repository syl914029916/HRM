package org.fkjava.hrm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.fkjava.hrm.bean.Document;

/**
 * DocumentMapper 数据访问类
 * @author CHUNLONG.LUO
 * @email 584614151@qq.com
 * @date 2016-10-16 09:26:49
 * @version 1.0
 */
public interface DocumentMapper {

	int findTotalNum(Map<String, Object> params);

	List<Document> selectDocumentByPage(Map<String, Object> params);

	@Delete("delete from hrm_document where id = #{id}")
	void deleteDocumentById(int id);

	@Insert("insert into hrm_document(title,url,remark,create_date,user_id,fileName) values(#{title},#{url},#{remark},#{createDate},#{user.id},#{fileName})")
	void saveDocument(Document document);

	@Select("select * from hrm_document where id = #{id}")
	Document getDocumentById(int id);

	void updateDocument(Document document);



}