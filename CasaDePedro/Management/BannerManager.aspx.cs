using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Management
{
    public partial class BannerManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            homepageslider mySlider = (homepageslider)e.Entity;
            mySlider.LastUpdatedBy = User.Identity.Name;
            mySlider.LastUpdateDateTime = DateTime.Now;

            //image upload via fileupload control (insert item)
            FileUpload FileUploadInsertItem = (FileUpload)ListView1.InsertItem.FindControl("FileUploadInsertItem");
            string virtualFolder = "~/Images/Sliders/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = Guid.NewGuid().ToString();
            string extension = System.IO.Path.GetExtension(FileUploadInsertItem.FileName);

            FileUploadInsertItem.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension)); //save image file
            mySlider.ImageUrl = virtualFolder + fileName + extension; 
        }

        protected void EntityDataSource1_Deleted(object sender, EntityDataSourceChangedEventArgs e)
        {
            //Delete Image file
            homepageslider mySlider = (homepageslider)e.Entity;
            string fileName = Server.MapPath(mySlider.ImageUrl);
            System.IO.File.Delete(fileName);
        }

        protected void EntityDataSource2_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Update last updated by and last updated datetime fields
            homepageslider updateSlider = (homepageslider)e.Entity;
            updateSlider.LastUpdatedBy = User.Identity.Name;
            updateSlider.LastUpdateDateTime = DateTime.Now;
        }

    }
}