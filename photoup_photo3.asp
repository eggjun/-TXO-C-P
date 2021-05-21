<!--#include file="../asp_api/db.asp" -->
<%
set myconn = Server.CreateObject("ADODB.Connection")
Set myrs = Server.CreateObject("ADODB.Recordset")
myconn.Open GetConnectString("L8BI0")
myrs.CursorLocation = 3

main_pk = trim(request("main_pk")) '接 photo_up_photo3.asp傳過來的值
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<TITLE>照片上傳</TITLE>
</head>
<BODY>
<%
'On Error Resume Next 

'底下三行固定，一定要寫
a=Request.TotalBytes
b=Request.BinaryRead(a)
set obj=server.createobject("basp21")

' 接收輸入項傳過來的值
'content=obj.Form(b,"content")    ' 接收由上一個form輸入項傳入之值，content 為上一支程式之輸入項
'OP_ID=obj.Form(b,"OP_ID")    ' 接收由上一個form輸入項傳入之值，OP_ID 為上一支程式之輸入項
'CORRECT_ANSWER=obj.Form(b,"CORRECT_ANSWER")    ' 接收由上一個form輸入項傳入之值，CORRECT_ANSWER 為上一支程式之輸入項

' 底下接收檔案
f3=obj.FormFileName(b,"file3")     '  file3  為上一支程式選檔之輸入項名稱
if Trim(f3)="" then
	response.Write("<center><a href='javascript:history.go(-1)'>Back To File Upload Page</a></center>")
	Response.End()
	'response.Redirect("./fileup.htm")
else
	' 檔案長度
	fsize=obj.FormFileSize(b,"file3")				'檔案長度
	fname=Mid(f3,InstrRev(f3,"\")+1)				'檔案名稱
	fname_extension=Mid(fname,len(fname)-2,3)		'副檔名
	if UCase(fname_extension)<>"JPG" and UCase(fname_extension)<>"JPEG" and UCase(fname_extension)<>"GIF" and UCase(fname_extension)<>"PNG" and UCase(fname_extension)<>"BMP" then
		response.Write("<script>alert('Not Photo File!!')</script>")
		'response.Write(fname_extension)
		response.Write("<center><a href='javascript:history.go(-1)'>Back To File Upload Page</a></center>")
		Response.End()
	end if
	
	foldername =  "\upload_Image\" 
  
  'response.write Server.MapPath(".") & foldername
  'response.end
  set objfolder = server.createobject("scripting.filesystemobject") 
	if objfolder.folderexists(Server.MapPath(".") & foldername) = false then
	   objfolder.CreateFolder(Server.MapPath(".") & foldername) '創建目錄 
	end if 
	
	success=obj.FormSaveAs(b,"file3",Server.MapPath(".") & foldername & "\" & fname)     '存檔，儲存位置為硬碟上之絕對路徑。此路徑必須存在
	
	if success > 0 then    ' 若成功，傳回大於0之值	
		myStr = "update l8b_ARY_FIB_Data set fib_photo_3='"& fname &"' where main_pk ='" & main_pk & "'"
		'response.write(main_pk)
		'Response.End()
		set myrs = myconn.Execute("SET NAMES 'big5'")
		set myrs = myconn.Execute(myStr)
		response.write "<script>window.opener.jsFile();</script>"
		'response.write "<script>window.close();</script>" 
	else
		response.write "<script>alert('Upload Photo Failure!!')</script>"   
		
	end if
end if
%>
<%
'response.Write("<script>history.go(-2);location.href = document.referrer;</script>") '回前頁並重新整理
'response.write("<script>history.go(-2);window.location.reload();</script>")	'回前頁並重新整理

response.Write("<script>window.location=('http://tw100018629/L8BI0_WEB/FIB/ARY_FIB_DATA.asp');</script>") '回前頁並重新整理

Response.End()
%>
</body>
</html>
