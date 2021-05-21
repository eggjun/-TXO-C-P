<%
set myconn = Server.CreateObject("ADODB.Connection")
myconn.Open("Driver=MySQL ODBC 3.51 Driver; Server=tw100018629;port:3306; Database=l8bi0; uid=L8BI0; pwd=L8BI02010;")
Set myrs = Server.CreateObject("ADODB.Recordset")

main_pk = trim(request("main_pk")) '接前端傳過來的值

'myrs.close
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>照片上傳</title>
    <style type="text/css">
        #defect_name
        {
            width: 101px;
        }
    </style>
</head>

<BODY>
<FORM ACTION="photoup_photo3.asp?main_pk=<%=main_pk%>"  ENCTYPE="multipart/form-data" METHOD=POST>  
<div align="center">
<center>
<table border="0" width="430" cellspacing="0" cellpadding="0">  
  <tr>
    <td width="430" bgcolor="#CCCCFF">選擇照片, 請按『瀏覽...』將照片上傳
        <input type="hidden" name="content"></td>
  </tr>
  
  <tr>    
    <td bgcolor="#CCCCFF">
    <input name="file3" type=file size="50">
    <input name="resetfile" type=reset size="50">
    </td>    
  </tr>
      
  <tr>  
    <td align="center" bgcolor="#CCCCFF">
    <br>
    <br>
      <INPUT TYPE="SUBMIT" NAME="UPLOAD" style="cursor:hand" value="新增上傳">&nbsp;&nbsp;
      <INPUT TYPE="button" NAME="close" style="cursor:hand" value="關閉視窗" onClick="history.go(-1)"  >
    </td>
  </tr>
</table>

</center>
</div>
</FORM> 
</BODY>
</HTML>

