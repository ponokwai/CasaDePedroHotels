using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Booking
{
    public partial class RnBBookingDetail : System.Web.UI.Page
    {
        int _id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
            {
                int _id = Convert.ToInt32(Request.QueryString.Get("Id"));
                if (!Page.IsPostBack && _id > -1)
                {
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        restaurantbarreservation resDetail;
                        resDetail = (from r in myEntities.restaurantbarreservations
                                     where r.Id == _id
                                     select r).Single();
                        if (resDetail != null)
                        {
                            tbxFullName.Text = resDetail.FullName;
                            tbxStartDT.Text = Convert.ToString(resDetail.StartDateTime);
                            tbxEndDT.Text = Convert.ToString(resDetail.EndDateTime);
                            tbxPeopleNum.Text = Convert.ToString(resDetail.NoOfPerson);

                            ddlHotel.DataBind();
                            ListItem myHotel = ddlHotel.Items.FindByValue(resDetail.HotelId.ToString());
                            if (myHotel != null)
                            {
                                myHotel.Selected = true;
                            }

                            ddlResBar.DataBind();
                            ListItem myResBar = ddlResBar.Items.FindByValue(resDetail.RestaurantBarVenueId.ToString());
                            if (myResBar != null)
                            {
                                myResBar.Selected = true;
                            }

                            tbxPhone.Text = resDetail.Phone;
                            tbxEmail.Text = resDetail.Email;
                            tbxComment.Text = resDetail.Comment;
                            cbxConfirmBooking.Checked = Convert.ToBoolean(resDetail.BookingConfirmed);
                            ltlConfirmedBy.Text = resDetail.ConfirmedBy;

                            //make checkbox read only is booking has been confirmed
                            if (cbxConfirmBooking.Checked == true)
                            {
                                cbxConfirmBooking.Enabled = false;
                            }
                        }
                    }
                }
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Int16 myPeople = Convert.ToInt16(tbxPeopleNum.Text);
            if (myPeople < 1)
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ddlResBar.SelectedItem.Text == "-- Select Restaurant/Bar --")
            {
                args.IsValid = false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
                    {
                        _id = Convert.ToInt32(Request.QueryString.Get("Id"));
                        if (_id > -1)
                        {
                            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                            {
                                restaurantbarreservation RBres;
                                RBres = (from r in myEntities.restaurantbarreservations
                                         where r.Id == _id
                                         select r).Single();
                                if (RBres != null)
                                {
                                    RBres.FullName = tbxFullName.Text;
                                    RBres.StartDateTime = Convert.ToDateTime(tbxStartDT.Text);
                                    if (!string.IsNullOrEmpty(tbxEndDT.Text))
                                    {
                                        RBres.EndDateTime = Convert.ToDateTime(tbxEndDT.Text);
                                    }
                                    RBres.NoOfPerson = Convert.ToInt16(tbxPeopleNum.Text);
                                    RBres.HotelId = Convert.ToSByte(ddlHotel.SelectedValue);
                                    RBres.RestaurantBarVenueId = Convert.ToSByte(ddlResBar.Text);
                                    RBres.Phone = tbxPhone.Text;
                                    RBres.Email = tbxEmail.Text;
                                    RBres.Comment = tbxComment.Text;

                                    //save
                                    myEntities.SaveChanges();
                                    Response.Redirect("~/Booking/RestaurantsAndBars.aspx");
                                }
                            }
                        }
                    }
                }
            }
            catch
            {
                lblFeedback.Text = "An error has occured. Ensure parameters entered in the form are in the correct format";
            }
        }

        protected void cbxConfirmBooking_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxConfirmBooking.Checked)
            {
                if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
                {
                    int _id = Convert.ToInt32(Request.QueryString.Get("Id"));
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        restaurantbarreservation getData;
                        getData = (from g in myEntities.restaurantbarreservations
                                   where g.Id == _id
                                   select g).Single();
                        if (getData != null)
                        {
                            getData.ConfirmedBy = User.Identity.Name;
                            getData.BookingConfirmed = true;
                            myEntities.SaveChanges();
                        }
                    }
                }
            }
        }

    }
}