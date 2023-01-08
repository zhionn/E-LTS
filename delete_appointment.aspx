<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete_appointment.aspx.cs" Inherits="E_LTS.delete_appintment"  MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
     <div class="container">
    <h2>Delete Penalty</h2>
    <h4 style="color:red;">Delete the following record?</h4>
    <hr>
         <table class="tableRegister">
             <tr>
                 <td>
                     <h5>Appointment ID : </h5>
                 </td>
                 <td>
                     <asp:Label ID="Aid" runat="server" Width="500px" style="font-size:20px; color:blue;"></asp:Label>
                 </td>
             </tr>
         </table>
         <br/>
         <h3>Appointment Details</h3>
            <table class="tableRegister">
                <tr>
                    <td>
                        Student ID : 
                    </td>
                    <td>
                        <asp:Label ID="student_id" runat="server" Width="500px" placeholder="Student ID"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name : 
                    </td>
                    <td>
                        <asp:Label ID="name" runat="server" Width="500px" placeholder="Name"></asp:Label>
                </tr>
                <tr>
                    <td>
                        Contact Number : 
                    </td>
                    <td>
                        <asp:Label ID="phoneNumber" runat="server" Width="500px" placeholder="Phone Number"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Programme : 
                    </td>
                    <td>
                        <asp:Label ID="programme" runat="server" Width="500px" placeholder="Phone Number"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Time : 
                    </td>
                    <td>
                       <asp:Label ID="time" runat="server" Width="500px" placeholder="Phone Number"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date : 
                    </td>
                    <td>
                        <asp:Label ID="date" runat="server" Width="500px" placeholder="Phone Number"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Remark : 
                    </td>
                    <td>
                        <asp:Label ID="remark" runat="server" Width="500px" Height="100px" TextMode="MultiLine" placeholder="Remark"></asp:Label>
                    </td>
                </tr>
            </table>
         <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
        <asp:Label ID="ExistMessage" runat="server" class="existMessage"></asp:Label>
    <hr>
    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" class="Button" OnClick="DeleteBtn_Click" CssClass="deleteButton"/>
    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" class="Button" OnClick="CancelBtn_Click" CssClass="cancelButton"/>
  </div>
</asp:Content>
