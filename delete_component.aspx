<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete_component.aspx.cs" Inherits="E_LTS.delete_component" MasterPageFile="~/E-LTS.Master" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/collapseDelete.css" rel="stylesheet" />
     <div class="container">
    <h1>Delete Component</h1>
    <h4 style="color:red;">Delete the following record?</h4>
    <hr>
     <!-- STOCK CODE -->
        <table class="titleCodeUpdate">
            <tr>
                <td>
                    <h5 class="itemFontCode">Stock code / No Unit : </h5>
                </td> 
                    <td>
                        <asp:Label ID="stock" runat="server" Width="530px" Height="40px" style="font-size:18px; color:black; font-weight:bold;"></asp:Label>
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
                                <asp:Label ID="LblCName1" runat="server" CssClass="LblComponent"></asp:Label></label>
                            </h1>
                            <div class="content">
                                <table class="tablePartC" id="Item1" runat="server">
                                    <tr>
                                        <td>Component Name :</td>
                                        <td>
                                            <asp:label ID="cname1" runat="server" Width="530px" Height="40px"></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price Per Unit (RM) : </td>
                                        <td>
                                            <asp:label ID="price1" runat="server" Width="530px" Height="40px" ></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quantity (Unit/Pcs) : </td>
                                        <td>
                                            <asp:label ID="quantity1" runat="server" Width="530px" Height="40px"></asp:label><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Item Description :</td>
                                        <td>
                                            <asp:label ID="desc1" runat="server" placeholder="Description"></asp:label><br />
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
                                            <asp:label ID="cname2" runat="server" Width="530px" Height="40px"></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price Per Unit (RM) : </td>
                                        <td>
                                            <asp:label ID="price2" runat="server" Width="530px" Height="40px"></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quantity (Unit/Pcs) : </td>
                                        <td>
                                            <asp:label ID="quantity2" runat="server" Width="530px" Height="40px" ></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Item Description :</td>
                                        <td>
                                            <asp:label ID="desc2" runat="server" placeholder="Description"></asp:label>
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
                                            <asp:label ID="cname3" runat="server" Width="530px" Height="40px"></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Price Per Unit (RM) : </td>
                                        <td>
                                            <asp:label ID="price3" runat="server" Width="530px" Height="40px"></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quantity (Unit/Pcs) : </td>
                                        <td>
                                            <asp:label ID="quantity3" runat="server" Width="530px" Height="40px"></asp:label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Item Description :</td>
                                        <td>
                                            <asp:label ID="desc3" runat="server" placeholder="Description"></asp:label>
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
      <asp:Button ID="updateButton" runat="server" Text="Delete"  CssClass="menuButton" OnClick="updateButton_Click" style="margin-left:330px;"/>
     <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="menuButton" OnClick="CancelButton_Click" style="margin-left:100px;"/>
  </div>
</asp:Content>
