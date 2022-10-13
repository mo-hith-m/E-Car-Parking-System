<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="CustomerParkingBill.aspx.cs" Inherits="CustomerParkingBill" %>

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
            color: #FFCC00;
            border: thin solid #FFCC00;
        }
        .style7
        {
            width: 341px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
        <tr>
            <td bgcolor="Black" colspan="2" class="style6">
            CHECK YOUR RESERVED PARKING BILL DETAILS</td>
        </tr>
        <tr>
            <td style="border: thin solid #FFCC00; text-align: right; font-weight: 700;" 
                class="style7">
                &nbsp;</td>
            <td style="border: thin solid #FFCC00; font-weight: 700; text-align: center;">
            ENTER YOUR RESERVATION ID<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtrid" runat="server" Width="145px"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnsubmit" runat="server" BackColor="Black" 
                BorderStyle="Double" Font-Bold="True" ForeColor="#FFCC00" 
                onclick="btnsubmit_Click" Text="SUBMIT" Width="91px" />
            </td>
        </tr>
        <tr>
            <td style="border: thin solid #FFCC00; text-align: center;" class="style7">
                <asp:Image ID="Image2" runat="server" Height="124px" 
                    ImageUrl="~/images/logo2.png" Width="240px" />
            </td>
            <td style="border: thin solid #FFCC00">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                ForeColor="Black" GridLines="Vertical" 
                style="font-size: small; text-align: center; font-weight: 700">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="#FFCC00" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="border: thin solid #FFCC00" class="style7">
                &nbsp;</td>
            <td style="border: thin solid #FFCC00; text-align: center;">
                <asp:Label ID="lblbill" runat="server" BackColor="Black" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="#FFCC00" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

