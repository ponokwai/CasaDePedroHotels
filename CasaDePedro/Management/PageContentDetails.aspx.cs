using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Management
{
    public partial class PageContentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            pagecontent myContent = (pagecontent)e.Entity;

            //Homepage Icon
            FileUpload myIconFileUpload = (FileUpload)FormView1.FindControl("FileUploadHomeIcon");
            if (myIconFileUpload.HasFile)
            {
                //delete existing photofile
                string fileName = Server.MapPath(myContent.DefaultPageIconUrl);
                System.IO.File.Delete(fileName);

                //upload new file
                string virtualFolder = "~/Images/Banners/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string newFileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(myIconFileUpload.FileName);

                myIconFileUpload.SaveAs(System.IO.Path.Combine(physicalFolder, newFileName + extension));
                myContent.DefaultPageIconUrl = virtualFolder + newFileName + extension;
            }


            //Page Banner
            FileUpload myBannerFileUpload = (FileUpload)FormView1.FindControl("FileUploadPageBanner");
            if (myBannerFileUpload.HasFile)
            {
                //delete existing photo file
                string fileName = Server.MapPath(myContent.PageBannerUrl);
                System.IO.File.Delete(fileName);

                //upload new file
                string virtualFolder = "~/Images/Banners/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string newFileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(myBannerFileUpload.FileName);

                myBannerFileUpload.SaveAs(System.IO.Path.Combine(physicalFolder, newFileName + extension));
                myContent.PageBannerUrl = virtualFolder + newFileName + extension;
            }

            //Update EditedBy and DateTimeEdited fields
            myContent.EditedBy = User.Identity.Name;
            myContent.DateTimeEdited = DateTime.Now;
        }
    }
}