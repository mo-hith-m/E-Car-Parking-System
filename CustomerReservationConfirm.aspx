<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="CustomerReservationConfirm.aspx.cs" Inherits="CustomerReservationConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 70%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
        <tr>
            <td bgcolor="Black" 
                style="border-style: solid; border-color: #FFCC00; text-align: center; color: #FFCC00; font-weight: 700;">
                YOUR VEHICLE PARKING SLOT HAS BEEN RESERVED SUCCESSFULLY</td>
        </tr>
        <tr>
            <td style="border-style: solid; border-color: #FFCC00; text-align: center;">
                <asp:Image ID="Image2" runat="server" Height="92px" 
                    ImageUrl="~/images/img6.jpg" Width="189px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Black" 
                style="border-style: solid; border-color: #FFCC00; text-align: center; color: #FFCC00; font-weight: 700;">
                Note Your Parking Reservation ID :
                <asp:Label ID="lblrid" runat="server" style="font-size: x-large"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

