<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="NIT.Profile" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="container">
    <div class="row">
        <h3 class="page-header" style="font-weight: bold;">Profile Management</h3>
    </div>
  <br/>
<div class="row">
   <div class="panel panel-default" style="padding: 10px; margin: 10px; width: 900px;">
    <div id="Tabs" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li>
                <a href="#profile" aria-controls="academicstaff" role="tab" data-toggle="tab" style="background-color: #008080!important">
                My Profile
                </a>
            </li>
            <li>
                <a href="#changepassword" aria-controls="generalstaff" role="tab" data-toggle="tab" style="background-color: #008080!important">
                Manage Password
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content" style="padding-top: 20px;">
            <div role="tabpanel" class="tab-pane fade in active" id="profile">
                My Profile
                 <div class="panel panel-default" style="border-color: #A9A9A9">
                        <div class="panel-heading" style="background-color: #A9A9A9; color: #ffffff;">
                          Profile
                        </div>
                     <div id="profilemanagementfeedback" runat="server"></div>
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
                            <asp:DropdownList ID="ddlGender" CssClass="form-control" runat="server" Enabled="False">
                                <asp:ListItem Value="-1">--Select Gender--</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">Male</asp:ListItem>
                                <asp:ListItem Value="1">Female</asp:ListItem>
                            </asp:DropdownList>
                        </div>
                      </div><br/>
                    
                          <div class="form-group">
                               <div class="col-sm-offset-2 col-sm-10">
                            <span class="btn btn-success pull-left">
                                <i class="fa fa-plus"></i>&nbsp;
                                <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" Style="background: none; border: 0" OnClick="btnEditProfile_OnClick" OnClientClick="Confirm()" />
                            </span>
                              </div>
                        </div>
                    
                     </div>
                     <!-- /.panel-body -->
                    </div>
            </div>
            <div role="tabpanel" class="tab-pane fade in" id="changepassword">
               Manage Passwords
                        <div class="panel panel-default" style="border-color: #A9A9A9">
                        <div class="panel-heading" style="background-color: #A9A9A9; color: #ffffff;">
                           Change your Password
                        </div>
                        <!-- /.panel-body -->
                     <div class="panel-body">
                        <div class="form-group">
                            <label for="inputPasswordOld" class="col-sm-2 control-label">Old Password</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPasswordOld" placeholder="Enter your old password" runat="server"/>
                            </div>
                          </div><br/>
                    
                          <div class="form-group">
                            <label for="inputPasswordNew" class="col-sm-2 control-label">New Password</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPasswordNew" placeholder="Enter your new password" runat="server"/>
                            </div>
                          </div><br/>
                         
                          <div class="form-group">
                            <label for="inputPasswordNewReenter" class="col-sm-2 control-label">Re-Enter New Password</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPasswordNewReenter" placeholder="Re-enter your new password" runat="server"/>
                            </div>
                          </div><br/>
                    
                          <div class="form-group">
                               <div class="col-sm-offset-2 col-sm-10">
                            <span class="btn btn-success pull-left">
                                <i class="fa fa-lock"></i>&nbsp;
                                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" Style="background: none; border: 0" OnClick="btnChangePassword_OnClick" OnClientClick="ConfirmPasswordChange()" />
                            </span>
                              </div>
                        </div>

                     </div>
                        <!-- /.panel-body -->
                    </div>

            </div>
        </div>
    </div>
</div>
</div>
 
</div>
    
</asp:Content>
