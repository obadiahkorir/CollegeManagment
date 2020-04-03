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
    public partial class Defaults_Tutors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            var wsconnection = WsConfig.ObjNav;
            var odataconn = WsConfig.ReturnNavObj();
            string tutorscode = TutorCode.Text.Trim();
            string password = Password.Text.Trim();

            //try
            //{
            //    //string loginstatus = wsconnection.FnLoginTutor(tutorEmail, EncryptP(password));
                string loginstatus = wsconnection.FnLoginTutor(tutorscode, password);
                String[] logininfo = loginstatus.Split('*');
                if (logininfo[1] == "logingranted")
                {
                    Session["usertype"] = 1;
                    var tutorinfo =
                        odataconn.Employees.Where(c => c.No== tutorscode).ToList();
                    foreach (var oneinfo in tutorinfo)
                    {
                        Session["TutorCode"] = tutorscode;
                        Session["TutorName"] = oneinfo.First_Name + " " + oneinfo.Middle_Name + " " + oneinfo.Last_Name;
                        //  WsConfig.ObjNav.GetItemImage(Session["TutorCode"].ToString());
                        Response.Redirect("Dashboard_Tutors.aspx");
                    }
                }
                else
                {
                    loginfeedback.InnerHtml = "<div class='alert alert-" + logininfo[0] + "'>" + logininfo[1] + "</div>";
                }
           //}
           // catch (Exception ex)
           //{
           //   // ignored
           // loginfeedback.InnerHtml = "<div class='alert alert-" +ex.Message + "</div>";
           // }
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
    }
}