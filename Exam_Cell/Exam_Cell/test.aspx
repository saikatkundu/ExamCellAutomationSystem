<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Exam Cell</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Style.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="test.aspx"><img alt="Logo" src="Image/Camelliait.jpg" height="40" /></a>
                </div>
                <div class="navbar-collapse collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav" >
                        <li class="active"><a href="test.aspx" class="glyphicon glyphicon-home"><%--Home--%></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Examination<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Internal Exam</a></li>
                                <li class="divider"></li>
                                <li class="dropdown-header">Semester Exam.</li>
                                <li><a href="#">Lab</a></li>
                                <li><a href="#">Theory</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Department<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li ><a href="#">CSE</a></li>
                                <li ><a href="#">ECE</a></li>
                                <li ><a href="#">IT</a></li>
                                <li ><a href="#">See All</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Staff<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Teaching</a></li>
                                <li><a href="#">Non-Teaching</a></li>
                            </ul>
                        </li>
                    </ul>
                    <%--<form class="navbar-form">
                        <input type="text" class="form-control" placeholder="Search here.." Id="SearchInputt" style="width: 300px"/>
                        <button type="button" class="btn btn-default" ><span class="glyphicon glyphicon-search"></span></button>
                    </form>--%>
                    <div class="col-sm-3 col-md-3" id="srch">
                        <form class="navbar-form" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" name="q"/>
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                            </div>
                        </div>
                        </form>
                    </div>
                    

                    <ul class="nav navbar-nav pull-right" >
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"> MyAccount<strong class="caret"></strong></span></a>
                            <ul class="dropdown-menu">
                                <%--<li ><a href="#" class="glyphicon glyphicon-refresh"> Update Profile</a></li>
                                <li ><a href="#" class="glyphicon glyphicon-wrench"> Settings</a></li>
                                <li class="divider"></li>
                                <li ><a href="#" class="glyphicon glyphicon-log-out"> Sign Out</a></li>--%>
                                <li><a href="#" class="glyphicon glyphicon-log-in"> Sign In</a></li>
                                <li><a href="#" class=""> Register</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="goru" Height="172px" Width="711px"/>
    </div>
        
    </form>
    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
