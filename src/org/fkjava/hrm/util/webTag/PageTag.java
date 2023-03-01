package org.fkjava.hrm.util.webTag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class PageTag extends TagSupport {
	private int pageIndex;//当前页码
	private int pageSize;//每页显示的记录数
	private int recordCount;//总记录数
	private String submitUrl;//提交地址   index.action?pageIndex={0}
	private String pageStyle = "yahoo2";
	
    private final String TAG = "{0}";
	public PageTag() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		System.out.println("===doEndTag====");
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		
		//获取输出流
		JspWriter write =  this.pageContext.getOut();
		
		StringBuffer sbf = new StringBuffer();
         
		//判断总记录是否大于零
		if(this.recordCount>0){
			
			String jumpUrl = "";
			//计算总页码
			int totalPage = this.recordCount % this.pageSize==0?this.recordCount / this.pageSize : this.recordCount / this.pageSize +1;
			
			//用于封装页码信息
			StringBuffer page = new StringBuffer();
			//假设当前页码是第一页
			if(this.getPageIndex()==1){
				page.append("&nbsp;&nbsp;&nbsp;<span class='disabled'>上一页</span>");
				
				//计算中间页码
				calcMiddlePage(page,totalPage);
				
				//判断下一页是否可点击
				if(totalPage==1){
					page.append("&nbsp;&nbsp;&nbsp;<span class='disabled'>下一页</span>");
				}else{
					//submitUrl:index.action?pageIndex={0}
					jumpUrl = this.submitUrl.replace(this.TAG, String.valueOf(this.pageIndex+1));
					page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpUrl+"'>下一页</a>");
				}
				
			//当前页码在尾页
			}else if(this.pageIndex==totalPage){
				jumpUrl = this.submitUrl.replace(this.TAG, String.valueOf(this.pageIndex-1));
				page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpUrl+"'>上一页</a>");
				
				
				//计算中间页码
				calcMiddlePage(page,totalPage);

				
				page.append("&nbsp;&nbsp;&nbsp;<span class='disabled'>下一页</span>");
			//当前页码既不在首页也不再尾页
			}else{
				//submitUrl:index.action?pageIndex={0}
				jumpUrl = this.submitUrl.replace(this.TAG, String.valueOf(this.pageIndex-1));
				page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpUrl+"'>上一页</a>");
				
				//计算中间页码
				calcMiddlePage(page,totalPage);

				
				jumpUrl = this.submitUrl.replace(this.TAG, String.valueOf(this.pageIndex+1));
				page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpUrl+"'>下一页</a>");
			}
			//计算开始行号以及结束行号  1 11 21 31 41 
			int startSize = (this.pageIndex -1) * this.pageSize + 1;
			//判断当前页码是不是最后一页  如果不是： this.pageIndex * this.pageSize 否则： recordCount
			int endSize = this.pageIndex == totalPage? this.recordCount:this.pageIndex * this.pageSize;
			/*****/
			/***color size *td**/
			sbf.append("<table align='center'  class='"+this.pageStyle+"' width='100%'><tr><td style='color:#606266;font-size:15px;'>"+page.toString()+"&nbsp;&nbsp;&nbsp;跳转到&nbsp;&nbsp;&nbsp;<input type='text' size='2' id='jump_num'/>"
					+ "&nbsp;&nbsp;&nbsp;<input type='button' style='padding:2px 10px  ;border-radius:3px;font-size:15px;border: 1px solid #4E6EF2;color: #4E6EF2;background:#ffffff;' value='跳转' id='jump_but'/></td></tr>");
			sbf.append("<tr><td style='color:#606266;font-size:15px;face:黑体;'>总共<font color='#4E6EF2'>"+this.recordCount+"</font>条记录,当前显示"+startSize+"-"+endSize+"条记录</td></tr>");
			sbf.append("</table>");
			/****/
			sbf.append("<script type='text/javascript'>");
		
			sbf.append("document.getElementById('jump_but').onclick = function(){");
			sbf.append("var value = document.getElementById('jump_num').value;");
			sbf.append("if(!/^[1-9]\\d*$/.test(value)||value > "+totalPage+"){");
			sbf.append("alert('请输入[1-"+totalPage+"]之间的页码值！');");
			sbf.append("}else{");
			// index.action?pageIndex = {0}
			sbf.append("var submiturl = '"+this.submitUrl+"';");
			sbf.append("submiturl = submiturl.replace('"+this.TAG+"',value);");
			sbf.append("window.location = submiturl;");
			
			sbf.append("}");
			
			sbf.append("}");
			sbf.append("</script>");
			
		}else{
			sbf.append("<table align='center' class='"+this.pageStyle+"'><tr><td>总共<font color='red'>0</font>条记录,当前显示0-0条记录</td></tr></table>");
		}
		
		
		
		try {
			write.print(sbf.toString());
			write.flush();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
 
		return SKIP_BODY;
	}

	//计算中间页码
	private void calcMiddlePage(StringBuffer page,int totalPage) {
		// TODO Auto-generated method stub
		String jumpuUrl = "";
		//假设页码数量小于等于10则全部显示    1 2 3 4 5 6 7 8 9 10
		if(totalPage <=10){
			for(int i =1;i<=totalPage;i++){
				//当前页码不能点击
				if(i==this.pageIndex){
					page.append("&nbsp;&nbsp;&nbsp;<span class='current'>"+i+"</span>");
				}else{
					jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(i));
					page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+i+"</a>");
				}
				
			}
			//当前页码靠近首页  1 2 3 4 5 6 7 8 9 ...100
		}else if(this.pageIndex<=8){
			
			for(int i=1;i<=9;i++){
				//当前页码不能点击
				if(i==this.pageIndex){
					page.append("&nbsp;&nbsp;&nbsp;<span class='current'>"+i+"</span>");
				}else{
					jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(i));
					page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+i+"</a>");
				}
			}
			
			page.append("...");
			
		
			//拼装尾页
			jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(totalPage));
			page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+totalPage+"</a>");
			
			//当前页码靠近尾页 1 ... 91 92 93 94 95 96 97 98 99 100	
		}else if(this.pageIndex+8>=totalPage){
			jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(1));
			page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+1+"</a>");
			
			page.append("&nbsp;&nbsp;&nbsp;...");
			
			for(int i = totalPage-9;i<=totalPage;i++){
				if(i==this.pageIndex){
					page.append("&nbsp;&nbsp;&nbsp;<span class='current'>"+i+"</span>");
				}else{
					jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(i));
					page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+i+"</a>");
				}
			}
		  //当前页码靠近在中间 1 ... 44 45 46 47 48 49 50 51 52 ... 100
		}else{
			jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(1));
			page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+1+"</a>");
			
			page.append("&nbsp;&nbsp;&nbsp;...");
			
			for(int i = this.pageIndex - 4;i<=this.pageIndex+4;i++){
				if(i==this.pageIndex){
					page.append("&nbsp;&nbsp;&nbsp;<span class='current'>"+i+"</span>");
				}else{
					jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(i));
					page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+i+"</a>");
				}
			}
			
			page.append("...");
			//拼装尾页
			jumpuUrl = this.submitUrl.replace(this.TAG, String.valueOf(totalPage));
			page.append("&nbsp;&nbsp;&nbsp;<a href='"+jumpuUrl+"'>"+totalPage+"</a>");
		}
		
		
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		System.out.println("pageIndex："+pageIndex);
		if(pageIndex==0){
			pageIndex = 1;
		}
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		System.out.println("pageSize："+pageSize);

		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		System.out.println("recordCount："+recordCount);

		this.recordCount = recordCount;
	}

	public String getSubmitUrl() {
		return submitUrl;
	}

	public void setSubmitUrl(String submitUrl) {
		this.submitUrl = submitUrl;
	}

	public String getPageStyle() {
		return pageStyle;
	}

	public void setPageStyle(String pageStyle) {
		this.pageStyle = pageStyle;
	}
	
	

}
