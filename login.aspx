<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="E_LTS.login" %>

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
        <img src="img/TARUC-LOGO.png" class="tarucLogo"/>
        <div class="main">

        <!-- Sign in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="img/iot.jpg" alt="sign up image"/></figure>
                        <p class="Logo_text">E-Laboratory Tools System</p>
                    </div>

                    <div class="signin-form">
                        <h3 class="form-title">Please Enter Your Information</h3>
                        <form runat="server" class="register-form" id="loginform">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                           <strong>
                                <asp:TextBox ID="LoginID" placeholder="Login ID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="IDValidator" runat="server" ErrorMessage="*Please Fill In Your Student/Staff ID" ControlToValidate="LoginID" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="IDLimit" runat="server" ControlToValidate="LoginID" Display="Dynamic" ErrorMessage="*Invalid ID" ForeColor="Red" ValidationExpression="(([0-9]{7})|([0-9]{4}))"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock material-icons-name"></i></label>
                                <asp:TextBox ID="password" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PassValidator" runat="server" ErrorMessage="*Please Fill In Your Password" ControlToValidate="password" ForeColor ="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group login-button">
                                <asp:Button ID="signin" runat="server" Text="Login" class="form-submit" OnClick="signin_Click"/>
                            </strong>
                            </div>
                            <hr class="style-two">
                            <asp:Label ID="LabelIncorrect" runat="server" class="incorrect_login"></asp:Label>
                            <div class="text-center">
                                <asp:HyperLink ID="register" runat="server" class="small" NavigateUrl="register.aspx">Create an Account!</asp:HyperLink>
                            </div>
                            <div class="text-center">
                                <asp:HyperLink ID="forgotPwd" runat="server" class="small" NavigateUrl="forgot_password.aspx">Forgot Password?</asp:HyperLink>
                            </div>
                        </form>
                        <asp:Label ID="ErrorMsg" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </section>
            

    </div>

    <!-- JS -->
    <script src="vendor/loginJquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>

