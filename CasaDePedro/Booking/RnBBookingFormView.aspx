<%@ Page Title="Restaurant or Bar Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="RnBBookingFormView.aspx.cs" Inherits="CasaDePedro.Booking.RnBBookingFormView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="restaurantbarreservations" AutoGenerateWhereClause="True" EntityTypeFilter="" Include="hotel, restaurantbarvenue" Select="" Where="">
            <WhereParameters>
                <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" Height="100px" Width="90%" ItemType="CasaDePedro.restaurantbarreservation" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                <asp:BoundField DataField="StartDateTime" HeaderText="Start Date&amp;Time" SortExpression="StartDateTime" />
                <asp:BoundField DataField="EndDateTime" HeaderText="End Date&amp;Time" SortExpression="EndDateTime" />
                <asp:BoundField DataField="NoOfPerson" HeaderText="Number of Persons" SortExpression="NoOfPerson" />
                <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:TextBox>
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Restaurant/BarVenue" SortExpression="RestaurantBarVenueId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RestaurantBarVenueId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RestaurantBarVenueId") %>'></asp:TextBox>
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Item.restaurantbarvenue.ResBarName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:TextBox ID="Label3" runat="server" Text='<%# Bind("Comment") %>' ReadOnly="true" TextMode="MultiLine" BorderStyle="None" Width="90%"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="BookingConfirmed" HeaderText="BookingConfirmed" SortExpression="Booking Confirmed" />
                <asp:BoundField DataField="ConfirmedBy" HeaderText="Confirmed By" SortExpression="ConfirmedBy" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
        <br />
        <a class="btn btn-default" href='javascript:history.go(-1)'>Back</a>
    </div>
</asp:Content>
