<%
'On Error Resume Next

'�s����Ʈw
set myconn = Server.CreateObject("ADODB.Connection")
myconn.Open("Driver=MySQL ODBC 3.51 Driver; Server=tw100018629;port:3306; Database=l8bi0; uid=L8BI0; pwd=L8BI02010;")
Set myrs = Server.CreateObject("ADODB.Recordset")



btn_status=request("btn_status")			'�^��btn_status�ݩ�											
main_pk = trim(request("main_pk"))			'�^��main_pk����
if btn_status="Save" then					'�p�Gbtn_status�ݩʬ�save����H�U�{��

	'�Ninput��J�ȵ��ܼ�
	sheet_id = trim(request("sheet_id"))			
	laser_defect = trim(request("laser_defect"))
	cut_op_id = trim(request("cut_op_id"))
	x = trim(request("x"))
	y = trim(request("y"))

	defect_code = trim(request("defect_code"))	
	sub_defect = trim(request("sub_defect"))	
	run_time = trim(request("run_time"))
	eqp_chamber = trim(request("eqp_chamber"))
	fib_photo_1 = trim(request("fib_photo_1"))
	fib_photo_2 = trim(request("fib_photo_2"))
	fib_photo_3 = trim(request("fib_photo_3"))
	mechanism = trim(request("mechanism"))
	action = trim(request("action"))

	'�����W��
	Al_name = trim(request("Al"))
	Ba_name = trim(request("Ba"))
	Br_name = trim(request("Br"))
	C_name = trim(request("C"))
	Ca_name = trim(request("Ca"))	
	Cl_name = trim(request("Cl"))

	Cr_name = trim(request("Cr"))
	Cu_name = trim(request("Cu"))
	F_name = trim(request("F"))
	Fe_name = trim(request("Fe"))
	In1_name = trim(request("In"))
	Mg_name = trim(request("Mg"))

	Mn_name = trim(request("Mn"))	
	Mo_name = trim(request("Mo"))
	N_name = trim(request("N"))
	Ni_name = trim(request("Ni"))
	O_name = trim(request("O"))
	Os_name = trim(request("Os"))

	P_name = trim(request("P"))
	S_name = trim(request("S"))
	Si_name = trim(request("Si"))
	Sr_name = trim(request("Sr"))
	Ti_name = trim(request("Ti"))
	Zr_name = trim(request("Zr"))


	'��������
	Al = trim(request("Al_value"))
	Ba = trim(request("Ba_value"))
	Br = trim(request("Br_value"))
	C = trim(request("C_value"))
	Ca = trim(request("Ca_value"))	
	Cl = trim(request("Cl_value"))

	Cr = trim(request("Cr_value"))
	Cu = trim(request("Cu_value"))
	F = trim(request("F_value"))
	Fe = trim(request("Fe_value"))
	In1 = trim(request("In_value"))
	Mg = trim(request("Mg_value"))

	Mn = trim(request("Mn_value"))	
	Mo = trim(request("Mo_value"))
	N = trim(request("N_value"))
	Ni = trim(request("Ni_value"))
	O = trim(request("O_value"))
	Os = trim(request("Os_value"))

	P = trim(request("P_value"))
	S = trim(request("S_value"))
	Si = trim(request("Si_value"))
	Sr = trim(request("Sr_value"))
	Ti = trim(request("Ti_value"))
	Zr = trim(request("Zr_value"))
	
	
	'�D��:�N��Ʈw����main_pk�P�^�Ǫ�main_pk���Ȱ�����@�˪��ܴN�R��
	myStr = "delete from l8bi0.l8b_ARY_FIB_Data where main_pk='" & main_pk & "'"		
	set myrsTemp = myconn.Execute(myStr)		'����sql

	'�l��:�N��Ʈw����main_pk�P�^�Ǫ�main_pk���Ȱ�����@�˪��ܴN�R��
	myStr = "delete from l8bi0.l8b_ARY_FIB_Data_detail where main_pk='" & main_pk & "'"			
	set myrsTemp = myconn.Execute(myStr)

	

	'�N��Ʒs�W�ܸ�Ʈw
	myStr = "INSERT INTO l8bi0.l8b_ARY_FIB_Data (sheet_id, laser_defect, cut_op_id, x, y, defect_code, sub_defect, run_time, eqp_chamber, fib_photo_1,fib_photo_2,fib_photo_3, mechanism, action, lm_time)"
	myStr = myStr & " VALUES ('" & sheet_id & "','" & laser_defect & "','" & cut_op_id & "','" & x & "','" & y & "','" & defect_code & "' "
	myStr = myStr & " ,'" & sub_defect & "','" & run_time & "' ,'" & eqp_chamber & "' , '" & fib_photo_1 & "' , '" & fib_photo_2 & "' , '" & fib_photo_3 & "' , '" & mechanism & "' , '" & action & "',now())"
	Set myrs = myconn.Execute("SET NAMES 'big5'")			'�w�q�s�X
	Set myrs = myconn.Execute(myStr)			'����sql


			'select�D���̤jpk��																			'���j����
	myStr = "select max(main_pk) main_pk from l8bi0.l8b_ARY_FIB_Data where lm_time >= date_sub(now(),interval 5 second)  " 
    set myrs = myconn.Execute("SET NAMES 'big5'")
    set myrs = myconn.Execute(myStr)

	'�N��Ʈw��쪺�̤jpk�ȵ��ܼ�
    new_main_pk = myrs("main_pk") 
	'response.write(new_main_pk)

	'�p�G�̤jpk�Ȥ����Ű���H�U�{��
	if new_main_pk <> " " then

		'�N�����W�ٳ]���}�C���ܼ�
		str_name = ""& Al_name &","& Ba_name &","& Br_name &","& C_name &","& Ca_name &","& Cl_name &","& Cr_name &","& Cu_name &","& F_name &","& Fe_name &","& In1_name &","& Mg_name &","& Mn_name &","& Mo_name &","& N_name &","& Ni_name &","& O_name &","& Os_name &","& P_name &","& S_name &","& Si_name &","& Sr_name &","& Ti_name &","& Zr_name &""
		
		'�N�����ȳ]���}�C���ܼ�
		str = ""& Al &","& Ba &","& Br &","& C &","& Ca &","& Cl &","& Cr &","& Cu &","& F &","& Fe &","& In1 &","& Mg &","& Mn &","& Mo &","& N &","& Ni &","& O &","& Os &","& P &","& S &","& Si &","& Sr &","& Ti &","& Zr &""
			
		'�⤸���W�٥H�r�������ε��}�C
		ary_name = Split(str_name,",")

		'�⤸���Ȥw�r�����ε��}�C
		ary = Split(str,",")
			
		
			'���j��]�Ҧ������W��
			for i=0 to ubound(ary_name)
					
					'�p�G�����Ȫ����פj��s�N�N����
				if   len(ary(i)) > 0 then

					'response.write(ary_name(i))
					'response.write(ary(i))				
						
					'�s�W:�s�J��Ʈw
					myStr = "INSERT INTO l8bi0.l8b_ARY_FIB_Data_detail (main_pk, element, numerical_value)"
					myStr = myStr & " VALUES ('" & new_main_pk & "','" & ary_name(i) & "','" & ary(i) & "') "
				
					Set myrs = myconn.Execute("SET NAMES 'big5'")			'�w�q�s�X
					Set myrs = myconn.Execute(myStr)			'����sql

				end if	
								
			next 
						
	end if
			
	
