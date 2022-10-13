<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminViewReservedParkingByCity.aspx.cs" Inherits="AdminReservedParking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style4
        {
            width: 100%;
        }
        .style6
        {
            text-align: right;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
        <tr>
            <td class="style3" colspan="3" 
                
                style="border: thin ridge #6600CC; font-weight: 700; text-align: center; background-image: url('background/btblueblk.gif');">
                VIEW RESERVED PARKING SLOTS DETAILS BY CITY</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Select The City</td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlcity" runat="server" AutoPostBack="True" Height="19px" 
                    onselectedindexchanged="ddlcity_SelectedIndexChanged" style="font-weight: 700" 
                    Width="166px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem>Bengaluru</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Select The Area</td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlarea" runat="server" Height="16px" 
                    style="font-weight: 700" Width="166px" AutoPostBack="True" 
                    onselectedindexchanged="ddlarea_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Parking Area In This Area</td>
            <td style="border: thin ridge #6600CC; font-weight: 700; text-align: center;">
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
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                <p>
                    Select The
                Parking Area Code</p>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlpcode" runat="server" AutoPostBack="True" 
                    Height="19px" onselectedindexchanged="ddlpcode_SelectedIndexChanged" 
                    style="font-weight: 700" Width="164px">
                </asp:DropDownList>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                <asp:GridView ID="GridView2" runat="server" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Horizontal" 
                    style="font-weight: 700; text-align: center; font-size: small">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4B4BE4" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

