<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Page</title>
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
<s:form action = "Update" >
<table align = "center">

<tr><td><p><font size="5" face="STLiti" color="white">作品</p></td><td><input type="text" name="title" /></td></tr>
<tr><td><p><font size="5" face="STLiti" color="white">作者</p></td><td><input type="text" name="author" /></td></tr>
<tr><td><p><font size="5" face="STLiti" color="white">出版商</p><td><input type="text" name="publisher" /></td></tr>
<tr><td><p><font size="5" face="STLiti" color="white">出版日期</p><td><input type="text" name="publishdate" /></td></tr>
<tr><td><p><font size="5" face="STLiti" color="white">价格</p></td><td><input type="text" name="price" /></td></tr>
</table>
<table align = "center">
<tr>
<div class ="button gray"><div class="shine"></div><input type = "submit" value ="更新" ></div>
</tr>
</table>
</s:form>
</body>
</html>