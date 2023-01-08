<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentList.aspx.cs" Inherits="E_LTS.studentList" MasterPageFile="~/E-LTS.Master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Student List
    <a href="add_student.aspx" class="css-button"  style="text-decoration: none"> 
	    <span class="css-button-icon"><i class="fa fa-plus-square" aria-hidden="true"></i></span>
	    <span class="css-button-text">Add</span>
    </a>
    </h1>
    
</div>
    Search : <asp:TextBox ID="txtSearch" runat="server" width="700px" Height="30px"/>
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <hr />
    <asp:GridView ID="gvStudentList" runat="server" Width="90%" AutoGenerateColumns="False" 
        AllowPaging="True" CellPadding="4" DataKeyNames="student_id" OnRowDataBound="studentList_RowDataBound" 
        CssClass="datagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" 
        RowStyle-CssClass="rows" emptydatatext="No Record Found." 
        showFooter="True" FooterStyle-CssClass="footer" ShowHeaderWhenEmpty="True">
        <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" Font-Size="14px"/>
        <Columns>
            <asp:TemplateField HeaderText="No.">
            <ItemTemplate>
                 <%# Container.DataItemIndex + 1 + "." %>
            </ItemTemplate>
            <FooterTemplate>
                 Total Of Student : <%# gvStudentList.Rows.Count %>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_ID" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact"/>
            <asp:BoundField DataField="programme" HeaderText="Programme" SortExpression="programme" />
            <asp:HyperLinkField DataNavigateUrlFields="student_id" DataNavigateUrlFormatString="student_details.aspx?student_id={0}" Text="Details" />
            <asp:HyperLinkField DataNavigateUrlFields="student_id" DataNavigateUrlFormatString="delete_student.aspx?student_id={0}" Text="Delete" />
        </Columns>
    </asp:GridView><br />
</asp:Content>
