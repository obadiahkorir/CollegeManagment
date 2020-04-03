using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Reply_Complaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["TutorCode"] == null)
            {
                Response.Redirect("Defaults_Tutors.aspx");
            }
            else
            {
                Session["complaintCode"] = Request.QueryString["complainNo"];
                _LoadAComplaint();
            }

        }

        protected void _LoadAComplaint()
        {
            var wsodataconnect = WsConfig.ReturnNavObj();
            var stdCompln =
                wsodataconnect.StudentsComplaints.Where(n => n.No == Convert.ToInt32(Session["complaintCode"]))
                    .ToArray();
            for (int i = 0; i < stdCompln.Count(); i++)
            {
                var onecomplaint = stdCompln[i];
                txtAreaStdComplain.Text = onecomplaint.Complaint_Text;
               // txtareaComplaintReply.Text = onecomplaint.Complaint_Reply;
            }
        }
        protected void InsertComplaintReply()
        {
            try
            {
                var wsconnect = WsConfig.ObjNav;
                var complainttext = txtareaComplaintReply.Text.Trim();
                int complaintNo = Convert.ToInt32(Session["complaintCode"]);
                if (string.IsNullOrWhiteSpace(complainttext))
                {
                    complainfeedback.InnerHtml =
                         "<div class='alert alert-danger'>You cannot submit empty field, please type your complaint!</div>";
                    return;
                }

                string insertionstat = wsconnect.FnSaveComplaintReply(complaintNo, complainttext);
                String[] info = insertionstat.Split('*');
                complainfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
               
            }
            catch (Exception ex)
            {
                complainfeedback.InnerHtml =
                           "<div class='alert alert-danger'>" + ex.Message + "</div>";
            }
        }

        protected void btnSaveComplainReply_OnClick(object sender, EventArgs e)
        {
           InsertComplaintReply();
        }
        protected void btnBack_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Reply_Complaint.aspx");
        }
    }
}