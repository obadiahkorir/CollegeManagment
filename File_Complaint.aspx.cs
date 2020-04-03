using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class File_Complaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["studentCode"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
              //  LoadComplaintsHere();
            }
        }
        protected void btnSaveComplain_OnClick(object sender, EventArgs e)
        {
            InsertComplaint();
        }

        protected void InsertComplaint()
        {
            try
            {
                var wsconnect = WsConfig.ObjNav;
                // var complainttext = Request.Form["txtinputComplaint"];
                var complainttext = txtareaComplaint.Text.Trim();
                DateTime complaintdate = DateTime.Today;
                int studentAdmissionNo = Convert.ToInt32(Session["uniqadmNo"]);
                if (string.IsNullOrWhiteSpace(complainttext))
                {
                    complainfeedback.InnerHtml =
                         "<div class='alert alert-danger'>Your cannot submit empty field, please type your complaint!</div>";
                    return;
                }

                bool insertionstat = wsconnect.FnInsertComplaint(studentAdmissionNo, complaintdate, complainttext);
                switch (insertionstat)
                {
                    case true:
                        complainfeedback.InnerHtml =
                            "<div class='alert alert-success'>Your feedback submitted successfully!</div>";
                        break;
                    case false:
                        complainfeedback.InnerHtml =
                           "<div class='alert alert-danger'>Your feedback could NOT be submitted!</div>";
                        break;
                }
            }
            catch (Exception ex)
            {
                complainfeedback.InnerHtml =
                           "<div class='alert alert-danger'>"+ex.Message+"</div>";
            }
        }

        protected void LoadComplaintsHere()
        {
            var wsconnect = WsConfig.ObjNav;
            var wsodataconnect = WsConfig.ReturnNavObj();
            int count = 0;
            var complaints = wsodataconnect.StudentsComplaints.Where(u => u.UniqNo == Convert.ToInt32(Session["uniqadmNo"])).ToArray();
            for (int i = 0; i < complaints.Count(); i++)
            {
                count++;
                //var onecomplaint = complaints[i];
                //int entryno = onecomplaint.No;
                //counter.InnerHtml = count.ToString();
                //reportDate.InnerHtml = Convert.ToDateTime(onecomplaint.Complaint_Date).ToString("dd-MM-yyyy");
                //complainReply.InnerHtml = onecomplaint.Complaint_Reply;
                //status.InnerHtml = onecomplaint.Status;
                //filedComplaintDetails.InnerHtml = wsconnect.FnLoadStudentComplaint(entryno);
                //var entryNos = complaints.Select(n => n.No).ToArray();
                //for (int j = 0; j < entryNos.Count(); j++)
                //{
                //    filedComplaintDetails.InnerHtml = wsconnect.FnLoadStudentComplaint(entryno);
                //}
                //filedComplaintDetails.InnerHtml = wsconnect.FnLoadAllComplaints(Convert.ToInt32(Session["uniqadmNo"]));

            }
        }

        protected void btnBack_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}