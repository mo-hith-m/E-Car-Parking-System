<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

 p.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style3">
    <tr>
        <td style="border: thin inset #6600CC; text-align: center;">
            <asp:Image ID="Image2" runat="server" Height="108px" 
                ImageUrl="~/images/logo2.png" Width="278px" BorderColor="#6600CC" 
                BorderStyle="Double" BorderWidth="3px" style="text-align: center" />
        </td>
    </tr>
    <tr>
        <td style="border: thin inset #6600CC;">
            <p class="MsoNormal" style="font-size: large">
                <span style="font-family: &quot;Times New Roman&quot;,&quot;serif&quot;; color: #373737">
                <strong>The proposed project is a smart parking booking system that provides 
                customers an easy way of reserving a parking space online. It overcomes the 
                problem of finding a parking space in commercial areas that unnecessary consumes 
                time. Hence this project offers a web based reservation system where users can 
                view various parking areas and select the space to view whether space is 
                available or not. If the booking space is available then he can book it for 
                specific time slot. The booked space will be marked yellow and will not be 
                available for anyone else for the specified time. This system provides an 
                additional feature of cancelling the bookings. User can cancel their books space 
                anytime. Users can even make payment online via credit card. After making 
                payment users are notified about the booking via email along with unique parking 
                number. </strong>
                <o:p>
                </o:p>
                </span>
            </p>
        </td>
    </tr>
</table>
</asp:Content>

