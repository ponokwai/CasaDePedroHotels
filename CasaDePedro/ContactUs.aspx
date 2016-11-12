<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/frontend.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CasaDePedro.ContactUs" %>

<%@ OutputCache Duration="2592000" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <h2 class="fancy-header"><%: Title %></h2>
    

    <div class="container-fluid">
        <script
            src="http://maps.googleapis.com/maps/api/js">
        </script>
        <div id="map" style="width: 100%; height: 350px;"></div>

        <script type="text/javascript">
            var locations = [
  
                ['Casa De Pedro Annex', 5.568487, 5.776129, 2],
                ['Casa De Pedro', 5.568957, 5.778360, 1],
            ];

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: new google.maps.LatLng(5.568957, 5.778360),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });


            var infowindow = new google.maps.InfoWindow();

            var marker, i;

            for (i = 0; i < locations.length; i++) {
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    map: map
                });

                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        infowindow.setContent(locations[i][0]);
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }
        </script>
    </div><br />
    <div class="container body-content">
        <div class="row">
            <div class="col-md-6">
                <br />
                <address>
                    Casa De Pedro Hotels
                    <br />
                    KM 1 Refinery Road
                    <br />
                    Effurn/Warri
                    <br />
                    Delta State
                    <br />
                    Nigeria
                    <br />
                    <span class="glyphicon glyphicon-earphone"></span>: +234(0)8032496798; +234(0)8032496801
                    <br />
                    <span class="glyphicon glyphicon-envelope"></span>: <a href="mailto:info@casadepedrohotels.com.ng">info@casadepedrohotels.com.ng</a>
                </address>
            </div>
            <div class="col-md-6 wow glideRight">
                <!-- Client Validation js -->
                <script type="text/javascript">
                    function validatePhoneAndEmail(source, args) {
                        var phoneNumber = document.getElementById('<%= txtYourNumber.ClientID %>');
                        var emailAddress = document.getElementById('<%= txtYourEmail.ClientID %>');
                        if (phoneNumber.value != '' || emailAddress.value != '') {
                            args.IsValid = true;
                        }
                        else {
                            args.IsValid = false;
                        }
                    }
                </script>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" HeaderText="Please correct the following errors:" />
                        <asp:Panel ID="ContactFormPanel" runat="server">
                            Name: 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYourName" CssClass="FormError" ErrorMessage="Enter your name" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtYourName" runat="server" CssClass="form-control"></asp:TextBox>
                            Phone Number:
                        <asp:TextBox ID="txtYourNumber" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            Email:
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtYourEmail" CssClass="FormError" ErrorMessage="Enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">*</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePhoneAndEmail" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your phone number or email address" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                            <asp:TextBox ID="txtYourEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            Comments:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYourComments" CssClass="FormError" ErrorMessage="Enter a comment" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtYourComments" runat="server" TextMode="MultiLine" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox><br />
                            <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn btn-default" OnClick="Button1_Click" />
                        </asp:Panel>
                        <asp:Label ID="iMessage" runat="server" Text="Message Sent" CssClass="success text-center" Visible="false"></asp:Label>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <div class="PleaseWait">
                            PleaseWait...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
    </div>
</asp:Content>
