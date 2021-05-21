<!--#include file="../asp_api/db.asp" -->
<%
set myconn = Server.CreateObject("ADODB.Connection")
Set myrs = Server.CreateObject("ADODB.Recordset")
myconn.Open GetConnectString("L8BI0")
myrs.CursorLocation = 3

if request("btn_status")="DELETE" then
	call delete_db()
end if
%>

<script language="javascript">
function jsDelete(val_1,val_2) {
	document.query_form.btn_status.value='DELETE';
	document.query_form.main_pk.value=val_1;
	this.query_form.submit();
}
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>照片管理</title>
<style type="text/css">
<!--
.style1 {font-size: 12px}
.style2 {color: #FF0000}
-->
</style>
</head>

<body>
<form name="query_form">
<table width="300" border="0" align="center" class="style1">
  <tr align="center" bgcolor="#00CCFF">
    <td width="70%">照片</td>
    <td width="15%">&nbsp;</td>
<%
main_pk = request("main_pk")
sqlStr="SELECT fib_photo_1 FROM l8b_ARY_FIB_Data where main_pk='" & main_pk & "' "
myrs.Open "SET NAMES 'big5'", myconn
myrs.Open sqlStr, myconn
cnt=myrs.RecordCount
if Not myrs.EOF then		
	for i=1 to cnt
		FILE_NAME = myrs.Fields("fib_photo_1")
		
		if (i mod 2=1) then 
			bgcolor=" bgcolor='#FFFFFF'"
		else 
			bgcolor=" bgcolor='#FFFFCC'"
		end if
		
		response.Write("<tr align='center' class='style1'" & bgcolor & ">")
		
		if FILE_NAME<>"" then
			response.Write("<td><a href='." & myrs("folder_name") & myrs("file_name") &"' target=_blank><img src='." & myrs("folder_name") & myrs("file_name") & "' width='175' height='135'></a></td>")	
		else
			response.Write("<td>&nbsp;</td>")
		end if
%>
  	<td><input name="btnModify" type="button" value="刪除" style='cursor:hand' onClick="jsDelete('<%=main_pk%>')">
    </td>
<%
		response.Write("<tr>")
		myrs.MoveNext
	next
end if	
myrs.close
%>
  </tr>
</table>
<input type="hidden" name="btn_status">
<input type="hidden" name="main_pk" value="<%=Trim(request("main_pk"))%>">

</form>
</body>
</html>
<%
sub delete_db()	
	
	main_pk=Trim(request("main_pk"))
	
	
	myStr = "select fib_photo_1 from l8b_ARY_FIB_Data where main_pk='" & main_pk & "'"
	set myrs = myconn.Execute("SET NAMES 'big5'")
	set myrs = myconn.Execute(myStr)
	
	foldername =  Server.MapPath(".") & myrs("folder_name") 
  
  set objfolder = server.createobject("scripting.filesystemobject") 
  set objfile = server.createobject("scripting.filesystemobject")
  'response.write foldername
  'response.end
	if objfolder.folderexists(foldername & "trashcan" ) = false then
	   objfolder.CreateFolder(foldername & "trashcan" ) '創建目錄 
	end if 

  'response.write foldername & "trashcan\" & myrs("file_name")
  'response.end
  

	if objfolder.fileexists(foldername & myrs("file_name") ) = true then
	   set File_Name = objfile.GetFile(foldername & myrs("file_name"))
	   if objfolder.fileexists(foldername & "trashcan\" & myrs("file_name") ) = true then
	      File_Name.delete() 
	   else
	      File_Name.Move (foldername & "trashcan\" & myrs("file_name"))
	   end if 
	end if 
	
	myStr = "update l8b_ARY_FIB_Data set fib_photo_1 ='"& fib_photo_1 &"'  where main_pk='" & main_pk & "'"
	
	set myrs = myconn.Execute("SET NAMES 'big5'")
	set myrs = myconn.Execute(myStr)
	If Err.Number <> 0 Then
		Response.Clear
		response.Write "資料更新時發生錯誤" & "<BR>"
		response.Write "錯誤代碼：" & Err.Number & "<BR>"
		response.Write "錯誤資訊：" & Err.Description & "<BR>"
		response.Write "出錯文件：" & Err.Source & "<BR>"
	else
		response.Write("<script>alert('資料已刪除');</script>")
		response.write "<script>window.opener.jsFile();</script>"
		response.Write("<script>location.href='photo_manage.asp?main_pk=" & main_pk & "';</script>")
	end if
end sub
myconn.close
%>