<%@ Page Title="Service Class List" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="AllServices.aspx.cs" Inherits="CasaDePedro.Management.AllServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <div class="row">
            <h2><%: Title %></h2><br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.facilityunit">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Management/AddOrEditServices.aspx?ServId={0}" DataTextField="Name" HeaderText="Service Name" SortExpression="Name" />
                    <asp:TemplateField HeaderText="Service Class" SortExpression="HotelCoreServiceId">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# BindItem.hotelcoreservice.ServiceCategory %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Sub-class" SortExpression="HotelCoreSubServiceId">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# BindItem.hotelcoresubservice.SubService %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Forward Image" SortExpression="FrontPicUrl">
                        
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="<%# BindItem.FrontPicUrl %>" CssClass="img-responsive img-thumbnail" Height="100px" />
                            <%--<asp:Label ID="Label3" runat="server" Text='<%# Bind("FrontPicUrl") %>'></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EditBy" HeaderText="EditBy" SortExpression="EditBy" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="facilityunits" Include="hotelcoreservice, hotelcoresubservice">
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
