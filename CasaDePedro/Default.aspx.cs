using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Sliders
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var mySliders = from s in myEntities.homepagesliders
                                select s;

                Repeater1.DataSource = mySliders.ToList();
                Repeater1.DataBind();
            }

            //Text Content
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 1
                             select t.PageText).SingleOrDefault();
                lblText.Text = myTxt.ToString().Replace(Environment.NewLine, "<br />");

            }

            //Photo Icons
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myIcons = from ic in myEntities.pagecontents
                              where ic.Id > 1
                              select ic;

                Repeater2.DataSource = myIcons.ToList();
                Repeater2.DataBind();
            }
        }
    }
}