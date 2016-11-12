<%@ Page Title="Add or Edit Service Sub-Class" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="AddOrEditServiceSubClass.aspx.cs" Inherits="CasaDePedro.Management.AddOrEditServiceSubClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <div class="row">
            <h2>Manage Sub-Service Class</h2>

            <h3>Add New Service Sub-Class</h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                            <br />
                            Service Class:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCoreService2" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Core Service" InitialValue="4">*</asp:RequiredFieldValidator>
                            &nbsp;<asp:DropDownList ID="ddlCoreService2" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="ServiceCategory" DataValueField="Id"></asp:DropDownList>
                            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="hotelcoreservices" OrderBy="it.[ServiceCategory]">
                            </asp:EntityDataSource>
                            <br />
                            New Service Sub-class Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxSubService" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a New Sub-service Name">*</asp:RequiredFieldValidator>
                            &nbsp;<asp:TextBox ID="tbxSubService" runat="server" CssClass="form-control"></asp:TextBox><br />
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="btnAdd_Click" />
                        </div>
                    </div>
                    <hr />
                    <%--<h6>Core Sub-service List</h6>--%>
                    <br />
                    <a class="btn btn-default" role="button" data-toggle="collapse" href="#collapseSubService" aria-expanded="false" aria-controls="collapseSubService">Edit or Remove Core Sub-Class <span class="glyphicon glyphicon-triangle-bottom"></span>
                    </a>
                    <div class="collapse" id="collapseSubService">
                        <div class="well">
                            <p class="text-danger"><span class="glyphicon glyphicon-question-sign"></span>Do NOT DELETE a sub-class service that is still linked to a published service. If unsure, ask your website administrator</p>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource3" ItemType="CasaDePedro.hotelcoresubservice">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="SubService" HeaderText="Service Sub-class" SortExpression="SubService" />
                                    <asp:TemplateField HeaderText="Core Service" SortExpression="Service Class">
                                        <%--<EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CoreServiceId") %>'></asp:TextBox>
                                        </EditItemTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Item.hotelcoreservice.ServiceCategory %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="hotelcoresubservices" Include="hotelcoreservice">
                            </asp:EntityDataSource>
                        </div>
                    </div><br />
                    <a href="~/Management/AddOrEditServices.aspx" runat="server">Go to Add or Edit Services</a>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="PleaseWait">
                        Please Wait...
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
    <br />
</asp:Content>
