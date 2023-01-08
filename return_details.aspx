<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return_details.aspx.cs" Inherits="E_LTS.return_details" MasterPageFile="~/E-LTS.Master" %>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Poppins:500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function printpage() {

            var getpanel1 = document.getElementById("<%= Panel1.ClientID%>");
            var getpanel2 = document.getElementById("<%= Panel2.ClientID%>");
            var getpanel3 = document.getElementById("<%= Panel3.ClientID%>");
            var getpanel4 = document.getElementById("<%= Panel4.ClientID%>");
            var getpanel5 = document.getElementById("<%= Panel5.ClientID%>");
            var getpanel6 = document.getElementById("<%= Panel6.ClientID%>");
            var MainWindow = window.open('', '', 'height=500,width=1000');
            MainWindow.document.write('<html><head><title>Equipment Return Form</title>');
            MainWindow.document.write('</head><body>');
            MainWindow.document.write(getpanel1.innerHTML);
            MainWindow.document.write(getpanel2.innerHTML);
            MainWindow.document.write(getpanel3.innerHTML);
            MainWindow.document.write(getpanel4.innerHTML);
            MainWindow.document.write(getpanel5.innerHTML);
            MainWindow.document.write(getpanel6.innerHTML);
            MainWindow.document.write('</body></html>');
            MainWindow.document.close();
            setTimeout(function () {
                MainWindow.print();
            }, 500);
            return false;

        }
    </script>
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
            <h5 class="m-0 font-weight-bold text-primary" style="font-weight: bold; font-family: Arial">Section 1: Equipment Loan Form </h5>
            <h5 class="formID">Form ID :
                <asp:Label ID="fID" runat="server"></asp:Label></h5>
        </div>
        <div class="card-body">
            <asp:Panel ID="Panel1" runat="server">
                <table class="titleTable">
                    <tr>
                        <td>
                            <h5>Part A: Information of TAR UC Staff/Student who using the equipment</h5>
                        </td>
                    </tr>
                </table>
                <table class="tablePartA">
                    <tr>
                        <td style="width: 126px; margin-left: 200px;">
                            <div style="margin-left: 20px;">Student ID :</div>
                        </td>
                        <td style="width: 353px">
                            <asp:TextBox ID="student_id" runat="server" Width="280px" Height="48px" placeholder="Student ID" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 123px">Name : 
                        </td>
                        <td>
                            <asp:TextBox ID="name" runat="server" Width="280px" Height="48px" placeholder="Name" ReadOnly="True"></asp:TextBox><br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 126px">
                            <div style="margin-left: 20px;">Email : </div>
                        </td>
                        <td style="width: 353px">
                            <asp:TextBox ID="email" runat="server" Width="280px" Height="48px" placeholder="Email" ReadOnly="True"></asp:TextBox><br />
                        </td>
                        <td style="width: 123px">Contact Number : 
                        </td>
                        <td>
                            <asp:TextBox ID="phoneNumber" runat="server" Width="280px" Height="48px" placeholder="Phone Number" ReadOnly="True"></asp:TextBox><br />
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
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
                            <asp:Label ID="Ldate" runat="server" Width="400px"></asp:Label><br />
                        </td>
                        <td>
                            <asp:Label ID="Rdate" runat="server" Width="400px"></asp:Label><br />
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server">
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
                            <asp:TextBox ID="stock" runat="server" Width="480px" Height="40px" placeholder="Stock Code" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <!-- Item -->
            <asp:Panel ID="Panel4" runat="server">
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
                                                <asp:TextBox ID="cname1" runat="server" Width="530px" Height="40px" placeholder="Component Name" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Price Per Unit (RM) : </td>
                                            <td>
                                                <asp:TextBox ID="price1" runat="server" Width="530px" Height="40px" placeholder="Price" ReadOnly="True"></asp:TextBox><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Quantity (Unit/Pcs) : </td>
                                            <td>
                                                <asp:DropDownList ID="quantity1" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlQuantity" Enabled="False">
                                                    <asp:ListItem Value="0">Select The Quantity</asp:ListItem>
                                                </asp:DropDownList><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Item Description :</td>
                                            <td>
                                                <asp:TextBox ID="desc1" runat="server" placeholder="Description" TextMode="MultiLine" Rows="10" CssClass="Box" ReadOnly="True"></asp:TextBox><br />
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
                                                <asp:TextBox ID="cname2" runat="server" Width="530px" Height="40px" placeholder="Component Name" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Price Per Unit (RM) : </td>
                                            <td>
                                                <asp:TextBox ID="price2" runat="server" Width="530px" Height="40px" placeholder="Price" Text="0.00" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Quantity (Unit/Pcs) : </td>
                                            <td>
                                                <asp:DropDownList ID="quantity2" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlQuantity" OnSelectedIndexChanged="quantity2_SelectedIndexChanged" Enabled="False">
                                                    <asp:ListItem Value="0">Select The Quantity</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Item Description :</td>
                                            <td>
                                                <asp:TextBox ID="desc2" runat="server" placeholder="Description" TextMode="MultiLine" Rows="10" CssClass="Box" ReadOnly="True"></asp:TextBox>
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
                                                <asp:TextBox ID="cname3" runat="server" Width="530px" Height="40px" placeholder="Component Name" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Price Per Unit (RM) : </td>
                                            <td>
                                                <asp:TextBox ID="price3" runat="server" Width="530px" Height="40px" placeholder="Price" Text="0.00" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Quantity (Unit/Pcs) : </td>
                                            <td>
                                                <asp:DropDownList ID="quantity3" runat="server" BackColor="#F6F1DB" ForeColor="#7d6754" CssClass="ddlQuantity" OnSelectedIndexChanged="quantity3_SelectedIndexChanged" Enabled="False">
                                                    <asp:ListItem Value="0">Select The Quantity</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Item Description :</td>
                                            <td>
                                                <asp:TextBox ID="desc3" runat="server" placeholder="Description" TextMode="MultiLine" Rows="10" CssClass="Box" ReadOnly="True"></asp:TextBox>
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
            </asp:Panel>
            <asp:Panel ID="Panel5" runat="server">
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
                            <asp:TextBox ID="SupervisorName" runat="server" Width="400px" Height="40px" ReadOnly="True"></asp:TextBox><br />
                        </td>
                    </tr>
                    <tr>
                        <td>Project Supervisor Email
                        </td>
                        <td>
                            <asp:TextBox ID="SupervisorEmail" runat="server" Width="400px" Height="40px" ReadOnly="True"></asp:TextBox><br />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>

    <div class="card shadow mb-4">
        <asp:Panel ID="Panel7" runat="server">
            <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h5 class="m-0 font-weight-bold text-primary" style="font-weight: bold; font-family: Arial">Section 2 : Loan</h5>
            </div>
            <div class="card-body">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="form_Id" DataSourceID="dsDetected" Width="100%" CssClass="rowDetected">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Loan] WHERE ([form_Id] = @form_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="fID" Name="form_Id" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </div>

    <div class="card shadow mb-4">
        <asp:Panel ID="Panel6" runat="server">
            <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h5 class="m-0 font-weight-bold text-primary" style="font-weight: bold; font-family: Arial">Section 3 : Return</h5>
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
                            <tr>
                                <td>Price Per Unit (RM)</td>
                                <td>RM40</td>
                                <td>RM5</td>
                                <td>RM8</td>
                            </tr>
                            <tr>
                                <td>Total Price of Fines (RM)</td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label></td>
                                </td>
                            <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
        </asp:Panel>
        <asp:SqlDataSource ID="dsDetected" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Return] WHERE ([form_Id] = @form_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="fID" Name="form_Id" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </div>
    <asp:Button ID="print" runat="server" OnClientClick="return printpage();" Style="margin-top: 10px; margin-left: 350px;" Text="Print" CssClass="menuButton" />
    <asp:Button ID="cancelForm" class="menuButton" runat="server" Text="Return" Style="margin-top: 10px; margin-left: 100px;" OnClick="CancelButton_Click" CausesValidation="false" />
</asp:Content>
