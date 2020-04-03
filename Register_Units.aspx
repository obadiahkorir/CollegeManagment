<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Units.aspx.cs" Inherits="NIT.Register_Units" MasterPageFile="~/Site.Master" %>
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
                <label><strong>Units Registration</strong></label>
                <br/>
                <% 
                   var wsodataconnect = WsConfig.ReturnNavObj();
                %>
              <table id="myUnitsRegister" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Unit Tutor</th>
                  <th>Total Hours</th>
                  <th>Register Unit</th>
                </tr>
                </thead>
                <tbody>
                <%
                var results = wsodataconnect.Units.Where(u => u.Open_for_Portal_Registration==true).ToArray();
                for (int i = 0; i < results.Count(); i++)
                {
                    var result = results[i];
                %>
                <tr>
                  <td><%=result.Unit_Code%></td>
                  <td><%=result.Name%></td>
                  <td><%=result.Tutor %></td>
                  <td><%=result.Total_Hours %></td>
                  <td><a href="Register_Unit_Register.aspx?unitCode=<%=result.Unit_Code %>&studentCode=<%=Session["studentCode"].ToString()%>&totalHours=<%=result.Total_Hours %>&unitName=<%=result.Name %>&programName=<%=result.Program_Name %>"><label class="btn btn-info" ><i class="fa fa-edit"></i></label></a></td>
                  <%--<td><a href="Register.aspx?step=2&&cNo=<%= copyrightNo %>&&del=<% = applicant.Line_No %>"><label class="btn btn-danger"><i class="fa fa-trash"></i></label></a></td>--%>
                </tr>
                 <% } %>
               
                </tbody>
                <tfoot>
                <tr>
                 <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Unit Tutor</th>
                  <th>Total Hours</th>
                  <th>Register Unit</th>
                </tr>
                </tfoot>
              </table>
              <br/>

            
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
</section>
<!-- /.content -->
 
      <section>
      <div class="row">
        <div class="col-md-12">
            <!-- /.card-header -->
            <div class="panel-body">
                <label><strong>Registered Uits</strong></label>
                <br/>
              
              <table id="myRegisteredunits" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Module</th>
                    <th>Semester</th>
                    <th>Unit Code</th>
                    <th>Unit Name</th>
                    <th>Unit Tutor</th>
                    <th>Total Hours</th>
                    <th>Register Unit</th>
                </tr>
                </thead>
                <tbody>
                <%
                var units = wsodataconnect.Units.Where(u => u.Open_for_Portal_Registration==true).ToArray();
                for (int i = 0; i < units.Count(); i++)
                {
                    var oneunit = units[i];
                %>
                <tr>
                    <td><%=oneunit.Module%></td>
                    <td><%=oneunit.Semester%></td>
                    <td><%=oneunit.Unit_Code%></td>
                    <td><%=oneunit.Name%></td>
                    <td><%=oneunit.Tutor %></td>
                    <td><%=oneunit.Total_Hours %></td>
                    <td>
                        <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="lnkBtnBack2Units"> <i class="fa fa-trash"></i></asp:LinkButton>
                    </td>
                     
                </tr>
                 <% } %>
               
                </tbody>
                <tfoot>
                <tr>
                    <th>Module</th>
                    <th>Semester</th>
                    <th>Unit Code</th>
                    <th>Unit Name</th>
                    <th>Unit Tutor</th>
                    <th>Total Hours</th>
                    <th>Register Unit</th>
                </tr>
                </tfoot>
              </table>
              <br/>

            
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
</section>   
  

</div>
<!-- /.content-wrapper -->
</asp:Content>