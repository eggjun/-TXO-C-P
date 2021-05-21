<!DOCTYPE html>
<html>
<body>
<table>
<td id="week1">" & week_tmp & "</td>
<td id="stage1">" & stage_tmp & "</td>
<td>&nbsp;<input name="week" type="text" value="" id="week" size="10"></td>
<td><select name="stage" id="stage">
    <option value=""></option>
    <option value="PVD">PVD</option>
    <option value="CVD">CVD</option>
    <option value="PH" >PH</option>
    <option value="WET">WET</option>
    <option value="DRY">DRY</option>
    </select>


<button id="btn_U" onclick="myFunction()">Update</button>

<script>
function myFunction() {
	document.getElementById("week").value = document.getElementById("week1").innerHTML; 
    var obj=document.getElementById( 'stage' );
	var index=obj.selectedIndex; //序號，取當前選中選項的序號
	var val = obj.options[index].text;
 
	btn_U.remove();
	document.getElementById("week1").innerHTML = "<button id='save_btn' onclick='SaveFunction()'>save</button>"

}
function SaveFunction(){
	document.getElementById("week1").innerHTML = document.getElementById("week").value; 
	week.remove();

}


</script>
</table>
</body>
</html>
