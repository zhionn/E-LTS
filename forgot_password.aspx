<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="E_LTS.forgot_password" %>

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
</head>
<body>
 <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="containerForgot">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Forgot Password</h2>
                        <form runat="server" class="register-form" id="registerForm">
                            </br>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="email" runat="server" placeholder="Your Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="*Please Fill In Your Email" ControlToValidate="email" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="EmailLimit" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="*Invalid email address" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                            </div>
                            <asp:Label ID="forgot_message" runat="server" class="forgot_message"></asp:Label>
                            <div class="form-group register-button">
                                <asp:Button ID="submit" runat="server" Text="Submit" class="forgot-submit" OnClick="submit_Click" />
                            </div>
                        </form>
                    </div>
                    <div class="forgot-image">
                        <figure><img src="img/iot.jpg" alt="sign up image"/></figure>
                        <p class="register_Text">E-Laboratory Tools System</p>
                        <asp:HyperLink ID="member" runat="server" class="forgot-image-link" NavigateUrl="login.aspx">I am already member</asp:HyperLink>
                    </div>
                </div>
                <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
            </div>
        </section>
     </div>
</body>
</html>
