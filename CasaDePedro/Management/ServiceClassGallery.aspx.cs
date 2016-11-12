using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Management
{
    public partial class ServiceClassGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (string.IsNullOrEmpty(Request.QueryString.Get("ServId")))
            //{
            //    Response.Redirect("~/Management/");
            //}
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");
            if (!FileUploadInsertItem.HasFile) //|| !FileUploadInsertItem.FileName.ToLower().EndsWith(".jpg") || !FileUploadInsertItem.FileName.ToLower().EndsWith(".png")
            {
                CustomValidator CustValImg = (CustomValidator)ListView1.InsertItem.FindControl("CustValImg");
                CustValImg.IsValid = false;
                e.Cancel = true;
            }
        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            
            //Adding ServId property value to database
            sbyte servId = Convert.ToSByte(Request.QueryString.Get("ServId"));
            facilitypicgallery myPicture = (facilitypicgallery)e.Entity;
            myPicture.FacilityUnitId = servId;
            //Insert user name
            myPicture.EditedBy = User.Identity.Name;
            //image upload via fileupload control (insert item)
            FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");
            string virtualFolder = "~/Images/Content/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(FileUploadInsertItem.FileName);

            FileUploadInsertItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
            myPicture.PicUrl = virtualFolder + fileName + extension;
        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            facilitypicgallery myPicture = e.Entity as facilitypicgallery;
            string fileName = Server.MapPath(myPicture.PicUrl);
            System.IO.File.Delete(fileName);//add PicUrl to the ListView DataKeyNames i.e DataKeyNames="Id, ImageUrl" - this adds the deleted event to View State
        }
    }
}