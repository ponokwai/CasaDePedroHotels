<%@ Page Title="Manage Website" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CasaDePedro.Booking.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <p>Welcome to the administration page of <a href="http://www.casadepedrohotels.com.ng">http://www.casadepedrohotels.com.ng</a>. If you are here in error or have an incorrect priviledge please log out and report to <a href="mailto:support@casadepedrohotels.com.ng">support@casadepedrohotels.com.ng</a>. </p>
        <h4>User Priviledges</h4>
        <table class="table table-bordered">
            <tr>
                <td>
                    <h4>Role</h4>
                </td>
                <td>
                    <h4>Access</h4>
                </td>
            </tr>
            <tr>
                <td>Frontdesk</td>
                <td>This role can only use the FrontDesk menu to manage hotel booking.</td>
            </tr>
            <tr>
                <td>Manager</td>
                <td>This role has full access to the FrontDesk and Manager menus. The Manager menu is used to manage website content.</td>
            </tr>
            <tr>
                <td>Administrator</td>
                <td>This is the super user role. An administrator can access all menus and is responsible for managing all roles and access.</td>
            </tr>
        </table>
        <p>
            If you have a challenge using this website, meet your supervisor or email <a href="mailto:support@casadepedrohotels.com.ng">support@casadepedrohotels.com.ng</a>.</p>
        <p>
            Warm regards</p>
        <p>
            Casa De Pedro Hotels Team</p>
    </div>
</asp:Content>
