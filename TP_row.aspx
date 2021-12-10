<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTP_Chart.aspx.cs" Inherits="TTP_Chart"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>TTP</title>
    </head>
        <body>
            <form id="form1" runat="server">
                <div> 
                    <table> 
                        <tr>
                            <td>                                                        
                                <asp:GridView ID = "Header_Data" runat = "server"                
                                    BackColor = "White" 
                                    BorderColor = "#999999" BorderStyle = "Solid" 
                                    BorderWidth = "1px" CellPadding = "6" 
                                    ForeColor = "Black" GridLines = "Vertical">                                    
                                    <FooterStyle BackColor = "#CCCCCC" />
                                    <PagerStyle BackColor = "#999999" ForeColor = "Black" HorizontalAlign = "Center" />
                                    <SelectedRowStyle BackColor = "#000099" Font-Bold = "True" ForeColor = "White" />
                                    <HeaderStyle BackColor = "#005AB5" Font-Bold = "True" ForeColor = "White" />
                                    <AlternatingRowStyle BackColor="#C4E1FF" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <br />
                        <br />
                        <tr valign = "top">                             
                            <td align = "right">
                                
                                <div>
                                    <asp:GridView ID = "TP_Data" runat = "server"                
                                        BackColor = "White" 
                                        BorderColor = "#999999" BorderStyle = "Solid" 
                                        BorderWidth = "1px" CellPadding = "6" 
                                        ForeColor = "Black" GridLines = "Vertical">          
                                        <FooterStyle BackColor = "#CCCCCC" />
                                        <PagerStyle BackColor = "#999999" ForeColor = "Black" HorizontalAlign = "Center" />
                                        <SelectedRowStyle BackColor = "#000099" Font-Bold = "True" ForeColor = "White" />
                                        <HeaderStyle BackColor = "#02DF82" Font-Bold = "True" ForeColor = "White" />
                                        <AlternatingRowStyle BackColor="#C1FFE4" />
                                    </asp:GridView> 
                                </div>
                            </td> 
                            <td> 
                                <div>                 
                                    <asp:GridView ID = "Mes_Data" runat = "server"                
                                        BackColor = "White" 
                                        BorderColor = "#999999" BorderStyle = "Solid" 
                                        BorderWidth = "1px" CellPadding = "6" 
                                        ForeColor = "Black" GridLines = "Vertical">          
                                        <FooterStyle BackColor = "#CCCCCC" />
                                        <PagerStyle BackColor = "#999999" ForeColor = "Black" HorizontalAlign = "Center" />
                                        <SelectedRowStyle BackColor = "#000099" Font-Bold = "True" ForeColor = "White" />
                                        <HeaderStyle BackColor = "#005AB5" Font-Bold = "True" ForeColor = "White" />
                                        <AlternatingRowStyle BackColor="#C4E1FF" />
                                    </asp:GridView>
                                </div>
                            </td>   
                          
                        </tr>
                    </table>
                </div>
            </form>
        </body>
</html>
