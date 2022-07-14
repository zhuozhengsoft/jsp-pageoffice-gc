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
    poCtrl1.addCustomToolButton("保存", "Save()", 1);
    poCtrl1.addCustomToolButton("开始手写", "StartHandDraw()", 5);
    poCtrl1.addCustomToolButton("设置线宽", "SetPenWidth()", 5);
    poCtrl1.addCustomToolButton("设置颜色", "SetPenColor()", 5);
    poCtrl1.addCustomToolButton("设置笔型", "SetPenType()", 5);
    poCtrl1.addCustomToolButton("设置批注类型", "SetDrawType()", 5);
    poCtrl1.addCustomToolButton("设置批注形状类型", "SetDrawShapeType()", 5);
    poCtrl1.addCustomToolButton("打开橡皮擦", "OpenEraser()", 5);
    poCtrl1.addCustomToolButton("关闭橡皮擦", "CloseEraser()", 5);
    poCtrl1.addCustomToolButton("退出手写", "ExitHandDraw()", 5);
    poCtrl1.setSaveFilePage("SaveFile.jsp");
    poCtrl1.webOpen("doc/template.doc", OpenModeType.docNormalEdit, "张三");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <script language="JavaScript">
        //保存
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }

        //开始手写
        function StartHandDraw() {
            poapplication.EnterInkDraw();//进入手写批注状态。
        }

        //设置线宽
        function SetPenWidth() {
            poapplication.SetInkDrawLineStyle(70);//设置批注磅值。
        }

        //设置颜色
        function SetPenColor() {
            poapplication.SetInkDrawColor("#000000");//设置当前批注颜色。
        }

        //设置笔型
        function SetPenType() {
            poapplication.SetInkDrawPenStyle(0);//设置批注笔类型。为0表示圆珠笔；为1表示水彩笔；为2表示荧光笔。//设置批注笔类型。为0表示圆珠笔；为1表示水彩笔；为2表示荧光笔。
        }

        //打开橡皮擦
        function OpenEraser() {
            poapplication.SetInkDrawEraser(true);//设置橡皮擦状态。为true表示进入橡皮擦状态，为false表示退出橡皮擦状态。
        }

        //关闭橡皮擦
        function CloseEraser() {
            poapplication.SetInkDrawEraser(false);//设置橡皮擦状态。为true表示进入橡皮擦状态，为false表示退出橡皮擦状态。
        }

        //退出手写
        function ExitHandDraw() {
            poapplication.ExitInkDraw();//退出手写批注状态。
        }

         //设置批注类型
         function SetDrawType(){
             poapplication.SetInkDrawShapeStyle(0);//设置批注形状类型。为 0 表示直线；为1表示波浪线；为2表示矩形。
        }

        //设置批注形状类型
        function SetDrawShapeType(){
            poapplication.SetInkDrawShapeStyle(1);//设置批注形状类型。为 0 表示直线；为1表示波浪线；为2表示矩形。注意：只有设置过批注类型了再设置批注形状类型才有效
        }

    </script>
</head>
<body>
<div style="font-size: 12px; line-height: 20px; border-bottom: dotted 1px #ccc; border-top: dotted 1px #ccc; padding: 5px;">
    <span style="color: red;">操作说明：</span>若想提前设置线宽、颜色、笔型、缩放等，可先点击自定义工具栏上的相应按钮，然后点击“开始手写”按钮。在尚未关闭手写工具栏时，点“撤销最近一次手写”按钮，可撤销最近一次的手写；点击“退出手写”按钮，可退出手写；还可点“设置线宽”、“设置颜色”等按钮对手写批注的颜色、线宽等进行再次设置。
    <br/>
    关键代码：点右键，选择“查看源文件”，看js函数
    <br/>
    <input id="Button3" type="button" value="设置线宽"
           onclick="SetPenWidth()"/>
    <input id="Button4" type="button" onclick="SetPenColor()"
           value="设置颜色"/>
    <input id="Button2" type="button" onclick="ExitHandDraw()"
           value="退出手写"/>
    <span style="background-color: Yellow;"></span>
</div>
<br/>
<form id="form1">
    <div style="height: 700px; width: auto;">
        <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    </div>
</form>
</body>
</html>
