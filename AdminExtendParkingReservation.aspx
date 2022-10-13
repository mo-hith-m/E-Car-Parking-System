<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminExtendParkingReservation.aspx.cs" Inherits="AdminExtendParkingReservation" %>

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
        .style6
        {
            font-weight: bold;
        }
        .style7
        {
            text-transform: uppercase;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
        <tr>
            <td class="style5" colspan="2" 
                style="border: thin ridge #6600CC; background-image: url('background/btblueblk.gif'); text-align: center; font-weight: 700; color: #FFFFFF;">
                EXTEND THE parking Slots RESRVATIONS</td>
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
                    style="font-weight: 700" Width="141px" AutoPostBack="True" 
                    onselectedindexchanged="ddlrid_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="border: thin ridge #6600CC; text-align: right;">
                <b>DATE OF PARKING</b></td>
            <td style="border: thin ridge #6600CC">
                <b>
                <asp:Label ID="lbldateofparking" runat="server"></asp:Label>
                &nbsp;&nbsp;
                &nbsp;</b></td>
        </tr>
        <tr>
            <td style="border: thin ridge #6600CC; text-align: right;">
                <b>TOTAL DAYS</b></td>
            <td style="border: thin ridge #6600CC">
                <b>
                <asp:Label ID="lbldays" runat="server"></asp:Label>
                </b>
            </td>
        </tr>
        <tr>
            <td style="border: thin ridge #6600CC; text-align: right;" class="style7">
                Parking Charges / Day</td>
            <td style="border: thin ridge #6600CC">
                <asp:Label ID="lblcharges" runat="server" 
                    style="font-size: large" CssClass="style6">150</asp:Label>
            </td>
        </tr>
        <tr>
            <td style="border: thin ridge #6600CC; text-align: right;" class="style7">
                DATE EXTENDS TO</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txttodate" runat="server" CssClass="style6" TextMode="Date" 
                    Width="141px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txttodate" ErrorMessage="Select The Extended Date" 
                    style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="border: thin ridge #6600CC; text-align: right;" class="style7">
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnsubmit" runat="server" BackColor="#4B4BE4" 
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" 
                    ForeColor="White" Height="24px" onclick="btnsubmit_Click" Text="SUBMIT" 
                    Width="94px" />
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

