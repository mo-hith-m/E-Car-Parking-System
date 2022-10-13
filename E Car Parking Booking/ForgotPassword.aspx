<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
    {
        width: 90%;
        border-style: solid;
        border-width: 2px;
        background-image: url('http://localhost:49159/ETendering/images/loginbckgrd.jpg');
    }
    .style10
    {
        font-weight: bold;
        text-align: center;
        width: 144px;
    }
    .style6
    {
        font-weight: bold;
        text-align: center;
    }
    .style8
    {
        text-align: left;
        width: 207px;
    }
    .style7
    {
        text-align: left;
    }
        .style13
        {
            color: #FFFF99;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style5">
        <tr>
            <td bgcolor="#333300" class="style9" colspan="4" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg'); text-align: center;">
                <b style="text-align: center"><span class="style13">Please Enter The Details To 
                Recover Your Password</span></b></td>
        </tr>
        <tr>
            <td class="style10" rowspan="6" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:Image ID="Image2" runat="server" Height="101px" ImageUrl="~/images/03.png" 
                    Width="88px" />
            </td>
            <td class="style6" colspan="3" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:Label ID="lblpassword" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                UserName</td>
            <td class="style8" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:TextBox ID="txtuname" runat="server"></asp:TextBox>
            </td>
            <td class="style7" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtuname" ErrorMessage="Enter UserName" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                Mobile No</td>
            <td class="style8" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:TextBox ID="txtmno" runat="server"></asp:TextBox>
            </td>
            <td class="style7" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtmno" ErrorMessage="Enter Mobile Number" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                Email-ID</td>
            <td class="style8" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:TextBox ID="txteid" runat="server"></asp:TextBox>
            </td>
            <td class="style7" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txteid" ErrorMessage="Enter Email-ID" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                &nbsp;</td>
            <td class="style8" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnsubmit" runat="server" Font-Bold="True" Height="27px" 
                    onclick="btnsubmit_Click" Text="SUBMIT" Width="101px" />
                &nbsp;</td>
            <td class="style7" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                &nbsp;</td>
            <td class="style8" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                &nbsp;</td>
            <td class="style7" 
                style="background-image: url('http://localhost:49159/ETendering/images/creamparch2.jpg')">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