response.write("<script>window.location.href = window.location.href.split('?')[0];</script>")	'�������۰ʨ�s �çR��URL�᭱���Ѽ�




	'�s�W�����ܼƤ@�Ӫť�
	sheet_id = " "			
	laser_defect = " "
	cut_op_id = " "
	x = " "
	y = " "
	defect_code = " "
	sub_defect = " "
	run_time = " "
	eqp_chamber = " "
	mechanism = " "
	action = " "
	Al = " "
	Ba = " "
	Br = " "
	C = " "
	Ca = " "	
	Cl = " "

	Cr = " "
	Cu = " "
	F = " "
	Fe = " "
	In1 = " "
	Mg = " "

	Mn = " "	
	Mo = " "
	N = " "
	Ni = " "
	O = " "
	Os = " "

	P = " "
	S = " "
	Si = " "
	Sr = " "
	Ti = " "
	Zr = " "

End if


'�R��
if btn_status="Delete" then			'�p�Gbtn_status�ݩʬ�delete����H�U�{��
	myStr = "delete from l8bi0.l8b_ARY_FIB_Data where main_pk='" & main_pk & "'"			
	set myrsTemp = myconn.Execute(myStr)

	myStr = "delete from l8bi0.l8b_ARY_FIB_Data_detail where main_pk='" & main_pk & "'"			
	set myrsTemp = myconn.Execute(myStr)				'����sql
	main_pk = ""			'�R�����N�ܼƲM��
end if


