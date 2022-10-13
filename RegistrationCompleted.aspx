<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="RegistrationCompleted.aspx.cs" Inherits="RegistrationCompleted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style3
    {
        width: 70%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style3">
    <tr>
        <td style="font-weight: 700; font-size: large; text-align: center; color: #333300">
            Registration Completed Sucessfully</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image2" runat="server" Height="74px" 
                ImageUrl="~/images/thank_you_comment_11.gif" Width="227px" />
        </td>
    </tr>
</table>
</asp:Content>

