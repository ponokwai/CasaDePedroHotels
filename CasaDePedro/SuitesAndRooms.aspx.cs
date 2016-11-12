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
    public partial class Suites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Top Content
            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myTxt = (from t in myEntities.pagecontents
                             where t.Id == 2
                             select t).SingleOrDefault();

                lblText.Text = myTxt.PageText.ToString().Replace(Environment.NewLine, "<br />");
                Image2.ImageUrl = myTxt.PageBannerUrl;

            }

            using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
            {
                var myResBar = from r in myEntities.facilityunits
                               where r.HotelCoreServiceId == 1
                               select r;
                Repeater1.DataSource = myResBar.ToList();
                Repeater1.DataBind();
            }
        }

        protected void btnSendReserveRequest_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                    {
                        roomreservation myReservation = new roomreservation();
                        myReservation.StartDate = Convert.ToDateTime(tbxFromDate.Text).Date;
                        myReservation.EndDate = Convert.ToDateTime(tbxToDate.Text).Date;
                        myReservation.NoOfAdult = Convert.ToSByte(ddlAdults.SelectedValue);
                        myReservation.NoOfChild = Convert.ToSByte(ddlChildren.SelectedValue);
                        myReservation.HotelId = Convert.ToSByte(ddlHotel.SelectedValue);
                        myReservation.RoomTypeId = Convert.ToSByte(ddlRoom.SelectedValue);
                        myReservation.FullName = tbxFullName.Text;
                        myReservation.Phone = tbxPhone.Text;
                        myReservation.Email = tbxEmail.Text;
                        myReservation.Comment = tbxComment.Text;

                        //Save to database
                        myEntities.roomreservations.Add(myReservation);
                        myEntities.SaveChanges();

                        //Send reservation email
                        string fileName = Server.MapPath("~/App_Data/SuiteRoomReservation.txt");
                        string mailBody = File.ReadAllText(fileName);

                        mailBody = mailBody.Replace("##StartDate##", tbxFromDate.Text);
                        mailBody = mailBody.Replace("##EndDate##", tbxToDate.Text);
                        mailBody = mailBody.Replace("##Adults##", ddlAdults.SelectedItem.Text);
                        mailBody = mailBody.Replace("##Children##", ddlChildren.SelectedItem.Text);
                        mailBody = mailBody.Replace("##Hotel##", ddlHotel.SelectedItem.Text);
                        mailBody = mailBody.Replace("##Suite/Room##", ddlRoom.SelectedItem.Text);
                        mailBody = mailBody.Replace("##FullName##", tbxFullName.Text);
                        mailBody = mailBody.Replace("##Phone##", tbxPhone.Text);
                        mailBody = mailBody.Replace("##Email##", tbxEmail.Text);
                        mailBody = mailBody.Replace("##Comment##", tbxComment.Text);

                        MailMessage myMailMessage = new MailMessage();
                        myMailMessage.Body = mailBody;
                        myMailMessage.Subject = "New Suite/Room Reservation";
                        myMailMessage.From = new MailAddress(AppConfiguration.FromAddress, AppConfiguration.FromName);
                        myMailMessage.To.Add(new MailAddress(AppConfiguration.ToBookingAddress, AppConfiguration.ToName));
                        if (!string.IsNullOrEmpty(tbxEmail.Text))
                        {
                            myMailMessage.ReplyToList.Add(new MailAddress(tbxEmail.Text));
                        }

                        SmtpClient mySmtpClient = new SmtpClient();
                        mySmtpClient.Send(myMailMessage);

                        //Remove form and give feedback
                        pnlReserveRoom.Visible = false;
                        lblReserveConf.CssClass = "text-success";
                        lblReserveConf.Text = "Thank you for the reservation. We will contact you for confirmation.";
                    }
                }
                catch
                {
                    lblReserveConf.CssClass = "text-danger";
                    lblReserveConf.Text = "An error has occurred. Please try again or call to make reservation";
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime fromDate = Convert.ToDateTime(tbxFromDate.Text).Date;
            DateTime toDate = Convert.ToDateTime(tbxToDate.Text).Date;
            if (toDate <= fromDate)
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime fromDate = Convert.ToDateTime(tbxFromDate.Text).Date;
            if (DateTime.Now.Date > fromDate)
            {
                args.IsValid = false;
            }
        }

        protected void ddlRoom_TextChanged(object sender, EventArgs e)
        {
            if (ddlRoom.SelectedItem.Text != "-- Select Suite/Room --")
            {
                using (dbo_casadepedroEntities myEntities = new dbo_casadepedroEntities())
                {
                    sbyte _id = Convert.ToSByte(ddlRoom.SelectedValue);
                    
                     var myPrice = (from p in myEntities.roomtypes
                               where p.Id == _id
                               select p.AmountPerNight).Single();
                     if (myPrice != null)
                     {
                         lblPrice.Text = "=N=" + myPrice.ToString() + " Per Night (25% discount at weekends)";
                     }
                }
            }
            
        }
    }
}