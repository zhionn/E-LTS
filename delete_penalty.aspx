<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete_penalty.aspx.cs" Inherits="E_LTS.delete_penalty" MasterPageFile="~/E-LTS.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
    <div class="container">
    <h2>Delete Penalty</h2>
    <h4 style="color:red;">Delete the following record?</h4>
    <table class="tableRegister">
             <tr>
                 <td>
                     Penalty ID :
                 </td>
                 <td>
                     <asp:Label ID="LblPid" runat="server" Width="500px"></asp:Label>
                 </td>
             </tr>
         </table>
         <br/>
         <h3>Penalty Details</h3>
            <table class="tableRegister">
                <tr>
                    <td>
                        Student ID : 
                    </td>
                    <td>
                        <asp:Label ID="LblSId" runat="server" Width="500px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name : 
                    </td>
                    <td>
                        <asp:Label ID="LblName" runat="server" Width="500px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email : 
                    </td>
                    <td>
                        <asp:Label ID="LblEmail" runat="server" Width="500px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact Number : 
                    </td>
                    <td>
                        <asp:Label ID="LblContact" runat="server" Width="500px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Programme : 
                    </td>
                    <td>    
                        <asp:Label ID="LblProgramme" runat="server" Width="500px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Item Loss of/damage : 
                    </td>
                    <td>
                        1. <asp:Label ID="LblLoss1" runat="server" Width="500px"></asp:Label><br/>
                        2. <asp:Label ID="LblLoss2" runat="server" Width="500px"></asp:Label><br/>
                        3. <asp:Label ID="LblLoss3" runat="server" Width="500px"></asp:Label><br/>
                        4. <asp:Label ID="LblLoss4" runat="server" Width="500px"></asp:Label><br/>
                        5. <asp:Label ID="LblLoss5" runat="server" Width="500px"></asp:Label><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Total Price of fines : 
                    </td>
                    <td>
                        <asp:Label ID="LblTotal" runat="server" Width="500px"></asp:Label>
                    </td>
                </tr>
            </table>
         <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
    <hr>
    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" class="Button" OnClick="DeleteBtn_Click" CssClass="deleteButton"/>
    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" class="Button" OnClick="CancelBtn_Click" CssClass="cancelButton"/>
  </div>
</asp:Content>