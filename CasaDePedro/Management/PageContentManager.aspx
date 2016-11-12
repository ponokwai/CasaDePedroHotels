<%@ Page Title="Manage Page Content" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="PageContentManager.aspx.cs" Inherits="CasaDePedro.Management.PageContentManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataKeyNames="Id" DataSourceID="EntityDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Management/PageContentDetails.aspx?Id={0}" DataTextField="PageTitle" HeaderText="Page Title" SortExpression="PageTitle" />
                    <asp:TemplateField HeaderText="Page Banner" SortExpression="PageBannerUrl">
                        <%--<EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PageBannerUrl") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        <ItemTemplate>
                            <asp:Image ID="imgBanner" ImageUrl='<%# Bind("PageBannerUrl") %>' runat="server" Height="200px" />
                            <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("PageBannerUrl") %>'></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default Page Icon" SortExpression="DefaultPageIconUrl">
                        <%--<EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DefaultPageIconUrl") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        <ItemTemplate>
                            <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# Bind("DefaultPageIconUrl") %>' Height="150px" />
                            <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("DefaultPageIconUrl") %>'></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EditedBy" HeaderText="Edited By" SortExpression="EditedBy" />
                    <asp:BoundField DataField="DateTimeEdited" HeaderText="Date Time Edited" SortExpression="DateTimeEdited" DataFormatString="0:d" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="pagecontents">
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
