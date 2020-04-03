<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="NIT.Rates" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
    <!-- Main content -->
    <section>
      <div class="row">
        <div class="col-md-12">
            <div class="panel-body">
             <div id="ratefeedback" runat="server"></div>
                <div class="form-group">
                    <div class="col-md-3">
                        <label><strong>5 Point Rating</strong></label>
                    </div>
                    <div class="col-md-5">
                        <asp:DropdownList ID="ddlRates" CssClass="form-control" runat="server" AutoPostBack="False">
                            <asp:ListItem>--Select Rate--</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropdownList>
                    </div>
                   <div class="col-md-6"></div>
                </div>
               
            </div>
               <div class="panel-footer">
                   <span class="btn btn-warning pull-left btn-sm">
                        <i class="fa fa-arrow-circle-left"></i>&nbsp; <asp:Button runat="server" ID="btnBack" style="background: none;border: 0"  Text="Back" OnClick="btnBack_OnClick"></asp:Button>
                    </span> 

                    <span class="btn btn-success pull-right btn-sm">
                        <i class="fa fa-save"></i>&nbsp; <asp:Button runat="server" ID="btnSubmitRate"  style="background: none;border: 0" Text="Submit Rating" OnClick="btnSubmitRate_OnClick"></asp:Button>
                    </span> 
               <div class="clearfix"></div>
              </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
</asp:Content>