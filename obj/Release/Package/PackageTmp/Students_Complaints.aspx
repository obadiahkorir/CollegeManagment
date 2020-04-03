<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students_Complaints.aspx.cs" Inherits="NIT.Students_Complaints" MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="NIT" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
   
      <div class="row">
        <div class="col-md-12">
          <div class="panel">
            <!-- /.card-header -->
            <div class="panel-body pad">
              <div class="mb-3">
               <div class="panel">
            <div class="panel-header">
              <h4 class="panel-title"><strong>Complaints logged by Students</strong></h4>
            </div>
            <!-- /.card-header -->
            <div class="panel-body">
              <table id="filedcomplaints" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Complain No</th>
                  <th>Complain File Date</th>
                  <th>Complain Details</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        var wsodataconnect = WsConfig.ReturnNavObj();
                        var complaints = wsodataconnect.StudentsComplaints.ToArray();
                        int count = 0;
                    for (int i = 0; i < complaints.Count(); i++)
                    {
                            count++;
                            var onecomplaint = complaints[i];
                    %>
                    <tr>
                        <td><% =count.ToString()%></td>
                        <td><%=onecomplaint.No%></td>
                        <td><%=Convert.ToDateTime(onecomplaint.Complaint_Date).ToString("dd-MM-yyyy") %></td>
                        <td><%=onecomplaint.Complaint_Text%></td>
                        <td><%=onecomplaint.Status %></td>
                        <td><a href="Reply_Complaint.aspx?complainNo=<%=onecomplaint.No %>"><label class="btn btn-info" ><i class="fa fa-edit"></i></label></a></td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Complain No</th>
                  <th>Complain File Date</th>
                  <th>Complain Details</th>
                  <th>Status</th>
                  <th>Action</th>
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