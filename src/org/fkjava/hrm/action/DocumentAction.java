package org.fkjava.hrm.action;


import java.io.File;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.Document;
import org.fkjava.hrm.bean.Notice;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.service.impl.HrmServiceImpl;
import org.fkjava.hrm.service.proxy.ServiceProxy;
import org.fkjava.hrm.util.HrmContant;
import org.fkjava.hrm.util.webTag.PageModel;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class DocumentAction extends ActionSupport {

	private Document document;
	
	private PageModel pageModel = new PageModel();
	
	
	private List<Document> documents;
	private String tip;
	
	//创建代理对象
	ServiceProxy serviceProxy = new ServiceProxy();
	HrmService hrmService = serviceProxy.bind(new HrmServiceImpl());
	
	private String ids;
	
	private File pic;
	private String picFileName;
	
	//文档分页查询
	public String selectDocumentByPage(){
		try {
			
			documents = hrmService.selectDocumentByPage(document,pageModel);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new HrmException(e);
		}
		return SUCCESS;
		
	}
	
	//删除文档信息
	public String deleteDocumentById(){
		try {
			
			hrmService.deleteDocumentById(document.getId());
			tip = "删除成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "删除失败！";
		}
		return SUCCESS;
		
	}
	
	//添加文档信息
	public String addDocument(){
		try {
			
			hrmService.addDocument(pic,picFileName,document);
			tip = "添加成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "添加失败！";
		}
		return SUCCESS;
		
	}
	
	
	//跳转至修改文档页面
	public String showUpdateDocument(){
		try {
			
			document = hrmService.getDocumentById(document.getId());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return SUCCESS;
		
	}


	//修改文档
	public String updateDocument(){
		try {
			
			hrmService.updateDocument(pic,picFileName,document);
			tip = "修改成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "修改失败！";
		}
		return SUCCESS;
		
	}
	
	
	//判断文件是否存在
	public String downFile(){
		try {
			//判断文件是否存在
			String projectPath = ServletActionContext.getServletContext().getRealPath("/");
			File file = new File(projectPath+document.getUrl());
			if(!file.exists()){
			   return INPUT;	
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	//下载文件
	public InputStream getInputStream(){

		String userAgent =  ServletActionContext.getRequest().getHeader("user-agent");
		try {
			if (userAgent.toLowerCase().indexOf("msie") != -1){
				picFileName = URLEncoder.encode(document.getFileName(), "utf-8"); // msie
			}else{
				picFileName = new String(document.getFileName().getBytes("utf-8"), "iso8859-1");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
		
		return ServletActionContext.getServletContext().getResourceAsStream(document.getUrl());
	}
	

	public Document getDocument() {
		return document;
	}



	public void setDocument(Document document) {
		this.document = document;
	}



	public PageModel getPageModel() {
		return pageModel;
	}



	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}



	



	public List<Document> getDocuments() {
		return documents;
	}



	public void setDocuments(List<Document> documents) {
		this.documents = documents;
	}



	public String getTip() {
		return tip;
	}



	public void setTip(String tip) {
		this.tip = tip;
	}



	public String getIds() {
		return ids;
	}



	public void setIds(String ids) {
		this.ids = ids;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	
	
	
	

}
