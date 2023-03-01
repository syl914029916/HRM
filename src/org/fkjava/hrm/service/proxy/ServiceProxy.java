package org.fkjava.hrm.service.proxy;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.util.ConnectionFactory;
import org.fkjava.hrm.util.annotation.AutoMapper;

public class ServiceProxy{


	@SuppressWarnings("unchecked")
	public <T> T bind(T t) {
		// TODO Auto-generated method stub
		return (T)Proxy.newProxyInstance(t.getClass().getClassLoader(), t.getClass().getInterfaces(), new InvocationHandler() {
			
			@Override
			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				// TODO Auto-generated method stub
				//获取连接
				SqlSession sqlSession =  ConnectionFactory.getSqlSession();
				try {
					
					//获取被代理对象中所有的属性，并注入值
					Class<?> clazz = t.getClass();
					
					//获取所有的属性包括私有的
					Field[] fields = clazz.getDeclaredFields();
					for(Field field : fields){
						//判断属性上是否有注解标示，并且required=true才注入
						AutoMapper autoMapper = field.getAnnotation(AutoMapper.class);
					    if(autoMapper!=null&&autoMapper.required()){
					    	//如果属性是私有的需要改成可访问
					    	if(!field.isAccessible()){
					    		field.setAccessible(true);
					    	}
					    	//给属性注入值  UserMapper.class
					    	field.set(t, sqlSession.getMapper(field.getType()));
					    	
					    }
					}
					
					//执行目标方法
					Object result = method.invoke(t, args);
					
				    //提交事务
					sqlSession.commit();
					return result;
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					//事务回滚
					sqlSession.rollback();
					throw new HrmException("操作执行失败："+e.getMessage(),e);
				}finally {
					
					//关闭连接
					ConnectionFactory.closeSqlSession();
				}
				
			}
		});
	}

}
