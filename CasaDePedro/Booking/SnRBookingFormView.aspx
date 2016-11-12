<%@ Page Title="Suite or Room Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="SnRBookingFormView.aspx.cs" Inherits="CasaDePedro.Booking.SnRBookingEditDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2><hr />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="100px" Width="90%" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.roomreservation" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <%--<asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />--%>
                <asp:BoundField DataField="FullName" HeaderText="Guest Name" SortExpression="FullName" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />
                <asp:BoundField DataField="NoOfAdult" HeaderText="Adults" SortExpression="NoOfAdult" />
                <asp:BoundField DataField="NoOfChild" HeaderText="Children" SortExpression="NoOfChild" />
                <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <%--<InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RoomTypeId" SortExpression="RoomTypeId">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <%--<InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:TextBox>
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Item.roomtype.Category %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox>
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        <asp:TextBox ID="Label3" ReadOnly="true" runat="server" TextMode="MultiLine" Text='<%# Item.Comment %>' BorderStyle="None" Width="80%"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="BookingConfirmed" HeaderText="BookingConfirmed" SortExpression="BookingConfirmed" />
                <asp:BoundField DataField="ConfirmedBy" HeaderText="ConfirmedBy" SortExpression="ConfirmedBy" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView><br />
        <a class="btn btn-default" href='javascript:history.go(-1)'>Back</a>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="roomreservations" Include="hotel, roomtype" Where="">
            <WhereParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="Id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>


    </div>
</asp:Content>
