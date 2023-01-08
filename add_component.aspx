<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_component.aspx.cs" Inherits="E_LTS.add_component" MasterPageFile="~/E-LTS.Master" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/collapse.css" rel="stylesheet" />
     <div class="container">
    <h1 style="color:black;">Component Form</h1>
    <p>Please fill in this form to create a new component.</p>
    <hr>
        <table class="titleCodeUpdate">
            <tr>
                <td>
                    <h5 class="itemFont">Stock code /No Unit : </h5>
                </td> 
                    <td>
                        <asp:TextBox ID="stock" runat="server" Width="500px" placeholder="Stock Code"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorStock" runat="server" ControlToValidate="stock" Display="Dynamic" ErrorMessage="*Please Fill In the stock code" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>
        </table>
         <br />
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
                                </label>
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
                                </label>
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
                                </label>
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
             <hr>
         <asp:Label ID="ErrorMessage" runat="server"></asp:Label><br>
      <asp:Button ID="AddButton" runat="server" Text="Add"  CssClass="addButton" OnClick="AddButton_Click" />
     <asp:Button ID="ResetButton" runat="server" Text="Reset" class="resetButton" OnClick="ResetButton_Click"/>
     <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="cancelButton" OnClick="CancelButton_Click" CausesValidation="false"/>
  </div>
</asp:Content>
