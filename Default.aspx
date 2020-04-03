﻿<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NIT._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
<title>Login - NIT</title>
    
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="description" content=""/>
<meta name="author" content=""/> 
<link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
<!-- Bootstrap Core CSS -->
<link href="~/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<!-- MetisMenu CSS -->
<link href="~/vendor/metisMenu/metisMenu.min.css" rel="stylesheet"/>
<!-- Custom CSS -->
<link href="~/dist/css/sb-admin-2.css" rel="stylesheet"/>
<!-- Morris Charts CSS -->
<link href="~/vendor/morrisjs/morris.css" rel="stylesheet"/>
<!-- Custom Fonts -->
<link href="~/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<form id="form1" runat="server">
<div class="row" style="width: 100%; display: block; margin: auto;">
    <div class=" col-sm-2 col-md-3 col-lg-3"></div>
        <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6">
            <p></p>
            <img src="images/logo.png" runat="server" class="img-responsive" style="display: block; margin: auto"/>
            <p></p>
            <div class="panel panel-default">
                <div class="panel-heading" ><strong><i class="fa fa-institution fa-fw"></i>Log in to Portal</strong></div>
                <div class="panel-body">
                    <div class="form-group">
                        <a href="Defaults_Students.aspx" runat="server" style="color: Blue;">Student Portal</a>&nbsp; 
                    </div>
                    <div class="form-group">
                        <a href="Defaults_Tutors.aspx" runat="server" style="color: Blue;">Tutor Portal</a>
                    </div>
                   
                </div>
                <div class="panel-footer" style="background-color:#A9A9A9;"></div>
            </div>
            <label class="pull-right" style="display: block;">&copy; <%: DateTime.Now.Year %> - <a href="#" runat="server" target="blank">Infogain</a></label>
        </div>
        <div class=" col-sm-2 col-md-3 col-lg-3"></div>
    
</div>
</form>
  
</body>
</html>
