using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Supplimentary_Exams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void _GetUnits()
        {
            var wsodataconnect = WsConfig.ReturnNavObj();

            //var unitcode = wsodataconnect.call_for_Proposal.ToList().Where(pty => pty.Proposal_Type == "Grant");
            //ddlAccountType.DataSource = projs;
            //ddlAccountType.DataTextField = "Project";
            //ddlAccountType.DataValueField = "Call_Ref_Number";
            //ddlAccountType.DataBind();
            //ddlAccountType.Items.Insert(0, "--Select Project--");
        }
    }
}