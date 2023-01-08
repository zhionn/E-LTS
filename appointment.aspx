<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="E_LTS.appointment" MasterPageFile="~/E-LTS.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="main" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Appointment
            <a href="add_appointment.aspx" class="css-button"  style="text-decoration: none"> 
	    <span class="css-button-icon"><i class="fa fa-plus-square" aria-hidden="true"></i></span>
	    <span class="css-button-text">Add</span>
    </a>
    </h1>
</div>
        <asp:GridView ID="gvAppointment" runat="server" Width="90%" AutoGenerateColumns="False" 
        AllowPaging="True" CellPadding="4" DataKeyNames="appointment_id" DataSourceID="dsAppointment"
        CssClass="datagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" OnRowDataBound="appointment_RowDataBound"
        RowStyle-CssClass="rows" emptydatatext="No Record Found." ShowHeaderWhenEmpty="True"
        showFooter="true" FooterStyle-CssClass="footer">
        <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" Font-Size="14px"/>
        <Columns>
            <asp:TemplateField HeaderText="No.">
            <ItemTemplate>
                 <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <FooterTemplate>
                 Total Of Penalty : <%# gvAppointment.Rows.Count %>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="appointment_id" HeaderText="Appointment ID" SortExpression="appointment_ID" />
            <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
            <asp:BoundField DataField="remark" HeaderText="Remark" SortExpression="remark" />
            <asp:HyperLinkField DataNavigateUrlFields="appointment_Id" DataNavigateUrlFormatString="update_appointment.aspx?appointment_Id={0}" Text="Edit" />
            <asp:HyperLinkField DataNavigateUrlFields="appointment_Id" DataNavigateUrlFormatString="delete_appointment.aspx?appointment_Id={0}" Text="Delete" />
        </Columns>    
    </asp:GridView>
    <asp:SqlDataSource ID="dsAppointment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Appointment] WHERE ([student_id] = @student_id)"> 
                <SelectParameters>
            <asp:SessionParameter Name="student_id" SessionField="student_Id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>