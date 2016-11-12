using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;
using System.Web;
using System.Web.UI;

namespace CasaDePedro.App_Code
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));

            BundleTable.EnableOptimizations = true;
        }

        
    }
}