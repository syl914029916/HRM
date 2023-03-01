package org.fkjava.hrm.action;

import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.User;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.service.impl.HrmServiceImpl;
import org.fkjava.hrm.service.proxy.ServiceProxy;
import org.fkjava.hrm.util.HrmContant;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private User user;
	private String vcode;
	
	//创建代理对象
	ServiceProxy serviceProxy = new ServiceProxy();
	HrmService hrmService = serviceProxy.bind(new HrmServiceImpl());
	
	public String userLogin(){
		String tip = "";
		try {
			
			//判断验证码是否正确
			String code = (String)ServletActionContext.getRequest().getSession().getAttribute(HrmContant.VCODE);
			if(code==null||!code.equals(vcode)){
				tip = "您输入的验证码不正确，请重新输入！";
			}else{
				//根据用户名以及密码获取用户信息
				user = hrmService.findUserByNameAndPass(user);
				if(user==null){
					tip = "您输入的用户名或密码不正确，请重新输入！";
				}else{
					//用户输入的信息正确，必须将用户信息存放在session中
					ServletActionContext.getRequest().getSession().setAttribute(HrmContant.SESSION_USER, user);
				}
			}
			
			//防止中文乱码
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			//将提示信息响应至前台
			ServletActionContext.getResponse().getWriter().print(tip);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new HrmException(e.getMessage());
		}
		return NONE;
	}
	
	
	public String userLogout(){
		
		//将用户信息从session中清除
		//ServletActionContext.getRequest().getSession().removeAttribute(HrmContant.SESSION_USER);
		ServletActionContext.getRequest().getSession().invalidate();
		return LOGIN;
	
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	
	

}
