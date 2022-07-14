<%@ page language="java" import="com.zhuozhengsoft.pageoffice.PDFCtrl" pageEncoding="utf-8" %>
<%
    PDFCtrl pdfCtrl1 = new PDFCtrl(request);
    pdfCtrl1.setServerPage(request.getContextPath() + "/poserver.zz"); //此行必须
    pdfCtrl1.setZoomSealServer("http://dp.zoomsealent.cn:8080/ZoomSealEnt/enserver.zz");//设置zoomseal签章服务地址
    //设置保存页面
    pdfCtrl1.setSaveFilePage("SaveFile.jsp");
    pdfCtrl1.webOpen("test.pdf");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="overflow:hidden">
<!--**************   卓正 PageOffice 客户端代码开始    ************************-->
<script language="javascript" type="text/javascript">
	function Save() {
		document.getElementById("PDFCtrl1").WebSave();
	}

	function InsertSeal() {
		try {
			document.getElementById("PDFCtrl1").ZoomSeal.AddSeal();//如果使用ZoomSeal中的USBKEY方式盖章，第一个参数不能为盖章用户登录名，只能为null或者空字符串
		} catch(e) {}
	}
				
</script>
<div style="height:850px;width:auto;">
    <%=pdfCtrl1.getHtmlCode("PDFCtrl1")%>
</div>
</body>
</html>