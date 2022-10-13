<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style5
    {
        width: 99%;
    }
    .style9
    {
        color: #333300;
        font-weight: bold;
        font-size: large;
    }
    .style6
    {
        text-align: right;
        width: 179px;
    }
    .style7
    {
        width: 160px;
        text-align: center;
    }
    .style8
    {
        text-align: left;
    }
    .style10
    {
        text-align: right;
        width: 179px;
        font-weight: bold;
        color: #333300;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style5">
    <tr>
        <td bgcolor="#DADADA" class="style9" colspan="3" style="text-align: center">
            Please Enter The Details To Register
            <br />
            <asp:Image ID="Image2" runat="server" Height="43px" 
                ImageUrl="~/buttons/new_animated.gif" Width="99px" />
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            Name</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:TextBox ID="txtname" runat="server" Height="20px" Width="148px"></asp:TextBox>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtname" ErrorMessage="Name Is Must" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            User Name</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:TextBox ID="txtuname" runat="server" Height="20px" Width="148px"></asp:TextBox>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtuname" ErrorMessage="User Name Is Must" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            Password</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:TextBox ID="txtpwd" runat="server" Height="20px" TextMode="Password" 
                Width="148px"></asp:TextBox>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtpwd" ErrorMessage="Password Is Must" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            Re-Enter Password</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:TextBox ID="txtrpwd" runat="server" Height="20px" TextMode="Password" 
                Width="148px"></asp:TextBox>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtrpwd" ErrorMessage="Re-Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtpwd" ControlToValidate="txtrpwd" 
                ErrorMessage="Password Mismatch" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            User Type</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:DropDownList ID="ddlusertype" runat="server" Font-Bold="True" 
                Height="27px" Width="140px">
                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>User</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="ddlusertype" ErrorMessage="Select User Type" ForeColor="Red" 
                InitialValue="-1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            Email-ID</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:TextBox ID="txteid" runat="server" Height="20px" Width="148px"></asp:TextBox>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txteid" ErrorMessage="Email ID Is Must" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txteid" ErrorMessage="Invalid Email Id" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            Mobile No</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:TextBox ID="txtmno" runat="server" Height="20px" Width="148px"></asp:TextBox>
        </td>
        <td bgcolor="#DADADA" class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtmno" ErrorMessage="Mobile Number Is Must" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="txtmno" ErrorMessage="Invalid Mobile Number" ForeColor="Red" 
                ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style10">
            Date Of Registration</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:Label ID="lbldor" runat="server" style="font-weight: 700"></asp:Label>
        </td>
        <td bgcolor="#DADADA">
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="#DADADA" class="style6">
            &nbsp;</td>
        <td bgcolor="#DADADA" class="style7">
            <asp:ImageButton ID="btnregister" runat="server" Height="34px" 
                ImageUrl="~/buttons/images (6).jpg" onclick="btnregister_Click" Width="111px" />
        </td>
        <td bgcolor="#DADADA">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

