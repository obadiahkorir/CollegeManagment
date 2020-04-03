using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Payslip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TutorCode"] == null)
            {
                Response.Redirect("Defaults_Tutors.aspx");
            }
        }
        protected void _ReadPayslip()
        {
            
            var tutorCode = Session["TutorCode"].ToString();
            int payMonth = Convert.ToInt32(ddlPayperiods.SelectedValue);

            try
            {
                var status = WsConfig.ObjNav.GeneratePayslip(tutorCode, payMonth);
                    var info = status.Split('*');
                    if (info[0] == "success")
                    {
                        payslipView.Attributes.Add("src", ResolveUrl("~/Statements/" + tutorCode + ".pdf"));
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                    }
            }
            catch (Exception e)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>"+e.Message+"</div>";
                //feedback.InnerHtml = "<div class='alert alert-danger'>We encountered an error while generating your statement. Please try again later</div>";
            }
        }

        protected void btnBlobGen_OnClick(object sender, EventArgs e)
        {
            _ReadPayslip();
        }
    }
}