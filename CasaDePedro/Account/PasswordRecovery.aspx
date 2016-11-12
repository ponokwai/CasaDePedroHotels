<%@ Page Title="Password Recovery" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="CasaDePedro.Account.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        
            <h2><%: Title %></h2><hr />
            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" SuccessPageUrl="~/Default.aspx">
                <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <MailDefinition BodyFileName="~/App_Data/PasswordRecoveryConfirmation.txt" From="webmaster@casadepedrohotels.com.ng" Subject="Your Password">
                </MailDefinition>
                <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            </asp:PasswordRecovery>
        
    </div>
</asp:Content>
