<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.LinkedList,java.util.List,java.net.URLEncoder "
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link  type="text/css" href="css/base.css" media="screen">
	<link rel="stylesheet" type="text/css" href="css/button.css" media="screen">
	<style>
	input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            input:focus{
                    border-color: #66afe9;
                    outline: 0;
                    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
            }
	</style>
</head>
<body>
<form action = "Search">
<table align ="center">
<tr>
<td><p><font size="5" face="STLiti" color="white">请输入作者或者作品名字</p></td><td><input type = "text" name = "name" /></td></tr>

</table>

<table align = "center">
<tr><td align = "center"><div class = "button gray"   onclick = "window.location='home.html'"/><div class="shine"></div>主页</div></td>
</tr>
</tabel>

<table align ="center">
<tr>

<div class ="button gray"><div class="shine"></div><input type = "submit" value ="搜索" ></div>


</tr>
</table>


<table align ="center">

<tr>
    <td><p><font size="5" face="STLiti" color="white">ISBN</p></td>
    <td><p><font size="5" face="STLiti" color="white">作品</p></td>
    <td><p><font size="5" face="STLiti" color="white">作者</p></td>
    <!--<td><p><font size="5" face="STLiti" color="white">出版商</p></td>
    <td><<p><font size="5" face="STLiti" color="white">出版日期</p></td>
    <td><p><font size="5" face="STLiti" color="white">价格</p></td>  -->

<tr>
<%
List<String> list_book=session.getAttribute("list_book")==null?new LinkedList():(List<String>)session.getAttribute("list_book");


if(!list_book.isEmpty()&& list_book!=null&&list_book.size()!=0)
{
	for(int i =0;i<list_book.size();i+=6)
	{
		out.print("<tr><td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+list_book.get(i)+"</td>");
		String str = list_book.get(i+1);
		
		  out.print("<td align=\"center\"><a href=Detail?Title="+ str+">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+list_book.get(i+1)+"</td>");
		  out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+list_book.get(i+2)+"</td>");
		 // out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+list_book.get(i+3)+"</td>");
		  //out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+list_book.get(i+4)+"</td>");
		  //out.print("<td align=\"center\">"+"<p><font size=\"5\" face=\"STLiti\" color=\"white\">"+list_book.get(i+5)+"</td></tr>");	
		  
		  
	}
	
}
else
	out.print("<p><font size=\"5\" face=\"STLiti\" color=\"white\">该作者在此图书库中无作品");
%>
</tr>

</table>
</form>

</body>
</html>