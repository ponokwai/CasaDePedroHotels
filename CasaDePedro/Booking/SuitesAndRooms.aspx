<%@ Page Title="Suites and Rooms Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="SuitesAndRooms.aspx.cs" Inherits="CasaDePedro.FrontDesk.SuitesAndRooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2><hr />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EntityDataSource1" ItemType="CasaDePedro.roomreservation">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <%--<EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>--%>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/Booking/SnRBookingFormView.aspx?Id=" + Item.id %>' runat="server">View</asp:HyperLink>
                                &nbsp;<asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/Booking/SnRBookingDetail.aspx?Id=" + Item.id %>' runat="server">Update</asp:HyperLink>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FullName" HeaderText="Guest Name" SortExpression="FullName" />
                        <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderText="Start Date" SortExpression="StartDate" />
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="NoOfAdult" HeaderText="Adults" SortExpression="NoOfAdult" />
                        <asp:BoundField DataField="NoOfChild" HeaderText="Children" SortExpression="NoOfChild" />
                        <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelId") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Item.hotel.HotelName %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Room Type" SortExpression="RoomTypeId">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Item.roomtype.Category %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:TemplateField HeaderText="Confirmed" SortExpression="BookingConfirmed">
                            <%--<EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" Checked='<%# BindItem.BookingConfirmed %>' runat="server" />
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("BookingConfirmed") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <%--<asp:CheckBox ID="CheckBox2" Checked='<%# Item.BookingConfirmed %>' runat="server" />--%>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("BookingConfirmed") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Confirmed By" SortExpression="ConfirmedBy">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ConfirmedBy") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ConfirmedBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="roomreservations" OrderBy="it.[id] DESC" Include="hotel, roomtype">
                </asp:EntityDataSource>
            
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="PleaseWait">Please Wait...</div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
