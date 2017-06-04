<%@ Page Title="" Language="C#" MasterPageFile="~/master/MasterPage_account.master" AutoEventWireup="true" CodeFile="create_ac.aspx.cs" Inherits="account_create_ac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         body {
            background-image: url('https://goo.gl/TnXWbS');
            overflow: hidden;
            background-repeat: no-repeat;
            background-size: cover;
        }
         #tran {
            opacity: 0.9;
        }
        #fullscreen_bg {
            margin-top: 110px;
        }
        #lgin-reg-btn {
            padding: 5px 25px;
        }
        #red_login_link {
            /*position:relative;*/
            margin-top: 40px;
            margin-left: 120px;
        }
        #login_register_btn {
            margin-left: 120px;
            margin-top: 10px;
            outline: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="fullscreen_bg" class="fullscreen_bg"/>
        <form class="form-signin">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4" id="tran">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h3 class="text-center">SIGN UP</h3>
                                <form class="form form-signup" role="form">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
                                            </span>
                                            <input type="text" class="form-control" placeholder="First Name" />
                                        </div>
                                    </div>
                    
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                            <input type="text" class="form-control" placeholder="Last Name" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                            <input type="text" class="form-control" placeholder="Email" />
                                        </div>
                                    </div>
                    
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                            <input type="password" class="form-control" placeholder="Password" />
                                        </div>
                                    </div>
                    
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                            <input type="text" class="form-control" placeholder="Address" />
                                        </div>
                                    </div>
                    
                                    <div class="form-group">
                                        <div class="input-group date" id="datetimepicker1">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <input type="text" class="form-control" placeholder="Age" />
                                        </div>
                                    </div>
                                  <!--  <script type="text/javascript">
                                        $(function () {
                                            $('#datetimepicker1').datetimepicker();
                                        });
        </script>  -->
                    
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                            <input type="text" class="form-control" placeholder="Contact No." />
                                        </div>
                                    </div>
                                    <%--<a href="http://www.jquery2dotnet.com" class="btn btn-sm btn-primary btn-block" role="button">SUBMIT</a> --%>
                                    <%--<button id="login_register_btn" type="button" class="btn btn-link"> LogIn Here</button>--%>

                                    <button class="btn btn-lg btn-primary btn-block" id="lgin-reg-btn" type="submit"> Register</button>
                                    <%--<a href="login.aspx" id="red_login_link">LogIn Here</a>--%>

                                    <button id="login_register_btn" type="button" class="btn btn-link"><a href="login.aspx"> LogIn Here</a></button>

                                </form>
                            </div>
                
                        </div>
                    </div>
                </div>
            </div>
        </form>
    
     
</asp:Content>

