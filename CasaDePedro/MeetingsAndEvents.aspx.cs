using CasaDePedro.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CasaDePedro
{
    public partial class MeetingsAndEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Top Content
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 4
                             select t).SingleOrDefault();

                lblText.Text = myTxt.PageText.ToString().Replace(Environment.NewLine, "<br />");
                Image2.ImageUrl = myTxt.PageBannerUrl;

            }

            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myResBar = from r in myEntities.facilityunits
                               where r.HotelCoreServiceId == 3
                               select r;
                Repeater1.DataSource = myResBar.ToList();
                Repeater1.DataBind();
            }


        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        meetingeventreservation myHall = new meetingeventreservation();
                        
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
                        myEntities.meetingeventreservations.Add(myHall);
                        myEntities.SaveChanges();

                        //Send reservation email
                        string fileName = Server.MapPath("~/App_Data/MeetingEventsReservation.txt");
                        string mailBody = File.ReadAllText(fileName);

                        mailBody = mailBody.Replace("##StartDate##", tbxStartDT.Text);
                        mailBody = mailBody.Replace("##EndDate##", tbxEndDT.Text);
                        mailBody = mailBody.Replace("##People##", tbxPeopleNum.Text);

                        mailBody = mailBody.Replace("##Hotel##", ddlHotel.SelectedItem.Text);
                        mailBody = mailBody.Replace("##Venue##", ddlMEVenue.SelectedItem.Text);
                        mailBody = mailBody.Replace("##FullName##", tbxFullName.Text);
                        mailBody = mailBody.Replace("##Phone##", tbxPhone.Text);
                        mailBody = mailBody.Replace("##Email##", tbxEmail.Text);
                        mailBody = mailBody.Replace("##Comment##", tbxComment.Text);

                        MailMessage myMailMessage = new MailMessage();
                        myMailMessage.Body = mailBody;
                        myMailMessage.Subject = "New Meeting/Event Reservation";
                        myMailMessage.From = new MailAddress(AppConfiguration.FromAddress, AppConfiguration.FromName);
                        myMailMessage.To.Add(new MailAddress(AppConfiguration.ToBookingAddress, AppConfiguration.ToName));
                        if (!string.IsNullOrEmpty(tbxEmail.Text))
                        {
                            myMailMessage.ReplyToList.Add(new MailAddress(tbxEmail.Text));
                        }

                        SmtpClient mySmtpClient = new SmtpClient();
                        mySmtpClient.Send(myMailMessage);

                        //Remove form and provide feedback
                        pnlMeetingsEvents.Visible = false;
                        lblFeedback.Visible = true;
                        lblFeedback.CssClass = "text-success";
                        lblFeedback.Text = "Thank you for the reservation. We will contact you for confirmation.";


                    }
                }
                catch
                {
                    lblFeedback.Visible = true;
                    lblFeedback.Text = "An error has occurred. Please try again or call to make your reservation.";
                    lblFeedback.CssClass = "text-danger";
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
    }
}