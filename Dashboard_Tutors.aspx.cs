using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Dashboard_Tutors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["TutorCode"] == null)
            {
                Response.Redirect("Defaults_Tutors.aspx");
            }
            if (!IsPostBack)
            {
                
            }
        }

    }
}