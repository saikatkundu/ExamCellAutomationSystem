<%@ Page Language="C#" Trace="true" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div class="container">
        
        <div id="make_pub_dr">
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> Make And Publish Duty Roster</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                    <div class="form-group">
                        <asp:Label ID="Label11" CssClass="col-sm-2 control-label col-sm-offset-2" runat="server" Text="Room No"></asp:Label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="mk_pub_dr_rno" CssClass="form-control text-center" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label12" CssClass="col-sm-2 control-label col-sm-offset-2" runat="server" Text="Date"></asp:Label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="mk_pub_dr_date" CssClass="form-control text-center" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label13" CssClass="col-sm-2 control-label col-sm-offset-2" runat="server" Text="Time"></asp:Label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="mk_pub_dr_time" CssClass="form-control text-center" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label14" CssClass="col-sm-2 control-label col-sm-offset-2" runat="server" Text="Exam Type"></asp:Label>
                        <div class="col-sm-4">
                            <select id="mk_pub_dr_etype" class="form-control" runat="server">
                                <option>----------Select Exam--------</option>
                                <option>Internal</option>
                                <option>Semester Theory</option>
                                <option>Semester Lab</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
						<div class="col-sm-12 text-center">
                                 <asp:Button ID="mk_pub_dr_btn" CssClass="btn btn-primary" runat="server" Text="Make Duty Roster" onClick="MakeDutyRoster"/>
						</div>
                    </div>
                </div>
            </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        
    </div>
    </form>
</body>
</html>
