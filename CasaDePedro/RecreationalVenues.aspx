<%@ Page Title="Recreational Venues" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="RecreationalVenues.aspx.cs" Inherits="CasaDePedro.RecreationalVenues" MetaDescription="For your comfort and leisure we have swimming pool, spa, gym, cinema, boutique, saloon, in-door kids playground, and more. The swimming pool is located at the main hotel, and has a Jacuzzi facility. Our gym is equipped with modern facilities to help you stay fit and burn off excess calories. Our 9D cinema is equipped with amazing experience and box office movies you cannot afford to miss. Make someone happy today. Ever travelled and realised the need for more clothing or clothing accessories? We have well stocked boutique to meet your needs. They say “looking good, is good business”. So we have provided in-house unisex saloons to make you always look your best." 
    MetaKeywords="recreation, centre, saloon, swimming, pool, boutique, arcade, playground, 9D, cinema" %>
<%@ OutputCache Duration="2592000" VaryByParam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <h2 class="fancy-header"><%: Title %></h2>
    <div class="container-fluid <%--page-banner--%>">
        <asp:Image ID="Image2" runat="server" Width="100%" CssClass="img-responsive" />
    </div>
    <br />
    <div class="container">
        <div class="row wow glideRight">
            <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>
        </div><br />
        <div class="row">

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
