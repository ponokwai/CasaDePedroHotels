<%@ Page Title="Home" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CasaDePedro.Default" MetaDescription="Casa De Pedro Main and Annex hotels are situated at KM 1 Refinery Road, Effurun/Warri in Delta State, Nigeria. Both hotels are walking distance from the city most iconic attractions like the Delta Mall, Casa FUNfactory, and the Warri Refinery. We have 126 accommodations of various categories that are suitable for tourists and business guests. Facilities at our hotels include free WIFI, swimming pool, jacuzzi, restaurants, bars, spa, saloons, gym, and cinema. Our staffs are well trained and will always offer you good service with a smile."
    MetaKeywords="hotel, accommodation, guesthouse, effurun, warri, delta, state, nigeria, bush, bar, swimming, pool, saloon, jacuzzi, cinema, sports, bar," %>
<%@ OutputCache Duration="10800" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="container-fluid <%--default-body-content--%>">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <asp:Repeater ID="Repeater1" runat="server" ItemType="CasaDePedro.homepageslider">
                    <ItemTemplate>
                        <div class="item">
                            <asp:Image ID="Image1" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-responsive" Width="100%" runat="server" />
                            <div class="carousel-caption">
                                <h4>
                                    <asp:Literal ID="Literal1" Text='<%# Item.CaptionHeading %>' runat="server"></asp:Literal></h4>
                                <p>
                                    <asp:Literal ID="Literal2" Text='<%# Item.CaptionDesc %>' runat="server"></asp:Literal></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div><br /><br />
    <%--<hr />--%>
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-push-8 wow glideRight" style="border-left:2px solid red;">
                <a runat="server" class="btn btn-danger btn-lg" href="~/SuitesAndRooms.aspx">Reserve a Suite/Room <span class="glyphicon glyphicon-triangle-right"></span></a>
                <address>
                    Casa De Pedro Hotels <br />
                    KM 1 Refinery Road <br />
                    Effurn/Warri <br />
                    Delta State <br />
                    Nigeria <br />
                    <span class="glyphicon glyphicon-earphone"></span>: +234(0)8032496798; +234(0)8032496801 <br />
                    <span class="glyphicon glyphicon-envelope"></span>: <a href="mailto:info@casadepedrohotels.com.ng">info@casadepedrohotels.com.ng</a> 
                </address>
                
            </div>
            <div class="col-sm-8 col-sm-pull-4">
                <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>
            </div>
            
        </div>
        <hr />
        <div class="row">
            <asp:Repeater ID="Repeater2" runat="server" ItemType="CasaDePedro.pagecontent">
                <ItemTemplate>
                    <div class="col-sm-6 wow animated glideLeft">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Item.PageUrl %>'>
                            <asp:Image ID="Image1" runat="server" CssClass="img-responsive img-centralise img-rounded" ImageUrl='<%# Item.DefaultPageIconUrl %>' AlternateText="Meetings and Events" />
                            <h6 class="serv-name-format">
                                <asp:Literal ID="Literal" runat="server" Text='<%# Item.PageTitle %>'></asp:Literal></h6>
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
