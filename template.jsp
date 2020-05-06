<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script type="text/javascript">
    	var s = ${param.pid}+1;
    	if(s==1){
    		window.location.href="index.jsp";
    	}
    </script>
    <style type="text/css">
        *{margin: 0;padding: 0;border: 0;outline: none;}
        body{width: 100%;height: 100%;overflow: hidden;}
        .body{position: relative;z-index: 1000;}
        header{height: 70px;background: -webkit-linear-gradient(135deg, #75ac82, rgba(151, 203, 204, 0.43), #75ac82, rgba(151, 203, 204, 0.75));animation: bg 6s linear infinite;}
        @keyframes bg{from{background-position: -4000px 0;;}} header h6{color: red;font-size: 40px;text-align: center;text-shadow: 0px 0px 2px #e6e6e6, 0px 1px 1px #ddd, 0px 2px 1px #eeeeee, 0px 3px 1px #e6e6e6, 0px 4px 1px #c5c5c5, 0px 5px 1px #c1c1c1, 0px 6px 1px #bbb, 0px 7px 1px #777, 0px 8px 3px rgba(100, 100, 100, 0.4), 0px 9px 5px rgba(100, 100, 100, 0.1), 0px 10px 7px rgba(100, 100, 100, 0.15), 0px 11px 9px rgba(100, 100, 100, 0.2), 0px 12px 11px rgba(100, 100, 100, 0.25), 0px 13px 15px rgba(100, 100, 100, 0.3);line-height: 60px;font-family:"幼圆";letter-spacing: 40px;}
        label,textarea{display: block;resize: none}
        #context{font-size: 16px;font-family:"微软雅黑";width: 960px;height: 300px;padding: 10px;background: rgba(56, 56, 56, 0.58);color: #ffffff;overflow-x: hidden;border-radius: 5px;box-shadow: 0 0 10px #fff;transition: .4s}
        label{color: #ffffff;width: 300px;height: 50px;line-height: 50px;font-size: 24px;}
        select,#title,#auth{width: 200px;height: 30px;font-size: 20px;padding-left: 6px;background: rgba(56, 56, 56, 0.58);color: #ffffff;box-shadow: 0 0 10px #fff;}
        #CMS_html{width: 1000px;margin: 0 auto;margin-top: 30px;}
        a{text-decoration: none;text-align: center;}
        ::selection{background:#72d0eb;color:#fff;text-shadow:none}
        .sub-btn{display: block;width: 300px;height: 40px;margin: 20px auto;font-size: 20px;background: -webkit-linear-gradient(45deg, #9a9a9a, #a1b3b9, #90aca5, #797979,#6e6894,#867e7e);;border-radius: 4px;color: #eee;transition: .4s;}
        .sub-btn:hover{box-shadow:0 0 0 2px #fff;background: -webkit-linear-gradient(45deg, rgba(163, 200, 146, 0.8), rgba(152, 213, 164, 0.91), rgba(130, 193, 157, 0.68), rgba(129, 205, 151, 0.83),#6e6894,#867e7e);;color: #fff;}
        .tags a:hover{color: #000;background-color: #fff;cursor: pointer;box-shadow: 3px 3px 40px #48e0d3;}
        select,input[type='text']{border-radius: 5px;}
        select{margin-left:-6px;width: 206px;}
        .clear{clear: both;}
    </style>
</head>
<body>
<canvas id="canvas" width="1536" height="734" style="position: absolute;"></canvas>
<div class="body">
    <header>
       <h6>添加文档</h6>
    </header>
    <div id="CMS_html">
            <div style="width: 300px;float: left;">
                <label>
                    <font color="#fff">模板：</font>
                    <select name="moban" id="moban">
                        <option value="">---请选择模板---</option>
                        <option value="defult" selected>默认模板</option>
                        <option value="html">html模板</option>
                        <option value="smart">智能模板</option>
                        <option value="simple">简单模板</option>
                    </select>
                </label>
                <label for="title">标题：<input type="text" name="title" id="title" autocomplete="off"></label>
                <label for="auth">作者：<input type="text" name="auth" id="auth"></label>
                <label style="height: 30px;line-height: 20px"><font style="font-size: 14px;color: red;">内容(可包含html代码)</font></label>
            </div>
        <textarea name="context" id="context" cols="30" rows="10"></textarea>
        <input type="button" value="发布" class="sub-btn">
    </div>
</div>
<div class="none" style="display:none;"></div>
<div class="tags_none" style="display:none;"></div>
<script src="js/xingkong.js"></script>
<script src="js/jquery.min.js"></script>
<script>
    $(".sub-btn").click(function() {
       $(".none,.tags_none").html("");
       var content =$("#context"),conArr=[],h2=1
       var html = "";
       conArr = content.val().split("\n");
       var layout = conArr.shift().split(",");//第一行
       var len = conArr.length;
       var index = 0;
	   for(var k=1;k<len;k++){
		    var lay_k = layout[index++];
		    var lay = lay_k.split(":");
			var smartTagName = lay[0];
			try {
				var smartTagLines = parseInt(lay[1]);
			} catch (e) {
				
			}
		    switch (smartTagName) {
			case "p":
				html+="<p>";
	            var item;
	            for(var i=0;i<smartTagLines;i++){
	                item=conArr.shift().trim();
	                html+=(i==smartTagLines-1)?item:(item+"<br>");
	            }
	            html+="</p>";
	            k+=smartTagLines-1;
				break;
			case "pre":
				html+="<pre class='prettyprint linenums'><xmp>";
	            var item;
	            for(var i=0;i<smartTagLines;i++){
	                item=conArr.shift();
	                html+=(i==smartTagLines-1)?item:(item+"\n");
	            }
	            html+="</xmp></pre>";
	            k+=smartTagLines-1;
				break;
			case "div":
				html+="<div class='sc_act'>";
				var item;
				for (var int = 0; int < smartTagLines; int++) {
					item=conArr.shift();
					html+=(int==smartTagLines-1)?item:(item+"\n");
				}
				html+="</div>";
				k+=smartTagLines-1;
				break;
			case "h2":
				var item = conArr.shift().trim();
				html+="<h2 id='h"+h2+"'>"+item+"</h2>";
	        	$(".tags_none").append("<a href='#h"+h2+"' title='"+item+"'>"+item+"</a>");
	        	h2++;
				break;
			case "h3":
				html+="<h3>"+conArr.shift().trim()+"</h3>";
				break;
			case "ul":
				 html+="<ul>";
		            for(var i=0;i<smartTagLines;i++){
		               html+="<li>"+conArr.shift().trim()+"</li>";
		            }
		         html+="</ul>";
		         k+=smartTagLines-1;
				break;
			case "a":
				html+="<a href='"+lay[1]+"'>"+conArr.shift().trim()+"</a>";
				break;
			case "img":
				html+="<img href='/biji/htmlFiles/"+lay[1]+"'>"+conArr.shift().trim()+"</img>";
				k--;
				break;
			}
		}
	   $(".none").html(html);
	   var moban=$("#moban").select().val(),title=$("#title").val(),auth = $("#auth").val(),temple = $(".none").html(),tags=$(".tags_none").html();
	   console.log(html);
	    if(confirm("点确定我一键生成笔记")){
		   $.ajax({
	            type:"post",
	            url:"temple",
	            data:{"pid":${param.pid},"moban":moban,"title":title,"auth":auth,"temple":temple,"tags":tags},
	            success:function (data) {
	            	alert(data);
	            	window.location.href="/biji/index.jsp";
	            }
	        })  
	   } 
    })
</script>
</body>
</html>