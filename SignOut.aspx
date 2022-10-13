<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="SignOut.aspx.cs" Inherits="SignOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style3
    {
        width: 100%;
        border-style: solid;
        border-width: 1px;
    }
    .style4
    {
            text-align: center;
            color: #333300;
            font-weight: bold;
            font-size: x-large;
        }
    .style8
    {
        color: #0000CC;
        font-size: x-large;
    }
        .style9
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style3">
        <tr>
            <td class="style4">
                YOUR SESSION HAS EXPIRED !!!!!!!!!!!!!!<br />
                <asp:Image ID="Image2" runat="server" Height="94px" 
                    ImageUrl="~/buttons/login.jpg" Width="108px" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                <span class="style9">PLEASE</span><span class="style8"> </span>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="style8" 
                    NavigateUrl="~/SignIn.aspx">SignIn</asp:HyperLink>
                <span class="style8">&nbsp; </span><span class="style9">TO CONTINUE<br />
                </span>
            </td>
        </tr>
    </table>
</asp:Content>