'�ק�:select��Ʈw������
sql = "SELECT main_pk, sheet_id, laser_defect, cut_op_id, x, y, defect_code,  sub_defect, run_time, eqp_chamber, fib_photo_1, fib_photo_2, fib_photo_3, lm_time, mechanism, action, (SELECT GROUP_CONCAT(concat(element, ':', numerical_value)) FROM l8b_ARY_FIB_Data_detail d where d.main_pk = a.main_pk having MAX(d.main_pk)) as element FROM l8bi0.l8b_ARY_FIB_Data a where a.main_pk='" & main_pk & "' "


myrs.CursorLocation = 3	
myrs.Open "SET NAMES 'big5'", myconn
myrs.Open sql, myconn
if Not myrs.EOF then

	'�N��Ʈw�����ȵ��ܼ�
	sheet_id = myrs.Fields("sheet_id")
	laser_defect = myrs.Fields("laser_defect")
	cut_op_id = myrs.Fields("cut_op_id")
	x = myrs.Fields("x")	
	y = myrs.Fields("y")
	defect_code = myrs.Fields("defect_code")
	sub_defect = myrs.Fields("sub_defect")
	run_time = myrs.Fields("run_time")
	eqp_chamber = myrs.Fields("eqp_chamber")
	fib_photo_1 = myrs.Fields("fib_photo_1")
	fib_photo_2 = myrs.Fields("fib_photo_2")
	fib_photo_3 = myrs.Fields("fib_photo_3")		
	mechanism = myrs.Fields("mechanism")	
	action = myrs.Fields("action")

	'�N SELECT GROUP_CONCAT(concat(element, ':', numerical_value)) FROM l8b_ARY_FIB_Data_detail d where d.main_pk = a.main_pk having MAX(d.main_pk)) as element �H�r��������
	element_name_update = split(myrs.Fields("element"),",")
	
	'�Ҧ������W�ٵ��ܼ�
	all_element_name = "Al,Ba,Br,C,Ca,Cl,Cr,Cu,F,Fe,In,Mg,Mn,Mo,N,Ni,O,Os,P,S,Si,Sr,Ti,Zr"

	'�N�Ҧ������W�٥H�r�������ε��}�C
	ary_element_name = split(all_element_name,",")

	'�]�����W�٪��}�C�j�� ex: [Al:8] [C:9]
	for j = 0 to ubound(element_name_update)
	
		'�N�����W�٦A�H�_�������ε��}�C ex: [Al] [8] [C] [9]
		element_value_update = Split(element_name_update(j),":")

		'�]�����W�٦r��}�C�j��
		for i = 0 to ubound(ary_element_name)		
			
			if element_value_update(0) = "Al" then	 '����J�������W		
				Al_value = element_value_update(1)	 '�ۦP���ܴN�N�ȵ�������input name		
			end if

			if element_value_update(0) = "Ba" then				
				Ba_value = element_value_update(1)
			end if

			if element_value_update(0) = "Br" then				
				Br_value = element_value_update(1)
			end if

			if element_value_update(0) = "C" then				
				C_value = element_value_update(1)
			end if

			if element_value_update(0) = "Ca" then				
				Ca_value = element_value_update(1)
			end if

			if element_value_update(0) = "Cl" then				
				Cl_value = element_value_update(1)
			end if

			if element_value_update(0) = "Cr" then				
				Cr_value = element_value_update(1)
			end if

			if element_value_update(0) = "Cu" then				
				Cu_value = element_value_update(1)
			end if

			if element_value_update(0) = "F" then				
				F_value = element_value_update(1)
			end if

			if element_value_update(0) = "Fe" then				
				Fe_value = element_value_update(1)
			end if

			if element_value_update(0) = "In" then				
				In_value = element_value_update(1)
			end if

			if element_value_update(0) = "Mg" then				
				Mg_value = element_value_update(1)
			end if

			if element_value_update(0) = "Mn" then				
				Mn_value = element_value_update(1)
			end if

			if element_value_update(0) = "Mo" then				
				Mo_value = element_value_update(1)
			end if

			if element_value_update(0) = "N" then				
				N_value = element_value_update(1)
			end if

			if element_value_update(0) = "Ni" then				
				Ni_value = element_value_update(1)
			end if

			if element_value_update(0) = "O" then				
				O_value = element_value_update(1)
			end if

			if element_value_update(0) = "Os" then				
				Os_value = element_value_update(1)
			end if

			if element_value_update(0) = "P" then				
				P_value = element_value_update(1)
			end if

			if element_value_update(0) = "S" then				
				S_value = element_value_update(1)
			end if

			if element_value_update(0) = "Si" then				
				Si_value = element_value_update(1)
			end if

			if element_value_update(0) = "Sr" then				
				Sr_value = element_value_update(1)
			end if

			if element_value_update(0) = "Ti" then				
				Ti_value = element_value_update(1)
			end if

			if element_value_update(0) = "Zr" then				
				Zr_value = element_value_update(1)
			end if

		next					
	next	
