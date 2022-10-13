<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style3
    {
        width: 50%;
    }
    .style6
    {
        width: 78%;
    }
    .style7
    {
        width: 149px;
        text-align: right;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style3">
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image2" runat="server" Height="95px" 
                ImageUrl="~/images/FORGET.jpg" Width="269px" />
        </td>
    </tr>
    <tr>
        <td>
            <table align="center" class="style6">
                <tr>
                    <td bgcolor="#767EA6" colspan="2" style="text-align: center">
                        Contact Us</td>
                </tr>
                <tr>
                    <td bgcolor="#EDE9E9" class="style7">
                        Name</td>
                    <td bgcolor="#EDE9E9">
                        Sadhana Degree College
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#EDE9E9" class="style7">
                        Email ID</td>
                    <td bgcolor="#EDE9E9">
                        sdcproject@gmail.com</td>
                </tr>
                <tr>
                    <td bgcolor="#EDE9E9" class="style7">
                        Mobile No</td>
                    <td bgcolor="#EDE9E9">
                        9986793939</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>

