<%@ page language="java"
         import="com.zhuozhengsoft.pageoffice.wordreader.DataRegion,com.zhuozhengsoft.pageoffice.wordreader.WordDocument"
         pageEncoding="utf-8" %>
<%
    WordDocument doc = new WordDocument(request, response);
    //获取提交的数值
    DataRegion dataUserName = doc.openDataRegion("PO_userName");
    DataRegion dataDeptName = doc.openDataRegion("PO_deptName");
    String content = "";
    content += "公司名称：" + doc.getFormField("txtCompany");
    content += "\r\n员工姓名：" + dataUserName.getValue();
    content += "\r\n部门名称：" + dataDeptName.getValue();
    out.println(content);
    // doc.showPage(500, 400);
    doc.close();
%>
