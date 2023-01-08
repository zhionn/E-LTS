<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_form.aspx.cs" Inherits="E_LTS.update_form" MasterPageFile="~/E-LTS.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Poppins:500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=loanDate]").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
                minDate: new Date(),
            });
        });

        $(function () {
            $("[id*=returnDate]").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
                minDate: new Date(),
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/collapse.css" rel="stylesheet" />
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
    </div>
    <div class="card shadow mb-4">
        <div
            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h5 class="m-0 font-weight-bold text-primary" style="font-weight: bold; font-family: Arial">Section 1 : Equipment Loan Form</h5>
            <h5 class="formID">Form ID :
                <asp:Label ID="fID" runat="server"></asp:Label></h5>
        </div>
        <div class="card-body">
            <table class="titleTable">
                <tr>
                    <td>
                        <h5>Part A: Information of TAR UC Student who using the equipment</h5>
                    </td>
                </tr>
            </table>
            <table class="tablePartA">
                <tr>
                    <td style="width: 126px; margin-left: 200px;">
                        <div style="margin-left: 20px;">Student ID :</div>
                    </td>
                    <td style="width: 353px">
                        <asp:TextBox ID="student_id" runat="server" Width="280px" Height="48px" placeholder="Student ID"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="fillID" runat="server" ErrorMessage="*Please Fill In the Student ID" ControlToValidate="student_id" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="IDLimit" runat="server" ControlToValidate="student_id" Display="Dynamic" ErrorMessage="*Invalid ID" ForeColor="Red" ValidationExpression="[0-9]{7}"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 123px">Name : 
                    </td>
                    <td>
                        <asp:TextBox ID="name" runat="server" Width="280px" Height="48px" placeholder="Name"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="*Please Fill In Your Name" ControlToValidate="name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NameLimit" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="*Only 50 characters" ForeColor="Red" ValidationExpression="[A-Za-z ]{0,50}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 126px">
                        <div style="margin-left: 20px;">Email : </div>
                    </td>
                    <td style="width: 353px">
                        <asp:TextBox ID="email" runat="server" Width="280px" Height="48px" placeholder="Email"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="*Please Fill In Your Email" ControlToValidate="email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailLimit" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="*Invalid email address" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 123px">Contact Number : 
                    </td>
                    <td>
                        <asp:TextBox ID="phoneNumber" runat="server" Width="280px" Height="48px" placeholder="Phone Number"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="phoneNumberValidator" runat="server" ErrorMessage="*Please Fill In Your Phone Number" ControlToValidate="phoneNumber" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="phoneNumberLimit" runat="server" ControlToValidate="phoneNumber" Display="Dynamic" ErrorMessage="*Invalid Mobile Number" ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <br />

            <table class="titleTable">
                <tr>
                    <td>
                        <h5>Part B: Loaned And Returned Date</h5>
                    </td>
                </tr>
            </table>
            <table class="tablePartB">
                <tr>
                    <td style="font-weight: bold;">Loaned Date</td>
                    <td style="font-weight: bold;">Returned Date</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="loanDate" runat="server" Width="400px" onkeypress="return false;" onpaste="return false;" autocomplete="off"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoanDate" runat="server" ErrorMessage="*Please Fill In Choose The Loan Date" ControlToValidate="loanDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="returnDate" runat="server" Width="400px" onkeypress="return false;" onpaste="return false;" autocomplete="off"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorReturnDate" runat="server" ErrorMessage="*Please Fill In Choose The Return Date" ControlToValidate="loanDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />

            <table class="titleTable">
                <tr>
                    <td>
                        <h5>Part C: Equipment information to be Loan</h5>
                    </td>
                </tr>
            </table>

            <!-- STOCK CODE -->
            <table class="titleCodeLoan">
                <tr>
                    <td>
                        <h5 class="itemFontCode">Stock code / No Unit : </h5>
                    </td>
                    <td>
                        <asp:TextBox ID="stock" runat="server" Width="480px" Height="40px" placeholder="Stock Code"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="stock" Display="Dynamic" ErrorMessage="*Please Fill In the stock code" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <!-- Item -->
            <section>
                <div class="Scriptcontent">
                    <div class="container">
                        <!-- Item 1 -->
                        <section class="accordion">
                            <input type="checkbox" name="collapse" id="handle1">
                            <h1 class="handle">
                                <label for="handle1">
                                    Item 1 :
                                <asp:Label ID="LblCName1" runat="server" CssClass="LblComponent"></asp:Label></label>
                            </h1>
                            <div class="content">
                                <table class="tablePartC" id="Item1" runat="server">
                                    <tr>
                                        <td>Component Name :</td>
                                        <td>
                                            <asp:TextBox ID="cname1" runat="server" Width="530px" Height="40px" placeholder="Component Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCname1" runat="server" ErrorMessage="*Please Fill The Component Name" ControlToValidate="cname1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price Per Unit (RM) : </td>
                                        <td>
                                            <asp:TextBox ID="price1" runat="server" Width="530px" Height="40px" placeholder="Price"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice1" runat="server" ErrorMessage="*Please Fill In The Price" ControlToValidate="price1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quantity (Unit/Pcs) : </td>
                                        <td>
                                            <asp:DropDownList ID="quantity1" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlQuantity">
                                                <asp:ListItem Value="0">Select The Quantity</asp:ListItem>
                                            </asp:DropDownList><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity1" runat="server" InitialValue="0" ErrorMessage="*Please Fill In Choose The Quantity" ControlToValidate="quantity1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Item Description :</td>
                                        <td>
                                            <asp:TextBox ID="desc1" runat="server" placeholder="Description" TextMode="MultiLine" Rows="10" CssClass="Box"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesc1" runat="server" ErrorMessage="*Please Fill In The Description" ControlToValidate="desc1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                        <br />

                        <!-- Item 2 -->

                        <section class="accordion">
                            <input type="checkbox" name="collapse" id="handle2">
                            <h1 class="handle">
                                <label for="handle2">
                                    Item 2 :
                                <asp:Label ID="LblCName2" runat="server" CssClass="LblComponent"></asp:Label></label>
                            </h1>
                            <div class="content">
                                <table class="tablePartC" id="Item2" runat="server">
                                    <tr>
                                        <td>Component Name :</td>
                                        <td>
                                            <asp:TextBox ID="cname2" runat="server" Width="530px" Height="40px" placeholder="Component Name"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price Per Unit (RM) : </td>
                                        <td>
                                            <asp:TextBox ID="price2" runat="server" Width="530px" Height="40px" placeholder="Price" Text="0.00"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quantity (Unit/Pcs) : </td>
                                        <td>
                                            <asp:DropDownList ID="quantity2" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlQuantity" OnSelectedIndexChanged="quantity2_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select The Quantity</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Item Description :</td>
                                        <td>
                                            <asp:TextBox ID="desc2" runat="server" placeholder="Description" TextMode="MultiLine" Rows="10" CssClass="Box"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                        <br />

                        <!-- Item 3 -->

                        <section class="accordion">
                            <input type="checkbox" name="collapse" id="handle3">
                            <h1 class="handle">
                                <label for="handle3">
                                    Item 3 :
                                <asp:Label ID="LblCName3" runat="server" CssClass="LblComponent"></asp:Label></label>
                            </h1>
                            <div class="content">
                                <table class="tablePartC" id="Item3" runat="server">
                                    <tr>
                                        <td>Component Name :</td>
                                        <td>
                                            <asp:TextBox ID="cname3" runat="server" Width="530px" Height="40px" placeholder="Component Name"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price Per Unit (RM) : </td>
                                        <td>
                                            <asp:TextBox ID="price3" runat="server" Width="530px" Height="40px" placeholder="Price" Text="0.00"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quantity (Unit/Pcs) : </td>
                                        <td>
                                            <asp:DropDownList ID="quantity3" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlQuantity" OnSelectedIndexChanged="quantity3_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select The Quantity</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Item Description :</td>
                                        <td>
                                            <asp:TextBox ID="desc3" runat="server" placeholder="Description" TextMode="MultiLine" Rows="10" CssClass="Box"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </section>
                        <br />

                    </div>
                    <!--//container -->
                </div>
            </section>

            <table class="titleTable">
                <tr>
                    <td>
                        <h4>Part D: Recommendation and Approval</h4>
                    </td>
                </tr>
            </table>
            <table class="tablePartD">
                <tr>
                    <td>Lab Assistant In-charge of the Equipment
                    </td>
                    <td>
                        <asp:TextBox ID="LabName" runat="server" Width="400px" Height="40px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Project Supervisor Name
                    </td>
                    <td>
                        <asp:TextBox ID="SupervisorName" runat="server" Width="400px" Height="40px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RVName" runat="server" ErrorMessage="*Please Fill In the Project Supervisor’s Name" ControlToValidate="SupervisorName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REName" runat="server" ControlToValidate="SupervisorName" Display="Dynamic" ErrorMessage="*Only 50 characters" ForeColor="Red" ValidationExpression="[A-Za-z ]{0,50}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Project Supervisor Email
                    </td>
                    <td>
                        <asp:TextBox ID="SupervisorEmail" runat="server" Width="400px" Height="40px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RVSupervisor" runat="server" ErrorMessage="*Please Fill In the Project Supervisor’s Email" ControlToValidate="SupervisorEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RESupervisor" runat="server" ControlToValidate="SupervisorEmail" Display="Dynamic" ErrorMessage="*Invalid email address" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                        <asp:Label ID="failNoti" runat="server" CssClass="failMessage"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td>Approval of Equipment
                    </td>
                    <td>
                        <asp:RadioButtonList ID="ApprovalRadio" runat="server" RepeatDirection="Horizontal" Style="border-color: black;">
                            <asp:ListItem Text="Pending" class="Radio1" Value="Pending"></asp:ListItem>
                            <asp:ListItem Text="Approved" class="Radio2" Value="Approved"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorApproval" ErrorMessage="*Please Select the Approval" ControlToValidate="ApprovalRadio" runat="server" ForeColor="Red" Display="Dynamic" />
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="card shadow mb-4">
        <asp:Panel ID="Panel6" runat="server">
            <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h5 class="m-0 font-weight-bold text-primary" style="font-weight: bold; font-family: Arial">Section 2 : Loan</h5>
            </div>
            <div class="card-body">
                <asp:DataList ID="DsDetect" runat="server" DataKeyField="form_Id" DataSourceID="dsDetected" Width="100%" CssClass="rowDetected">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th></th>
                                <th>Component 1</th>
                                <th>Component 2</th>
                                <th>Component 3</th>
                            </tr>
                            <tr>
                                <td>Components</td>
                                <td>GrovePi</td>
                                <td>Resistor</td>
                                <td>Voltage Regulator</td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("C1Detect") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("C2Detect") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("C3Detect") %>'></asp:Label></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
        </asp:Panel>
        <asp:SqlDataSource ID="dsDetected" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Loan] WHERE ([form_Id] = @form_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="fID" Name="form_Id" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </div>

     <asp:Label ID="ErrorMessage" runat="server" CssClass="existMessage"></asp:Label><br />
    <asp:Button ID="submitForm" class="menuButton" runat="server" Text="Submit" Style="margin-top: 10px; margin-left: 300px;" OnClick="submitForm_Click" />
    <asp:Button ID="cancelForm" class="menuButton" runat="server" Text="Cancel" Style="margin-top: 10px; margin-left: 70px;" CausesValidation="false" OnClick="cancelForm_Click" />

</asp:Content>

