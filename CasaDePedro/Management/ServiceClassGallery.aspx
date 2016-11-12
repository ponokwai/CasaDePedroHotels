<%@ Page Title="Manage Service Class Pictures" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="ServiceClassGallery.aspx.cs" Inherits="CasaDePedro.Management.ServiceClassGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="container body-content">
        <div class="row">
            <h2><%: Title %></h2><br />

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id, PicUrl" DataSourceID="EntityDataSource1" GroupItemCount="3" InsertItemPosition="LastItem" ItemType="CasaDePedro.facilitypicgallery" OnItemInserting="ListView1_ItemInserting">
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">
                        Upload Picture:<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Recommended Size" data-content="440px * 248px"><span class="glyphicon glyphicon-question-sign"></span></a>
                        <asp:FileUpload ID="FileUploadInsertItem" runat="server" CssClass="form-control" />
                        <asp:CustomValidator ID="CustValImg" runat="server" ErrorMessage="Upload .jpg or .png picture" CssClass="FormError" ControlToValidate="FileUploadInsertItem"></asp:CustomValidator>
                        <br />Description:
                        <asp:TextBox ID="DescriptionTextBox" CssClass="form-control" runat="server" Text='<%# BindItem.Description %>' />
                        <br />
                        <div class="btn-group">
                            <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-success" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Clear" />
                        </div>
                        </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <br />
                        <asp:Image ID="imgPic" ImageUrl='<%# Item.PicUrl %>' CssClass="img-thumbnail img-responsive" runat="server" />                       
                        <br />Description:
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Item.Description %>' />
                        <br />Last Modified:
                        <asp:Label ID="EditedByLabel" runat="server" Text='<%# Item.EditedBy %>' />                        
                        <br />
                        <asp:Button ID="DeleteButton" CssClass="btn btn-danger" runat="server" CommandName="Delete" Text="Delete" />                      
                        <br /></td>
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=dbo_casadepedroEntities" DefaultContainerName="dbo_casadepedroEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="facilitypicgalleries" OnDeleted="EntityDataSource1_Deleted" OnInserting="EntityDataSource1_Inserting" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="FacilityUnitId" QueryStringField="ServId" Type="SByte" />
                </WhereParameters>
            </asp:EntityDataSource>

        </div>
    </div>
</asp:Content>