end if

myrs.close

ss="style='cursor:pointer' onClick='document.query.submit();'"
%>

<script Language="javascript" src="./calendar/calendar_1/calendar.js"></script>
<script>
function jsSave(){			//����function��jssave��js
	
	if (document.query.sheet_id.value=='') {		//�p�G�����쪺�ȬO�ŭ�
		alert('Pls select sheet_id');
		document.query.sheet_id.focus();}				//���X��������
	
	else if (document.query.laser_defect.value=='') {
		alert('Pls select laser_defect');
		document.query.laser_defect.focus();}			//focus���

	else if (document.query.cut_op_id.value=='') {
		alert('Pls input cut_op_id');
		document.query.cut_op_id.focus();}

	else if (document.query.x.value=='') {
		alert('Pls input x');
		document.query.x.focus();}

	else if (document.query.y.value=='') {
		alert('Pls input y');
		document.query.y.focus();}

	else if (document.query.defect_code.value=='') {
		alert('Pls input defect_code');
		document.query.defect_code.focus();}	

	else if (document.query.sub_defect.value=='') {
		alert('Pls input sub_defect');
		document.query.sub_defect.focus();}
	
	else if (document.query.run_time.value=='') {
		alert('Pls input run_time');
		document.query.run_time.focus();}
	
	else if (document.query.eqp_chamber.value=='') {
		alert('Pls input eqp_chamber');
		document.query.eqp_chamber.focus();}

	else if (document.query.mechanism.value=='') {
		alert('Pls input mechanism');
		document.query.mechanism.focus();}

	else if (document.query.action.value=='') {
		alert('Pls input action');
		document.query.action.focus();}

	else {
		document.query.btn_status.value="Save";			//�Nsave��btn_status
		this.query.submit();}
}

function jsDelete(str1,str2){					//����function��jsdelete��js
	if (confirm ("�T�w�R��? " + str2))			//���X��������
	{
		document.query.main_pk.value=str1;				//�Nstr1��main_pk
		document.query.btn_status.value="Delete";		//�Ndelete��btn_status
		this.query.submit();
	}	
}

function jsUpdate(str1){				//����function��jsupdate��js
	document.query.main_pk.value=str1;	//�Nstr1��main_pk
	document.query.btn_status.value="Update";		//�Nupdate��btn_status
	this.query.submit();
}

</script>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9,IE=10,IE=11,IE=EDGE" />
<!-- <meta http-equiv="Content-Type" content="text/html; charset=big5"> -->
<title>ARY_FIB_DATA</title>
</head>
<body>
<form name="query">
<input type="hidden" name="main_pk"  value="<%=main_pk%>">
<input type="hidden" name="btn_status">

