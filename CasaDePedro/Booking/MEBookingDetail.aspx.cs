using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.Booking
{
    public partial class MEBookingDetail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !string.IsNullOrEmpty(Request.QueryString.Get("Id")))
            {
                int _id = Convert.ToInt32(Request.QueryString.Get("Id"));

                using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                {
                    meetingeventreservation myResv;
                    myResv = (from m in myEntities.meetingeventreservations
                              where m.Id == _id
                              select m).Single();
                    if (myResv != null)
                    {
                        tbxFullName.Text = myResv.FullName;
                        tbxStartDT.Text = Convert.ToString(myResv.StartDateTime);
                        tbxEndDT.Text = Convert.ToString(myResv.EndDateTime);
                        tbxPeopleNum.Text = Convert.ToString(myResv.NoOfPerson);

                        ddlHotel.DataBind();
                        ListItem myHotel = ddlHotel.Items.FindByValue(myResv.HotelId.ToString());
                        if (myHotel != null)
                        {
                            myHotel.Selected = true;
                        }

                        ddlMEVenue.DataBind();
                        ListItem myVenue = ddlMEVenue.Items.FindByValue(myResv.MeetingEventVenueId.ToString());
                        if (myVenue != null)
                        {
                            myVenue.Selected = true;
                        }

                        tbxPhone.Text = myResv.Phone;
                        tbxEmail.Text = myResv.Email;
                        tbxComment.Text = myResv.Comment;
                        cbxConfirmBooking.Checked = Convert.ToBoolean(myResv.BookingConfirmed);
                        ltlConfirmedBy.Text = myResv.ConfirmedBy;

                        //disable checkbox if booking is already confirmed
                        if (cbxConfirmBooking.Checked == true)
                        {
                            cbxConfirmBooking.Enabled = false;
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
            if (ddlMEVenue.SelectedItem.Text == "-- Select Venue --")
            {
                args.IsValid = false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && !string.IsNullOrEmpty(Request.QueryString.Get("Id")))
            {
                try
                {
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        int _id = Convert.ToInt32(Request.QueryString.Get("Id"));

                        meetingeventreservation myHall;
                        myHall = (from h in myEntities.meetingeventreservations
                                  where h.Id == _id
                                  select h).Single();
                        if (myHall != null)
                        {
                            myHall.StartDateTime = Convert.ToDateTime(tbxStartDT.Text);
                            if (!string.IsNullOrEmpty(tbxEndDT.Text))
                            {
                                myHall.EndDateTime = Convert.ToDateTime(tbxEndDT.Text);
                            }
                            myHall.NoOfPerson = Convert.ToInt16(tbxPeopleNum.Text);
                            myHall.HotelId = Convert.ToSByte(ddlHotel.SelectedValue);
                            myHall.MeetingEventVenueId = Convert.ToSByte(ddlMEVenue.SelectedValue);
                            myHall.FullName = tbxFullName.Text;
                            myHall.Phone = tbxPhone.Text;
                            myHall.Email = tbxEmail.Text;
                            myHall.Comment = tbxComment.Text;

                            //Save to database
                            myEntities.SaveChanges();
                            Response.Redirect("~/Booking/MeetingsAndEvents.aspx");
                        }


                    }
                }
                catch
                {
                    lblFeedback.Visible = true;
                    lblFeedback.Text = "An error has occurred. Review your data entries to ensure you have entered the correct input format";
                    lblFeedback.CssClass = "text-danger";
                }
            }
        }

        protected void cbxConfirmBooking_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxConfirmBooking.Checked && !string.IsNullOrEmpty(Request.QueryString.Get("Id")))
            {
                int _id = Convert.ToInt32(Request.QueryString.Get("Id"));
                using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                {
                    meetingeventreservation getMEres;
                    getMEres = (from g in myEntities.meetingeventreservations
                               where g.Id == _id
                               select g).Single();
                    if (getMEres != null)
                    {
                        getMEres.ConfirmedBy = User.Identity.Name;
                        getMEres.BookingConfirmed = true;
                        myEntities.SaveChanges();
                    }
                }

            }
        }
    }
}