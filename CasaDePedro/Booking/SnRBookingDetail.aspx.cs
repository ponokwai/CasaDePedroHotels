using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro.FrontDesk
{
    public partial class SnRBookingDetail : System.Web.UI.Page
    {
        //int _id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load controls
            if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
            {
                int _id = Convert.ToInt32(Request.QueryString.Get("Id"));

                if (!Page.IsPostBack && _id > -1)
                {
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        var booking = (from b in myEntities.roomreservations
                                       where b.id == _id
                                       select b).Single();
                        if (booking != null)
                        {
                            tbxFullName.Text = booking.FullName;
                            tbxFromDate.Text = booking.StartDate.ToString();
                            tbxToDate.Text = booking.EndDate.ToString();
                            tbxAdults.Text = booking.NoOfAdult.ToString();
                            tbxChildren.Text = booking.NoOfChild.ToString();

                            ddlHotel.DataBind();
                            ListItem myDdlHotel = ddlHotel.Items.FindByValue(booking.HotelId.ToString());
                            if (myDdlHotel != null)
                            {
                                myDdlHotel.Selected = true;
                            }

                            ddlRoom.DataBind();
                            ListItem myDdlRooms = ddlRoom.Items.FindByValue(booking.RoomTypeId.ToString());
                            if (myDdlRooms != null)
                            {
                                myDdlRooms.Selected = true;
                            }

                            tbxPhone.Text = booking.Phone;
                            tbxEmail.Text = booking.Email;
                            tbxComment.Text = booking.Comment;
                            cbxConfirmBooking.Checked = Convert.ToBoolean(booking.BookingConfirmed);
                            if (cbxConfirmBooking.Checked == true)
                            {
                                cbxConfirmBooking.Enabled = false;
                            }
                            lblConfirmedBy.Text = booking.ConfirmedBy;


                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    //Update data
                    if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
                    {
                        int _id = Convert.ToInt32(Request.QueryString.Get("Id"));
                        if (_id > -1)
                        {
                            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                            {
                                roomreservation bkUpdate;
                                bkUpdate = (from b in myEntities.roomreservations
                                            where b.id == _id
                                            select b).Single();
                                if (bkUpdate != null)
                                {
                                    bkUpdate.FullName = tbxFullName.Text;
                                    bkUpdate.StartDate = Convert.ToDateTime(tbxFromDate.Text).Date;
                                    bkUpdate.EndDate = Convert.ToDateTime(tbxToDate.Text).Date;
                                    bkUpdate.NoOfAdult = Convert.ToSByte(tbxAdults.Text);
                                    bkUpdate.NoOfChild = Convert.ToSByte(tbxChildren.Text);
                                    bkUpdate.HotelId = Convert.ToSByte(ddlHotel.SelectedValue);
                                    bkUpdate.RoomTypeId = Convert.ToSByte(ddlRoom.SelectedValue);
                                    bkUpdate.Phone = tbxPhone.Text;
                                    bkUpdate.Email = tbxEmail.Text;
                                    bkUpdate.Comment = tbxComment.Text;

                                    myEntities.SaveChanges();
                                    Response.Redirect("~/Booking/SuitesAndRooms.aspx");
                                }
                            }
                        }
                    }
                }
            }
            catch
            {
                lblFeedback.Text = "An error has occured. Ensure all data entered in the form are in the correct format";
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
                        roomreservation getData;
                        getData = (from g in myEntities.roomreservations
                                   where g.id == _id
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