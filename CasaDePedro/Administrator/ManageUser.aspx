<%@ Page Title="Manage User" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="CasaDePedro.Administrator.CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <div class="col-md-6">
                <h3>Create New User</h3>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" ValidationGroup="valGpCreateUser" />
                                User Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a User Name" SetFocusOnError="True" ValidationGroup="valGpCreateUser">*</asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="tbxUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                Password:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPassword" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a password" SetFocusOnError="True" ValidationGroup="valGpCreateUser">*</asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="tbxPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                Confirm Password:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxConfirmPassword" CssClass="FormError" Display="Dynamic" ErrorMessage="Confirm your Password" SetFocusOnError="True" ValidationGroup="valGpCreateUser">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbxPassword" ControlToValidate="tbxConfirmPassword" CssClass="FormError" Display="Dynamic" ErrorMessage="Password do not match" SetFocusOnError="True" ValidationGroup="valGpCreateUser">*</asp:CompareValidator>
                                &nbsp;<asp:TextBox ID="tbxConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                Email Address:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxEmail" CssClass="FormError" Display="Dynamic" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" ValidationGroup="valGpCreateUser">*</asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                Select Role:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a User Role" SetFocusOnError="True" ControlToValidate="ddlRoles" InitialValue="-- Select Role --" ValidationGroup="valGpCreateUser">*</asp:RequiredFieldValidator>
                                &nbsp;<asp:DropDownList ID="ddlRoles" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:Button ID="btnCreateUser" runat="server" Text="Create User" CssClass="btn btn-success" OnClick="btnCreateUser_Click" ValidationGroup="valGpCreateUser" />
                                <asp:Label ID="lblFeedback" runat="server" CssClass="text-success"></asp:Label>
                            </div>
                        </div>
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
            <div class="col-md-6">
                <h3>Delete User</h3>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        Select User:
                        <asp:DropDownList ID="ddlDelUser" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnDelUser" CssClass="btn btn-danger" runat="server" Text="Delete User" OnClick="btnDelUser_Click" />
                        <asp:Label ID="lblDelUserFeedback" CssClass="text-success" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <div class="PleaseWait">
                            Please Wait...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h3>Find Users in Role</h3>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        Find Users in Role:
                    <asp:DropDownList ID="ddlUserRoles" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:Button ID="btnUsersInRole" runat="server" Text="Get Users In Role" CssClass="btn btn-success" OnClick="btnUsersInRole_Click" />
                        <br />
                        Users:
                <br />
                        <asp:ListBox ID="ListBox1" runat="server" CssClass="form-control"></asp:ListBox>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                    <ProgressTemplate>
                        <div class="PleaseWait">Please Wait...</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div class="col-md-6">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <h3>Add/Remove User From Role</h3>
                Users:
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                <br />
                Roles:
                <asp:ListBox ID="ListBox2" runat="server" CssClass="form-control"></asp:ListBox><br />
                <div class="btn btn-group">
                    <asp:Button ID="btnAddUser" runat="server" CssClass="btn btn-success" Text="Add User" OnClick="btnAddUser_Click" />
                    <asp:Button ID="btnRemoveUser" runat="server" CssClass="btn btn-danger" Text="Remove User" OnClick="btnRemoveUser_Click" />
                </div>
                        <asp:Label ID="lblAddRemoveFeedback" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress4" runat="server">
                    <ProgressTemplate>
                        <div class="PleaseWait">Please Wait...</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>

        </div>
    </div>
</asp:Content>
