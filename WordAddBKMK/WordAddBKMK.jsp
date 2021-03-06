<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl"
         pageEncoding="utf-8" %>

<%
    //******************************卓正PageOffice组件的使用*******************************
    PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
    poCtrl1.setServerPage(request.getContextPath() + "/poserver.zz"); //此行必须
    //隐藏菜单栏
    poCtrl1.setMenubar(false);
    //添加自定义按钮
    poCtrl1.addCustomToolButton("插入书签", "addBookMark", 5);
    poCtrl1.addCustomToolButton("删除书签", "delBookMark", 5);
    poCtrl1.webOpen("doc/template.doc", OpenModeType.docNormalEdit, "张三");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>在word当前光标处插入书签</title>
</head>
<body>
<form id="form1">
    <div style=" font-size:small; color:Red;">
        <label>关键代码：点右键，选择“查看源文件”，看js函数：</label>
        <label>function addBookMark() 和 function delBookMark()</label>
        <br/>
        <label>插入书签时，请先输入要插入的书签名称和文本；删除书签时，请先输入相应的书签名称！</label><br/>
        <label>书签名称：</label><input id="txtBkName" type="text" value="test"/>
        &nbsp;&nbsp;<label>书签文本：</label><input id="txtBkText" type="text" value="[测试]"/>
    </div>
    <input id="Button1" type="button" onclick="addBookMark();" value="插入书签"/>
    <input id="Button2" type="button" onclick="delBookMark()" value="删除书签"/>
    <div style=" width:auto; height:700px;">
        <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    </div>
</form>
<script type="text/javascript">
   //遍历当前文件中的所有书签
   /**
	function getBookMarkList(){
	  var VBAdoc = poapplication.ActiveDocument;
	  for(i=1; i<=VBAdoc.BookMarks.Count; i++)
	  {
		alert(VBAdoc.Bookmarks.Item(i).Name);//获取书签名称
        //alert(VBAdoc.Bookmarks.Item(i).Range.Text);//获取书签内容
	  }
	}
   */
     var bkName = document.getElementById("txtBkName").value;
     var bkText = document.getElementById("txtBkText").value;

	 //插入书签
     function  addBookMark()
     {
            var obj = poapplication.ActiveDocument;
            var bkName = document.getElementById("txtBkName").value;
            var bkText = document.getElementById("txtBkText").value;
            range = obj.Application.Selection.Range;
            range.Text = bkText;
            obj.Bookmarks.Add(bkName,  range);
			obj.Bookmarks.Item(bkName).Select();

      }
	  //删除书签
        function delBookMark()
       {
           var bkName = document.getElementById("txtBkName").value;
           var obj = poapplication.ActiveDocument;
           range = obj.Application.Selection.Range;
           if(obj.Bookmarks.Exists(bkName)){
               obj.Bookmarks.Item(bkName).Select();
               obj.Application.Selection.Range.Text = "";
           }
    
        }

</script>
</body>
</html>