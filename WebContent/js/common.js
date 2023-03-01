(function(){

	$(function(){
		  
		
	  	  $("tr[id^='tr_']").hover(function(){
	      	  //触发mouseover事件
	            $(this).css("backgroundColor","#F2F6FC");       	  
	        },function(){
	      	  
	      	  //假设当前tr对应的checkbox是选中的状态则不去掉背景色
	      	  var trId = this.id;
	      	  var boxId = trId.replace("tr","check");
	      	  
	      	  //判断当前checkbox是否选中
	      	  var flag = $("#"+boxId).prop("checked");
	      	  if(!flag){
	      		  //触发mouseout事件
	                $(this).css("backgroundColor","#ffffff"); 
	      	  }
	      	       	  
	        })
		
	})	
	
	
	
})()
	
	
     
        