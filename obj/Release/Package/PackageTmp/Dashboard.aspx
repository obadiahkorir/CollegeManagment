<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="NIT.Dashboard" %>
<%@ Import Namespace="NIT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="panel panel-default" style="margin-top:10px;background-color: #E5EBF2; border-color: #E5EBF2;">
   <%  if(Convert.ToInt32(Session["usertype"]) == 0)
            {
         %>
            <div class="col-md-6 col-lg-6" style="max-height: 700px; overflow: auto;">
                <h3>Students Dashboard</h3>
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
                                             <div id="feebalance" runat="server"></div>
                                        </div>
                                        <div>Fee Balance</div>
                                    </div>
                                </div>
                            </div>
                           <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left"><label class="btn btn-primary"   data-toggle="modal" data-target="#viewfeeEntries"><i class="fa fa-eye" ></i>&nbsp;View Entries</label></span>
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
                                    <div id="unitsregistered" runat="server"></div>
                                </div>
                                <div>Registered Units</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left"><label class="btn btn-primary"   data-toggle="modal" data-target="#viewunits"><i class="fa fa-eye" ></i>&nbsp;View Units</label></span>
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
                                    <div id="divdummy" runat="server"><h4>Dummy</h4></div>       
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
            var odataconn = WsConfig.ReturnNavObj();
            var profiles = odataconn.StudentPortal.Where(a => a.Adm_No == Convert.ToInt32(Session["uniqadmNo"].ToString())).ToArray();
            for (int i = 0; i < profiles.Count(); i++)
            {
                var profile = profiles[i];
            %>
            <div class="col-md-6 col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">Welcome <strong><%=Session["StudentName"]%></strong></div>
                    <div class="panel-body">
                        <img src="images/<%: Session["uniqadmNo"] + ".png" %>" style="max-width: 100%; max-height: 300px; display: block; margin: auto;"/>
                        <hr/>
                        <table class="table table-striped table-bordered">
                            <tbody>
                            <tr><td>Full Name</td><td><% =profile.Name %></td></tr>
                            <tr><td>Admission No.</td><td><% =profile.No %></td></tr>
                            <tr><td>Phone Number</td><td><% =profile.Phone_No %></td></tr>
                            <tr><td>Physical Location</td><td><% =profile.Address %></td></tr>
                            <tr><td>Email</td><td><% =profile.E_Mail %></td></tr>
                            </tbody>
                        </table>
                        <a  class="btn btn-info" href="Profile.aspx">Edit</a>
                    </div>
                </div>
            </div>
    
        <%break;
        }
        %>
    <%}%>
    
<div id="viewunits" class="modal fade">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header"><div class="modal-title"><strong>Units Registered this Semester</strong><button type="button" class="close" data-dismiss="modal">&times;</button></div></div>
        <div class="modal-body">
            <table class="table table-bordered table-striped">
                 <thead>
                <tr>
                  <th>No</th>
                  <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Module</th>
                  <th>Semester</th>
                  <th>Registration Type</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        var wsconnect = WsConfig.ObjNav;
                        var wsodataconnect = WsConfig.ReturnNavObj();

                        var regCode = wsconnect.FnGetSemesterRegCode(Session["studentCode"].ToString());

                        var allunits = wsodataconnect.RegistrationLine.Where(u => u.Reg_Code == regCode).ToArray();
                        int count = 0;
                    for (int i = 0; i < allunits.Count(); i++)
                    {
                            count++;
                            var oneunit = allunits[i];
                    %>
                    <tr>
                        <td><% =count.ToString()%></td>
                        <td><%=oneunit.Unit_Code%></td>
                        <td><%=oneunit.Unit_Name%></td>
                        <td><% =oneunit.Module%></td>
                        <td><%=oneunit.Semester %></td>
                        <td><%=oneunit.Registration_Type %></td>
                       
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Unit Code</th>
                  <th>Unit Name</th>
                  <th>Module</th>
                  <th>Semester</th>
                  <th>Registration Type</th>
                </tr>
                </tfoot>
           
            </table>
        </div>
    </div>
</div>
</div>

<div id="viewfeeEntries" class="modal fade">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header"><div class="modal-title"><strong>Fee Balance Entries</strong><button type="button" class="close" data-dismiss="modal">&times;</button></div></div>
        <div class="modal-body">
            <table class="table table-bordered table-striped">
                 <thead>
                <tr>
                  <th>No</th>
                  <th>Posting Date</th>
                  <th>Description</th>
                  <th>Amount (KES)</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        var feeentries = wsodataconnect.Cust_LedgerEntries.Where(u => u.Customer_No == (String)Session["studentCode"]).ToList().Take(20).OrderByDescending(d=>d.Posting_Date).ToArray();
                        int countfee = 0;
                    for (int i = 0; i < feeentries.Count(); i++)
                    {
                            countfee++;
                            var onefeeentry = feeentries[i];
                    %>
                    <tr>
                        <td><% =countfee.ToString()%></td>
                        <td><%=Convert.ToDateTime(onefeeentry.Posting_Date).ToString("dd-MM-yyyy") %></td>
                        <td><%=onefeeentry.Document_Type%></td>
                        <td><% =Convert.ToDecimal(onefeeentry.Amount).ToString("N2")%></td>
                        
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Posting Date</th>
                  <th>Description</th>
                  <th>Amount (KES)</th>
                </tr>
                </tfoot>
           
            </table>
        </div>
    </div>
</div>
</div>
 
</div>
</asp:Content>