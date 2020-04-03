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
    public partial class GetNewTutorPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPassRequest_OnClick(object sender, EventArgs e)
        {
            ChangeTutorPassword();
        }

        public void ChangeTutorPassword()
        {
            if (string.IsNullOrWhiteSpace(tutorCode.Text.Trim()))
            {
                passwordfeedback.InnerHtml = "<div id='alert alert-danger'>Please enter your tutor email address!</div>";
                return;
            }

            try
            {
                var tutornumber = tutorCode.Text.Trim();
                var newpassword = NewPassword();
                var odataconn = WsConfig.ReturnNavObj();
                var name = "";
                var email = "";
                var tutorinfo =
                           odataconn.Employees.Where(c => c.No == tutornumber).ToArray();
                for (int i = 0; i < tutorinfo.Count(); i++)
                {
                    var onetutorinfo = tutorinfo[i];
                    email = onetutorinfo.E_Mail;
                    name = onetutorinfo.First_Name+" "+ onetutorinfo.Middle_Name+" "+ onetutorinfo.Last_Name;
                }
                if (string.IsNullOrWhiteSpace(email))
                {
                    passwordfeedback.InnerHtml = "<div id='alert alert-danger'>Your Email Account is not on our database!</div>";
                }
                else
                {
                    //String status = WsConfig.ObjNav.FnResetTutorPassword(email, EncryptP(newpassword));
                    String status = WsConfig.ObjNav.FnResetTutorPassword(tutornumber, newpassword);
                    String[] info = status.Split('*');
                    SendNewPassword(email, name, newpassword);
                    passwordfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                }
            }
            catch (Exception exception)
            {
                passwordfeedback.InnerHtml = "<div id='alert alert-danger'>" + exception.Message + "</div>";
            }
        }

        protected string NewPassword()
        {
            var nPwd = "";
            var rdmNumber = new Random();
            nPwd = rdmNumber.Next(1000, 1999).ToString();
            return nPwd;
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

        protected void SendNewPassword(string myEmail, string myName, string myPassword)
        {
            //begin send email to VC now, down here
            const string mSubject = @"Request password Reset";
            string emailbody = "Dear " + myName + "<br/>";
            emailbody += "<br />You have reset you password successfully. Your new Password is " + myPassword + ". Kindly go to Login";
            emailbody += "<br /><br />Thank you";
            //send email to user
            bool emsendtoVc = WsConfig.MailFunction(emailbody, myEmail, mSubject);
        }
    }
}