using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace CasaDePedro.App_Code
{
    public static class AppConfiguration
    {
        public static string FromAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("FromAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting FromAddress not found in web.config file.");
            }
        }

        public static string FromName
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("FromName");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting FromName not found in web.config file.");
            }
        }

        public static string ToBookingAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToBookingAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToBookingAddress not found in web.config file.");
            }
        }

        public static string ToInfoAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToInfoAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToInfoAddress not found in web.config file.");
            }
        }

        public static string ToSupportAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToSupportAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToSupportAddress not found in web.config file.");
            }
        }
        public static string ToName
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToName");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToName not found in web.config file.");
            }
        }
        public static bool SendMailOnError
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("SendMailOnError");
                if (!string.IsNullOrEmpty(result))
                {
                    return Convert.ToBoolean(result);
                }
                throw new Exception("AppSetting SendMailOnError not found in web.config file.");
            }
        }
    }
}