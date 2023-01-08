<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="E_LTS.Register" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>E-LTS</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css"/>

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
 <div class="main">
    <!-- Sign up form -->
        <section class="signup">
            <div class="containerRegister">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form runat="server" class="register-form" id="registerForm">
                            <p class="radio_title">Role</p>
                            <table><tr>
                            <td class="table_role">
                            <div class="form-group">
                                <label for="role"></label>
                                <asp:RadioButton ID="staff" runat="server" text="Staff" GroupName="role" CssClass="radio" OnCheckedChanged="staff_CheckedChanged"  AutoPostBack="true"/>
                            </div>
                            <div class="form-group">
                                <asp:RadioButton ID="student" runat="server" text="Student" GroupName="role" CssClass="radio" OnCheckedChanged="student_CheckedChanged"  AutoPostBack="true"/>
                            </div>
                            </td>
                            </tr>
                            </table>
                            </br>
                            <div class="form-group">
                                <label for="Student/Staff ID"><i class="zmdi zmdi-card material-icons-name"></i></label>
                                <asp:TextBox ID="ID" runat="server" placeholder="Student/Staff ID" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="IDValidator" runat="server" ErrorMessage="*Please Fill In Your Student/Staff ID" ControlToValidate="ID" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="IDLimitStaff" runat="server" ControlToValidate="ID" Display="Dynamic" ErrorMessage="*Invalid ID" ForeColor="Red" ValidationExpression="([0-9]{4})"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="IDLimitStudent" runat="server" ControlToValidate="ID" Display="Dynamic" ErrorMessage="*Invalid ID" ForeColor="Red" ValidationExpression="([0-9]{7})"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <asp:TextBox ID="name" runat="server" placeholder="Your Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="*Please Fill In Your Name" ControlToValidate="name" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email material-icons-name"></i></label>
                                <asp:TextBox ID="email" runat="server" placeholder="Your Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="*Please Fill In Your Email" ControlToValidate="email" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="EmailLimit" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="*Invalid email address" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock material-icons-name"></i></label>
                                <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="fillPwd" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="*Please Fill In Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="pwdValidate" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="*Only 10 characters with _@$/" ForeColor="Red" ValidationExpression="[A-Za-z0-9_@$/]{0,10}"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline material-icons-name"></i></label>
                                <asp:TextBox ID="re_pass" runat="server" placeholder="Repeat your password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="fillRePwd" runat="server" ControlToValidate="re_pass" Display="Dynamic" ErrorMessage="*Please Fill In Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="comparePwd" runat="server" ErrorMessage="*Password Does Not Match" ForeColor ="Red" Display="Dynamic" ControlToValidate="re_pass" ControlToCompare="password"></asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber"><i class="zmdi zmdi-smartphone-iphone material-icons-name"></i></label>
                                <asp:TextBox ID="phoneNumber" runat="server" placeholder="Your Contact Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="phoneNumberValidator" runat="server" ErrorMessage="*Please Fill In Your Contact Number" ControlToValidate="phoneNumber" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="phoneNumberLimit" runat="server" ControlToValidate="phoneNumber" Display="Dynamic" ErrorMessage="*Invalid Mobile Number" ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="programme"></label>
                                <asp:DropDownList ID="course" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddl">
                                    <asp:ListItem Value="0">Select Your Programme</asp:ListItem>
                                    <asp:ListItem Value="RSF"></asp:ListItem>
                                    <asp:ListItem Value="RIT"></asp:ListItem>
                                    <asp:ListItem Value="RSD"></asp:ListItem>
                                    <asp:ListItem Value="RDS"></asp:ListItem>
                                </asp:DropDownList>  
                            </div>
                            <div class="form-group register-button">
                                <asp:Button ID="signup" runat="server" Text="Register" class="register" OnClick="signup_Click" />
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="img/iot.jpg" alt="sign up image"/></figure>
                        <p class="register_Text">E-Laboratory Tools System</p>
                        <asp:HyperLink ID="member" runat="server" class="signup-image-link" NavigateUrl="login.aspx">I am already member</asp:HyperLink><br />
                        <asp:Label ID="ErrorMessage" runat="server" class="errorMessage"></asp:Label><br />
                        <asp:Label ID="ExistMessage" runat="server" class="existMessage"></asp:Label>
                    </div>
                </div>
            </div>
        </section>
     </div>
</body>
</html>
