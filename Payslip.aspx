<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payslip.aspx.cs" Inherits="NIT.Payslip" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
      <!-- Main content -->
				<div class="row">
				    <div class="col-lg-10 offset-lg-1">
					<div class="d-flex flex-lg-row flex-column justify-content-between">
                        
                         <div class="form-group">
                              <label><strong>Payperiod:</strong></label>
                              <div class="input-group">
                                  <asp:DropDownList runat="server" ID="ddlPayperiods">
                                      <asp:ListItem Value="1">Jan</asp:ListItem>
                                      <asp:ListItem Value="2">Feb</asp:ListItem>
                                      <asp:ListItem Value="3">Mar</asp:ListItem>
                                      <asp:ListItem Value="4">Apr</asp:ListItem>
                                      <asp:ListItem Value="5">May</asp:ListItem>
                                      <asp:ListItem Value="6">Jun</asp:ListItem>
                                      <asp:ListItem Value="7">Jul</asp:ListItem>
                                      <asp:ListItem Value="8">Aug</asp:ListItem>
                                      <asp:ListItem Value="9">Sep</asp:ListItem>
                                      <asp:ListItem Value="10">Oct</asp:ListItem>
                                      <asp:ListItem Value="11">Nov</asp:ListItem>
                                      <asp:ListItem Value="12">Dec</asp:ListItem>
                                  </asp:DropDownList>
                                   </div>
                              <!-- /.input group -->
                            </div>
                            <!-- /.form group -->                            

						<div class="d-flex flex-row align-items-center justify-content-start">
						    <asp:Button runat="server" CssClass="btn btn-block btn-success" ID="btnBlobGen"  Text="Generate Payslip" OnClick="btnBlobGen_OnClick"></asp:Button>
					    </div>

					</div>
				</div>
                    </div>
             <br/>
		
               <div class="row" style="width: 100%; display: block; margin: auto;">
                    <div runat="server" id="feedback"></div>
                   <br/>
                       <div style="margin: 10px;"><iframe runat="server" ID="payslipView" width="100%" height="500px"></iframe>
                    </div>
    
                </div>
        </div>
</asp:Content>

