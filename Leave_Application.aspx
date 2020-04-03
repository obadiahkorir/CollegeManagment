﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave_Application.aspx.cs" Inherits="NIT.Leave_Application" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="NIT" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
<div class="row">
    <h3 class="page-header" style="font-weight: bold;">Leave Application</h3>
</div>
  <br/>
    <div class="row">
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
    </div>
        <div class="row">
           <div class="panel panel-default" style="padding: 10px; margin: 10px; width: 900px;">
               <div class="panel panel-default" style="border-color: #A9A9A9">
                <div class="panel-heading" style="background-color: #A9A9A9; color: #ffffff;">Apply for Leave</div>
                <div id="leaveapplyfeedback" runat="server"></div>
                <br/>
                <!-- /.panel-body -->
                <div class="panel-body">
                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Full Name</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputName" placeholder="Full Name" runat="server" disabled/>
                    </div>
                </div><br/>
                <div class="form-group">
                    <label for="inputPhone" class="col-sm-2 control-label">Phone No.</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPhone" placeholder="Phone Number" runat="server"/>
                    </div>
                </div><br/>
                <div class="form-group">
                    <label for="inputResidence" class="col-sm-2 control-label">Residence</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputResidence" placeholder="Residence" runat="server"/>
                    </div>
                </div><br/>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail" placeholder="Email" runat="server"/>
                    </div>
                </div><br/>

                <div class="form-group">
                <label class="col-sm-2 control-label">Gender</label>
                <div class="col-sm-10">
                    <asp:DropdownList ID="ddlGender" CssClass="form-control" runat="server">
                        <asp:ListItem Value="-1">--Select Gender--</asp:ListItem>
                        <asp:ListItem Value="0">Male</asp:ListItem>
                        <asp:ListItem Value="1">Female</asp:ListItem>
                    </asp:DropdownList>
                </div>
                </div><br/>
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                    <span class="btn btn-success pull-left">
                        <i class="fa fa-plus"></i>&nbsp;
                        <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" Style="background: none; border: 0"  />
                    </span>
                        </div>
                </div>
                    
                </div>
                <!-- /.panel-body -->
            </div>
           </div>
        </div>
    </div>
</asp:Content>