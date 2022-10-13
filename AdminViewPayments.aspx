<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminViewPayments.aspx.cs" Inherits="AdminViewPayments" %>

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
        .style5
    {
        color: #000066;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
    <tr>
        <td colspan="2" 
            style="background-image: url('background/btblueblk.gif');" class="style6">
&nbsp;PARKING PAYMENTS DETAILS</td>
    </tr>
    <tr>
        <td style="border: thin solid #FFCC00; text-align: center;">
            <asp:Image ID="Image2" runat="server" Height="110px" 
                ImageUrl="~/images/img5.gif" Width="244px" />
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
    <tr>
        <td style="border: thin solid #FFCC00; text-align: center;">
            &nbsp;</td>
        <td style="border: thin solid #FFCC00; text-align: center;">
            <asp:Label ID="lbltotal" runat="server" BackColor="#4B4BE4" 
                style="color: #FFFFFF; font-weight: 700; font-size: large"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="border: thin solid #FFCC00; text-align: center;">
            &nbsp;</td>
        <td style="border: thin solid #FFCC00; text-align: center;">
            <span class="style5" style="font-size: large"><strong style="color: #000066">
            Please Select The Date To Show The Payments</strong></span></td>
    </tr>
    <tr>
        <td style="border: thin solid #FFCC00; text-align: center;">
            &nbsp;</td>
        <td style="border: thin solid #FFCC00; text-align: center;">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                Font-Size="9pt" ForeColor="Black" Height="143px" NextPrevFormat="ShortMonth" 
                onselectionchanged="Calendar1_SelectionChanged" style="font-size: x-small" 
                Width="170px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                    Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="Black" BorderStyle="Solid" Font-Bold="True" 
                    Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
        </td>
    </tr>
    <tr>
        <td style="border: thin solid #FFCC00; text-align: center;">
            &nbsp;</td>
        <td style="border: thin solid #FFCC00; text-align: center; font-weight: 700;">
            <asp:GridView ID="GridView2" runat="server" BackColor="White" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                ForeColor="Black" GridLines="Vertical" style="font-size: small">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="#4B4BE4" Font-Bold="True" ForeColor="White" />
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
        <td style="border: thin solid #FFCC00; text-align: center;">
            &nbsp;</td>
        <td style="border: thin solid #FFCC00; text-align: center;">
            <asp:Label ID="lblpayment" runat="server" BackColor="#4B4BE4" ForeColor="White" 
                style="font-size: x-large; font-weight: 700;"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

