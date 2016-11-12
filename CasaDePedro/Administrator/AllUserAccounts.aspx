<%@ Page Title="User Account Dashboard" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="AllUserAccounts.aspx.cs" Inherits="CasaDePedro.Administrator.AllUserAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <h4>All Accounts</h4>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        <br />
        <hr />
        <div class="form-group">
            User Name: 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter UserName"></asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblUserFeed" CssClass="lblFeedBack" runat="server"></asp:Label>
            <asp:TextBox ID="tbxUserName" placeholder="UserName" runat="server" CssClass="form-control"></asp:TextBox>
            <br />

            <asp:Button ID="btnUnlock" runat="server" Text="Unlock User" CssClass="btn btn-success" OnClick="btnUnlock_Click" />

        </div>
    </div>

</asp:Content>
