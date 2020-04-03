using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NIT
{
    public partial class Academic_Documents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAcademicDocs();
            }
        }
        protected void LoadAcademicDocs()
        {
            try
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Documents_Academic/"));
                List<ListItem> files = filePaths.Select(filePath => new ListItem(Path.GetFileName(filePath), filePath)).ToList();
                tblAcademicDocuments.DataSource = files;
                tblAcademicDocuments.DataBind();
            }
            catch (Exception ex)
            {
                // KCDFAlert.ShowAlert("No Uploads!");
            }

        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            //Download files
            //string filePath = (sender as LinkButton).CommandArgument;
            //string filename = Path.GetFileName(filePath);
            //string fExt = Path.GetExtension(filename);
            //Response.ContentType = "pdf";
            //string filePaths = (sender as LinkButton).CommandArgument;
            //HttpResponse response = HttpContext.Current.Response;
            //WebClient client = new WebClient();
            //Byte[] FileBuffer = client.DownloadData(filePaths);
            //Response.Clear();
            //Response.ClearContent();
            //Response.ClearHeaders();
            //Response.Cache.SetCacheability(HttpCacheability.Private);
            //Response.CacheControl = "private";
            //Response.AddHeader("Content-Type", "application/pdf");
            //viewMe.Attributes.Add("src", ResolveUrl("~/Documents/" + filename));
            ////Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            //Response.AddHeader("content-length", FileBuffer.Length.ToString());
            //Response.BufferOutput = false;
            //Response.Flush();
            //Response.BinaryWrite(FileBuffer);
            //Response.Flush();
            //Response.SuppressContent = true;
            //HttpContext.Current.ApplicationInstance.CompleteRequest();
            //Response.End();


        }
    }
}