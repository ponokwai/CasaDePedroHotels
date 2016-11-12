<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CasaDePedro.Account.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueDestinationPageUrl="~/Default.aspx" PasswordRecoveryText="Recover your password" PasswordRecoveryUrl="~/Account/PasswordRecovery.aspx">
            <MailDefinition BodyFileName="~/App_Data/PasswordChangeConfirmation.txt" From="webmaster@casadepedrohotels.com.ng" Subject="Your new password">
            </MailDefinition>
        </asp:ChangePassword>
    </div>
</asp:Content>
