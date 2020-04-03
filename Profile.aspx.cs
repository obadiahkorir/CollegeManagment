using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Profile : System.Web.UI.Page
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
            }
        }

        protected void _LoadProfile()
        {
            var odataconn = WsConfig.ReturnNavObj();
            var profiles = odataconn.StudentPortal.Where(a => a.Adm_No == Convert.ToInt32(Session["uniqadmNo"].ToString())).ToArray();

            for (int i = 0; i < profiles.Count(); i++)
            {
                var profile = profiles[i];
                inputName.Value = profile.Name;
                inputPhone.Value = profile.Phone_No;
                inputResidence.Value = profile.Address;
                inputEmail.Value = profile.E_Mail;

                var gend = profile.Gender;
                switch (gend)
                {
                    case "Male":
                        ddlGender.SelectedIndex = 1;
                        break;
                    case "Female":
                        ddlGender.SelectedIndex = 2;
                        break;
                    default:
                        ddlGender.SelectedIndex = 0;
                        break;
                }

            }
        }

        protected void EditMyProfile()
        {
            var phonenumber = inputPhone.Value.Trim();
            var residence = inputResidence.Value.Trim();
            var email = inputEmail.Value.Trim();
            int gender = 0;
            if (ddlGender.SelectedIndex == 0)
            {
                profilemanagementfeedback.InnerHtml = "<div id='alert alert-danger'>Please select gender first!</div>";
                
            }
            else
            {
                gender = Convert.ToInt32(ddlGender.SelectedValue);
            }
            try
            {
                var studentcode = (string)Session["studentCode"];
                String status = WsConfig.ObjNav.FnUpdateProfile(studentcode, phonenumber, residence, gender,email);
                String[] info = status.Split('*');
                profilemanagementfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            }
            catch (Exception exception)
            {
                profilemanagementfeedback.InnerHtml = "<div id='alert alert-danger'>" + exception.Message + "</div>";
            }


        }

        protected void btnEditProfile_OnClick(object sender, EventArgs e)
        {
            //edit profile
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                EditMyProfile();
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Operation Cancelled by user!')", true); // ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "alert('You clicked NO!')", true);
            }
        }

        public void ChangeStudentPassword()
        {
            if (string.IsNullOrWhiteSpace(inputPasswordOld.Value.Trim()) || string.IsNullOrWhiteSpace(inputPasswordNew.Value.Trim()) || 
                string.IsNullOrWhiteSpace(inputPasswordNew.Value.Trim()) || string.IsNullOrWhiteSpace(inputPasswordNewReenter.Value.Trim()))
            {
                profilemanagementfeedback.InnerHtml = "<div id='alert alert-danger'>Do not leave Fields empty!</div>";
                return;
            }
            if (inputPasswordNew.Value.Trim() != inputPasswordNewReenter.Value.Trim())
            {
                profilemanagementfeedback.InnerHtml = "<div id='alert alert-danger'>New Passwords do not match!</div>";
                return;
            }
            try
            {
                var studentcode = (string)Session["studentCode"];
                String status = WsConfig.ObjNav.FnChangePassword(studentcode, EncryptP(inputPasswordNewReenter.Value.Trim()), EncryptP(inputPasswordOld.Value.Trim()));
                String[] info = status.Split('*');
                profilemanagementfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            }
            catch (Exception exception)
            {
                profilemanagementfeedback.InnerHtml = "<div id='alert alert-danger'>" + exception.Message + "</div>";
            }
        }
        static string EncryptP(string mypass)
        {
            //encryptpassword:
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(mypass));
                return Convert.ToBase64String(data);
            }
        }

        protected void btnChangePassword_OnClick(object sender, EventArgs e)
        {
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "text", "loadPasswordPanel()", true); // ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "alert('You clicked NO!')", true);
            

            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                ChangeStudentPassword();
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Operation Cancelled by user!')", true); // ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "alert", "alert('You clicked NO!')", true);
               
            }
        }
    }
}