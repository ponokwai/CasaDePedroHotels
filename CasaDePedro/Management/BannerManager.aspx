<%@ Page Title="Banner Manager" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="BannerManager.aspx.cs" Inherits="CasaDePedro.Management.BannerManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <h2><%: Title %></h2>
        <div class="row">
            <h3 class="text-center">Add or Delete Homepage Slider Picture</h3>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id, ImageUrl" DataSourceID="EntityDataSource1" GroupItemCount="1" InsertItemPosition="LastItem" ItemType="CasaDePedro.homepageslider" OnItemInserting="ListView1_ItemInserting">


                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">
                                <br />
                                Upload Image:
                                <asp:CustomValidator ID="CustValImg" runat="server" ErrorMessage="Upload .jpg or .png picture" CssClass="FormError" ControlToValidate="FileUploadInsertItem"></asp:CustomValidator><br />
                                <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="1200px * 450px"><span class="glyphicon glyphicon-question-sign"></span></a>
                                <asp:FileUpload ID="FileUploadInsertItem" CssClass="form-control" runat="server" />
                                <%--<asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />--%>
                                <br />
                                Caption Heading:
                        <asp:TextBox ID="CaptionHeadingTextBox" CssClass="form-control" runat="server" Text='<%# BindItem.CaptionHeading %>' />
                                <br />
                                Caption Description:
                        <asp:TextBox ID="CaptionDescTextBox" CssClass="form-control" runat="server" Text='<%# BindItem.CaptionDesc %>' />
                                <br />
                                <div class="btn-group">
                                    <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-default" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-success" CommandName="Cancel" Text="Clear" />
                                </div>
                                <br />
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="">
                                <br />
                                <asp:Image ID="Image1" ImageUrl='<%# Item.ImageUrl %>' CssClass="img-responsive" Height="200px" runat="server" />
                                <br />
                                <em>Caption Heading:</em><br />
                                <asp:Label ID="CaptionHeadingLabel" runat="server" Text='<%# Eval("CaptionHeading") %>' />
                                <br />
                                <em>Caption Description:</em><br />
                                <asp:Label ID="CaptionDescLabel" runat="server" Text='<%# Eval("CaptionDesc") %>' />
                                <br />
                                <em>Last Updated By:</em><br />
                                <asp:Label ID="LastUpdatedByLabel" runat="server" Text='<%# Eval("LastUpdatedBy") %>' />
                                <br />
                                <em>Date-Time of Last Update:</em><br />
                                <asp:Label ID="LastUpdateDateTimeLabel" runat="server" Text='<%# Eval("LastUpdateDateTime") %>' />
                                <br />
                                <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-danger" CommandName="Delete" Text="Delete" />
                                <br />
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <%--<asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>--%>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EntitySetName="homepagesliders" OnDeleted="EntityDataSource1_Deleted" OnInserting="EntityDataSource1_Inserting">
                    </asp:EntityDataSource>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="ListView1" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                <ProgressTemplate>
                    <div class="PleaseWait">Please Wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <hr />
        <div class="row">
            <h3 class="text-center">Edit Homepage Slider Caption Text</h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource2">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                                <%--<EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:TextBox>
                                </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <asp:Image ID="Image2" Height="200px" CssClass="img-responsive img-thumbnail" ImageUrl='<%# Bind("ImageUrl") %>' runat="server" />
                                    <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:Label>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CaptionHeading" HeaderText="Caption Heading" SortExpression="CaptionHeading" />
                            <asp:BoundField DataField="CaptionDesc" HeaderText="Caption Description" SortExpression="CaptionDesc" />
                            <asp:BoundField DataField="LastUpdatedBy" HeaderText="Last Updated By" SortExpression="LastUpdatedBy" ReadOnly="True" />
                            <asp:BoundField DataField="LastUpdateDateTime" HeaderText="Last Updated DateTime" SortExpression="LastUpdateDateTime" ReadOnly="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="homepagesliders" OnUpdating="EntityDataSource2_Updating">
                    </asp:EntityDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="PleaseWait">Please Wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>
