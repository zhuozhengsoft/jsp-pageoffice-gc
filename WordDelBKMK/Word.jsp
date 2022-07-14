<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="utf-8"%>

<%
//******************************卓正PageOffice组件的使用*******************************
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	//隐藏菜单栏
	poCtrl1.setMenubar(true);
	//添加自定义按钮
    poCtrl1.addCustomToolButton("删除光标处的","delBookMark()",0);
    poCtrl1.addCustomToolButton("删除选中文本中的","delChoBookMark()",0);
	poCtrl1.webOpen("doc/template.doc", OpenModeType.docNormalEdit, "张三");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head> 
        <title>js删除光标位置的书签</title>

   </head>
<body>
    <span style="color:red"> 删除当前光标所在位置的光标::将光标放在指定书签上，点击删除当前光标所在位置书签按钮</span>
        <label>关键代码：点右键，选择“查看源文件”，看js函数：</label>
        <label style="color:blue">function  delBookMark()</label>
    <br/>
    <span style="color:red">删除所选文本中的书签：选择文本内容，点击删除选择文本内容中的书签按钮，然后看效果</span>
        <label >关键代码：点右键，选择“查看源文件”，看js函数：</label>
        <label style="color:blue">function  delChoBookMark()</label>
    <br/>
    <span>模板中的</span><span>【xxxxx】</span><span>代表书签;&nbsp;或者可以选择   插入->书签->定位进行查看书签位置</span><br/>
    <input id="Button1" type="button" onclick="delBookMark();"    value="删除当前光标所在位置的书签" /> &nbsp;&nbsp;
    <input id="Button1" type="button" onclick="delChoBookMark();" value="删除选中文本内容中的书签" /> &nbsp;&nbsp;
     <div style="width:auto; height:700px;">
                <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    </div>
  <script type="text/javascript">
    //删除当前光标所在位置的书签
    function delBookMark() {
	    var VBAdoc = poapplication.ActiveDocument;
		if(VBAdoc.Application.Selection.Bookmarks.Count > 0){
		      VBAdoc.Application.Selection.Bookmarks.Item(1).Select();
              VBAdoc.Application.Selection.Range.Text = "";
		}else{
			alert("当前光标处没有书签！");
		}
    }

    //删除选中文本的内容中的书签   
	 function delChoBookMark() {
	   var VBAdoc = poapplication.ActiveDocument;
	   //判断当前是否选择了文本内容
	   if (VBAdoc.Application.Selection.Range.Text != ""){
		  //判断选择的文本中是否有书签
		  if(VBAdoc.Application.Selection.Bookmarks.Count >= 1){
             //遍历循环删除书签
			  for(i=1;i<VBAdoc.Application.Selection.Bookmarks.Count;i++){
				  VBAdoc.Application.Selection.Bookmarks.Item(i).Select();
                  VBAdoc.Application.Selection.Range.Text = "";
			   }
		  }else{
              alert("选择的文本中没有书签");
		  }
      } else{
		  alert("您没有选择任何文本");
	  }
	 }
</script>

</body>
</html>





