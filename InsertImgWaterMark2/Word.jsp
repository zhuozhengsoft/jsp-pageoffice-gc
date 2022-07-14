<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl,com.zhuozhengsoft.pageoffice.wordwriter.WordDocument"
         pageEncoding="utf-8" %>
<%
    PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
    //设置服务器页面
    poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
    WordDocument doc = new WordDocument();
    //添加图片水印
    doc.getWaterMark().setImage("doc/logo.jpg");
    poCtrl.setWriter(doc);
    //打开Word文档
    poCtrl.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张佚名");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用JS给文档插入图片水印</title>
</head>
<body>
<div style="width:auto; height:670px;">
    <%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
</div>
</body>
</html>
