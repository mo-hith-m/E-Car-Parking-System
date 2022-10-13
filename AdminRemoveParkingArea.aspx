<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminRemoveParkingArea.aspx.cs" Inherits="AdminRemoveParkingArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style4
        {
            width: 78%;
        }
        .style5
        {
            font-weight: bold;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
        <tr>
            <td bgcolor="#FFCC00" colspan="3" 
                style="border: medium solid #000000; text-align: center;">
                <b>REMOVE PARKING AREA DETAILS</b></td>
        </tr>
        <tr>
            <td class="style5" style="border: thin ridge #6600CC">
                SELECT THE
                CITY</td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlcity" runat="server" AutoPostBack="True" Height="19px" 
                    onselectedindexchanged="ddlcity_SelectedIndexChanged" style="font-weight: 700" 
                    Width="166px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem>Bengaluru</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ddlcity" ErrorMessage="Please Select The City" 
                    InitialValue="-1" style="color: #CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5" style="border: thin ridge #6600CC">
                SELECT THE
                AREA</td>
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
            <td class="style5" style="border: thin ridge #6600CC">
                PARKING AREA CODE</td>
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
            <td class="style5" style="border: thin ridge #6600CC">
                ADDRESS</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtaddress" runat="server" Height="74px" TextMode="MultiLine" 
                    Width="222px" Enabled="False"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" style="border: thin ridge #6600CC">
                NUMBER OF PARKING SLOTS</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtparkingslots" runat="server" Width="169px" Enabled="False"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <br />
            </td>
        </tr>
        <tr>
            <td class="style5" style="border: thin ridge #6600CC">
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnremove" runat="server" BackColor="Black" 
                    BorderColor="#FFCC00" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" 
                    ForeColor="#FFCC00" Height="27px" onclick="btnremove_Click" Text="REMOVE" 
                    Width="115px" />
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

