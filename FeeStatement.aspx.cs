using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class FeeStatement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["studentCode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        protected void _ReadFeeStatement()
        {
            int studentAdmissionNo = Convert.ToInt32(Session["uniqadmNo"]);
            var studentcode = (String)Session["studentCode"];
            var strtDt = txtStartDate.Value;
            var endDt = txtEnddate.Value;

            try
            {
                if (String.IsNullOrWhiteSpace(strtDt) || String.IsNullOrWhiteSpace(strtDt))
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>Enter date! </div>";
                }

                DateTime startdate;
                if (!DateTime.TryParse(strtDt, out startdate))
                {
                    // this.WriteToFile("date provided is not of a valid format!");
                    return;
                }

                DateTime enddate;
                if (!DateTime.TryParse(endDt, out enddate))
                {
                    // this.WriteToFile("date provided is not of a valid format!");
                }
                if (enddate < startdate)
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>Enddate cannot be less than start date </div>";
                }
                else
                {
                    String status = WsConfig.ObjNav.GetCustomerStatement(studentcode, startdate, enddate);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                      statementView.Attributes.Add("src", ResolveUrl("~/Statements/" + studentAdmissionNo + ".pdf"));
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                    }
                }
                }
            catch (Exception)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>We encountered an error while generating your statement. Please try again later</div>";
            }
          }

        protected void btnBlobGen_OnClick(object sender, EventArgs e)
        {
            _ReadFeeStatement();
        }
    }
}