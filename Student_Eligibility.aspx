<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Eligibility.aspx.cs" Inherits="NIT.Student_Eligibility"  MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="NIT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
      <!-- Main content -->
				<div class="row">
				    <div class="col-lg-10 offset-lg-1">
					<div class="d-flex flex-lg-row flex-column justify-content-between">
                        
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
             <br/>
		
               <div class="row" style="width: 100%; display: block; margin: auto;">
                    <div runat="server" id="feedback"></div>
                   <br/>
                       <div style="margin: 10px;"><iframe runat="server" ID="statementView" width="100%" height="500px"></iframe>
                    </div>
    
                </div>
        </div>
</asp:Content>