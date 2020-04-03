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
    public partial class Defaults_Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            var wsconnection = WsConfig.ObjNav;
            var odataconn = WsConfig.ReturnNavObj();
            string studentCode = StudentCode.Text.Trim();
            string password = Password.Text.Trim();

            try
            {
                bool loginstatus = wsconnection.FnLogin(studentCode, EncryptP(password));
                switch (loginstatus)
                {
                    case true:
                        Session["usertype"] = 0;
                        var studentinfo =
                            odataconn.StudentPortal.Where(c => c.No == studentCode).ToList();
                        foreach (var info in studentinfo)
                        {
                            Session["uniqadmNo"] = info.Adm_No;
                            Session["studentCode"] = studentCode;
                            Session["StudentName"] = info.Name;

                            WsConfig.ObjNav.GetItemImage(Session["studentCode"].ToString());
                            Response.Redirect("Dashboard.aspx");
                        }
                        break;

                    case false:
                        loginfeedback.InnerHtml = "<div class='alert alert-danger'>Login failed!</div>";
                        break;
                    default:
                        break;

                }
            }
            catch (Exception ex)
            {
                // ignored
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
    }
}