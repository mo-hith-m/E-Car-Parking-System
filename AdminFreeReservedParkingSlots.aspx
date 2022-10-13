<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminFreeReservedParkingSlots.aspx.cs" Inherits="AdminFreeParking" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
        <tr>
            <td class="style5" colspan="2" 
                style="border: thin ridge #6600CC; background-image: url('background/btblueblk.gif'); text-align: center; font-weight: 700; color: #FFFFFF;">
                Free / De-Reserve The parking Slots</td>
        </tr>
        <tr>
            <td colspan="2" style="border: thin ridge #6600CC; text-align: center;">
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
        <tr>
            <td style="border: thin ridge #6600CC; text-align: right; font-weight: 700;">
                SELECT THE RESERVATION ID TO FREE THE SLOT</td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlrid" runat="server" Height="16px" 
                    style="font-weight: 700" Width="141px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                &nbsp;&nbsp;
                <asp:Button ID="btnfreeslot" runat="server" BackColor="#4B4BE4" 
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" 
                    onclick="btnfreeslot_Click" Text="FREE SLOT" Width="106px" />
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

