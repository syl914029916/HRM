package org.fkjava.hrm.bean;

import java.text.SimpleDateFormat;

/**
 * @author CHUNLONG.LUO
 * @email  584614161@QQ.COM
 * @date   2016年2月3日
 * @version 1.0
 */
public class Employee_demo {

	//{"编号","姓名","性别","手机","邮箱","职位","学历","身份证号码","部门","联系地址","建档日期"}
			
	    private int id;
		private String name;
		private String sex;
		private String phone;
		private String email;
		private String job;
		private String education;
		private String cardId;
		private String dept;
		private String address;
		private String createDate;
	
	
	      
			
			
			
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getSex() {
				return sex;
			}
			public void setSex(int sex) {
				if(sex==1){
					this.sex = "男";
				}else{
					this.sex = "女";
				}
			}
			public String getPhone() {
				return phone;
			}
			public void setPhone(String phone) {
				this.phone = phone;
			}
			public String getEmail() {
				return email;
			}
			public void setEmail(String email) {
				this.email = email;
			}
			public String getJob() {
				return job;
			}
			public void setJob(String job) {
				this.job = job;
			}
			public String getEducation() {
				return education;
			}
			public void setEducation(String education) {
				this.education = education;
			}
			public String getCardId() {
				return cardId;
			}
			public void setCardId(String cardId) {
				this.cardId = cardId;
			}
			public String getDept() {
				return dept;
			}
			public void setDept(String dept) {
				this.dept = dept;
			}
			public String getAddress() {
				return address;
			}
			public void setAddress(String address) {
				this.address = address;
			}
			public String getCreateDate() {
				return createDate;
			}
			public void setCreateDate(java.util.Date createDate) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				this.createDate = sdf.format(createDate);
			}
			
			
}
