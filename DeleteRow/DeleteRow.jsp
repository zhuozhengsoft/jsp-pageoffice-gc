<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl"
         pageEncoding="utf-8" %>
<%
    //******************************卓正PageOffice组件的使用*******************************
    PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
    poCtrl1.setServerPage(request.getContextPath() + "/poserver.zz"); //此行必须
    //隐藏菜单栏
    poCtrl1.setMenubar(false);
    poCtrl1.addCustomToolButton("删除行", "DeleteRow()", 1);
    poCtrl1.webOpen("doc/deleteWord.doc", OpenModeType.docNormalEdit, "张三");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>删除光标所在行</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<!-- ***************************PageOffice组件客户端Js代码******************************** -->
<script type="text/javascript">
            //删除word表格中光标所在行
            function DeleteRow() {
                var appObj =poapplication.ActiveDocument.Application;

                appObj.Selection.HomeKey(10);
                appObj.Selection.EndKey(10, true);
                appObj.Selection.Cells.Delete(2);
                appObj.Selection.TypeBackspace();
            }

    
</script>
“删除行”按钮可以删除光标所在行
<div style="width:auto; height:700px; ">
    <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
</div>
</body>
</html>
