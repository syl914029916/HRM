package org.fkjava.hrm.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ConnectionFactory {

	private static SqlSessionFactory sqlSessionFactory = null;
	
	//由于SqlSession是非线程安全的，为了保证线程安全，java提供了一个类ThreadLocal来实现线程安全
	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<>();
	//初始化数据库连接池
	static{
		InputStream inputStream = null;
		try {
			 inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(inputStream!=null){
				try {
					inputStream.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		
	}
	

	
	//获取连接的方法
	public static SqlSession getSqlSession(){
		
		SqlSession sqlSession = threadLocal.get();
		if(sqlSession==null){
			sqlSession = sqlSessionFactory.openSession();
			threadLocal.set(sqlSession);    
		}
		return sqlSession;
	}
	
	
	//关闭连接的方法
	public static void closeSqlSession(){
		SqlSession sqlSession = threadLocal.get();
		if(sqlSession!=null){
			 sqlSession.close();
			 //将连接从threadLocal移除
			 threadLocal.remove();
		}
	}
}
