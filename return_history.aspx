<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return_history.aspx.cs" Inherits="E_LTS.return_history" MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Returned List
    </h1>

</div>
    Search : <asp:TextBox ID="txtSearch" runat="server" width="700px" Height="30px"/>
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <hr />
    <asp:GridView ID="gvReturn" runat="server" Width="90%" AutoGenerateColumns="False" 
        AllowPaging="True" CellPadding="4" DataKeyNames="form_Id" OnRowDataBound="return_RowDataBound" 
        CssClass="datagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" 
        RowStyle-CssClass="rows" emptydatatext="No Record Found." 
        showFooter="true" FooterStyle-CssClass="footer" ShowHeaderWhenEmpty="True">
        <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" />
        <Columns>
            <asp:TemplateField HeaderText="No.">
            <ItemTemplate>
                 <%# Container.DataItemIndex + 1 + "." %>
            </ItemTemplate>
            <FooterTemplate>
                 Total Of Student : <%# gvReturn.Rows.Count %>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="form_Id" HeaderText="Form ID" SortExpression="form_ID" />
            <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_ID" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="loaned_date" HeaderText="Loaned Date" SortExpression="loaned_date" />
            <asp:BoundField DataField="returned_date" HeaderText="Returned Date" SortExpression="returned_date" />
            <asp:BoundField DataField="SupervisorName" HeaderText="Supervisor Name" SortExpression="SupervisorName" />
            <asp:BoundField DataField="SupervisorEmail" HeaderText="Supervisor Email" SortExpression="SupervisorEmail" />
            <asp:HyperLinkField DataNavigateUrlFields="form_Id" DataNavigateUrlFormatString="return_details.aspx?form_Id={0}" Text="Details" />
        </Columns>    
    </asp:GridView>
</asp:Content>