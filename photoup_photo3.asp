<!--#include file="../asp_api/db.asp" -->
<%
set myconn = Server.CreateObject("ADODB.Connection")
Set myrs = Server.CreateObject("ADODB.Recordset")
myconn.Open GetConnectString("L8BI0")
myrs.CursorLocation = 3

main_pk = trim(request("main_pk")) '�� photo_up_photo3.asp�ǹL�Ӫ���
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<TITLE>�Ӥ��W��</TITLE>
</head>
<BODY>
<%
'On Error Resume Next 

'���U�T��T�w�A�@�w�n�g
a=Request.TotalBytes
b=Request.BinaryRead(a)
set obj=server.createobject("basp21")

' ������J���ǹL�Ӫ���
'content=obj.Form(b,"content")    ' �����ѤW�@��form��J���ǤJ���ȡAcontent ���W�@��{������J��
'OP_ID=obj.Form(b,"OP_ID")    ' �����ѤW�@��form��J���ǤJ���ȡAOP_ID ���W�@��{������J��
'CORRECT_ANSWER=obj.Form(b,"CORRECT_ANSWER")    ' �����ѤW�@��form��J���ǤJ���ȡACORRECT_ANSWER ���W�@��{������J��

' ���U�����ɮ�
f3=obj.FormFileName(b,"file3")     '  file3  ���W�@��{�����ɤ���J���W��
if Trim(f3)="" then
	response.Write("<center><a href='javascript:history.go(-1)'>Back To File Upload Page</a></center>")
	Response.End()
	'response.Redirect("./fileup.htm")
else
	' �ɮת���
	fsize=obj.FormFileSize(b,"file3")				'�ɮת���
	fname=Mid(f3,InstrRev(f3,"\")+1)				'�ɮצW��
	fname_extension=Mid(fname,len(fname)-2,3)		'���ɦW
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
	   objfolder.CreateFolder(Server.MapPath(".") & foldername) '�Ыإؿ� 
	end if 
	
	success=obj.FormSaveAs(b,"file3",Server.MapPath(".") & foldername & "\" & fname)     '�s�ɡA�x�s��m���w�ФW��������|�C�����|�����s�b
	
	if success > 0 then    ' �Y���\�A�Ǧ^�j��0����	
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
'response.Write("<script>history.go(-2);location.href = document.referrer;</script>") '�^�e���í��s��z
'response.write("<script>history.go(-2);window.location.reload();</script>")	'�^�e���í��s��z

response.Write("<script>window.location=('http://tw100018629/L8BI0_WEB/FIB/ARY_FIB_DATA.asp');</script>") '�^�e���í��s��z

Response.End()
%>
</body>
</html>
