<%@ Page Title="Meetings and Events Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="MeetingsAndEvents.aspx.cs" Inherits="CasaDePedro.FrontDesk.MeetingsAndEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2><hr />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.meetingeventreservation">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Booking/MEBookingFormView.aspx?Id=" + Item.Id %>'>View</asp:HyperLink>
                        &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Booking/MEBookingDetail.aspx?Id=" + Item.Id %>'>Edit</asp:HyperLink>
                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                <asp:BoundField DataField="StartDateTime" HeaderText="Start Date&amp;Time" SortExpression="StartDateTime" />
                <asp:BoundField DataField="EndDateTime" HeaderText="End Date&amp;Time" SortExpression="EndDateTime" />
                <asp:BoundField DataField="NoOfPerson" HeaderText="Number of People" SortExpression="NoOfPerson" />
                <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Venue" SortExpression="MeetingEventVenueId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MeetingEventVenueId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Item.meetingeventvenue.MEVenueName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CheckBoxField DataField="BookingConfirmed" HeaderText="BookingConfirmed" SortExpression="BookingConfirmed" />
                <asp:BoundField DataField="ConfirmedBy" HeaderText="ConfirmedBy" SortExpression="ConfirmedBy" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="meetingeventreservations" Include="hotel, meetingeventvenue">
        </asp:EntityDataSource>
    </div>
</asp:Content>
