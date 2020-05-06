<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <title>个人笔记</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0">
    <style>
*{margin: 0;padding: 0;}
a{text-decoration: none;}
ul{padding-left: 30px;list-style: none;}
li{line-height: 30px;}
@-webkit-keyframes html_page{from{opacity: 0;filter: alpha(opacity=0);-webkit-transform: perspective(400px) rotate3d(0, 1, 0, 0deg) scale3d(0.1, .5, .1) translate3d(0, 1000px, 0);transform: perspective(400px) rotate3d(0, 1, 0, 0deg) scale3d(0.1, .5, .1) translate3d(0, 1000px, 0);-webkit-animation-timing-function: cubic-bezier(0.55, .055, .675, .19);animation-timing-function: cubic-bezier(0.55, .055, .675, .19)}
60%{opacity: 1;filter: alpha(opacity=100);-webkit-transform: perspective(400px) rotate3d(0, 1, 0, -270deg) scale3d(0.075, .475, .475) translate3d(0, 100px, 0);transform: perspective(400px) rotate3d(0, 1, 0, -480deg) scale3d(0.075, .475, .475) translate3d(0, 100px, 0);-webkit-animation-timing-function: cubic-bezier(0.175, .885, .32, 1);animation-timing-function: cubic-bezier(0.175, .885, .32, 1)}
80%{-webkit-transform: perspective(400px) rotate3d(0, 1, 0, -480deg) scale3d(0.075, .475, .475) translate3d(0, 100px, 0);transform: perspective(400px) rotate3d(0, 1, 0, -480deg) scale3d(0.075, .475, .475) translate3d(0, 100px, 0);animation-timing-function: cubic-bezier(0.075, .885, .32, 1)}}
body{background: #eee;animation: html_page .5s ease-in-out}
/*header start*/header.header{height: 170px;margin-bottom:10px;background: url("images/header.jpg");background-size: cover;line-height: 170px}
a.con-logo{text-decoration: none;color: #ffffff;font-family: "楷体"}
.con-logo div{line-height: 170px;font-size: 50px;min-width: 300px}
.g-mono{letter-spacing: 2px;transition: 0.3s}
.g-mono:hover{letter-spacing: 10px}
/*header end*//*树形菜单*/.tree-wrap{display: inline-block;width: 100%;height: 100%;max-width:320px;background:#fff;overflow: auto;top: 0;right: 0;position: absolute;}
#treeView{float:left;width:100%}
#treeView > ul{padding-left: 4px;padding-right: 20px;overflow: hidden;}
#treeView > ul::-webkit-scrollbar-button,content::-webkit-scrollbar-button{display: none}
#treeView > ul::-webkit-scrollbar-thumb,content::-webkit-scrollbar-thumb{display: none}
#treeView > ul::-webkit-scrollbar,content::-webkit-scrollbar{display: none}
.menu a{display: block;width: 100%;height: 30px;color: #1c2b3e;/*text-shadow: 0px 0px 2px #686868, 0px 1px 1px #ddd, 0px 2px 1px #d6d6d6, 0px 3px 1px #ccc, 0px 4px 1px #c5c5c5, 0px 5px 1px #c1c1c1, 0px 6px 1px #bbb, 0px 7px 1px #777, 0px 8px 3px rgba(100, 100, 100, 0.4), 0px 9px 5px rgba(100, 100, 100, 0.1), 0px 10px 7px rgba(100, 100, 100, 0.15), 0px 11px 9px rgba(100, 100, 100, 0.2), 0px 12px 11px rgba(100, 100, 100, 0.25), 0px 13px 15px rgba(100, 100, 100, 0.3);*/line-height: 30px;transition: all .1s linear;}
.menu a:hover{background: #7f7f7f;color: #ffffff;box-shadow: -10px 0 0 #7f7f7f, 30px 0 0 #7f7f7f;/*text-shadow: 0px 0px 2px #686868, 0px 1px 1px #fff, 0px 2px 1px #fff, 0px 3px 1px #fff, 0px 4px 1px #fff, 0px 5px 1px #fff, 0px 6px 1px #fff, 0px 7px 1px #777, 0px 8px 3px #fff, 0px 9px 5px #fff, 0px 10px 7px #fff, 0px 11px 9px #fff, 0px 12px 11px #fff, 0px 13px 15px #fff;*/}
.menu a span{display: inline-block;min-width: 20px;}
i{width: 20px;height: 20px;display: inline-block;vertical-align: middle;}
.ico{background: url("images/list.png") no-repeat center center;background-size: 20px 20px;}
.h-ico{background: url("images/html.png") no-repeat center center;background-size: 20px 20px;}
/*树形菜单*//*内容*/.content{height:100%;position: absolute;display: inline-block;top: 0;left: 0;background: #fff;width: 80%;}
/*内容*/.f-thide{overflow: hidden;text-overflow: ellipsis;white-space: nowrap;word-wrap: normal;}
::selection{background: #72d0eb;color: #fff;text-shadow: none}
.content-wrap{position: relative;width: 90%;background:#eee;margin:0 auto;height: 100%;min-height: 555px}
#BJ_html{width: 100%;height:100%}
    </style>
  </head>
  <body>
<div class="biji">
    <!--header start-->
        <header class="header row">
            <div class="g-logo col-sm-12" align="center">
                <a href="index.jsp" class="con-logo">
                    <div>
                        <span class="g-mono">a'ゞ『个人笔记』</span>
                        <span class="g-bloger"><font size="4">不一样的笔记</font></span>
                    </div>
                </a>
            </div>
        </header>
        <!--header end-->
   <div class="content-wrap">
       <div class="tree-wrap"><div id="treeView"></div></div>
       <div class="content">
           <iframe src="temple/defult/模板文件.html" frameborder="0" id="BJ_html" name="BJ_html" onload="iFrameHeight()"></iframe>
       </div>
   </div>
</div>
<!-- 小火箭样式 -->
<style type="text/css">
    #rocket-to-top div{left: 0;margin: 0;overflow: hidden;padding: 0;position: absolute;top: 0;width: 149px;}
    #rocket-to-top .level-2{background: url(images/rocket_button_up.png) no-repeat scroll -149px 0 transparent;display: none;height: 250px;opacity: 0;z-index: 1;}
    #rocket-to-top .level-3{background: none repeat scroll 0 0 transparent;cursor: pointer;display: block;height: 150px;z-index: 2;}
    #rocket-to-top{background: url(images/rocket_button_up.png) no-repeat scroll 0 0 transparent;cursor: default;display: block;height: 250px;margin: -125px 0 0;overflow: hidden;padding: 0;position: fixed;right: 0;top: 80%;width: 149px;z-index: 11;}
</style>
<div style="display: none;" id="rocket-to-top">
    <div style="opacity:0;display: block;" class="level-2"></div>
    <div class="level-3"></div>
</div>
<!-- 右键菜单样式 -->
<style>
#contextmenu,#contextmenu2{position: fixed;padding:0;box-shadow: 0px 1px 16px 0 rgba(90, 109, 122, 0.41);}
#contextmenu li,#contextmenu2 li{height: 40px;line-height: 40px;background: #fff;padding-left: 10px;padding-right: 10px;}
#contextmenu li:hover ,#contextmenu2 li:hover{color: #76b0f3;background: #f4f9ff;cursor: pointer;}
</style>
<ul id="contextmenu" style="display: none">
    <li class="menu_1">新建文件夹</li>
    <li class="menu_2">新建文档</li>
    <li class="menu_3">删除</li>
    <li class="menu_4">重命名</li>
</ul>
<ul id="contextmenu2" style="display: none">
    <li class="menu_5">修改</li>
    <li class="menu_3">删除</li>
    <li class="menu_4">重命名</li>
</ul>
  <script src="js/jquery.min.js"></script>
  <script src="js/scrollTop.js"></script>
  <script>
  	  	var tree = $("#treeView"),h = $(window).height(),maxId;
	  	function init(d) {
		      tree.html(treeHtml(d.d, -1));
		      $(".content").css("width",$(".content-wrap").width()-$(".tree-wrap").width()-10+"px");
		      $(".ico").parent("a").click(function () {
		    	  $(this).next("ul").slideToggle();
		      }).trigger("click");
		      $("a[data-file-id='1']").trigger("click");
		      $("#treeView > ul > li > ul > li > a").trigger("click");
		  }
	    function data(d){
			maxId = d.d.length+1;
			init(d);
	    }
  		function treeHtml(data,id) {
  	        var html='';
  	        var children = getChildById(data,id);
  	        var className = 'menu';
  	      	html+=(children.length)?"<ul class='"+className+"'>":"";
  	        //循环递归json数据
  	      	children.forEach(function (item,index) {
  	        	var isUrl=item.url=="javascript:;",ico=isUrl?"ico":"h-ico",_url = isUrl?item.url:"html/"+item.url;
  	        	//鼠标右键事件
  	        	var menu = isUrl?"oncontextmenu='contextmenu(this)'":"oncontextmenu='contextmenu2(this)'";
  	        	html+="<li><a "+menu+" target='BJ_html' title='"+item.title+"' class='f-thide' data-file-id='"+item.id+"' href='"+_url+"'><i class='"+ico+"'></i><span>"+item.title+"</span></a>"+treeHtml(data, item.id)+"</li>";
  	        });
  	      	html+=(children.length)?"</ul>":"";
  	        return html;
  	      }
  		
  		//通过pid(父id)查找数据的id(子id)
  	    function getChildById(arr,pid){
            var newArr = [];
            for( var i = 0,l=arr.length; i < l; i++ ){
                if( arr[i].pid == pid ){
                    newArr.push(arr[i]);
                }
            }
            return newArr;
        }
  	    //解决iframe的高度问题
		function iFrameHeight(){
			var ifm = document.getElementById("BJ_html");
			var subWeb = document.frames ? document.frames["BJ_html"].document : ifm.contentDocument;
			if(ifm != null && subWeb != null) {
				var _height = $(subWeb.body).find("#article").height()||$(subWeb.body).find(".WordSection1").height();
				$(".content-wrap").css("height",_height+100+"px");
			}
		}
  	    //右键菜单逻辑
		$(window).scroll(function(){
			$("#contextmenu,#contextmenu2").hide();
		});
		function contextmenu(_this){
			var e = event||window.event,x=e.clientX,y=e.clientY;
		    $("#contextmenu").css({'top':y+'px','left':x+'px'}).show().attr("data-id",$(_this).attr("data-file-id"));
		}
		function contextmenu2(_this){
			var e = event||window.event,x=e.clientX,y=e.clientY;
		    $("#contextmenu2").css({'top':y+'px','left':x+'px'}).show().attr("data-id",$(_this).attr("data-file-id"));
		}
		//屏蔽浏览器默认右键菜单
		$(document).contextmenu(function(){return false;});
		$(window).click(function(){$("#contextmenu,#contextmenu2").hide();})
		//点击右键菜单实现增删改查
		$("#contextmenu li,#contextmenu2 li").click(function(){
			var curA = $("a[data-file-id='"+$(this).parent().attr("data-id")+"']"),_this=$(this);
			if(_this.is(".menu_1")){
				curUl = curA.next("ul");
				if(curUl.length>0){
					if(curUl.css("display")=="none")curA.trigger("click");
					curUl.append("<li><a oncontextmenu='contextmenu(this)' target='BJ_html' title='新建文件夹' class='f-thide' data-file-id='"+maxId+"' href='javascript:;'><i class='ico'></i><span>新建文件夹</span></a></li>");
				}else{
					curA.parent("li").append("<ul><li><a oncontextmenu='contextmenu(this)' target='BJ_html' title='新建文件夹' class='f-thide' data-file-id='"+maxId+"' href='javascript:;'><i class='ico'></i><span>新建文件夹</span></a></li><ul>");
				}
				$("a[data-file-id='"+maxId+"']").find("span").attr("contenteditable",true).get(0).focus();
				maxId++;
			}else if(_this.is(".menu_2")){
				window.open("template.jsp?pid="+curA.attr("data-file-id"));
			}else if(_this.is(".menu_3")){
				if(confirm("你确定要删除吗?")){
					$.ajax({
						type:"post",
						url:"user",
						data:{"action":"delete","id":curA.attr("data-file-id")},
						success:function(data){
							if(data==1){
								alert("删除成功");
								curA.remove();
							}else{
								alert("删除失败");
							}
						}
					  }) 
				}
			}else if(_this.is(".menu_4")){
				curA.find("span").attr("contenteditable",true).get(0).focus();
			}
			$("span[contenteditable='true']").blur(function(){
				$(this).attr("contenteditable",false);
				if(_this.is(".menu_1")){
					$.ajax({
					type:"post",
					url:"user",
					data:{"action":"add","title":$(this).html(),"pid":curA.attr("data-file-id")},
					success:function(data){
						if(data==1){
							alert("添加成功");
						}else{
							alert("添加失败");
						}
					}
				  })
				}else if(_this.is(".menu_4")){
					$.ajax({
						type:"post",
						url:"user",
						data:{"action":"alter","title":$(this).html(),"id":curA.attr("data-file-id")},
						success:function(data){
								if(data==1){
									alert("操作成功");
								}else{
									alert("操作失败");
								}
							}
						})
					}
				})
			})
  	</script>
  	<script src="<%=basePath%>data?callback=data"></script>
  </body>
</html>