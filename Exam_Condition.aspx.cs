using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Exam_Condition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetUnitInformation();
            GetmeYears();
        }
        protected void _GetUnitInformation()
        {
            var wsodataconnect = WsConfig.ReturnNavObj();

            var acadSess = wsodataconnect.AcademicSessionList.ToList();
            ddlAcademicSess.DataSource = acadSess;
            ddlAcademicSess.DataTextField = "Session_Name";
            ddlAcademicSess.DataValueField = "Session_Code";
            ddlAcademicSess.DataBind();
            ddlAcademicSess.Items.Insert(0, "--Select Session--");

            var acadMod = wsodataconnect.Module.ToList();
            ddlModule.DataSource = acadMod;
            ddlModule.DataTextField = "Module_Description";
            ddlModule.DataValueField = "Module_Code";
            ddlModule.DataBind();
            ddlModule.Items.Insert(0, "--Select Module--");
            
        }
        protected void GetmeYears()
        {
            // Clear items:    
            ddlYear.Items.Clear();
            // Add default item to the list
            ddlYear.Items.Add("--Select Year--");
            // Start loop
            for (int i = 0; i < 20; i++)
            {
                // For each pass add an item
                // Add a number of years (negative, which will subtract) to current year
                ddlYear.Items.Add(DateTime.Now.AddYears(-i).Year.ToString());
            }

        }
    }
}