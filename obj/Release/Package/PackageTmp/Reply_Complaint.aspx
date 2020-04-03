<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reply_Complaint.aspx.cs" Inherits="NIT.Reply_Complaint" MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="NIT" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        <div class="row">
        <div class="col-md-12">
          <div class="panel panel-outline card-info">
            <div class="panel-header">
              <h4 class="panel-title">
               <strong>Student Complaint</strong> 
              </h4>
            </div>
            <!-- /.card-header -->
            <div class="panel-body">
              <div class="mb-3">
                  <asp:TextBox runat="server" placeholder="please input your complaint here" TextMode="MultiLine" ID="txtAreaStdComplain" 
                      CssClass="form-control" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; 
                      padding: 10px;" Enabled="False"></asp:TextBox>
              
                   </div>
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      <br/>
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-outline card-info">
            <div class="panel-header">
              <h4 class="panel-title">
               <strong>Reply to the Complaint (Max Characters: 100)</strong> 
              </h4>
            </div>
            <!-- /.card-header -->
            <div class="panel-body">
               <%-- <input type="text" runat="server" id="inputtest" name="inputtest" class="form-control" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"/>
               --%> 
              <div class="mb-3">
              <div id="complainfeedback" runat="server"></div>
                  <label id="lblCharleftTextarea" title=""></label>
                  <asp:TextBox runat="server" placeholder="please input your complaint here" TextMode="MultiLine" ID="txtareaComplaintReply" 
                      CssClass="form-control" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; 
                      padding: 10px;" MaxLength="10"
                      onKeyUp="javascript:CheckTextArea(this, 100);" onChange="javascript:CheckTextArea(this, 100);"></asp:TextBox>
              
                   </div>
              <br/>
            <div class="row">
                <span class="btn btn-warning pull-left btn-sm">
                    <i class="fa fa-arrow-circle-left"></i>&nbsp; <asp:Button runat="server" ID="btnBack" style="background: none;border: 0"  Text="Back" OnClick="btnBack_OnClick"></asp:Button>
                </span> 
                <span class="btn btn-success pull-right btn-sm">
                    <i class="fa fa-save"></i>&nbsp; <asp:Button runat="server" ID="btnSaveComplainReply"  style="background: none;border: 0" Text="Save Complaint" OnClick="btnSaveComplainReply_OnClick"></asp:Button>
                </span> 
            </div>
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
</section>
<!-- /.content -->
      
<script>
function CheckTextArea(textArea, maxLength) {
    document.getElementById("lblCharleftTextarea").innerHTML = maxLength - textArea.value.length + " characters left";
    if (textArea.value.length > maxLength) {
        document.getElementById("lblCharleftTextarea").style.color = "red";
        textArea.value = textArea.value.substr(0, maxLength);
        document.getElementById("lblCharleftTextarea").innerHTML = maxLength - textArea.value.length + " characters left";
    }
    else if (textArea.value.length < maxLength) {
        document.getElementById("lblCharleftTextarea").style.color = "Black";
    }
    else {
        document.getElementById("lblCharleftTextarea").style.color = "red";
    }
}
</script>
</div>
<!-- /.content-wrapper -->
</asp:Content>
