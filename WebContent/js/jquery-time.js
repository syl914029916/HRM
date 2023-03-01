(function($){
	
	//给jQuery扩展类的方法以及属性
	$.extend({
		week:["星期天","星期一","星期二","星期三","星期四","星期五","星期六"],
        calcTime:function(time){
        	return time <10?"0"+time:time;
        }
	})
	
	
	
	//给jQuery对象扩展方法以及属性
	$.fn.extend({
		timeRun:function(){
			//获取当前时间  
		    var date = new Date();
		    //获取年
		    var year = date.getFullYear();
		    //获取月份
		    var month = date.getMonth()+1;
		    //获取天
		    var day = date.getDate();
		    
		    var weekIndex = date.getDay();
		   
		    //获取时分秒
		    var hour = date.getHours();
		    var mi= date.getMinutes();
		    var se = date.getSeconds();
		    
		    var timeStr = year+"年"+month+"月"+day+"日"+"&nbsp;"+$.week[weekIndex]+"&nbsp;"+$.calcTime(hour)+":"+$.calcTime(mi)+":"+$.calcTime(se);
		    
		    this.html(timeStr);

            var t = this;
			//启动定时器
		    window.setTimeout(function(){
		    	t.timeRun();
		    }, 1000);
		}
		
		
	})
	
	
})(jQuery)