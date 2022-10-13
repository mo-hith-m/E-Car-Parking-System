<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminAllreservedParkings.aspx.cs" Inherits="AdminAllreservedParkings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style4
    {
        width: 100%;
    }
    .style6
    {
        text-align: center;
        font-weight: 700;
        font-size: large;
        color: #FFFFFF;
        border: thin solid #FFCC00;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
    <tr>
        <td colspan="2" 
            style="background-image: url('background/btblueblk.gif');" class="style6">
&nbsp;ALL RESERVED PARKING SLOT DETAILS</td>
    </tr>
    <tr>
        <td style="border: thin solid #FFCC00; text-align: center;">
            <asp:Image ID="Image2" runat="server" Height="110px" 
                ImageUrl="~/images/img6.jpg" Width="244px" />
        </td>
        <td style="border: thin solid #FFCC00">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                ForeColor="#333333" GridLines="None" 
                style="font-size: small; text-align: center; font-weight: 700">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#4B4BE4" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>

