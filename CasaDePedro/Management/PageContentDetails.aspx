<%@ Page Title="Page Content Manager" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="PageContentDetails.aspx.cs" Inherits="CasaDePedro.Management.PageContentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id, PageBannerUrl, DefaultPageIconUrl" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.pagecontent">
                <EditItemTemplate>
                    <b>Page Title:</b>
                    <asp:TextBox ID="PageTitleTextBox" ReadOnly="true" CssClass="form-control" runat="server" Text='<%# BindItem.PageTitle %>' />
                    <br />
                    <b>Page Text:</b>
                    <asp:TextBox ID="PageTextTextBox" CssClass="form-control" runat="server" Text='<%# BindItem.PageText %>' Width="90%" TextMode="MultiLine" />
                    <br />
                    <b>Page Url:</b>
                    <asp:TextBox ID="PageUrlTextBox" runat="server" CssClass="form-control" ReadOnly="true" Text='<%# BindItem.PageUrl %>' />
                    <br />
                    <b>Page Banner:</b>
                    <asp:Image ID="imgPageBanner" CssClass="img-responsive img-thumbnail" Height="300px" ImageUrl='<%# BindItem.PageBannerUrl %>' runat="server" /><br />
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="1800px * 375px"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:FileUpload ID="FileUploadPageBanner" CssClass="form-control" runat="server" />

                    <%--<asp:TextBox ID="PageBannerUrlTextBox" runat="server" Text='<%# Bind("PageBannerUrl") %>' />--%>
                    <br />
                    <b>Homepage Icon:</b>
                    <asp:Image ID="imgHomeIcon" CssClass="img-responsive img-thumbnail" Height="200px" runat="server" ImageUrl='<%# BindItem.DefaultPageIconUrl %>' /><br />
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="499px * 281px"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:FileUpload ID="FileUploadHomeIcon" CssClass="form-control" runat="server" />
                    <%--<asp:TextBox ID="DefaultPageIconUrlTextBox" runat="server" Text='<%# Bind("DefaultPageIconUrl") %>' />--%>
                    <br />

                    <div class="btn-group">
                        <asp:LinkButton ID="UpdateButton" CssClass="btn btn-default" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        <asp:LinkButton ID="UpdateCancelButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </EditItemTemplate>

                <ItemTemplate>
                    
                    <br />
                    <b>Page Title:</b>
                    <br />
                    <asp:Label ID="PageTitleLabel" runat="server" Text='<%# Item.PageTitle %>' />
                    <hr />
                    <b>Page Text:</b>
                    <br />
                    <asp:TextBox ID="tbxPageText" TextMode="MultiLine" ReadOnly="true" Text='<%# Item.PageText %>' Width="90%" runat="server"></asp:TextBox>
                    <%--<asp:Label ID="PageTextLabel" runat="server" Text='<%# Bind("PageText") %>' />--%>
                    <hr />
                    
                    <b>Page Banner:</b>
                    <br />
                    <asp:Image ID="ImagePageBanner" ImageUrl='<%# Item.PageBannerUrl %>' Height="300px" runat="server" />
                    <%--<asp:Label ID="PageBannerUrlLabel" runat="server" Text='<%# Bind("PageBannerUrl") %>' />--%>
                    <hr />
                    <b>Homepage Icon:</b>
                    <br />
                    <asp:Image ID="ImagePageIcon" ImageUrl='<%# Item.DefaultPageIconUrl %>' Height="200px" runat="server" />
                    <%--<asp:Label ID="DefaultPageIconUrlLabel" runat="server" Text='<%# Bind("DefaultPageIconUrl") %>' />--%>
                    <hr />
                    <b>Last Edited By:</b>
                    <br />
                    <asp:Label ID="EditedByLabel" runat="server" Text='<%# Item.EditedBy %>' />
                    <hr />
                    <b>DateTime Edited:</b>
                    <br />
                    <asp:Label ID="DateTimeEditedLabel" runat="server" Text='<%# Item.DateTimeEdited %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="pagecontents" Where="" OnUpdating="EntityDataSource1_Updating">
                <WhereParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="SByte" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
