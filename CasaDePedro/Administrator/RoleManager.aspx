<%@ Page Title="Role Manager" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="RoleManager.aspx.cs" Inherits="CasaDePedro.Administrator.RolesManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">

        <div class="row">
            <h2><%: Title %></h2>

            <h3>Create Role</h3>
            Enter Name:
                <asp:TextBox ID="tbxCreateRole" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:Button ID="btnRole" runat="server" CssClass="btn btn-default" Text="Create Role" OnClick="btnRole_Click" />
            <br />
            <br />
            Roles:
            <asp:ListBox ID="lbxRoles" runat="server" CssClass="form-control"></asp:ListBox>



        </div>
    </div>
</asp:Content>
