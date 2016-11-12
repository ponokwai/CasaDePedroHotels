<%@ Page Title="Meetings & Events" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="MeetingsAndEvents.aspx.cs" Inherits="CasaDePedro.MeetingsAndEvents" MetaDescription="We have conference and event halls at Casa De Pedro main and annex hotels. The venues have the capacity to host annual general meetings, exhibitions, weddings, and more. We provide discounted catering service for clients using our venues, and there are free parking and 24 hours security in the hotel premises. To let us know and plan with you in advance, make a reservation today." 
    MetaKeywords="meeting, events, booking, reservation, warri, effurun, refinery, road, nigeria" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <h2 class="fancy-header"><%: Title %></h2>
    <div class="container-fluid <%--page-banner--%>">
        <asp:Image ID="Image2" Width="100%" CssClass="img-responsive" runat="server" />
    </div>
    <br />
    <div class="container body-content">
        <div class="row">
            <div class="col-md-4">
                <br />
                <%--<h4>Make a Reservation</h4>--%>
                <%--<div class="make-reservation">--%>
                <br />
                <a class="btn btn-danger btn-lg" role="button" data-toggle="collapse" href="#collapseForm" aria-expanded="false" aria-controls="collapseForm">Make a Reservation <span class="glyphicon glyphicon-triangle-right"></span>
                </a>
                <div class="collapse" id="collapseForm">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title text-center">Meeting and Event Reservation</h3>
                                </div>
                                <asp:Panel ID="pnlMeetingsEvents" runat="server">
                                    <div class="panel-body">
                                        <div>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                                        </div>
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" Text="Start Date &amp; Time" CssClass="control-label" AssociatedControlID="tbxStartDT"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxStartDT" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter date and time of your reservation" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="tbxStartDT" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label9" runat="server" Text="End Date &amp; Time" CssClass="control-label" AssociatedControlID="tbxEndDT"></asp:Label>
                                                <asp:TextBox ID="tbxEndDT" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
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
                                                <asp:Label ID="Label4" runat="server" Text="Select Venue" CssClass="control-label" AssociatedControlID="ddlMEVenue"></asp:Label>
                                                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="ddlMEVenue" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a meeting or event venue" OnServerValidate="CustomValidator2_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                                                <asp:DropDownList ID="ddlMEVenue" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="MEVenueName" DataValueField="Id"></asp:DropDownList>
                                                <asp:EntityDataSource ID="EntityDataSource2" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="meetingeventvenues" Where="" OrderBy="it.[MEVenueName]">
                                                    <WhereParameters>
                                                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="SByte" />
                                                    </WhereParameters>
                                                </asp:EntityDataSource>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label5" runat="server" Text="Full Name" CssClass="control-label" AssociatedControlID="tbxFullName"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxFullName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your full name" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label6" runat="server" Text="Phone Number" CssClass="control-label" AssociatedControlID="tbxPhone"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbxPeopleNum" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your phone number" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="tbxPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label7" runat="server" Text="E-mail" CssClass="control-label" AssociatedControlID="tbxEmail"></asp:Label>
                                                <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label8" runat="server" Text="Comment" CssClass="control-label" AssociatedControlID="tbxComment"></asp:Label>
                                                <asp:TextBox ID="tbxComment" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:Button ID="btnSubmit" runat="server" Text="Send" CssClass="btn btn-default" OnClick="btnSubmit_Click" />
                                    </div>
                                </asp:Panel>
                                <div>
                                    <asp:Label ID="lblFeedback" Visible="false" runat="server"></asp:Label>
                                </div>
                            </div>

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
                <%--</div>--%>
                <br />
                <br />
                <address>
                    <span class="glyphicon glyphicon-earphone">: 08032496798; 08032496801</span><br />
                    <span class="glyphicon glyphicon-envelope"><a href="mailto:booking@casadepedrohotels.com.ng">: booking@casadepedrohotels.com.ng</a></span>
                </address>
            </div>
            <div class="col-md-8 glideRight">
                <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <br />
        <div class="row">
            <%--<h3>Services</h3>--%>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="Repeater1" runat="server" ItemType="CasaDePedro.facilityunit">
                        <ItemTemplate>
                            <div class="col-sm-6 wow animated glideLeft">

                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/ServiceView.aspx?ServId=" + Item.Id %>'>
                                    <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-centralise" ImageUrl='<%# Item.FrontPicUrl %>' AlternateText="Meetings and Events" />
                                    <p class="serv-name-format">
                                        <asp:Literal ID="Literal" runat="server" Text='<%# Item.Name %>'></asp:Literal>
                                    </p>
                                </asp:HyperLink>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                <ProgressTemplate>
                    <div class="PleaseWait">Please Wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>
