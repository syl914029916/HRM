package org.fkjava.hrm.util;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.User;

public class HrmContant {

	//session中用户信息对应的key值
	public final static String SESSION_USER = "session_user";
	
	//配置验证码对应的key值
	public static final String VCODE = "vcode";

	
	//获取当前用户
	public static User getCurrentUser() {
		// TODO Auto-generated method stub
		return (User)ServletActionContext.getRequest().getSession().getAttribute(SESSION_USER);
	}


	//文件异步上传
	public static String fileUpload(File pic, String picFileName, String path) {
		// TODO Auto-generated method stub
		//获取项目部署路径
		String projectPath = ServletActionContext.getServletContext().getRealPath(path);
		System.out.println("projectPath:"+projectPath);
		try {
			File f = new File(projectPath);  
			if(!f.exists()){
				f.mkdirs();
			}
			
			//给文件重命名   
		    String newFileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(picFileName);
			
			//拷贝文件至指定目录  
			FileUtils.copyFile(pic, new File(projectPath+File.separator+newFileName));
			 return path+"/"+newFileName;   
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
          
          return null;
	}

}
