using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Rates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["studentCode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!Page.IsPostBack)
            {
               // ViewState.Add("tutorRate", ddlRates.SelectedValue);
            }

        }

        protected void btnSubmitRate_OnClick(object sender, EventArgs e)
        {
            var wsconnect = WsConfig.ObjNav;
            var unitCode = Request.QueryString["unitCode"];
            var studentCode = Request.QueryString["studentCode"];
            var unitName = Request.QueryString["unitName"];
            var tutorName = Request.QueryString["tutorName"];
            int lecRate = Convert.ToInt32(ddlRates.SelectedValue);

            try
            {
                string isRated = wsconnect.FnInsertRating(unitCode, studentCode, unitName, tutorName, lecRate);
                String[] info = isRated.Split('*');
                ratefeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            }
            catch (Exception exp)
            {
                ratefeedback.InnerHtml = "<div class='alert alert-" + exp.Message+ "</div>";
            }

        }

        protected void btnBack_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Tutor_Ratings.aspx");
        }
    }
}