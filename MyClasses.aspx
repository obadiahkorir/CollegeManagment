<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyClasses.aspx.cs" Inherits="NIT.MyClasses" MasterPageFile="~/Site.Master" %>

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
                <label><strong>My Classes</strong></label>
                <% 
                   var wsodataconnect = WsConfig.ReturnNavObj();
                %>
              <table id="myClassTimetable" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Unit Code</th>
                    <th>Unit Name</th>
                    <th>Semester</th>
                    <th>Module</th>
                </tr>
                </thead>
                <tbody>
                <%
                    var results = wsodataconnect.ClassTimetable.Where(t=>t.Tutor==(String)Session["TutorCode"]).ToArray();
                    for (int i = 0; i < results.Count(); i++)
                    {
                        var result = results[i];
                %>
                <tr>
                   <td><%=result.Unit_Code %></td>
                   <td><%=result.Unit_Name %></td>
                   <td><%=result.Semester %></td>
                   <td><%=result.Module %></td>
                   
                </tr>
                 <% } %>
               
                </tbody>
                <tfoot>
                <tr>
                    <th>Unit Code</th>
                    <th>Unit Name</th>
                    <th>Semester</th>
                    <th>Module</th>
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
