<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>盖章和签字专题</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <!-- pageoffice.js文件一定要引用-->
    <script type="text/javascript" src="../pageoffice.js"></script>
    <script type="text/javascript">
        function refreshDemo() {
            if (confirm("确认复位所有示例的文档吗？")) {
                location.href = "refresh.jsp";
            }
        }
    </script>
</head>
<body>
<!--content-->
<div class="zz-content mc clearfix pd-28" align="center">
    <div class="demo mc">
        <h2 class="fs-16">
            盖章和(手写)签字专题
        </h2>
    </div>
    <div style="margin: 10px" align="center">
        <p>
            此示例的章来源于“卓正ZoomSeal电子签章系统”中的章，签章服务地址是：http://dp.zoomsealent.cn:8080/ZoomSealEnt/enserver.zz。<br>
			当然，您也可以将此印章地址更换为您自己"卓正ZoomSeal电子签章系统"的印章服务地址。
        </p>
		<p>
		      印章的用户名：<span style="color:red">李志</span>   密码：<span style="color:red">123456</span>
		</p>
    </div>
    <div style="margin: 10px" align="center">
        <div style="margin: 10px" align="center">
            <h3>三、PDF盖章、签字<span style=" color:Red;">）</span></h3>
            <table style="border-collapse: separate; border-spacing: 20px;border: 1px solid #9CF" align="center" width="1200px">
                <tr>
                    <th style="border-bottom: 1px solid #9CF; width:85%;">功能演示</th>
                    <th style="border-bottom: 1px solid #9CF">文件目录</th>
                </tr>
            <tr>
                <td>
                    1.常规盖章：
                    <a
                            href="javascript:POBrowser.openPDFWindow('PDF/AddSeal1/PDF1.jsp','width=1200px;height=850px;');">PDF1.jsp</a>
                </td>
                <td>
                    (PDF/AddSeal1)
                </td>
            </tr>
			<!--
            <tr>
                <td>
                    2.常规签字：
                    <a
                            href="javascript:POBrowser.openPDFWindow('PDF/AddSign1/PDF2.jsp' ,'width=1200px;height=850px;');">PDF2.jsp</a>
                </td>
                <td>
                    (PDF/AddSign1)
                </td>
            </tr>
			-->
        </table>
    </div>
</div>
</body>
</html>