<center> 
<table>   
	<tr>
		<td>sheet_id</td>
		<td><input type="text" name="sheet_id" size="10" value="<%=sheet_id%>"></td>
		<td>laser_defect</td>
		<td><input type="text" name="laser_defect" size="10" value="<%=laser_defect%>"></td>
		<td>cut_op_id</td>
		<td><input type="text" name="cut_op_id" size="10" value="<%=cut_op_id%>"></td>
		<td>x�y��</td>
		<td><input type="text" name="x" size="6" value="<%=x%>"></td>
		<td>y�y��</td>
		<td><input type="text" name="y" size="6" value="<%=y%>"></td>
  </tr>
  <tr> 
	<td>defect_code</td>   
    <td><select name="defect_code">
		<option value=" ">�п��</option>
		<option value="M1: �Q�x��" <%if defect_code="M1: �Q�x��" then response.write("selected") end if%>>M1: �Q�x��</option>
		<option value="M1: �F��" <%if defect_code="M1: �F��" then response.write("selected") end if%>>M1: �F��</option>
		<option value="M1: �_�u/ż��" <%if defect_code="M1: �_�u/ż��" then response.write("selected") end if%>>M1: �_�u/ż��</option>
		<option value="M1: �_�u-Particle" <%if defect_code="M1: �_�u-Particle" then response.write("selected") end if%>>M1: �_�u-Particle</option>
		<option value="M1: �_�u-�}�H" <%if defect_code="M1: �_�u-�}�H" then response.write("selected") end if%>>M1: �_�u-�}�H</option>
		<option value="M1: Fan-out����_�u" <%if defect_code="M1: Fan-out����_�u" then response.write("selected") end if%>>M1: Fan-out����_�u</option>
		<option value="M1: Fan-out�}�H�_�u" <%if defect_code="M1: Fan-out�}�H�_�u" then response.write("selected") end if%>>M1: Fan-out�}�H�_�u</option>
		<option value="M1: Fan-out-Fiber" <%if defect_code="M1: Fan-out-Fiber" then response.write("selected") end if%>>M1: Fan-out-Fiber</option>
		<option value="M1: Fan-out�Q�x" <%if defect_code="M1: Fan-out�Q�x" then response.write("selected") end if%>>M1: Fan-out�Q�x</option>
		<option value="M1: �骬" <%if defect_code="M1: �骬" then response.write("selected") end if%>>M1: �骬</option>
		<option value="M1: ���k" <%if defect_code="M1: ���k" then response.write("selected") end if%>>M1: ���k</option>
		<option value="M1: Others" <%if defect_code="M1: Others" then response.write("selected") end if%>>M1: Others</option>

		<option value="AS: �}�H��" <%if defect_code="AS: �}�H��" then response.write("selected") end if%>>AS: �}�H��</option>
		<option value="AS: �j����" <%if defect_code="AS: �j����" then response.write("selected") end if%>>AS: �j����</option>
		<option value="AS: �p����" <%if defect_code="AS: �p����" then response.write("selected") end if%>>AS: �p����</option>
		<option value="AS: AS�}�}��t�M��" <%if defect_code="AS: AS�}�}��t�M��" then response.write("selected") end if%>>AS: AS�}�}��t�M��</option>
		<option value="AS: AS�}�}��t�ҽk" <%if defect_code="AS: AS�}�}��t�ҽk" then response.write("selected") end if%>>AS: AS�}�}��t�ҽk</option>
		<option value="AS: �h���ݯd" <%if defect_code="AS: �h���ݯd" then response.write("selected") end if%>>AS: �h���ݯd</option>
		<option value="AS: Fiber" <%if defect_code="AS: Fiber" then response.write("selected") end if%>>AS: Fiber</option>
		<option value="AS: Fan-out�}�}" <%if defect_code="AS: Fan-out�}�}" then response.write("selected") end if%>>AS: Fan-out�}�}</option>
		<option value="AS: Fan-out�ݯd" <%if defect_code="AS: Fan-out�ݯd" then response.write("selected") end if%>>AS: Fan-out�ݯd</option>
		<option value="AS: �Q�x�L�ݯd" <%if defect_code="AS: �Q�x�L�ݯd" then response.write("selected") end if%>>AS: �Q�x�L�ݯd</option>
		<option value="AS: Others" <%if defect_code="AS: Others" then response.write("selected") end if%>>AS: Others</option>

		<option value="M2: �Q�x��" <%if defect_code="M2: �Q�x��" then response.write("selected") end if%>>M2: �Q�x��</option>
		<option value="M2: �j����" <%if defect_code="M2: �j����" then response.write("selected") end if%>>M2: �j����</option>
		<option value="M2: �p����" <%if defect_code="M2: �p����" then response.write("selected") end if%>>M2: �p����</option>
		<option value="M2: �h���ݯd" <%if defect_code="M2: �h���ݯd" then response.write("selected") end if%>>M2: �h���ݯd</option>
		<option value="M2: �_�u-�j��Particle" <%if defect_code="M2: �_�u-�j��Particle" then response.write("selected") end if%>>M2: �_�u-�j��Particle</option>
		<option value="M2: �_�u-�p��Particle" <%if defect_code="M2: �_�u-�p��Particle" then response.write("selected") end if%>>M2: �_�u-�p��Particle</option>
		<option value="M2: �F��" <%if defect_code="M2: �F��" then response.write("selected") end if%>>M2: �F��</option>
		<option value="M2: Fan-out�ݯd" <%if defect_code="M2: Fan-out�ݯd" then response.write("selected") end if%>>M2: Fan-out�ݯd</option>
		<option value="M2: Fan-out�Q�x" <%if defect_code="M2: Fan-out�Q�x" then response.write("selected") end if%>>M2: Fan-out�Q�x</option>
		<option value="M2: Fan-out�_�u" <%if defect_code="M2: Fan-out�_�u" then response.write("selected") end if%>>M2: Fan-out�_�u</option>
		<option value="M2: �_�u-ż��" <%if defect_code="M2: �_�u-ż��" then response.write("selected") end if%>>M2: �_�u-ż��</option>
		<option value="M2: Others" <%if defect_code="M2: Others" then response.write("selected") end if%>>M2: Others</option>
		</select>
		&nbsp;&nbsp;&nbsp;</td>

	<td>sub_defect</td>
    <td ><input type="text" name="sub_defect" size="20" value="<%=sub_defect%>"></td>
