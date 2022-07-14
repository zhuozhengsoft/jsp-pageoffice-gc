<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.OpenModeType,com.zhuozhengsoft.pageoffice.PageOfficeCtrl"
         pageEncoding="utf-8" %>
<%
    //******************************卓正PageOffice组件的使用*******************************
    //设置PageOffice服务器组件
    PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
    poCtrl1.setServerPage(request.getContextPath() + "/poserver.zz"); //此行必须
    //设置PageOfficeCtrl控件的标题栏名称
    poCtrl1.setCaption("Word文档保存后获取返回值");
    //隐藏菜单栏
    //poCtrl1.setMenubar(false);
    //添加自定义按钮
    poCtrl1.addCustomToolButton("保存", "Save()", 1);
    poCtrl1.addCustomToolButton("关闭", "Close()", 21);
    poCtrl1.setSaveFilePage("SaveFile.jsp");
    //打开文件
    poCtrl1.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张三");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Word文档保存后获取返回值</title>
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
            //document.getElementById("PageOfficeCtrl1").CustomSaveResult获取的是保存页面的返回值
            alert("保存成功，返回值为：" + document.getElementById("PageOfficeCtrl1").CustomSaveResult);
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
    </script>
</head>
<body>
<form id="form1">
    <div style=" width:auto; height:700px;">
        <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    </div>
</form>
</body>
</html>
