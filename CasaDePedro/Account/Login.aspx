<%@ Page Title="Log in to your account" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CasaDePedro.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container body-content">
        <br />
        <h2><%: Title %></h2><hr />
            <div class="col-md-4">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Booking/" PasswordRecoveryText="Recover your password" PasswordRecoveryUrl="~/Account/PasswordRecovery.aspx">
                    <LayoutTemplate>
                        <table class="table table-responsive">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">Log In</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="~/Account/PasswordRecovery.aspx">Recover your password</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <p>Hello! <asp:LoginName ID="LoginName1" runat="server" /> 
                            you are already logged in</p>
                        <p>
                            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Booking/Default.aspx" runat="server">Manage Site</asp:HyperLink> | <asp:LoginStatus ID="LoginStatus1" runat="server" />
                        </p>
                    </LoggedInTemplate>
                </asp:LoginView>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/ChangePassword.aspx">Change your password</asp:HyperLink>
            </div>
        </div>
    
</asp:Content>
