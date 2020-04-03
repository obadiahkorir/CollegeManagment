<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exam_Resluts.aspx.cs" Inherits="NIT.Exam_Resluts" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="NIT" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
    <!-- Main content -->
    <section >
      <div class="row">
        <div class="col-md-12">
            <!-- /.card-header -->
            <div class="panel-body">
                <label><strong>My Exam Results</strong></label>
                <% var wsconnect = WsConfig.ObjNav;
                   var wsodataconnect = WsConfig.ReturnNavObj();
                %>
              <table id="myGrades" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Semester</th>
                  <th>Grade</th>
                  <th>Grade Remarks</th>
                </tr>
                </thead>
                <tbody>
                <%
                    var results = wsodataconnect.FinalResults.Where(u => u.Reg_No == (String)Session["studentCode"]).ToArray();
                    for (int i = 0; i < results.Count(); i++)
                    {
                        var result = results[i];
                %>
                <tr>
                  <td><%=result.Unit_Code%></td>
                  <td><%=result.Unit_Name%></td>
                  <td><%=result.Semester %></td>
                  <td><%=result.Grade %></td>
                  <td><%=result.Remarks %></td>
                </tr>
                 <% } %>
               
                </tbody>
                <tfoot>
                <tr>
                 <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Semester</th>
                  <th>Grade</th>
                  <th>Grade Remarks</th>
                </tr>
                </tfoot>
              </table>
            </div>
         
        </div>
       </div>
  
<!-- /.col-->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
</asp:Content>