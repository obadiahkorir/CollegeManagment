﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timetable_Exam.aspx.cs" Inherits="NIT.Timetable_Exam" MasterPageFile="~/Site.Master" %>
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
                <label><strong>My Exam Timetable</strong></label>
                <% 
                   var wsodataconnect = WsConfig.ReturnNavObj();
                %>
              <table id="myExamTimetable" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Weekday</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Semester</th>
                    <th>Unit Code</th>
                    <th>Unit Name</th>
                    <th>Module</th>
                    <th>Course ID</th>
                    <th>Venue</th>
                    <th>Invigilator Last Name</th>
                    <th>Supervisor Last Name</th>
                </tr>
                </thead>
                <tbody>
                <%
                    var results = wsodataconnect.ExamTimetable.ToArray();
                    for (int i = 0; i < results.Count(); i++)
                    {
                        var result = results[i];
                %>
                <tr>
                    <td><%=result.Week_Day%></td>
                    <td><%=Convert.ToDateTime(result.Date).ToString("dd-MM-yyyy") %></td>
                    <td><%=result.Start_Time%></td>
                    <td><%=result.End_Time %></td>
                    <td><%=result.Semester %></td>
                    <td><%=result.Unit_Code %></td>
                    <td><%=result.Unit_Name %></td>
                    <td><%=result.Module %></td>
                    <td><%=result.Course_Code %></td>
                    <td><%=result.Venue %></td>
                    <td><%=result.Invigilator_last_Name %></td>
                    <td><%=result.Supervisor_last_Name %></td>
                </tr>
                 <% } %>
               
                </tbody>
                <tfoot>
                <tr>
                    <th>Weekday</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Semester</th>
                    <th>Unit Code</th>
                    <th>Unit Name</th>
                    <th>Module</th>
                    <th>Course ID</th>
                    <th>Venue</th>
                    <th>Invigilator Last Name</th>
                    <th>Supervisor Last Name</th>
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