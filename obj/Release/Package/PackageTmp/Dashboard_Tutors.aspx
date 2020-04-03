<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_Tutors.aspx.cs" Inherits="NIT.Dashboard_Tutors" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="NIT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="panel panel-default" style="margin-top:10px;background-color: #E5EBF2; border-color: #E5EBF2;">
    <% if (Convert.ToInt32(Session["usertype"]) == 1)
       { %>
    <div class="col-md-6 col-lg-6" style="max-height: 700px; overflow: auto;">
                <h3>Tutor Dashboard</h3>
                <hr/>
                <div class="row" style="width: 100%; display: block; margin: auto;">
                    <div class="col-lg-4 col-md-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <i class="fa fa-money fa-2x"></i>
                                    </div>
                                    <div class="col-xs-10 text-left">
                                        <div class="huge">
                                             <div id="myclasses" runat="server"></div>
                                        </div>
                                        <div>Classes</div>
                                    </div>
                                </div>
                            </div>
                           <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left"><label class="btn btn-primary"   data-toggle="modal" data-target="#viewunits"><i class="fa fa-eye" ></i>View Entries</label></span>
                                   <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                </div>

                <div class="col-lg-4 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-graduation-cap fa-2x"></i>
                            </div>
                            <div class="col-xs-10 text-center">
                                <div class="huge">
                                    <div id="Div2" runat="server"></div>
                                </div>
                                <div>Class Register</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left"><label class="btn btn-primary"   data-toggle="modal" data-target="#viewunits"><i class="fa fa-eye" ></i>View Units</label></span>
                           <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
                <div class="col-lg-4 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-refresh fa-2x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <div id="div3" runat="server"><h4>Dummy</h4></div>       
                                </div>
                                <div>Other controls</div>
                            </div>
                        </div>
                    </div>
                    <a href="Dashboard.aspx">
                        <div class="panel-footer">
                            <span class="pull-left"> View</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
       </div>
            <h3>Others</h3>
            <hr/>
            <div class="row" style="width: 100%; display: block; margin: auto;">
                        <div class="col-lg-4 col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="fa fa-plus fa-2x"></i>
                        </div>
                        <div class="col-xs-9 text-left">
                            <div class="huge"><br/></div>
                            <div>Insert Smth</div>
                        </div>
                    </div>
                </div>
                <a href="Dashboard.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Test Text</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
              <div class="col-lg-4 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-undo fa-2x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><br/></div>
                                <div>Text 2</div>
                            </div>
                        </div>
                    </div>
                    <a href="Dashboard.aspx">
                        <div class="panel-footer">
                            <span class="pull-left">Insert test here</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
           </div>
         </div>
        <%
            var odataconn2 = WsConfig.ReturnNavObj();
            var profiles2 = odataconn2.Employees.Where(a => a.No == Session["TutorCode"].ToString()).ToArray();
            for (int i = 0; i < profiles2.Count(); i++)
            {
                var profile = profiles2[i];
        %> 
        
             <div class="col-md-6 col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">Welcome <strong><%= Session["TutorName"] %></strong></div>
                    <div class="panel-body">
                        <img src="images/<%: Session["TutorCode"] + ".png" %>" style="max-width: 100%; max-height: 300px; display: block; margin: auto;"/>
                        <hr/>
                        <table class="table table-striped table-bordered">
                            <tbody>
                            <tr><td>Full Name</td><td><% = profile.First_Name+" "+profile.Middle_Name+" "+profile.Last_Name %></td></tr>
                            <tr><td>Tutor Code.</td><td><% = profile.No %></td></tr>
                            <tr><td>Phone Number</td><td><% = profile.Phone_No %></td></tr>
                            <tr><td>Physical Location</td><td><% = profile.Address %></td></tr>
                            <tr><td>Email</td><td><% = profile.E_Mail %></td></tr>
                            </tbody>
                        </table>
                        <a  class="btn btn-info" href="Profile.aspx">Edit</a>
                    </div>
                </div>
            </div>
    <% }
   } %>
    
<div id="viewunits" class="modal fade">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header"><div class="modal-title"><strong>Units Registered this Semester</strong><button type="button" class="close" data-dismiss="modal">&times;</button></div></div>
        <div class="modal-body">
            <table class="table table-bordered table-striped">
                 <thead>
                <tr>
                  <th>No</th>
                  <th>Complain File Date</th>
                  <th>Complain Details</th>
                  <th>Complain Reply</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
                   
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Complain File Date</th>
                  <th>Complain Details</th>
                  <th>Complain Reply</th>
                  <th>Status</th>
                </tr>
                </tfoot>
           
            </table>
        </div>
    </div>
</div>
</div>
 
</div>
</asp:Content>
