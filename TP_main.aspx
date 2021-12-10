<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTP.aspx.cs" Inherits="TTP"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TTP</title>
</head>
<body>
    <form id="form1"  runat="server">
    <div>  
        <br />
        <br />      
        
        Model:
        <asp:TextBox ID = "tb1" runat = "server" /> &nbsp;&nbsp;
        Date:
        <asp:TextBox ID = "tb2_date" runat = "server" /> &nbsp;&nbsp;

        <!--日期套件-->
        <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
        <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="jqueryui/style.css">
        
        <script>   
        $(function() {            
            $( "#tb2_date" ).datepicker({
                dateFormat: 'yy/mm/dd'      
            });
        });
        </script>   
        

        <asp:Button ID = "btn1" runat = "server" OnClick = "btn1_click" Text = "Query" />

        <br />
        <br />
        <br />
        <!--顯示table list-->
        <asp:GridView ID = "GridView1" runat = "server"                
            BackColor = "White" 
            BorderColor = "#999999" BorderStyle = "Solid" 
            BorderWidth = "2px" CellPadding = "6" 
            ForeColor = "Black" GridLines = "Vertical">          
            <FooterStyle BackColor = "#CCCCCC" />
            <PagerStyle BackColor = "#999999" ForeColor = "Black" HorizontalAlign = "Center" />
            <SelectedRowStyle BackColor = "#000099" Font-Bold = "True" ForeColor = "White" />
            <HeaderStyle BackColor = "#4A4AFF" Font-Bold = "True" ForeColor = "White" />
            <AlternatingRowStyle BackColor="#F1E1FF" />
        </asp:GridView>

       
    </div>
    </form>
</body>
</html>
