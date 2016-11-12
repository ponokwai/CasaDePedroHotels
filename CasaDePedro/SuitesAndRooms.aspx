<%@ Page Title="Suites and Rooms" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="SuitesAndRooms.aspx.cs" Inherits="CasaDePedro.Suites" MetaDescription="Our suites and rooms are spacious, comfortable, and reasonably priced. There are a total of 126 accommodations of various categories at the Main and Annex hotels. If you enjoy surfing the web and staying connected with family and friends, you will be delighted to know we offer free internet WIFI service to all guests. If you like to relax with associates over meals, have refreshing drinks, listen to good music or love the entertainment of a live band, we already know about your type, and have provided restaurants, indoor bars, bush bar, sports bar, and more. Coming soon are 9D cinema, in-door kids play ground with arcade game, Jacuzzi, and swimming pool for your comfort. I know you must be enthusiastic to visit. Book a room today." 
    MetaKeywords="suites, rooms, booking, hotel, reservation, warri, effurun, delta, state, nigeria, visit, warri, refinery, road" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <%-- jQuery UI datepicker --%>
    
    <div>
        <h2 class="fancy-header">Suites & Rooms</h2>
    </div>
    <div class="container-fluid <%--page-banner--%>">
        <asp:Image ID="Image2" CssClass="img-responsive" Width="100%" AlternateText="Suites and Rooms" runat="server" />
    </div>
    <br />
    <div class="body-content">
        <div class="container">
            <div class="row">
            </div>
            <div class="row">

                <br />
                <div class="col-md-4">
                    <br />
                    <%--<h4>Make Reservation</h4>--%>
                    <a class="btn btn-danger btn-lg" role="button" data-toggle="collapse" href="#collapseResForm" aria-expanded="false" aria-controls="collapseResForm">Make a Reservation <span class="glyphicon glyphicon-triangle-right"></span>
                    </a>
                    <div class="collapse" id="collapseResForm">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="pnlReserveRoom" runat="server">
                                    <%-- Room Reservation Form --%>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title text-center">Suites and Rooms Reservation </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                                            </div>
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <asp:Label ID="lblCheckIn" runat="server" CssClass="control-label">Start Date</asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxFromDate" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a Start Date" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="tbxFromDate" CssClass="FormError" Display="Dynamic" ErrorMessage="Past dates are invalid" OnServerValidate="CustomValidator2_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                                                    <asp:TextBox ID="tbxFromDate" ClientIDMode="Static" name="tbxFromDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                                                </div>
                                                <div class="form-group">

                                                    <asp:Label ID="lblCheckout" runat="server" CssClass="control-label">End Date</asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxToDate" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter an End Date" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="tbxToDate" CssClass="FormError" Display="Dynamic" ErrorMessage="End Date must be after Start Date" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                                                    <asp:TextBox ID="tbxToDate" name="tbxToDate" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <asp:Label ID="Label1" runat="server" CssClass="control-label small-ddl" Text="Label">Adult</asp:Label>
                                                    <asp:DropDownList ID="ddlAdults" runat="server" CssClass="form-control" Width="100px">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                        <asp:ListItem>6</asp:ListItem>
                                                        <asp:ListItem>7</asp:ListItem>
                                                        <asp:ListItem>8</asp:ListItem>
                                                        <asp:ListItem>9</asp:ListItem>
                                                        <asp:ListItem>10</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label2" runat="server" Text="Children" CssClass="control-label small-ddl"></asp:Label>
                                                    <asp:DropDownList ID="ddlChildren" runat="server" CssClass="form-control" Width="100px">
                                                        <asp:ListItem>0</asp:ListItem>
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                        <asp:ListItem>6</asp:ListItem>
                                                        <asp:ListItem>7</asp:ListItem>
                                                        <asp:ListItem>8</asp:ListItem>
                                                        <asp:ListItem>9</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Select Hotel"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlHotel" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Hotel" InitialValue="1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    <asp:DropDownList ID="ddlHotel" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="EntityDataSource2" DataTextField="HotelName" DataValueField="Id"></asp:DropDownList>
                                                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="hotels">
                                                    </asp:EntityDataSource>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label4" CssClass="control-label" runat="server" Text="Select Suite/Room"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlRoom" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Suite or Room" InitialValue="3" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlRoom" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a Suite or Room" InitialValue="2">*</asp:RequiredFieldValidator>
                                                    <asp:DropDownList ID="ddlRoom" CssClass="form-control" runat="server" DataSourceID="EntityDataSource1" DataTextField="Category" DataValueField="Id" AutoPostBack="True" OnTextChanged="ddlRoom_TextChanged"></asp:DropDownList>
                                                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EntitySetName="roomtypes" AutoGenerateWhereClause="True" Where="">
                                                        <WhereParameters>
                                                            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="SByte" />
                                                        </WhereParameters>
                                                    </asp:EntityDataSource>
                                                    <asp:Label ID="lblPrice" runat="server" class="text-danger"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label3" runat="server" Text="Full Name" CssClass="control-label"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your Full Name" SetFocusOnError="True" ControlToValidate="tbxFullName">*</asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label5" runat="server" Text="Phone No" CssClass="control-label"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxPhone" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your Phone Number" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    <asp:TextBox ID="tbxPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label8" runat="server" Text="Email" CssClass="control-label"></asp:Label>
                                                    <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="Label6" runat="server" Text="Comment" CssClass="control-label"></asp:Label>
                                                    <asp:TextBox ID="tbxComment" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>

                                            <asp:Button ID="btnSendReserveRequest" runat="server" Text="Send" CssClass="btn btn-success" OnClick="btnSendReserveRequest_Click" />
                                        </div>
                                    </div>

                                </asp:Panel>
                                <%-- Confirmation label --%>
                                <asp:Label ID="lblReserveConf" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div class="PleaseWait">
                                    Please wait...
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>

                    </div>
                    <br />
                    <br />
                    <address>
                        <span class="glyphicon glyphicon-earphone">: 08032496798; 08032496801</span><br />
                        <span class="glyphicon glyphicon-envelope"><a href="mailto:booking@casadepedrohotels.com.ng">: booking@casadepedrohotels.com.ng</a></span>
                    </address>
                </div>
                <div class="col-md-8">
                    <div class="wow glideRight">
                        <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>
                    </div>
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
                                        <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-centralise" ImageUrl='<%# Item.FrontPicUrl %>' AlternateText="Suites and Rooms" />
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
    </div>
</asp:Content>
