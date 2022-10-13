<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="CustomerReserveParkingSlot.aspx.cs" Inherits="CustomerReserveParkingSlot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            color: #FFCC00;
        }
        .style6
        {
            text-align: right;
            font-weight: bold;
        }
        .style11
        {
            color: #FF0000;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
        <tr>
            <td bgcolor="Black" class="style5" colspan="3" 
                style="border: thin ridge #6600CC; font-weight: 700; text-align: center;">
                RESERVE A PARKING SLOT FOR YOUR CAR</td>
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
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" style="font-size: small">
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
                Select The Available Parking Slots</td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlparkingslot" runat="server" Height="16px" 
                    onselectedindexchanged="ddlparkingslot_SelectedIndexChanged" 
                    style="font-weight: 700" Width="162px">
                </asp:DropDownList>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Reservation ID</td>
            <td style="border: thin ridge #6600CC">
                <asp:Label ID="lblreservationid" runat="server" 
                    style="font-weight: 700; font-size: large"></asp:Label>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Vehicle No</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtvehicleno" runat="server" Width="161px"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtvehicleno" ErrorMessage="Enter Vehicle No" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Customer Name</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtcustname" runat="server" Width="161px"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtcustname" ErrorMessage="Customer Name Is Must" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Customer Date Of Birth</td>
            <td style="border: thin ridge #6600CC">
                <asp:Label ID="lbldob0" runat="server" style="font-weight: 700"></asp:Label>
            </td>
            <td style="border: thin ridge #6600CC; color: #FF3300;">
                Date of Birth Is Must</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Mobile No</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtmno" runat="server" Width="161px"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtmno" ErrorMessage="Mobile No Is Required" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtmno" ErrorMessage="Invalid Mobile No" 
                    style="color: #CC0000" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Parking Charges / Day</td>
            <td style="border: thin ridge #6600CC">
                <asp:Label ID="lblcharges" runat="server" 
                    style="font-weight: 700; font-size: large">150</asp:Label>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Date Of Booking</td>
            <td style="border: thin ridge #6600CC">
                <asp:Label ID="lbldob" runat="server" style="font-weight: 700"></asp:Label>
            </td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Select Date Of Parking<br />
                (Reservation Only for Today Or Tomorrow)</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtdop" runat="server" TextMode="Date" Width="158px"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtdop" ErrorMessage="Select The Date Of Parking" 
                    style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Select Card Type For Payment </td>
            <td style="border: thin ridge #6600CC">
                <asp:DropDownList ID="ddlcardtype" runat="server" Height="16px" 
                    style="font-weight: 700;" Width="177px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Debit Card</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ddlcardtype" CssClass="style11" 
                    ErrorMessage="Please Select Card Type" InitialValue="-1" 
                    style="color: #FF0000;"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                Card Number</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtcardno" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcardno" CssClass="style11" 
                    ErrorMessage="Card No Is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtcardno" CssClass="style11" ErrorMessage="Invalid Card No" 
                    ValidationExpression="\d{16}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                CVV Number</td>
            <td style="border: thin ridge #6600CC">
                <asp:TextBox ID="txtcvv" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td style="border: thin ridge #6600CC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtcvv" CssClass="style11" 
                    ErrorMessage="Please Enter CVV No"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtcvv" CssClass="style11" ErrorMessage="Invalid CVV No" 
                    ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" style="border: thin ridge #6600CC">
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnreserve" runat="server" Height="32px" 
                    ImageUrl="~/buttons/reserve1.png" Width="141px" 
                    onclick="btnreserve_Click" />
                &nbsp;</td>
            <td style="border: thin ridge #6600CC">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

