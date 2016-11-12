using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Management
{
    public partial class AddOrEditFacilityUnit : System.Web.UI.Page
    {
        int _id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page title display
            if (!string.IsNullOrEmpty(Request.QueryString.Get("ServId")))
            {
                ltlEditServ.Visible = true;
            }
            else
            {
                ltlNewServ.Visible = true;
            }
            //assign value to query string
            if (!string.IsNullOrEmpty(Request.QueryString.Get("ServId")))
            {
                _id = Convert.ToInt32(Request.QueryString.Get("ServId"));
            }
            if (!Page.IsPostBack && _id > -1)
            {
                //Load client controls from database
                using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                {
                    var dboItem = (from t in myEntities.facilityunits
                                   where t.Id == _id
                                   select t).SingleOrDefault();
                    if (dboItem != null)
                    {
                        tbxFacilityName.Text = dboItem.Name;

                        ddlCoreServices.DataBind();
                        ListItem myDdlCoreServices = ddlCoreServices.Items.FindByValue(dboItem.HotelCoreServiceId.ToString());
                        if (myDdlCoreServices != null)
                        {
                            myDdlCoreServices.Selected = true;
                        }

                        imgFrontPic.ImageUrl = dboItem.FrontPicUrl;

                        tbxDetails.Text = dboItem.Details;
                    }
                }
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                {
                    facilityunit myServClass;

                    if (_id == -1)  //create new object (instantiate)
                    {
                        myServClass = new facilityunit();
                        myServClass.EditBy = User.Identity.Name;
                        myEntities.facilityunits.Add(myServClass);
                    }
                    else
                    {
                        myServClass = (from u in myEntities.facilityunits
                                       where u.Id == _id
                                       select u).Single();
                        if (myServClass != null)
                        {
                            myServClass.EditBy = User.Identity.Name;
                        }
                    }
                    //Save to database
                    myServClass.Name = tbxFacilityName.Text;
                    myServClass.HotelCoreServiceId = Convert.ToSByte(ddlCoreServices.SelectedValue);
                    myServClass.HotelCoreSubServiceId = Convert.ToSByte(ddlSubCoreService.SelectedValue);
                    myServClass.Details = tbxDetails.Text;
                    //Delete existing front picture and upload new
                    if (fudFrontPic.HasFile != false)
                    {
                        if (imgFrontPic.ImageUrl != "")//delete existing cover pic file 
                        {
                            string delImgCoverPic = Server.MapPath(myServClass.FrontPicUrl);//getting physical location
                            System.IO.File.Delete(delImgCoverPic);
                        }
                        //Save new picture
                        string virtualFolder = "~/Images/Content/";
                        string physicalFolder = Server.MapPath(virtualFolder);
                        string fileName = Guid.NewGuid().ToString();
                        string extension = System.IO.Path.GetExtension(fudFrontPic.FileName);

                        fudFrontPic.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));//save to physical location
                        myServClass.FrontPicUrl = virtualFolder + fileName + extension; //save virtual location
                    }

                    myEntities.SaveChanges();
                    Response.Redirect(string.Format("~/Management/ServiceClassGallery.aspx?ServId={0}", myServClass.Id.ToString()));

                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString.Get("ServId")))
                {
                    sbyte _id = Convert.ToSByte(Request.QueryString.Get("ServId"));

                    //Remove facility pic gallery data (dependent)
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        //facilitypicgallery delServ;
                        var delServ = from s in myEntities.facilitypicgalleries.Include("facilityunit")
                                      where s.FacilityUnitId == _id
                                      select s;

                        if (delServ != null)
                        {
                            foreach (var itm in delServ)
                            {
                                //Delete pic gallery files
                                string fileName = Server.MapPath(itm.PicUrl);
                                File.Delete(fileName);

                                //delete dbo entry
                                myEntities.facilitypicgalleries.Remove(itm);
                            }
                            //save changes
                            myEntities.SaveChanges();
                        }
                    }

                    //Remove facility unit data
                    using (dbo_casadepedroEntities myContext = new dbo_casadepedroEntities())
                    {
                        var fUnit = (from f in myContext.facilityunits
                                     where f.Id == _id
                                     select f).SingleOrDefault();
                        if (fUnit != null)
                        {
                            //Delete pic file
                            string fUnitImg = Server.MapPath(fUnit.FrontPicUrl);
                            File.Delete(fUnitImg);

                            //update dbo
                            myContext.facilityunits.Remove(fUnit);
                            myContext.SaveChanges();

                            //redirect to services page
                            Response.Redirect("~/Management/AllServices.aspx");
                        }
                    }
                }
            }
            catch
            {
                lblFeedback.Text = "An error has occured. Refresh the page and try again or contact the developer (Rickwai Solutions) if error persists.";
            }
        }

    }
}