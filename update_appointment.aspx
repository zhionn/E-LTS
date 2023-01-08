<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_appointment.aspx.cs" Inherits="E_LTS.update_appointment" MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript">
        $(function () {
            $("[id*=date]").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
            });
        });

    </script>
     <div class="container">
    <h1>Appointment Form</h1>
    <p>Please fill in this form to create a new appointment.</p>
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
                        <asp:TextBox ID="student_id" runat="server" Width="500px" placeholder="Student ID"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="fillID" runat="server" ErrorMessage="*Please Fill In the Student ID" ControlToValidate="student_id" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="IDLimit" runat="server" ControlToValidate="student_id" Display="Dynamic" ErrorMessage="*Invalid ID" ForeColor="Red" ValidationExpression="[0-9]{7}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name : 
                    </td>
                    <td>
                        <asp:TextBox ID="name" runat="server" Width="500px" placeholder="Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="*Please Fill In Your Name" ControlToValidate="name" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NameLimit" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="*Only 50 characters" ForeColor="Red" ValidationExpression="[A-Za-z ]{0,50}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact Number : 
                    </td>
                    <td>
                        <asp:TextBox ID="phoneNumber" runat="server" Width="500px" placeholder="Phone Number"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="phoneNumberValidator" runat="server" ErrorMessage="*Please Fill In Your Phone Number" ControlToValidate="phoneNumber" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="phoneNumberLimit" runat="server" ControlToValidate="phoneNumber" Display="Dynamic" ErrorMessage="*Invalid Mobile Number" ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Programme : 
                    </td>
                    <td>
                    <asp:DropDownList ID="course" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddl">
                                    <asp:ListItem Value="0">Select Your Programme</asp:ListItem>
                                    <asp:ListItem Value="RSF"></asp:ListItem>
                                    <asp:ListItem Value="RIT"></asp:ListItem>
                                    <asp:ListItem Value="RSD"></asp:ListItem>
                                    <asp:ListItem Value="RDS"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="courseValidator" runat="server" ErrorMessage="*Please Select Your Programme" ForeColor ="Red" Display="Dynamic" ControlToValidate="course" InitialValue="0"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Time : 
                    </td>
                    <td>
                        <asp:DropDownList ID="time" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlLoss">
                            <asp:ListItem  Value="0">Select The Time</asp:ListItem>
                            <asp:ListItem>9.00a.m. - 10.00a.m.</asp:ListItem>
                            <asp:ListItem>10.00a.m. - 11.00a.m.</asp:ListItem>
                            <asp:ListItem>11.00a.m. - 12.00p.m.</asp:ListItem>
                            <asp:ListItem>12.00p.m. - 1.00p.m.</asp:ListItem>
                            <asp:ListItem>1.00p.m. - 2.00p.m.</asp:ListItem>
                            <asp:ListItem>2.00p.m. - 3.00p.m.</asp:ListItem>
                            <asp:ListItem>3.00a.m. - 4.00p.m.</asp:ListItem>
                            <asp:ListItem>4.00a.m. - 5.00p.m.</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity1" runat="server" InitialValue="0" ErrorMessage="*Please Fill In Choose The Time" ControlToValidate="date" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date : 
                    </td>
                    <td>
                        <asp:TextBox ID="date" runat="server"  Width="500px" onkeypress="return false;" onpaste="return false;" autocomplete="off"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ErrorMessage="*Please Fill In Choose The Date" ControlToValidate="date" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Remark : 
                    </td>
                    <td>
                        <asp:TextBox ID="remark" runat="server" Width="500px" Height="100px" TextMode="MultiLine" placeholder="Remark"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RegRemark" runat="server" ErrorMessage="*Remark is Required " ControlToValidate="remark" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
         <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
        <asp:Label ID="ExistMessage" runat="server" class="existMessage"></asp:Label>
    <hr>
    <asp:Button ID="updateButton" runat="server" Text="Update"  CssClass="menuButton" OnClick="updateButton_Click" />
     <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="menuButton" CausesValidation="false" OnClick="CancelButton_Click"/>
  </div>
</asp:Content>
