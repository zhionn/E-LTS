<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_student.aspx.cs" Inherits="E_LTS.add_student" MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
     <div class="container">
    <h1>Student Registration</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
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
                        Email : 
                    </td>
                    <td>
                        <asp:TextBox ID="email" runat="server" Width="500px" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="*Please Fill In Your Email" ControlToValidate="email" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailLimit" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="*Invalid email address" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password : 
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTxt" runat="server" Width="500px" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="fillPwd" runat="server" ControlToValidate="PasswordTxt" Display="Dynamic" ErrorMessage="*Please Fill In Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="pwdValidate" runat="server" ControlToValidate="PasswordTxt" Display="Dynamic" ErrorMessage="*Only 8 characters with _@$/" ForeColor="Red" ValidationExpression="[A-Za-z0-9_@$/]{0,8}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Repeat Password : 
                    </td>
                    <td>
                        <asp:TextBox ID="ReTypeTxt" runat="server" Width="500px" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="fillRePwd" runat="server" ControlToValidate="ReTypeTxt" Display="Dynamic" ErrorMessage="*Please Fill In Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="comparePwd" runat="server" ErrorMessage="*Password Does Not Match" ForeColor ="Red" Display="Dynamic" ControlToValidate="ReTypeTxt" ControlToCompare="PasswordTxt"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact Number : 
                    </td>
                    <td>
                        <asp:TextBox ID="phoneNumber" runat="server" Width="500px" placeholder="Phone Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="phoneNumberValidator" runat="server" ErrorMessage="*Please Fill In Your Phone Number" ControlToValidate="phoneNumber" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
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
            </table>
         <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
    <hr>
    <p>By creating an account you agree to our Terms & Privacy.</p>
    <asp:Button ID="RegisterBtn" runat="server" Text="Register" CssClass="registerbtn" OnClick="RegisterBtn_Click" />
  </div>
</asp:Content>

