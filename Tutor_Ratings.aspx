<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tutor_Ratings.aspx.cs" Inherits="NIT.Tutor_Ratings" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="NIT" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
    <!-- Main content -->
<section>
      <div class="row">
        <div class="col-md-12">
            <!-- /.card-header -->
            <div class="panel-body">
                <label><strong>My Lecturer Ratings</strong></label>
                <br/>
                <% 
                   var wsodataconnect = WsConfig.ReturnNavObj();
                %>
              <table id="myTutorRate" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Unit Tutor</th>
                  <th>I Rated</th>
                  <th>Rated Already?</th>
                  <th>Rate Lecturer</th>
                </tr>
                </thead>
                <tbody>
                <%
                var results = wsodataconnect.StudentsUnits.Where(u => u.studentCode == (String)Session["studentCode"]).ToArray();
                for (int i = 0; i < results.Count(); i++)
                {
                    var result = results[i];
                %>
                <tr>
                  <td><%=result.Unit_Code%></td>
                  <td><%=result.Unit_Name%></td>
                  <td><%=result.Tutor %></td>
                  <td><%=result.Rating%></td>
                  <td><%=result.Is_Rated%></td>
                  <td><a href="Rates.aspx?unitCode=<%=result.Unit_Code %>&studentCode=<%=Session["studentCode"].ToString()%>&unitName=<%=result.Unit_Name %>&tutorName=<%=result.Tutor %>">Go to Rate</a></td>
                </tr>
                 <% } %>
               
                </tbody>
                <tfoot>
                <tr>
                  <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Unit Tutor</th>
                  <th>I Rated</th>
                  <th>Rated Already?</th>
                  <th>Rate Lecturer</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
</asp:Content>
