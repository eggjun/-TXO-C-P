<%
set myconn = Server.CreateObject("ADODB.Connection")
myconn.Open("Driver=MySQL ODBC 3.51 Driver; Server=tw100018629;port:3306; Database=l8bi0; uid=L8BI0; pwd=L8BI02010;")
Set myrs = Server.CreateObject("ADODB.Recordset")

catch_board_id = trim(request("board_id"))
%>

<script Language="javascript" src="./calendar/calendar_1/calendar.js"></script>
<script>
	function Goback(){
		window.location=('http://tw100018629/L8BI0_WEB/FIB/ARY_FIB_DATA.asp');
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>ARY_FIB_DATA</title>
</head>
<body>
<form name="query">
<input type="hidden" name="main_pk"  value="<%=main_pk%>">
<input type="hidden" name="btn_status">

<table class="zebra">
	<thead>
		<th colspan="26">LSR</th>
			<tr>	
				<th>lot_id</th>
				<th>board_id</th>
				<th>chip_id</th>
				<th>data_ax</th>
				<th>gate_ax</th>
				<th>dft_mode</th>
				<th>rp_mtd_code</th>
				<th>rp_flag</th>
				<th>tool_id</th>
				<th>route</th>
				<th>ddate_ttime</th>
				<th>retype</th>
				<th>op_id</th>
				<th>x_cord</th>
				<th>y_cord</th>
				<th>mfg_day</th>
				<th>tester_tool</th>
				<th>ratio</th>
				<th>tester_opid</th>
				<th>repair_opid</th>
				<th>model_no</th>
				<th>abbr_no</th>
				<th>run_sysdate</th>
				<th>tool_tye</th>
				<th>lsr_judge</th>
				<th>TOS3</th>
			</tr>
	</thead>

<%
sql= "SELECT lot_id, board_id, chip_id, data_ax,  gate_ax, dft_mode, rp_mtd_code, rp_flag, tool_id, route, ddate_ttime, retype, op_id, x_cord, y_cord, mfg_day, tester_tool, ratio, tester_opid, repair_opid, model_no, abbr_no, run_sysdate, tool_tye, lsr_judge, TOS3 FROM l8bi0.at_alr_rpf where board_id = '" & catch_board_id & "' "

'response.write(catch_board_id)
'response.end()	

myrs.CursorLocation = 3	
myrs.Open "SET NAMES 'big5'", myconn
myrs.Open sql, myconn,3

if Not myrs.EOF then
	
	for i = 1 to myrs.RecordCount


		lot_id = myrs.Fields("lot_id")
		board_id = myrs.Fields("board_id")
		chip_id = myrs.Fields("chip_id")
		data_ax = myrs.Fields("data_ax")
		gate_ax = myrs.Fields("gate_ax")
		dft_mode = myrs.Fields("dft_mode")
		rp_mtd_code = myrs.Fields("rp_mtd_code")
		rp_flag = myrs.Fields("rp_flag")
		tool_id = myrs.Fields("tool_id")
		route = myrs.Fields("route")
		ddate_ttime = myrs.Fields("ddate_ttime")
		retype = myrs.Fields("retype")
		op_id = myrs.Fields("op_id")
		x_cord = myrs.Fields("x_cord")
		y_cord = myrs.Fields("y_cord")
		mfg_day = myrs.Fields("mfg_day")
		tester_tool = myrs.Fields("tester_tool")
		ratio = myrs.Fields("ratio")
		tester_opid = myrs.Fields("tester_opid")
		repair_opid = myrs.Fields("repair_opid")
		model_no = myrs.Fields("model_no")
		abbr_no = myrs.Fields("abbr_no")
		run_sysdate = myrs.Fields("run_sysdate")
		tool_tye = myrs.Fields("tool_tye")
		lsr_judge = myrs.Fields("lsr_judge")
		TOS3 = myrs.Fields("TOS3")

%>
	
	<tbody>	
		<tr>
			<td><%=lot_id%></td>
			<td><%=board_id%></td>
			<td><%=chip_id%></td>
			<td><%=data_ax%></td>
			<td><%=gate_ax%></td>
			<td><%=dft_mode%></td>
			<td><%=rp_mtd_code%></td>
			<td><%=rp_flag%></td>
			<td><%=tool_id%></td>
			<td><%=route%></td>
			<td><%=ddate_ttime%></td>
			<td><%=retype%></td>
			<td><%=op_id%></td>
			<td><%=x_cord%></td>
			<td><%=y_cord%></td>
			<td><%=mfg_day%></td>
			<td><%=tester_tool%></td>
			<td><%=ratio%></td>
			<td><%=tester_opid%></td>
			<td><%=repair_opid%></td>
			<td><%=model_no%></td>
			<td><%=abbr_no%></td>
			<td><%=run_sysdate%></td>
			<td><%=tool_tye%></td>
			<td><%=lsr_judge%></td>
			<td><%=TOS3%></td>
		</tr>
	<%
			myrs.movenext
		next
	end if
	%>
	
	<tr>
	
		<input type = "button" value="回前頁" style="width:160px;cursor:hand;background-color:rgb(247, 111, 134)" onclick="Goback()">
		
	</tr>
</tbody>
</table>
<% 
myrs.close


%>
<br>
<br>
<br>
<br>
<br>
<br>


<table class="zebra">
	<thead>
		<th colspan="23">AOI</th>
			<tr>
				<th>mfg_day</th>
				<th>model_no</th>
				<th>abbr_no</th>
				<th>op_id</th>
				<th>eqp_id</th>
				<th>test_time</th>
				<th>tft_lot_id</th>
				<th>tft_sheet_id</th>
				<th>tft_chip_id</th>
				<th>start_coord_x</th>
				<th>start_coord_y</th>
				<th>signal_no</th>
				<th>gate_no</th>
				<th>current_def_code</th>
				<th>current_def_code_desc</th>
				<th>defect_size</th>
				<th>first_retype_def_code</th>
				<th>first_retype_def_code_desc</th>
				<th>second_retype_def_code</th>
				<th>second_retype_def_code_desc</th>
				<th>first_retype_user</th>
				<th>first_retype_time</th>
				<th>second_retype_time</th>

			</tr>
	</thead>
	<%
	sql= "SELECT mfg_day, model_no, abbr_no, op_id, eqp_id, test_time, tft_lot_id, tft_sheet_id, tft_chip_id, start_coord_x, start_coord_y, signal_no, gate_no, current_def_code, current_def_code_desc, defect_size, first_retype_def_code, first_retype_def_code_desc, second_retype_def_code, second_retype_def_code_desc, first_retype_user, first_retype_time, second_retype_time FROM l8bi0.aidi_defect_data where tft_sheet_id = '" & catch_board_id & "' "
	
	
	
	
	myrs.CursorLocation = 3	
	myrs.Open "SET NAMES 'big5'", myconn
	myrs.Open sql, myconn,3
	
	if Not myrs.EOF then
		
		for i = 1 to myrs.RecordCount
	
			mfg_day = myrs.Fields("mfg_day")
			model_no = myrs.Fields("model_no")
			abbr_no = myrs.Fields("abbr_no")
			op_id = myrs.Fields("op_id")
			eqp_id = myrs.Fields("eqp_id")
			test_time = myrs.Fields("test_time")
			tft_lot_id = myrs.Fields("tft_lot_id")
			tft_sheet_id = myrs.Fields("tft_sheet_id")
			tft_chip_id = myrs.Fields("tft_chip_id")
			start_coord_x = myrs.Fields("start_coord_x")
			start_coord_y = myrs.Fields("start_coord_y")
			signal_no = myrs.Fields("signal_no")
			gate_no = myrs.Fields("gate_no")
			current_def_code = myrs.Fields("current_def_code")
			current_def_code_desc = myrs.Fields("current_def_code_desc")
			defect_size = myrs.Fields("defect_size")
			first_retype_def_code = myrs.Fields("first_retype_def_code")
			first_retype_def_code_desc = myrs.Fields("first_retype_def_code_desc")
			second_retype_def_code = myrs.Fields("second_retype_def_code")
			second_retype_def_code_desc = myrs.Fields("second_retype_def_code_desc")
			first_retype_user = myrs.Fields("first_retype_user")
			first_retype_time = myrs.Fields("first_retype_time")
			second_retype_time = myrs.Fields("second_retype_time")
	
	%>

	<tbody>	
		<tr>
			<td><%=mfg_day%></td>
			<td><%=model_no%></td>
			<td><%=abbr_no%></td>
			<td><%=op_id%></td>
			<td><%=eqp_id%></td>
			<td><%=test_time%></td>
			<td><%=tft_lot_id%></td>
			<td><%=tft_sheet_id%></td>
			<td><%=tft_chip_id%></td>
			<td><%=start_coord_x%></td>
			<td><%=start_coord_y%></td>
			<td><%=signal_no%></td>
			<td><%=gate_no%></td>
			<td><%=current_def_code%></td>
			<td><%=current_def_code_desc%></td>
			<td><%=defect_size%></td>
			<td><%=first_retype_def_code%></td>
			<td><%=first_retype_def_code_desc%></td>
			<td><%=second_retype_def_code%></td>
			<td><%=second_retype_def_code_desc%></td>
			<td><%=first_retype_user%></td>
			<td><%=first_retype_time%></td>
			<td><%=second_retype_time%></td>
		</tr>
		<%
		myrs.movenext
	next
end if
%>

<style>	
	tbody {
	  font: normal medium/1.4 sans-serif;
	}
	.zebra thead{
		background:#0bb391;
	}
	.zebra {
	  border-collapse: collapse;
	  width: 100%;
	}
	.zebra th, td {
	  padding: 0.25rem;
	  text-align: center;
	  border: 1px solid #ccc;
	}
	.zebra tbody tr:hover {
	  background: rgb(248, 248, 195);
	}
	</style>
</tbody>	
</table>
<% 
myrs.close
%>