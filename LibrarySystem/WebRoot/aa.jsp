<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<form action = "AddAuthor">
<table align="center">
<tr>
<td><p><font size="5" face="STLiti" color="white">作者名字</p></td><td><input  class="form-control" type="text" name="name" /></td>
<td><p><font size="5" face="STLiti" color="white">年龄</p></td><td><input class="form-control"  type="text" name="age" /></td>
<td><p><font size="5" face="STLiti" color="white">国籍</p></td><td><input type="text" name="country" /></td>
</tr>
</table>
<table align="center">
<td><div class ="button gray"><div class="shine"></div><input type = "submit" value ="添加作者" ></div></td>
</table>
</form>
</body>
</html>