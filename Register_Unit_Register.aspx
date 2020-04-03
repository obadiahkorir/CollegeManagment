<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Unit_Register.aspx.cs" Inherits="NIT.Register_Unit_Register" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="NIT" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
    <!-- Main content -->
<section>
    <div class="panel panel-default">
              <div class="panel-heading"><label>Register for this Unit</label><label class="pull-right"><i class="fa fa-angle-left" style="font-size: 15px;"></i></label></div>
              
               <div class="panel-body">
                  <div id="registrationfeedback" runat="server"></div>
                   <br/>

            <table class="table table-bordered table-striped">
                <tr>
                   <td> Program Name </td>
                  <td>
                       <asp:Textbox runat="server" CssClass="form-control" ID="txtProgram" type="text" Enabled="False"/>
                     <%-- <asp:DropdownList runat="server" CssClass="form-control" ID="ddlProgram"></asp:DropdownList>--%>
                  </td>
                </tr>
                <tr>
                  <td> Module </td>
                  <td>
                      <asp:DropdownList runat="server" CssClass="form-control" ID="ddlModule">
                        <asp:ListItem Value="0">--Select Module--</asp:ListItem>
                        <asp:ListItem Value="1">Module 1</asp:ListItem>
                        <asp:ListItem Value="2">Module 2</asp:ListItem>
                        <asp:ListItem Value="3">Module 3</asp:ListItem>
                  </asp:DropdownList>
                  </td>
              </tr>
                
             <tr>
                <td> Semester </td>
                <td>
                    <asp:DropdownList runat="server" CssClass="form-control" ID="ddlSemester">
                    <asp:ListItem Value="0">--Select Semester--</asp:ListItem>
                    <asp:ListItem Value="1">Semester 1</asp:ListItem>
                    <asp:ListItem Value="2">Semester 2</asp:ListItem>
                    <asp:ListItem Value="3">Semester 3</asp:ListItem>
                </asp:DropdownList>
                </td>
              </tr>

               <tr>
                  <td>Unit Code</td>
                  <td><asp:Textbox runat="server" CssClass="form-control" ID="txtUnitCode" type="text" Enabled="False"/></td>
              </tr>
               <tr>
                  <td>Unit Name</td>
                   <td><asp:Textbox runat="server" CssClass="form-control" ID="txtUnitName" type="text" Enabled="False"/></td>
              </tr>
                 <tr>
                  <td>Tutor Name</td>
                   <td><asp:Textbox runat="server" CssClass="form-control" ID="txtTutorname" type="text" /></td>
              </tr>
                 <tr>
                  <td>Total Hours</td>
                   <td><asp:Textbox runat="server" CssClass="form-control" ID="txtTotalhours" type="number" Enabled="False"/></td>
              </tr>
             
            </table>
         </div>
        <div class="panel-footer">
            <asp:LinkButton runat="server" CssClass="btn btn-warning pull-left" ID="lnkBtnBack2Units" OnClick="lnkBtnBack2Units_OnClick"> <i class="fa fa-arrow-circle-left"></i> Back </asp:LinkButton>
                 
            <asp:LinkButton runat="server" CssClass="btn btn-success pull-right" ID="lnkBtnRegisterUnit" OnClick="lnkBtnRegisterUnit_OnClick"><i class="fa fa-save"></i>&nbsp;Register</asp:LinkButton>
            <div class="clearfix"></div>
        </div>
    </div>
    </section>
</div>

<!-- /.content-wrapper -->
</asp:Content>
