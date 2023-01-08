<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete_student.aspx.cs" Inherits="E_LTS.delete_student" MasterPageFile="~/E-LTS.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
    <div class="container">
    <h2>Delete Student</h2>
    <h3 style="color:red;">Delete the following record?</h3>
        <table class="table">
        <tr>
            <td>Student ID : </td>
            <td>
                <asp:Label ID="LblId" runat="server" Width="500px" style="color:black;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Name: </td>
            <td>
                <asp:Label ID="LblName" runat="server" Width="500px" style="color:black;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Email : </td>
            <td>
                <asp:Label ID="LblEmail" runat="server" Width="500px" style="color:black;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Password : </td>
            <td>
                <asp:Label ID="LblPwd" runat="server" Width="500px" style="color:black;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Contact Number : </td>
            <td>
                <asp:Label ID="LblPhoneNumber" runat="server" Width="500px" style="color:black;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Programme : </td>
            <td>
                <asp:Label ID="LblProgramme" runat="server" Width="500px" style="color:black;"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" class="Button" OnClick="DeleteBtn_Click" CssClass="deleteButton"/>
    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" class="Button" OnClick="CancelBtn_Click" CssClass="cancelButton"/>
</div>
</asp:Content>
