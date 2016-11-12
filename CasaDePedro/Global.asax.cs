using CasaDePedro.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace CasaDePedro
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-2.2.1.min.js"
            }
        );

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            if (AppConfiguration.SendMailOnError)
            {
                if (HttpContext.Current.Server.GetLastError() != null)
                {
                    Exception myException = HttpContext.Current.Server.GetLastError().GetBaseException();
                    string mailSubject = "Error in page " + Request.Url.ToString();
                    string message = string.Empty;
                    message += "<strong>Message</strong><br />" + myException.Message + "<br />";
                    message += "<strong>Stack Trace</strong><br />" + myException.StackTrace + "<br />";
                    message += "<strong>Target Site</strong><br />" + myException.TargetSite + "<br />";
                    message += "<strong>Query String</strong><br />" + Request.QueryString.ToString() + "<br />";

                    MailMessage myMessage = new MailMessage(AppConfiguration.FromAddress, AppConfiguration.ToSupportAddress, mailSubject, message);
                    myMessage.IsBodyHtml = true;
                    SmtpClient mySmtpClient = new SmtpClient();
                    mySmtpClient.Send(myMessage);
                }
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}