<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="true" CodeBehind="File_Complaint.aspx.cs" Inherits="NIT.File_Complaint" MasterPageFile="~/Site.Master" %>
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
               <strong>File Complaints (Max Characters: 100)</strong> 
              </h4>
            </div>
            <!-- /.card-header -->
            <div class="panel-body">
               <%-- <input type="text" runat="server" id="inputtest" name="inputtest" class="form-control" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"/>
               --%> 
              <div class="mb-3">
              <div id="complainfeedback" runat="server"></div>
                  <label id="lblCharleftTextarea" title=""></label>
                  <asp:TextBox runat="server" placeholder="please input your complaint here" TextMode="MultiLine" ID="txtareaComplaint" 
                      CssClass="form-control" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; 
                      padding: 10px;" MaxLength="10"
                      onKeyUp="javascript:CheckTextArea(this, 100);" onChange="javascript:CheckTextArea(this, 100);"></asp:TextBox>
              
                  
                    <%--<textarea class="textarea" placeholder="please text your complaint here" id="txtinputComplaint" name="txtinputComplaint"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" runat="server"></textarea>--%>
              </div>
              <br/>
            <div class="row">
                <span class="btn btn-warning pull-left btn-sm">
                    <i class="fa fa-arrow-circle-left"></i>&nbsp; <asp:Button runat="server" ID="btnBack" style="background: none;border: 0"  Text="Back" OnClick="btnBack_OnClick"></asp:Button>
                </span> 
                <span class="btn btn-success pull-right btn-sm">
                    <i class="fa fa-save"></i>&nbsp; <asp:Button runat="server" ID="btnSaveComplain"  style="background: none;border: 0" Text="Save Complaint" OnClick="btnSaveComplain_OnClick"></asp:Button>
                </span> 
            </div>
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
        
      <div class="row">
        <div class="col-md-12">
          <div class="panel">
            <!-- /.card-header -->
            <div class="panel-body pad">
              <div class="mb-3">
               <div class="panel">
            <div class="panel-header">
              <h4 class="panel-title"><strong>Complaints filed so far</strong></h4>
            </div>
            <!-- /.card-header -->
            <div class="panel-body">
              <table id="filedcomplaints" class="table table-bordered table-striped">
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
                    <%
                        var wsodataconnect = WsConfig.ReturnNavObj();
                        var complaints = wsodataconnect.StudentsComplaints.Where(u => u.UniqNo == Convert.ToInt32(Session["uniqadmNo"])).ToArray();
                        int count = 0;
                    for (int i = 0; i < complaints.Count(); i++)
                    {
                            count++;
                            var onecomplaint = complaints[i];
                    %>
                    <tr>
                        <td><% =count.ToString()%></td>
                        <td><%=Convert.ToDateTime(onecomplaint.Complaint_Date).ToString("dd-MM-yyyy") %></td>
                        <td><%=onecomplaint.Complaint_Text%></td>
                        <td><% =onecomplaint.Complaint_Reply%></td>
                        <td><%=onecomplaint.Status %></td>
                        
                        <%--<td id="counter" runat="server"><% =count%></td>
                        <td id="reportDate" runat="server"><% %></td>
                        <td id="filedComplaintDetails" runat="server"><% %></td>
                        <td id="complainReply" runat="server"><% %></td>
                        <td id="status" runat="server"><% %></td>--%>
                    </tr>
                    <% } %>
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
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
       </div>
    </div>
   </div>
<!-- /.col-->
</div>

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