<%@ Page Title="" Language="C#" MasterPageFile="~/master/MasterPage_account.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="account_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #fullscreen_bg {
            margin-top: 150px;
            
        }
        body {
            background-image: url('https://goo.gl/TnXWbS');
            overflow: hidden;
            background-repeat: no-repeat;
            background-size: cover;
        }
        #login_register_btn {
            margin-top: 16px;
            margin-left: 60px;
            outline: none;
        }
        #remember-div {
            margin-left: 90px;
        }
        #lgin_btn {
            padding: 5px 25px;
        }
        #tran {
            opacity: 0.9;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="fullscreen_bg" class="fullscreen_bg">
    <%--<form class="form-signin" runat="server">--%>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4" id="tran">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-signin">
    	                    <h3 class="text-center">SIGN IN</h3> 
                            <div class="form-group">                
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                    </span>
                                    <input type="text" id="emailid" class="form-control" runat="server" placeholder="Email Address" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" id="pwd" runat="server" class="form-control" placeholder="Password" />
                                </div>    

                            </div>

                            <div class="input-group">
                                <div class="checkbox" id="remember-div">
                                    <label>
                                        <input id="login-remember" type="checkbox" name="remember" value="1"/> Remember me
                                    </label>
                                </div>
                            </div>
                            <asp:Button class="btn btn-lg btn-primary btn-block" id="lgin_btn" runat="server" Text="Sign In" OnClick="LogInNow" />
		                    
                            <button id="login_register_btn" type="button" class="btn btn-link"><a href="create_ac.aspx">New User? Register Now</a></button>
                            
	                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--</form>--%>
</div>
</asp:Content>

