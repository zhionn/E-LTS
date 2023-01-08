<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="E_LTS.index" MasterPageFile="~/E-LTS.Master"%>


<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/sb-admin-2.css" rel="stylesheet">
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Schedule List
    </h1>
</div>
        <asp:GridView ID="gvSchedule" runat="server" Width="90%" AutoGenerateColumns="False" 
        AllowPaging="True" CellPadding="4" DataKeyNames="appointment_id" DataSourceID="dsSchedule"
        CssClass="datagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" OnRowDataBound="schedule_RowDataBound"
        RowStyle-CssClass="rows" emptydatatext="No Record Found." ShowHeaderWhenEmpty="True"
        showFooter="true" FooterStyle-CssClass="footer">
        <EmptyDataRowStyle Font-Bold="True" ForeColor="Red" Font-Size="14px"/>
        <Columns>
            <asp:TemplateField HeaderText="No.">
            <ItemTemplate>
                 <%# Container.DataItemIndex + 1 %>
            </ItemTemplate>
            <FooterTemplate>
                 Total Of Penalty : <%# gvSchedule.Rows.Count %>
            </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="appointment_id" HeaderText="Appointment ID" SortExpression="appointment_ID" />
            <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
            <asp:BoundField DataField="remark" HeaderText="Remark" SortExpression="remark" />
        </Columns>    
    </asp:GridView>
    <asp:SqlDataSource ID="dsSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Appointment]"> 
    </asp:SqlDataSource>
</asp:Content>