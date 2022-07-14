<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl"
         pageEncoding="utf-8" %>
<%
    PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
    //设置服务器页面
    poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
   //添加打开文件后自动触发的事件
    poCtrl.setJsFunction_AfterDocumentOpened("AfterDocumentOpened");
    //打开Word文档
    poCtrl.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张佚名");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用JS给文件插入图片</title>
</head>
<body>


<script type="text/javascript">

	function AfterDocumentOpened(){
      locateBookMark();
      document.getElementById("PageOfficeCtrl1").InsertInlineWebImage("doc/logo.jpg");
	}

    //定位书签到光标处
    function locateBookMark() {
		var bkName = "PO_logo";
		poapplication.ActiveDocument.Bookmarks.Item("PO_logo").Select()
    }
</script>
<div style="width:auto; height:670px;">
    <%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
</div>

</body>
</html>
