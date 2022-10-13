<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
    {
        width: 75%;
        border-style: solid;
        border-width: 1px;
    }
        .style7
        {
            width: 83px;
        }
    .style6
    {
        color: #FFFFFF;
        font-weight: bold;
    }
        .style5
    {
        text-align: right;
        font-weight: bold;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style4">
        <tr>
            <td class="style7" rowspan="4">
                <asp:Image ID="Image2" runat="server" Height="94px" 
                    ImageUrl="~/buttons/login.jpg" Width="108px" />
            </td>
            <td bgcolor="#333300" class="style6" colspan="2" style="text-align: center">
                Please Enter Your Login Details</td>
        </tr>
        <tr>
            <td class="style5">
                User Name</td>
            <td>
                <asp:TextBox ID="txtuname" runat="server" Height="24px" Width="166px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtuname" ErrorMessage="Username Is Must" 
                    style="color: #CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Password</td>
            <td>
                <asp:TextBox ID="txtpwd" runat="server" Height="24px" TextMode="Password" 
                    Width="166px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpwd" ErrorMessage="Password Is Must" 
                    style="color: #CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnlogin" runat="server" Height="53px" 
                    ImageUrl="~/buttons/login1.jpg" onclick="btnlogin_Click" Width="96px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/ForgotPassword.aspx" style="font-weight: 700">Forgot Password</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

