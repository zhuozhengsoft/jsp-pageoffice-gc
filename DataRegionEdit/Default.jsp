<%@ page language="java" 
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*" 
	pageEncoding="utf-8"%>
<%
        WordDocument doc = new WordDocument();
        doc.getTemplate().defineDataRegion("Name", "[ 姓名 ]");
        doc.getTemplate().defineDataRegion("Address", "[ 地址 ]");
        doc.getTemplate().defineDataRegion("Tel", "[ 电话 ]");
        doc.getTemplate().defineDataRegion("Phone", "[ 手机 ]");
        doc.getTemplate().defineDataRegion("Sex", "[ 性别 ]");
        doc.getTemplate().defineDataRegion("Age", "[ 年龄 ]");
        doc.getTemplate().defineDataRegion("Email", "[ 邮箱 ]");
        doc.getTemplate().defineDataRegion("QQNo", "[ QQ号 ]");
        doc.getTemplate().defineDataRegion("MSNNo", "[ MSN号 ]");

        PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
        poCtrl.addCustomToolButton("保存", "Save()", 1);
        poCtrl.addCustomToolButton("定义数据区域", "ShowDefineDataRegions()", 3);

        poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
        poCtrl.setSaveFilePage("SaveFile.jsp");

        poCtrl.setTheme(ThemeType.Office2007);
        poCtrl.setBorderStyle(BorderStyleType.BorderThin);
        poCtrl.setWriter(doc);
        poCtrl.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "zhangsan");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>

	<script type="text/javascript">
        //获取后台添加的书签名称字符串
        function getBkNames() {
            var bkNames = document.getElementById("PageOfficeCtrl1").DataRegionDefineNames;
            return bkNames;
        }

        //获取后台添加的书签文本字符串
        function getBkConts() {
            var bkConts = document.getElementById("PageOfficeCtrl1").DataRegionDefineCaptions;
            return bkConts;
        }

        //定位书签
        function locateBK(bkName) {
            //var drlist = document.getElementById("PageOfficeCtrl1").DataRegionList;
            //drlist.GetDataRegionByName(bkName).Locate();
            // document.getElementById("PageOfficeCtrl1").Activate();
            //window.focus();
            var obj = poapplication.ActiveDocument;
            obj.Bookmarks.Item(bkName).Select();
            window.focus();
        }

        //添加书签
        function addBookMark(param) {
                  var obj = poapplication.ActiveDocument;
            var tmpArr = param.split("=");
            var bkName = tmpArr[0];
            var content = tmpArr[1];
            obj.Bookmarks.Refresh;
            try {
                //poapplication.Selection.Collapse(0);
                range = obj.Application.Selection.Range;
                range.Text = content;
                obj.Bookmarks.Add(bkName,  range);
                obj.Bookmarks.Item(bkName).Select();
                return "true";
            } catch (e) {
                return "false";
            }
        }
        //删除书签
        function delBookMark(bkName) {
                    var obj = poapplication.ActiveDocument;
            try {
                if (obj.Bookmarks.Exists(bkName)) {
                    obj.Bookmarks.Item(bkName).Select();
                    obj.Application.Selection.Range.Text = "";
                }
                return "true";
            } catch (e) {
            return "false";
        }

        }

        //遍历当前Word中已存在的书签名称
        function checkBkNames() {
           var obj=poapplication.ActiveDocument;
           var drlist=obj.Bookmarks;
            obj.Bookmarks.Refresh;
            var bkName = "";
            var bkNames = "";
            for (var i = 1; i <=drlist.Count; i++) {
                bkName = obj.Bookmarks.Item(i).Name;
                bkNames += bkName.substr(3) + ",";
            }
            return bkNames.substr(0, bkNames.length - 1);

        }

        //遍历当前Word中已存在的书签文本
        function checkBkConts() {
            var obj=poapplication.ActiveDocument;
            var drlist=obj.Bookmarks;
            obj.Bookmarks.Refresh;
            var bkCont = "";
            var bkConts = "";
            for (var i = 1; i <= drlist.Count; i++) {
                bkCont = drlist.Item(i).Range.Text;
                bkConts += bkCont + ",";
            }
            return bkConts.substr(0, bkConts.length - 1);
        }
    </script>
    
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }
        function ShowDefineDataRegions() {
            //document.getElementById("PageOfficeCtrl1").ShowHtmlModelessDialog("DataRegionDlg.htm", "parameter=xx", "left=300px;top=390px;width=520px;height=410px;frame:no;");
            window.open("DataRegionDlg.htm","child","width=720px,height=410px,resizable=no,scroll=no,status=no,left=300px,top=390px,location=no,menubar=no");
        }
    </script>

</head>
<body>
    <form action="">
    <div style="width: 1000px; height: 800px;">
        <%=poCtrl.getHtmlCode("PageOfficeCtrl1")%>
    </div>
    </form>
</body>
</html>