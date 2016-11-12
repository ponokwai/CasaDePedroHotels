using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro
{
    public partial class ServiceView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            sbyte servId = Convert.ToSByte(Request.QueryString.Get("ServId"));
            //Owl carousel
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var OwlPics = from o in myEntities.facilitypicgalleries
                              where o.FacilityUnitId == servId
                              select o;

                Repeater1.DataSource = OwlPics.ToList();
                Repeater1.DataBind();
            }
            //Textual Details
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var txtInfo = (from d in myEntities.facilityunits
                               where d.Id == servId
                               select d).SingleOrDefault();
                if (txtInfo != null)
                {
                    ltlTitle.Text = txtInfo.Name;
                    lblDetails.Text = txtInfo.Details.ToString().Replace(Environment.NewLine, "<br />");
                }
            }
        }
    }
}