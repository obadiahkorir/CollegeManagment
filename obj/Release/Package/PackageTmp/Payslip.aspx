<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payslip.aspx.cs" Inherits="NIT.Payslip" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
      <!-- Main content -->
				<div class="row">
				    <div class="col-lg-10 offset-lg-1">
					<div class="d-flex flex-lg-row flex-column justify-content-between">
                        
                         <div class="form-group">
                              <label><strong>Start Date:</strong></label>
                              <div class="input-group">
                                  <input type="text" class="form-control date" id="txtStartDate" runat="server"/><span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                              </div>
                              <!-- /.input group -->
                            </div>
                            <!-- /.form group -->
                            <div class="form-group">
                            <label><strong>End Date:</strong></label>
                              <div class="input-group">
                                  <input type="text" class="form-control date" id="txtEnddate" runat="server"/><span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                              </div>
                              <!-- /.input group -->
                            </div>
                            <!-- /.form group -->

						<div class="d-flex flex-row align-items-center justify-content-start">
						    <asp:Button runat="server" CssClass="btn btn-block btn-success" ID="btnBlobGen"  Text="View Fee Statement" OnClick="btnBlobGen_OnClick"></asp:Button>
					    </div>

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

