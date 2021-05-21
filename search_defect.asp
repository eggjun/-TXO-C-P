<%
set myconn = Server.CreateObject("ADODB.Connection")
myconn.Open("Driver=MySQL ODBC 3.51 Driver; Server=tw100018629;port:3306; Database=l8bi0; uid=L8BI0; pwd=L8BI02010;")
Set myrs = Server.CreateObject("ADODB.Recordset")
%>

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

<table>
    <tr>
		<input type = "button" value="回主頁" style="width:160px;cursor:hand;background-color:rgb(247, 111, 134)" onclick="window.location=('http://tw100018629/L8BI0_WEB/FIB/ARY_FIB_DATA.asp')">
	</tr>
    <center>
        <td style="background-color:rgb(245, 168, 53)">Defect_code</td>
        <td style="background-color:rgb(245, 168, 53)"><input type="text" name="search_defect" value="<%=request("search_defect")%>"  size="10"></td>&nbsp;&nbsp;
        <td style="background-color:rgb(245, 168, 53)">Element</td>
        <td style="background-color:rgb(245, 168, 53)"><input type="text" name="search_element" value="<%=request("search_element")%>"  size="10"></td>&nbsp;&nbsp;
        <td style="background-color:rgb(245, 168, 53)"><input type="Submit" name="search_show" value="show" style="width:60px;cursor:hand"></td>
    </center>
</table>	
<table class="zebra">
    <thead>
        <tr>
            <th>sheet_id</th>
            <th>laser_defect</th>
            <th>cut_op_id</th>
            <th>x座標</th>
            <th>y座標</th>	
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
     
        </tr>
    </thead>
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

    <%
        if search_defect <> "" or search_element <> ""  then
    %>
    <tbody>
    <tr>
        <td><%=sheet_id%></td>
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
            %>				
        </td>
        
        <td>
            <%			
                if myrs("fib_photo_2")  <> ""  then
                    response.Write("<a href='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_2") &"' target=_blank><img src='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_2") &"' width='60' height='30'></a>")
                end if
            %>		
        </td>
    
        <td>
            <%			
                if myrs("fib_photo_3")  <> ""  then
                    response.Write("<a href='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_3") &"' target=_blank><img src='\L8BI0_WEB\FIB\upload_Image\" & myrs("fib_photo_3") &"' width='60' height='30'></a>")
                end if
            %>			
        </td>

        <td><%=lm_time%></td>
        <td><%=mechanism%></td>
        <td><%=action%></td>
        <td><%=element%></td>
    </tr>
    </tbody>
    <%end if%>

	<%
	myrs.MoveNext	
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
</table>
</form>
</html>
<% 
myconn.close 
%>



		
