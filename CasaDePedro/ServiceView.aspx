<%@ Page Title="Service View" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="ServiceView.aspx.cs" Inherits="CasaDePedro.ServiceView" %>

<%@ OutputCache Duration="2592000" VaryByParam="*" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">

    <div class="container body-content">
        <div class="row">
            <h2>
                <asp:Literal ID="ltlTitle" runat="server"></asp:Literal></h2>
            <div class="col-md-5">
                <%-- Display pic carousel --%>
                <div id="owl-demo" class="owl-carousel owl-theme">
                    <asp:Repeater ID="Repeater1" runat="server" ItemType="CasaDePedro.facilitypicgallery">
                        <ItemTemplate>
                            <div class="item">
                                <asp:Image ID="imgowl" CssClass="img-responsive" ImageUrl='<%# Item.PicUrl %>' runat="server" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="col-md-7 wow glideRight">
                <asp:Label ID="lblDetails" runat="server"></asp:Label>

            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $("#owl-demo").owlCarousel({

                navigation: true, // Show next and prev buttons
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true

                // "singleItem:true" is a shortcut for:
                // items : 1, 
                // itemsDesktop : false,
                // itemsDesktopSmall : false,
                // itemsTablet: false,
                // itemsMobile : false

            });

        });
    </script>
</asp:Content>
