<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormList.aspx.cs" Inherits="E_LTS.FormList" MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Loan List
    <a href="loan.aspx" class="css-button"  style="text-decoration: none"> 
	    <span class="css-button-icon"><i class="fa fa-plus-square" aria-hidden="true"></i></span>
	    <span class="css-button-text">Loan</span>
    </a>
    </h1>

</div>
    Search : <asp:TextBox ID="txtSearch" runat="server" width="700px" Height="30px"/>
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <a href="return_history.aspx" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style=" margin-left:140px;">
    <i class="fas fa-download fa-sm text-white-50"></i>History</a>
    <hr />
    <asp:GridView ID="gvFormList" runat="server" Width="90%" AutoGenerateColumns="False" 
        AllowPaging="True" CellPadding="4" DataKeyNames="form_Id" OnRowDataBound="formList_RowDataBound" 
        CssClass="datagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" 
        RowStyle-CssClass="rows" emptydatatext="No Record Found." 
        showFooter="true" FooterStyle-CssClass="footer" ShowHeaderWhenEmpty="True" >
        <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" />
        <Columns>
            <asp:TemplateField HeaderText="No.">
            <ItemTemplate>
                 <%# Container.DataItemIndex + 1 + "." %>
            </ItemTemplate>
            <FooterTemplate>
                 Total Of Student : <%# gvFormList.Rows.Count %>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="form_Id" HeaderText="Form ID" SortExpression="form_ID" />
            <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_ID" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="loaned_date" HeaderText="Loaned Date" SortExpression="loaned_date" />
            <asp:BoundField DataField="returned_date" HeaderText="Returned Date" SortExpression="returned_date" />
            <asp:BoundField DataField="approval" HeaderText="Status" SortExpression="approval" />
            <asp:HyperLinkField DataNavigateUrlFields="form_Id" DataNavigateUrlFormatString="update_form.aspx?form_Id={0}" Text="Details" />
            <asp:HyperLinkField DataNavigateUrlFields="form_Id" DataNavigateUrlFormatString="Return.aspx?form_Id={0}" Text="Return" />
        </Columns>    
    </asp:GridView>
</asp:Content>