package org.fkjava.hrm.util.excelpoi;

import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;


/*
 * 将数据导出至Excel文件
 * 
 * poi.jar
 * 
 * */
public class ExcelUtil {

	public static void exportDataToExcel(String fileName,String sheetName,String[] titles,List<?> datas) {
		// TODO Auto-generated method stub
		
		//创建Excel文件
		HSSFWorkbook book = new HSSFWorkbook();
		
		//创建单元薄
		HSSFSheet sheet = book.createSheet(sheetName);
		
		//创建标题行
		HSSFRow headRow = sheet.createRow(0);
		try {
			for(int i=0;i<titles.length;i++){
				//通过行创建列
				HSSFCell cell = headRow.createCell(i);
				
				//给列赋值
				cell.setCellValue(titles[i]);
			}
			
			if(datas.size()>0){
				//获取目标对象对应的类
				Class<?> clazz = datas.get(0).getClass();
				Field[] fields = clazz.getDeclaredFields();
				//填充查询到的数据信息   
				for(int i=0;i<datas.size();i++){
					
					//创建数据行
					HSSFRow row = sheet.createRow(i+1);
		          
					for(int j=0;j<fields.length;j++){
						//创建列
						HSSFCell cell = row.createCell(j);
						
						if(!fields[j].isAccessible()){
							fields[j].setAccessible(true);
						}
						
						
						//获取属性对应的值
						Object value = fields[j].get(datas.get(i));
						cell.setCellValue(value==null?"":value.toString());
					}
				}
			}
			
			
			
			
			//判断浏览器类型 防止中文乱码
			String userAgent =  ServletActionContext.getRequest().getHeader("user-agent");

			if (userAgent.toLowerCase().indexOf("msie") != -1){
				fileName = URLEncoder.encode(fileName, "utf-8"); // msie
			}else{
				fileName = new String(fileName.getBytes("utf-8"), "iso8859-1");
			}
			
			//<param name="contentDisposition">attachment;filename="${picFileName}"</param>
            ServletActionContext.getResponse().setHeader("content-disposition", "attachment;filename="+fileName);
			
            //将文件响应至客户端
            book.write(ServletActionContext.getResponse().getOutputStream());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
	
		
	}

}
