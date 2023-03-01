package org.fkjava.hrm.util.dwr;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.io.FileTransfer;

public class FileUpload {

	   //文件上传成功后，将文件的路径返回至页面
	   public String picUpload(FileTransfer file){
		   
		   //获取项目部署路径  由于通过DWR发送请求的时候不会经过Struts2    ServletActionContext会为空
		   String projectPath = WebContextFactory.get().getServletContext().getRealPath("/images/emp");
		   
		   File f = new File(projectPath);
		   if(!f.exists()){
			   f.mkdirs();
		   }
		   try {
			   //给文件重命名
			   String newFileName = UUID.randomUUID().toString() +"."+FilenameUtils.getExtension(file.getFilename());
			   
			   //拷贝文件
			   FileUtils.copyInputStreamToFile(file.getInputStream(), new File(projectPath+File.separator+newFileName));
			   return "/images/emp/"+newFileName;
		   } catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  
		   return null;
		 
	   }
}
