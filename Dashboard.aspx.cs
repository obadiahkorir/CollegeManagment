using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["studentCode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                _LoadProfile();
                GetStudentInfo();
            }
        }
        protected void GetStudentInfo()
        {
            var wsconnection = WsConfig.ObjNav;
            var odataconn = WsConfig.ReturnNavObj();

            var studentinfo = odataconn.StudentPortal.Where(n => n.No == Session["studentCode"].ToString()).ToList();

            foreach (var oneinfo in studentinfo)
            {
                feebalance.InnerHtml = "<h4>KES." + oneinfo.Balance_LCY + "</h4>";

            }
            int studentdetails = wsconnection.FnCountUnits(Session["studentCode"].ToString());
            unitsregistered.InnerHtml = "<h4>" + studentdetails + "</h4>";
        }

        protected void _LoadProfile()
        {
            var odataconn = WsConfig.ReturnNavObj();
            var profiles = odataconn.StudentPortal.Where(a => a.Adm_No == Convert.ToInt32(Session["uniqadmNo"].ToString())).ToArray();

            for (int i = 0; i < profiles.Count(); i++)
            {
              

            }
        }
    }
}