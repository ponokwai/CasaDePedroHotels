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
    public partial class RestaurantAndBars : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Top Content
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 3
                             select t).SingleOrDefault();

                lblText.Text = myTxt.PageText.ToString().Replace(Environment.NewLine, "<br />");
                Image2.ImageUrl = myTxt.PageBannerUrl;

            }

            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myResBar = from r in myEntities.facilityunits
                               where r.HotelCoreServiceId == 2
                               select r;
                Repeater1.DataSource = myResBar.ToList();
                Repeater1.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        restaurantbarreservation myRes = new restaurantbarreservation();
                        myRes.FullName = tbxFullName.Text;
                        myRes.StartDateTime = Convert.ToDateTime(tbxStartDT.Text);
                        if (!string.IsNullOrEmpty(tbxEndDT.Text))
                        {
                            myRes.EndDateTime = Convert.ToDateTime(tbxEndDT.Text);
                        }
                        myRes.NoOfPerson = Convert.ToInt16(tbxPeopleNum.Text);
                        myRes.HotelId = Convert.ToSByte(ddlHotel.SelectedValue);
                        myRes.RestaurantBarVenueId = Convert.ToSByte(ddlResBar.SelectedValue);
                        myRes.Phone = tbxPhone.Text;
                        myRes.Email = tbxEmail.Text;
                        myRes.Comment = tbxComment.Text;

                        //save
                        myEntities.restaurantbarreservations.Add(myRes);
                        myEntities.SaveChanges();

                        //Send reservation email
                        string fileName = Server.MapPath("~/App_Data/RestaurantBarReservation.txt");
                        string mailBody = File.ReadAllText(fileName);

                        mailBody = mailBody.Replace("##StartDate##", tbxStartDT.Text);
                        mailBody = mailBody.Replace("##EndDate##", tbxEndDT.Text);
                        mailBody = mailBody.Replace("##People##", tbxPeopleNum.Text);
              
                        mailBody = mailBody.Replace("##Hotel##", ddlHotel.SelectedItem.Text);
                        mailBody = mailBody.Replace("##Venue##", ddlResBar.SelectedItem.Text);
                        mailBody = mailBody.Replace("##FullName##", tbxFullName.Text);
                        mailBody = mailBody.Replace("##Phone##", tbxPhone.Text);
                        mailBody = mailBody.Replace("##Email##", tbxEmail.Text);
                        mailBody = mailBody.Replace("##Comment##", tbxComment.Text);

                        MailMessage myMailMessage = new MailMessage();
                        myMailMessage.Body = mailBody;
                        myMailMessage.Subject = "New Restaurant/Bar Reservation";
                        myMailMessage.From = new MailAddress(AppConfiguration.FromAddress, AppConfiguration.FromName);
                        myMailMessage.To.Add(new MailAddress(AppConfiguration.ToBookingAddress, AppConfiguration.ToName));
                        if (!string.IsNullOrEmpty(tbxEmail.Text))
                        {
                            myMailMessage.ReplyToList.Add(new MailAddress(tbxEmail.Text));
                        }

                        SmtpClient mySmtpClient = new SmtpClient();
                        mySmtpClient.Send(myMailMessage);


                        //Send user feedback
                        pnlResBar.Visible = false;
                        lblFeedback.Visible = true;
                        lblFeedback.CssClass = "text-success";
                        lblFeedback.Text = "Thank you for the reservation. We will contact you for confirmation.";
                    }
                }
            }
            catch
            {
                lblFeedback.Visible = true;
                lblFeedback.Text = "An error has occurred. Please try again or call to make a your reservation.";
                lblFeedback.CssClass = "text-danger";
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
    }
}