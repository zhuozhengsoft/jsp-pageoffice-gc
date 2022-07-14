<%@ page language="java" import="javax.servlet.*,javax.servlet.http.*,java.io.File,java.io.FileInputStream"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.InputStream" %>
<%!
    //拷贝文件
    public void copyFile(String oldPath, String newPath) {
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(oldPath);
            if (oldfile.exists()) { //文件存在时
                InputStream inStream = new FileInputStream(oldPath); //读入原文件
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];
                int length;
                while ((byteread = inStream.read(buffer)) != -1) {
                    bytesum += byteread; //字节数 文件大小
                    System.out.println(bytesum);
                    fs.write(buffer, 0, byteread);
                }
                fs.close();
                inStream.close();
            }
        } catch (Exception e) {
            System.out.println("复制单个文件操作出错");
            e.printStackTrace();
        }
    }
%>
<%
    String rootPath = request.getSession().getServletContext().getRealPath("InsertSeal") + "/";
    copyFile(rootPath + "PDF/AddSeal1/test_bak.pdf", rootPath + "PDF/AddSeal1/test.pdf");
    copyFile(rootPath + "PDF/AddSign1/test_bak.pdf", rootPath + "PDF/AddSign1/test.pdf");

%>

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
</head>
<body>
<!--content-->
<div class="zz-content mc clearfix pd-28" align="center">
    <div class="demo mc">
        复位成功！<a href="index.jsp">返回到示例</a>
    </div>
</div>
</body>
</html>


