<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exam_Condition.aspx.cs" Inherits="NIT.Exam_Condition" MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="NIT" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="row">
    <h3 class="page-header" style="font-weight: bold;">Exemptions and Special Exams</h3>
</div>
<br/>
    <div class="row">
    <div class="panel panel-default" style="padding: 10px; margin: 10px; width: 900px;">
        <div class="panel panel-default" style="border-color: #A9A9A9">
        <div class="panel-heading" style="background-color: #A9A9A9; color: #ffffff;">Apply Exemptions and Special Exams</div>
        <div id="leaveapplyfeedback" runat="server"></div>
        <br/>
        <!-- /.panel-body -->
        <div class="panel-body">
        
        <div class="form-group col-sm-12">
        <label class="col-sm-2">Academic Session</label>
        <div class="col-sm-10">
            <asp:DropdownList ID="ddlAcademicSess" CssClass="form-control" runat="server"></asp:DropdownList>
        </div>
        </div><br/>
            
        <div class="form-group col-sm-12">
        <label class="col-sm-2">Year</label>
        <div class="col-sm-10">
            <asp:DropdownList ID="ddlYear" CssClass="form-control" runat="server"></asp:DropdownList>
        </div>
        </div><br/>
            
        <div class="form-group col-sm-12">
        <label class="col-sm-2">Academic Module</label>
        <div class="col-md-10">
            <asp:DropdownList ID="ddlModule" CssClass="form-control" runat="server"></asp:DropdownList>
        </div>
        </div><br/>
            
         <div class="form-group col-sm-12">
        <label class="col-sm-2 control-label">Semester</label>
        <div class="col-sm-10">
            <asp:DropdownList ID="ddlSem" CssClass="form-control" runat="server">
                <asp:ListItem Value="0">Semester I</asp:ListItem>
                <asp:ListItem Value="1">Semester II</asp:ListItem>
                <asp:ListItem Value="2">Semester III</asp:ListItem>
                <asp:ListItem Value="3">Semester IV</asp:ListItem>
                <asp:ListItem Value="4">Semester V</asp:ListItem>
                <asp:ListItem Value="5">Semester VI</asp:ListItem>
            </asp:DropdownList>
        </div>
        </div><br/>
                    
        </div>
        <!-- /.panel-body -->
    </div>
    </div>
</div>

<%--<div class="row">
    <div class="panel panel-default">
<!-- Main content -->
      <section >
      <div class="row">
        <div class="col-md-12">
            <!-- /.card-header -->
            <div class="panel-body">
                <label><strong>My Supplimentary Exam</strong></label>
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
</div>--%>

</div>
</asp:Content>
