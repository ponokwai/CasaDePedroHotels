<%@ Page Title="Update Suite/Room Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="SnRBookingDetail.aspx.cs" Inherits="CasaDePedro.FrontDesk.SnRBookingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">

        <h2><%: Title %></h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                </div>
                <div class="form-horizontal">
                    Guest Name: 
                    <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox><br />

                    From Date: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Date Format" data-content="DD/MM/YYYY"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:TextBox ID="tbxFromDate" runat="server" CssClass="form-control"></asp:TextBox><br />

                    To Date: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Date Format" data-content="DD/MM/YYYY"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:TextBox ID="tbxToDate" runat="server" CssClass="form-control"></asp:TextBox>

                    No of Adults:
                    <asp:TextBox ID="tbxAdults" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                    No of Children:
                    <asp:TextBox ID="tbxChildren" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                    Hotel:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlHotel" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Hotel" InitialValue="1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlHotel" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="EntityDataSource2" DataTextField="HotelName" DataValueField="Id"></asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="hotels">
                    </asp:EntityDataSource>

                    Suite or Room:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlRoom" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Suite or Room" InitialValue="3" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlRoom" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Suite or Room" InitialValue="2">*</asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlRoom" CssClass="form-control" runat="server" DataSourceID="EntityDataSource1" DataTextField="Category" DataValueField="Id"></asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="roomtypes" AutoGenerateWhereClause="True" Where="">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="SByte" />
                        </WhereParameters>
                    </asp:EntityDataSource>

                    Phone Number: 
                    <asp:TextBox ID="tbxPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>

                    Email:
                    <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>

                    Comments:
                    <asp:TextBox ID="tbxComment" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

                    Confirm Booking: 
                    <asp:CheckBox ID="cbxConfirmBooking" runat="server" AutoPostBack="True" OnCheckedChanged="cbxConfirmBooking_CheckedChanged" /><br />

                    Confirmed By: 
                    <asp:Label ID="lblConfirmedBy" runat="server" CssClass="text-success"></asp:Label>
                </div>

                <div class="btn-group">
                    <a class="btn btn-default" href='javascript:history.go(-1)'>Cancel</a>
                    <asp:Button ID="btnUpdate" CssClass="btn btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    <asp:Label ID="lblFeedback" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div class="PleaseWait">Please Wait...</div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
