package org.fkjava.hrm.action;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.fkjava.hrm.bean.Notice;
import org.fkjava.hrm.exception.HrmException;
import org.fkjava.hrm.service.HrmService;
import org.fkjava.hrm.service.impl.HrmServiceImpl;
import org.fkjava.hrm.service.proxy.ServiceProxy;
import org.fkjava.hrm.util.HrmContant;
import org.fkjava.hrm.util.webTag.PageModel;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class NoticeAction extends ActionSupport {

	private Notice notice;
	
	private PageModel pageModel = new PageModel();
	
	
	private List<Notice> notices;
	private String tip;
	
	//创建代理对象
	ServiceProxy serviceProxy = new ServiceProxy();
	HrmService hrmService = serviceProxy.bind(new HrmServiceImpl());
	
	private String ids;
	
	
	private File pic;//文件信息
	private String picFileName;//文件名
	
	
	//公告分页查询
	public String selectNoticeByPage(){
		try {
			
			notices = hrmService.selectNoticeByPage(notice,pageModel);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new HrmException(e);
		}
		return SUCCESS;
		
	}
	
	
	//公告删除
	public String deleteNoticeByIds(){
		try {
			
			hrmService.deleteNoticeByIds(ids.split(","));
			tip = "删除成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "删除失败！";
		}
		return SUCCESS;
		
	}
	
	//添加公告
	public String addNotice(){
		try {
			
			hrmService.addNotice(notice);
			tip = "添加成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "添加失败！";
		}
		return SUCCESS;
		
	}
	
	//根据公告id获取公告信息
	public String showUpdateNotice(){
		try {
			
			 notice = hrmService.getNoticeById(notice.getId());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return SUCCESS;
		
	}
	
	//更新公告
	public String updateNotice(){
		try {
			
			hrmService.updateNotice(notice);
			tip = "更新成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tip = "更新失败！";
		}
		return SUCCESS;
		
	}

	//根据公告的id获取公告内容
	public String prevNotice(){
		try {
			
			notice = hrmService.getNoticeById(notice.getId());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return SUCCESS;
		
	}
	
	
    //文件异步上传
	public String fileUpload(){
		try {
			
			//Gson 谷歌开发一个工具类  ，作用：可以将对象以及集合等装成json格式的字符窜
			String path = HrmContant.fileUpload(pic,picFileName,"/images/notice");
			
			//获取文件的后缀名
			String fileSuffix =  FilenameUtils.getExtension(picFileName);
			
			Map<String,String> map = new HashMap<>();
			if(fileSuffix.equals("jpg")||fileSuffix.equals("png")||fileSuffix.equals("jpeg")){
				//用户上传的是图片
				map.put("type", "image");
			}else{
				//用户上传的是  txt  ppt  doc  xls
				map.put("type", "file");
			}
			
			map.put("path", path);
			map.put("name", picFileName);
			
			Gson gson = new Gson();
			
			//将map集合转成json格式字符窜
			String jsonStr = gson.toJson(map);
			System.out.println("jsonStr:"+jsonStr);

            ServletActionContext.getResponse().getWriter().print(jsonStr);
            
            
            
            
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return NONE;    
		
	}
	
	

	public Notice getNotice() {
		return notice;
	}


	public void setNotice(Notice notice) {
		this.notice = notice;
	}





	public PageModel getPageModel() {
		return pageModel;
	}





	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}




	public List<Notice> getNotices() {
		return notices;
	}





	public void setNotices(List<Notice> notices) {
		this.notices = notices;
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
