<%@ Page Title="Edit Pricing" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="EditPricing.aspx.cs" Inherits="CasaDePedro.Management.EditPricing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.roomtype">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Category" HeaderText="Room Type" ReadOnly="True" SortExpression="Category" />
                <asp:BoundField DataField="AmountPerNight" HeaderText="Cost Per Night" SortExpression="AmountPerNight" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="roomtypes" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="" Include="hotel">
        </asp:EntityDataSource>
    </div>
</asp:Content>
