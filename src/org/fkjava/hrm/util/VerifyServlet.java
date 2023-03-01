package org.fkjava.hrm.util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 生成验证码
 */
public class VerifyServlet extends ActionSupport {
	
      public String execute(){
       // TODO Auto-generated method stub
		 //生成验证码随机岁
		 String randomCode = creadeCode();
         ServletActionContext.getRequest().getSession().setAttribute(HrmContant.VCODE, randomCode);	
         
         //通过ａｗｔ   swing画验证码
         //准备画布
         BufferedImage image = new BufferedImage(70, 25, BufferedImage.TYPE_INT_RGB);
         
         //创建2d画笔
         Graphics2D s2d = image.createGraphics();
         
         //给画布填充背景色
         s2d.setColor(Color.white);
         s2d.drawRect(0, 0, 70, 25);
         
         //设置干扰线的宽度
         s2d.setStroke(new BasicStroke(2.0f));
         
         Random random = new Random();
         //画干扰线
         for(int i=0;i<100;i++){
        	 int r = random.nextInt(255);
        	 int g = random.nextInt(255);
        	 int b = random.nextInt(255);
        	 
        	 Color c = new Color(r, g, b);
        	 
        	 //给画笔填充颜色
        	 s2d.setColor(c);
        	 
        	 //指定干扰线的位置
        	 int x = random.nextInt(70);
        	 int y = random.nextInt(25);
        	 s2d.drawLine(x, y, x, y);
        	 
         }
         
         //设置画笔颜色
         s2d.setColor(Color.red);
         
         //设置字体大小
         s2d.setFont(new  Font("宋体", Font.BOLD, 24));
         
         //将随机数画在画布上
         s2d.drawString(randomCode, 10, 22);
         
         //将验证码响应至客户端
        //设置响应头为image/png，得到一个OutputStream
         ServletActionContext.getResponse().setContentType("image/png");
         try {
        	  OutputStream out = ServletActionContext.getResponse().getOutputStream();
              
              ImageIO.write(image, "png", out);
              
              //刷新
              out.flush();
              out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
       
         
		 //处理异步请求后者直接将数据响应给用户时，需要返回NONE， 返回SUCCESS|INPUT等必定需要配置一个result
		return NONE;
	}

	//生成随机数
	private String creadeCode() {
		// TODO Auto-generated method stub
		StringBuffer sbf = new StringBuffer();
		Random random = new Random();
		for(int i=0;i<4;i++){
			int code = random.nextInt(10);
			sbf.append(code);
		}
		return sbf.toString();
	}

	
	public void setDate(){
		
	}
}
