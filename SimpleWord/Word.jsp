<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl"
         pageEncoding="utf-8" %>
<%
    PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
    //设置服务器页面
    poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
    //添加自定义按钮
    poCtrl.addCustomToolButton("保存", "Save", 1);
    poCtrl.addCustomToolButton("另存为", "SaveAs", 11);
    poCtrl.addCustomToolButton("页面设置", "PrintSet", 0);
    poCtrl.addCustomToolButton("打印", "PrintFile", 6);
    poCtrl.addCustomToolButton("全屏/还原", "IsFullScreen", 4);
    poCtrl.addCustomToolButton("-", "", 0);
    poCtrl.addCustomToolButton("关闭", "Close", 21);
    //设置保存页面
    poCtrl.setSaveFilePage("SaveFile.jsp");
    //打开Word文档
    poCtrl.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张佚名");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title> 选项卡</title>
</head>
<body>
<script type="text/javascript">
    function Save() {
        document.getElementById("PageOfficeCtrl1").WebSave();
    }

   function SaveAs() {     
            document.getElementById("PageOfficeCtrl1").ShowDialog(3);
    }


    function PrintSet() {
          document.getElementById("PageOfficeCtrl1").ShowDialog(5);//页面设置
    }

    function PrintFile() {
       document.getElementById("PageOfficeCtrl1").ShowDialog(4);
    }

    function Close() {
		if(navigator.userAgent.toLowerCase().indexOf("linux")>0){
            window.opener = null;
            window.open('', '_self');
            window.close();
		}else{
			 window.external.close();
		}
    }

    function IsFullScreen() {
        document.getElementById("PageOfficeCtrl1").FullScreen = !document.getElementById("PageOfficeCtrl1").FullScreen;
    }

    
</script>
    <div style="height:900px;width:auto;">
        <%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
    </div>
   
</body>
</html>
