<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="componentList.aspx.cs" Inherits="E_LTS.componentList" MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Component List
    <a href="add_component.aspx" class="css-button"  style="text-decoration: none"> 
	    <span class="css-button-icon"><i class="fa fa-plus-square" aria-hidden="true"></i></span>
	    <span class="css-button-text">Add</span>
    </a>
    </h1>
</div>
    Search : <asp:TextBox ID="txtSearch" runat="server" width="700px" Height="30px"/>
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <hr />
    <asp:GridView ID="gvComponentList" runat="server" Width="80%" AutoGenerateColumns="False" 
        AllowPaging="True" CellPadding="4" DataKeyNames="stock_code" OnRowDataBound="componentList_RowDataBound" 
        CssClass="datagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" 
        RowStyle-CssClass="rows" emptydatatext="No Record Found." ShowHeaderWhenEmpty="True"
        showFooter="true" FooterStyle-CssClass="footer" >
        <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" Font-Size="14px"/>
        <Columns>
            <asp:TemplateField HeaderText="No.">
            <ItemTemplate>
                 <%# Container.DataItemIndex + 1 + "." %>
            </ItemTemplate>
             <FooterTemplate>
                 Total Of Components : <%# gvComponentList.Rows.Count %>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="stock_code" HeaderText="Stock Code" SortExpression="stock_code" />
            <asp:BoundField DataField="component_name1" HeaderText="Component 1" SortExpression="component_name1" />
            <asp:BoundField DataField="component_price1" HeaderText="Price Per Unit (RM)" SortExpression="component_price1" />
            <asp:BoundField DataField="component_name2" HeaderText="Component 2" SortExpression="component_name2" />
            <asp:BoundField DataField="component_price2" HeaderText="Price Per Unit (RM)" SortExpression="component_price2" />
            <asp:BoundField DataField="Cstatus" HeaderText="Status" SortExpression="Cstatus" />
            <asp:HyperLinkField DataNavigateUrlFields="stock_code" DataNavigateUrlFormatString="update_component.aspx?stock_code={0}" Text="Details" />
            <asp:HyperLinkField DataNavigateUrlFields="stock_code" DataNavigateUrlFormatString="delete_component.aspx?stock_code={0}" Text="Delete" />
        </Columns>    
    </asp:GridView>
</asp:Content>
