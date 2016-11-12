using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro
{
    public partial class RecreationalVenues : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            //Top Content
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 5
                             select t).SingleOrDefault();

                lblText.Text = myTxt.PageText.ToString().Replace(Environment.NewLine, "<br />");
                Image2.ImageUrl = myTxt.PageBannerUrl;

            }

            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myResBar = from r in myEntities.facilityunits
                               where r.HotelCoreServiceId == 6
                               select r;
                Repeater1.DataSource = myResBar.ToList();
                Repeater1.DataBind();
            }
        }
    }
}