</tr>
<tr>    
    <td>run_time</td>
    <td><input input type="text" id="datepicker" name="run_time" size="20" value="<%=run_time%>">
		<!-- jquery ����M�� -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			$( function() {
				$( "#datepicker" ).datepicker();
			} );
		</script>
	</td>

	<td>eqp_chamber</td>
    <td ><input type="text" name="eqp_chamber" size="20" value="<%=eqp_chamber%>"></td>
	<input type="hidden"  name = "fib_photo_1" value="<%=fib_photo_1%>">
	<input type="hidden"  name = "fib_photo_2" value="<%=fib_photo_2%>">
	<input type="hidden"  name = "fib_photo_3" value="<%=fib_photo_3%>">	
</tr>

<tr>
	<td>mechanism</td>
	<td><input type="text" name="mechanism" size="22" value="<%=mechanism%>"></td>
	<td>action</td>
	<td><input type="text" name="action" size="22" value="<%=action%>"></td>
</tr>
<tr>
	<td><input value="Al" type = 'text' id = 'Al' name="Al" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Al_value" size="6" value="<%=Al_value%>"></td>

	<td><input value="Ba" type = 'text' id = 'Ba' name="Ba" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Ba_value" size="6" value="<%=Ba_value%>"></td>

	<td><input value="Br" type = 'text' id = 'Br' name="Br" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Br_value" size="6" value="<%=Br_value%>"></td>

	<td><input value="C" type = 'text' id = 'C' name="C" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="C_value" size="6" value="<%=C_value%>"></td>

	<td><input value="Ca" type = 'text' id = 'Ca' name="Ca" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Ca_value" size="6" value="<%=Ca_value%>"></td>

	<td><input value="Cl" type = 'text' id = 'Cl' name="Cl" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Cl_value" size="6" value="<%=Cl_value%>"></td>
</tr>
<tr>
	<td><input value="Cr" type = 'text' id = 'Cr' name="Cr" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Cr_value" size="6" value="<%=Cr_value%>"></td>

	<td><input value="Cu" type = 'text' id = 'Cu'  name="Cu" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Cu_value" size="6" value="<%=Cu_value%>"></td>

	<td><input value="F" type = 'text' id = 'F' name="F" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="F_value" size="6" value="<%=F_value%>"></td>

	<td><input value="Fe" type = 'text' id = 'Fe' name="Fe" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Fe_value" size="6" value="<%=Fe_value%>"></td>

	<td><input value="In" type = 'text' id = 'In' name="In" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="In_value" size="6" value="<%=In_value%>"></td>

	<td><input value="Mg" type = 'text' id = 'Mg' name="Mg" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Mg_value" size="6" value="<%=Mg_value%>"></td>
</tr>
<tr>
	<td><input value="Mn" type = 'text' id = 'Mn' name="Mn" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Mn_value" size="6" value="<%=Mn_value%>"></td>

	<td><input value="Mo" type = 'text' id = 'Mo' name="Mo" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Mo_value" size="6" value="<%=Mo_value%>"></td>

	<td><input value="N" type = 'text' id = 'N' name="N" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="N_value" size="6" value="<%=N_value%>"></td>

	<td><input value="Ni" type = 'text' id = 'Ni' name="Ni" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Ni_value" size="6" value="<%=Ni_value%>"></td>

	<td><input value="O" type = 'text' id = 'O' name="O" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="O_value" size="6" value="<%=O_value%>"></td>

	<td><input value="Os" type = 'text' id = 'Os' name="Os" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Os_value" size="6" value="<%=Os_value%>"></td>
</tr>
<tr>
	<td><input value="P" type = 'text' id = 'P' name="P" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="P_value" size="6" value="<%=P_value%>"></td>

	<td><input value="S" type = 'text' id = 'S' name="S" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="S_value" size="6" value="<%=S_value%>"></td>

	<td><input value="Si" type = 'text' id = 'Si' name="Si" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Si_value" size="6" value="<%=Si_value%>"></td>

	<td><input value="Sr" type = 'text' id = 'Sr' name="Sr" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Sr_value" size="6" value="<%=Sr_value%>"></td>

	<td><input value="Ti" type = 'text' id = 'Ti' name="Ti" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Ti_value" size="6" value="<%=Ti_value%>"></td>

	<td><input value="Zr" type = 'text' id = 'Zr' name="Zr" style="background-color:yellow;text-align:center;" size="1" readonly></td>
	<td><input type="text" name="Zr_value" size="6" value="<%=Zr_value%>"></td>
