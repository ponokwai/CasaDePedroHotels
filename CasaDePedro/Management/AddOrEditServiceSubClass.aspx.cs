using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Management
{
    public partial class AddOrEditServiceSubClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                {
                    hotelcoresubservice myNewSub = new hotelcoresubservice();
                    myNewSub.CoreServiceId = Convert.ToSByte(ddlCoreService2.SelectedValue);
                    myNewSub.SubService = tbxSubService.Text;

                    //save to dbo
                    myEntities.hotelcoresubservices.Add(myNewSub);
                    myEntities.SaveChanges();

                    Response.Redirect("~/Management/AddOrEditServiceSubClass.aspx");
                }
            }
        }
    }
}