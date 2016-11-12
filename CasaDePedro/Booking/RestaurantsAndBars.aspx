<%@ Page Title="Restaurants and Bars Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="RestaurantsAndBars.aspx.cs" Inherits="CasaDePedro.FrontDesk.RestaurantsAndBars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2><hr />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.restaurantbarreservation">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/Booking/RnBBookingFormView.aspx?Id=" + Item.Id %>' runat="server">View</asp:HyperLink>
                        &nbsp;<asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/Booking/RnBBookingDetail.aspx?Id=" + Item.Id %>' runat="server">Update</asp:HyperLink>
                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                <asp:BoundField DataField="StartDateTime" HeaderText="Start Date-Time" SortExpression="StartDateTime" />
                <asp:BoundField DataField="EndDateTime" HeaderText="End Date-Time" SortExpression="EndDateTime" />
                <asp:BoundField DataField="NoOfPerson" HeaderText="No. of People" SortExpression="NoOfPerson" />
                <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Restaurant/Bar Venue" SortExpression="RestaurantBarVenueId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RestaurantBarVenueId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Item.restaurantbarvenue.ResBarName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="BookingConfirmed" HeaderText="Confirmed" SortExpression="BookingConfirmed" />
                <asp:BoundField DataField="ConfirmedBy" HeaderText="Confirmed By" SortExpression="ConfirmedBy" />
            </Columns>
        </asp:GridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="restaurantbarreservations" Include="hotel, restaurantbarvenue" EntityTypeFilter="" OrderBy="it.[Id]" Select="">
        </asp:EntityDataSource>
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
</asp:Content>
