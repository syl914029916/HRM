package org.fkjava.hrm.filter;

import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.User;
import org.fkjava.hrm.util.HrmContant;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


//登录拦截器
public class LoginInteceptor extends AbstractInterceptor {

	public LoginInteceptor() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		//从session中获取用户信息
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute(HrmContant.SESSION_USER);
	
		//该方式设置编码只对post有效       get请求中文乱码解决：找到Tomcat的server.xml文件   加上URIEncoding="utf-8"即可
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		
		return user==null?Action.LOGIN:invocation.invoke();
	}

}
