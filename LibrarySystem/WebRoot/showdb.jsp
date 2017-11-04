<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.LinkedList,java.util.List,java.net.URLEncoder"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>This is BookDB</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link  type="text/css" href="css/base.css" media="screen">
	<link rel="stylesheet" type="text/css" href="css/button.css" media="screen">
</head>
<body>

<table align ="center">
<tr>

<a href= ShowDB><div class = "button gray"   /><div class="shine"></div>展示图书库</div></a>
<div class = "button gray"   onclick = "window.location='home.html'"/><div class="shine"></div>主页</div>
</tr>
</table>

<table align ="center">
<tr>
    <td><p><font size="5" face="STLiti" color="white">ISBN</p></td>
    <td><p><font size="5" face="STLiti" color="white">作品</p></td>
    <td><p><font size="5" face="STLiti" color="white">作者</p></td>
    <td><p><font size="5" face="STLiti" color="white">出版商</p></td>
    <td><<p><font size="5" face="STLiti" color="white">出版日期</p></td>
    <td><p><font size="5" face="STLiti" color="white">价格</p></td>

<tr>
<%List<String> db_book = (List<String>)session.getAttribute("db_book"); 
if(db_book!= null)
{
	for(int i =0;i<db_book.size();i+=6)
	{
		
		
		out.print("<tr><td align=\"center\"><p><font  size=\"4\" face=\"STLiti\" color=\"white\">"+db_book.get(i)+"</p></td>");
		  out.print("<td align=\"center\"><p><font  size=\"4\" face=\"STLiti\" color=\"white\">"+db_book.get(i+1)+"</p></td>");
		  out.print("<td align=\"center\"><p><font  size=\"4\" face=\"STLiti\" color=\"white\">"+db_book.get(i+2)+"</p></td>");
		  out.print("<td align=\"center\"><p><font  size=\"4\" face=\"STLiti\" color=\"white\">"+db_book.get(i+3)+"</p></td>");
		  out.print("<td align=\"center\"><p><font  size=\"4\" face=\"STLiti\" color=\"white\">"+db_book.get(i+4)+"</p></td>");
		  out.print("<td align=\"center\"><p><font  size=\"4\" face=\"STLiti\" color=\"white\">"+db_book.get(i+5)+"</p></td>");	
		  String str = db_book.get(i);
		
		  out.print("<td align=\"center\"><div class = \"button gray\"   onclick = \"window.location=\'up.jsp\'\"/><div class=\"shine\"></div>修改</div></a></td>");
		  out.print("<td align=\"center\"><a href=Delete?ISBN="+str+"><div class = \"button gray\"  /><div class=\"shine\"></div>删除</div></a></td></tr>");
		  
	}
	
}
else
	out.print("db_list = null");
%>
</tr>

</table>

</body>
</html>