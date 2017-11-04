<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.LinkedList,java.util.List"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link  type="text/css" href="css/base.css" media="screen">
	<link rel="stylesheet" type="text/css" href="css/button.css" media="screen">
</head>
<body>
<table align = "center">
<tr><td align = "center"><div class = "button gray"   onclick = "window.location='home.html'"/><div class="shine"></div>主页</div></td>
</tr>
</tabel>
<table align = "Center">
<tr>
    <td><p><font size="5" face="STLiti" color="white">ISBN</p></td>
    <td><p><font size="5" face="STLiti" color="white">作品</p></td>
    <td><p><font size="5" face="STLiti" color="white">作者</p></td>
    <td><p><font size="5" face="STLiti" color="white">出版商</p></td>
    <td><<p><font size="5" face="STLiti" color="white">出版日期</p></td>
    <td><p><font size="5" face="STLiti" color="white">价格</p></td>

</tr>

<tr>
<%List<String> book_detail = (List<String>)session.getAttribute("book_detail"); 

if(book_detail!= null)
{
	
		out.print("<tr><td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+book_detail.get(0)+"</td>");
		  out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+book_detail.get(1)+"</td>");
		  out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+book_detail.get(2)+"</td>");
		  out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+book_detail.get(3)+"</td>");
		  out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+book_detail.get(4)+"</td>");
		  out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+book_detail.get(5)+"</td>");	

	
	
}
else
	out.print("<p><font size=\"5\" face=\"STLiti\" color=\"white\">book_tail为空");
%>

</tr>
</table>


</body>
</html>