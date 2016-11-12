<%@ Page Title="Add or Edit Facility Unit" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="AddOrEditServices.aspx.cs" Inherits="CasaDePedro.Management.AddOrEditFacilityUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%--<EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CoreServiceId") %>'></asp:TextBox>
                                        </EditItemTemplate>--%></h2>
        <h2>
            <asp:Literal ID="ltlNewServ" runat="server" Visible="false">Add New Service Class</asp:Literal><asp:Literal ID="ltlEditServ" runat="server" Visible="false">Edit Service Class</asp:Literal></h2>
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Service Title" AssociatedControlID="tbxFacilityName" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="tbxFacilityName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Service Class" AssociatedControlID="ddlCoreServices" CssClass="control-label"></asp:Label>
                            <asp:DropDownList ID="ddlCoreServices" runat="server" CssClass="form-control" DataSourceID="EntityDataSource1" DataTextField="ServiceCategory" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="hotelcoreservices" EntityTypeFilter="" OrderBy="it.[ServiceCategory]" Select="">
                            </asp:EntityDataSource>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label5" runat="server" Text="Service Sub-Class" AssociatedControlID="ddlSubCoreService" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddlSubCoreService" runat="server" CssClass="form-control" DataSourceID="EntityDataSource4" DataTextField="SubService" DataValueField="Id"></asp:DropDownList>
                            <asp:EntityDataSource ID="EntityDataSource4" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="hotelcoresubservices" OrderBy="it.[SubService]" Where="">
                                <WhereParameters>
                                    <asp:ControlParameter ControlID="ddlCoreServices" Name="CoreServiceId" PropertyName="SelectedValue" Type="SByte" />
                                </WhereParameters>
                            </asp:EntityDataSource>
                            <a href="~/Management/AddOrEditServiceSubClass.aspx" class="small" runat="server">Add or Edit Sub-Class</a>
                        </div>
                        <div class="form-group">
                            <asp:Image ID="imgFrontPic" CssClass="thumbnail" runat="server" />
                            <asp:Label ID="Label3" runat="server" Text="Upload Front Image" AssociatedControlID="fudFrontPic" CssClass="control-label"></asp:Label>
                            <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="440px * 248px"><span class="glyphicon glyphicon-question-sign"></span></a>
                            <asp:FileUpload ID="fudFrontPic" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Description" AssociatedControlID="tbxDetails" CssClass="control-label"></asp:Label>
                            <asp:TextBox ID="tbxDetails" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-default" href='javascript:history.go(-1)'>< Back</a>
                            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button ID="btnSave" runat="server" Text="Save >" CssClass="btn btn-success" OnClick="btnSave_Click" />
                        </div>
                        <asp:Label ID="lblFeedback" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSave" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                <ProgressTemplate>
                    <div class="PleaseWait">Please Wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>

    </div>
    <br />
</asp:Content>