</tr>
<tr>
	&nbsp;
    <td><input type="button" name="Submit" value="Save" style="width:60px;cursor:hand" onClick="jsSave()"></td>
	&nbsp;		
</tr>
<tr>
	<td style="background-color:rgb(245, 168, 53)">Defect_code</td>
	<td style="background-color:rgb(245, 168, 53)"><input type="text" name="search_defect" value="<%=request("search_defect")%>"  size="10"></td>&nbsp;&nbsp;
	<td style="background-color:rgb(245, 168, 53)">Element</td>
	<td style="background-color:rgb(245, 168, 53)"><input type="text" name="search_element" value="<%=request("search_element")%>"  size="10"></td>&nbsp;&nbsp;
	<td style="background-color:rgb(245, 168, 53)"><input type="Submit" name="search_show" value="show" style="width:60px;cursor:hand"></td>
</tr>


</table>
</center>


<hr>
<br>
<table class="order-table zebra">
	<thead>
		<tr>
			<th>sheet_id</th>
			<th>laser_defect</th>
			<th>cut_op_id</th>
			<th>x�y��</th>
			<th>y�y��</th>	
			<th>defect_code</th>
			<th>sub_defect</th>
			<th>run_time</th>
			<th>eqp_chamber</th>
			<th>fib_photo_1</th>
			<th>fib_photo_2</th>
			<th>fib_photo_3</th>
			<th>lm_time</th>
			<th>mechanism</th>
			<th>action</th>
			<th>element</th>
			<th>Edit</th>
		</tr>
	</thead>

<!-- �s�W+�ק�:select��Ʈw��� ��ܫe�ݭ��� -->
<%
		search_defect = request("search_defect")
        search_element = request("search_element")

		sql = ""	
		sql = sql & "select main_pk, sheet_id, laser_defect, cut_op_id, x, y, defect_code, sub_defect, run_time, eqp_chamber, fib_photo_1, fib_photo_2, fib_photo_3, lm_time, mechanism, action, element"
        sql = sql & " from (SELECT a.main_pk, a.sheet_id, a.laser_defect, a.cut_op_id, a.x, a.y, a.defect_code,  a.sub_defect, a.run_time, a.eqp_chamber, a.fib_photo_1, a.fib_photo_2, a.fib_photo_3, a.lm_time, a.mechanism, a.action"
        sql = sql & ", (SELECT GROUP_CONCAT(concat(element, ':', numerical_value)) FROM l8b_ARY_FIB_Data_detail d where d.main_pk = a.main_pk having MAX(d.main_pk)) as element FROM l8bi0.l8b_ARY_FIB_Data a) b where main_pk <> 0 "
		
        if search_defect <> "" then
	    	sql = sql & " and defect_code like '%" & search_defect & "%'"
    	end if

        if search_element <> "" then
	    	sql = sql & " and element like '%" & search_element & "%'"
    	end if


'sql= "SELECT main_pk, sheet_id, laser_defect, cut_op_id, x, y, defect_code,  sub_defect, run_time, eqp_chamber, fib_photo_1, fib_photo_2, fib_photo_3, lm_time, mechanism, action, (SELECT GROUP_CONCAT(concat(element, ':', numerical_value)) FROM l8b_ARY_FIB_Data_detail d where d.main_pk = a.main_pk having MAX(d.main_pk)) as element FROM l8bi0.l8b_ARY_FIB_Data a "

'response.write(sql)	

'myrs.CursorLocation = 3	
'myrs.Open "SET NAMES 'big5'", myconn
'myrs.CursorType = 3
'myrs.LockType = 2
'myrs.Open sql, myconn
  
'if Not myrs.EOF then

	'for i = 1 to myrs.RecordCount
set myrs = Server.CreateObject("ADODB.Recordset")
myrs.CursorLocation = 3
myrs.Open "SET NAMES 'big5'", myconn
myrs.Open sql, myconn
		
