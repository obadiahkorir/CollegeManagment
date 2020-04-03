using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Register_Unit_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUnitsatStart();
            }
        }
        protected void LoadUnitsatStart()
        {
            var wsconnector = WsConfig.ReturnNavObj();

            //var programs = wsconnector.Programs.ToList();
            //ddlProgram.DataSource = programs;
            //ddlProgram.DataTextField = "Program_Name";
            //ddlProgram.DataValueField = "Program_Code";
            //ddlProgram.DataBind();
            
            var programName = Request.QueryString["programName"];
            var unitCode = Request.QueryString["unitCode"];
            var studentCode = Request.QueryString["studentCode"];
            var unitName = Request.QueryString["unitName"];
            var tutorName = Request.QueryString["tutorName"];
            var totalHours = Request.QueryString["totalHours"];

            txtUnitCode.Text = unitCode;
            txtUnitName.Text = unitName;
            txtTutorname.Text = tutorName;
            txtTotalhours.Text = totalHours;
            txtProgram.Text = programName;


        }

        protected void lnkBtnRegisterUnit_OnClick(object sender, EventArgs e)
        {
           //
        }

        protected void lnkBtnBack2Units_OnClick(object sender, EventArgs e)
        {
           Response.Redirect("Register_Units.aspx");
        }
    }
}