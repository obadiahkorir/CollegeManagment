<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Academic_Documents.aspx.cs" Inherits="NIT.Academic_Documents" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!-- Content Wrapper. Contains page content -->
  <div class="panel panel-default" >
    <!-- Main content -->
      <div class="row">
            <!-- /.card-header -->
            <div class="panel-body">
                <label><strong>Academic Documents</strong></label>
                <br/>
                   <asp:GridView ID="tblAcademicDocuments" runat="server" ClientIDMode="Static"
                            CssClass="table table-bordered table-striped datatableview" 
                            Width="100%" AutoGenerateSelectButton="false" EmptyDataText="No Files Found!" 
                            AlternatingRowStyle-BackColor="#F9BE00" AutoGenerateColumns="False" >
                       
                        <Columns>
                            <asp:BoundField DataField="Text" HeaderText="Document Name" />
                            
                            <asp:TemplateField HeaderText="Download File">
                                
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                       </asp:GridView>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
    
  
 
  <!-- /.content-wrapper -->
  </asp:Content>
