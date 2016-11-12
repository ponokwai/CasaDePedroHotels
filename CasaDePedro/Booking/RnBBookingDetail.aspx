<%@ Page Title="Update Restaurant/Bar Booking" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="RnBBookingDetail.aspx.cs" Inherits="CasaDePedro.Booking.RnBBookingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <hr />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
        </div>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Full Name" CssClass="control-label" AssociatedControlID="tbxFullName"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxFullName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your full name" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Start Date &amp; Time" CssClass="control-label" AssociatedControlID="tbxStartDT"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxStartDT" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter date and time of your reservation" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Date-Time Format" data-content="DD/MM/YYYY HH:MM:SS "><span class="glyphicon glyphicon-question-sign"></span></a>
                <asp:TextBox ID="tbxStartDT" runat="server" placeholder="DD/MM/YYYY HH:MM:SS" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label9" runat="server" Text="End Date &amp; Time" CssClass="control-label" AssociatedControlID="tbxEndDT"></asp:Label>
                <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Date-Time Format" data-content="DD/MM/YYYY HH:MM:SS "><span class="glyphicon glyphicon-question-sign"></span></a>
                <asp:TextBox ID="tbxEndDT" runat="server" placeholder="DD/MM/YYYY HH:MM:SS" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="No of People" CssClass="control-label" AssociatedControlID="tbxPeopleNum"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPeopleNum" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter number of attendees" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="tbxPeopleNum" CssClass="FormError" Display="Dynamic" ErrorMessage="No. of people cannot be less than 1 or a fraction" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                <asp:TextBox ID="tbxPeopleNum" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Select Hotel" CssClass="control-label" AssociatedControlID="ddlHotel"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlHotel" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a hotel" InitialValue="1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlHotel" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="EntityDataSource1" DataTextField="HotelName" DataValueField="Id"></asp:DropDownList>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="hotels">
                </asp:EntityDataSource>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Select Restaurant or Bar" CssClass="control-label" AssociatedControlID="ddlResBar"></asp:Label>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="ddlResBar" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a restaurant or bar" OnServerValidate="CustomValidator2_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                <asp:DropDownList ID="ddlResBar" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="ResBarName" DataValueField="Id"></asp:DropDownList>
                <asp:EntityDataSource ID="EntityDataSource2" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="restaurantbarvenues" Where="" EntityTypeFilter="" OrderBy="it.[ResBarName]" Select="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="SByte" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="Phone Number" CssClass="control-label" AssociatedControlID="tbxPhone"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbxPeopleNum" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your phone number" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="tbxPhone" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="E-mail" CssClass="control-label" AssociatedControlID="tbxEmail"></asp:Label>
                <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Comment" CssClass="control-label" AssociatedControlID="tbxComment"></asp:Label>
                <asp:TextBox ID="tbxComment" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <%--<asp:Label ID="Label10" runat="server" Text="Confirm Booking"></asp:Label>--%>
                <asp:CheckBox ID="cbxConfirmBooking" runat="server" Text="Confirm Booking" AutoPostBack="True" OnCheckedChanged="cbxConfirmBooking_CheckedChanged" />
            </div>
            <div class="form-group">
                <asp:Label ID="Label11" runat="server" Text="Confirmed By" AssociatedControlID="ltlConfirmedBy"></asp:Label>
                <p class="text-success"><asp:Literal ID="ltlConfirmedBy" runat="server"></asp:Literal>
                </p>
                <asp:Label ID="lblFeedback" runat="server" CssClass="text-danger"></asp:Label>
            </div><br />
            <div class="btn-group">
                <a class="btn btn-default" href='javascript:history.go(-1)'>Back</a>
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="PleaseWait">Please Wait...</div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