If Not myrs.EOF Then
	cnt=myrs.RecordCount	
	For i = 1 To cnt
		main_pk = myrs.Fields("main_pk")
		sheet_id = myrs.Fields("sheet_id")
		laser_defect = myrs.Fields("laser_defect")
		cut_op_id = myrs.Fields("cut_op_id")
		x = myrs.Fields("x")
		y = myrs.Fields("y")		
		defect_code = myrs.Fields("defect_code")
		sub_defect = myrs.Fields("sub_defect")
		run_time = myrs.Fields("run_time")
		eqp_chamber = myrs.Fields("eqp_chamber")
		fib_photo_1 = myrs.Fields("fib_photo_1")
		fib_photo_2 = myrs.Fields("fib_photo_2")
		fib_photo_3 = myrs.Fields("fib_photo_3")
		lm_time = myrs.Fields("lm_time")
		mechanism = myrs.Fields("mechanism")
		action = myrs.Fields("action")
		element = myrs.Fields("element")
		
%>
<tbody>

<tr>
	<!--�s�W+�ק�:�N��Ʈw�ȱa�J�e�ݪ�椤-->

	<td><%=sheet_id%></td>
	<!--<a href='http://tw100018629/L8BI0_WEB/FIB/LSR.asp?board_id=<%=sheet_id%>' target=_self></a>-->
	<td><%=laser_defect%></td>
	<td><%=cut_op_id%></td>
	<td><%=x%></td>
	<td><%=y%></td>
	<td><%=defect_code%></td>
	<td><%=sub_defect%></td>
	<td><%=run_time%></td>
	<td><%=eqp_chamber%></td>

	<td>
		<%				
			if myrs("fib_photo_1")  <> "" then
				response.Write("<a href='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_1") &"' target=_blank><img src='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_1") &"' width='60' height='30'></a>")
			end if
		%><br>	
		<input type="button" name="fib_photo_1" value="�ܧ�Ϥ�" style="cursor:hand" onClick="window.open('http://tw100018629/L8BI0_WEB/FIB/photo_up.asp?main_pk=<%=main_pk%>','_self')">				
	</td>
	
	<td>
		<%			
			if myrs("fib_photo_2")  <> ""  then
				response.Write("<a href='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_2") &"' target=_blank><img src='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_2") &"' width='60' height='30'></a>")
			end if
		%><br>	
		<input type="button" name="fib_photo_2" value="�ܧ�Ϥ�" style="cursor:hand" onClick="window.open('http://tw100018629/L8BI0_WEB/FIB/photo_up_photo2.asp?main_pk=<%=main_pk%>','_self')">		
	</td>

	<td>
		<%			
			if myrs("fib_photo_3")  <> ""  then
				response.Write("<a href='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_3") &"' target=_blank><img src='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_3") &"' width='60' height='30'></a>")
			end if
		%><br>	
		<input type="button" name="fib_photo_3" value="�ܧ�Ϥ�" style="cursor:hand" onClick="window.open('http://tw100018629/L8BI0_WEB/FIB/photo_up_photo3.asp?main_pk=<%=main_pk%>','_self')">			
	</td>

	<td><%=lm_time%></td>
	<td><%=mechanism%></td>
	<td><%=action%></td>
	<td><%=element%>

		<!-- �Ϫ�M��(IE�L�k�B�@) -->
		<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

		<canvas id="chart" width="8px" height="6px"></canvas>
		<script>
			var ctx = document.getElementById('chart').getContext('2d');
			var chart = new Chart(ctx, {
			type: 'pie',
			data: {
					labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
					datasets: [{
							label: '# of Votes',
							data: [12, 19, 3, 5, 2, 3]
						}]
					}
				});
		</script> -->
	
	</td>

	<td align="center">
		<input type="button" name="btn" value="Update" OnClick="jsUpdate('<%=main_pk%>')">
		<input type="button" name="Submit" value="Delete" style="width:60px;cursor:hand;background-color:rgb(247, 111, 134)" onClick="jsDelete('<%=main_pk%>','<%=sheet_id%>')"></td>
</tr>

<%
		myrs.movenext
	next
end if
myrs.close
%>

<style>	
	tbody {
	font: normal medium/1.4 sans-serif;
	}
	.zebra thead{
		background:#3cbde4;
	}
	.zebra {
	border-collapse: collapse;
	width: 100%;
	}
	.zebra th, td {
	padding: 0.25rem;
	text-align: center;
	border: 1px solid #ccc;
	font: normal medium/1.4 sans-serif;
	}
	.zebra tbody tr:hover {
	background: rgb(248, 248, 195);
	}
</style>
</tbody>
</table>
</form>
</body>
</html>

<%
myconn.close
%>