<%@ Page Title="" Language="C#" MasterPageFile="~/master/admin_master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/Admin/admin_home.css" rel="stylesheet" />
    <script src="../js/Admin/admin_js.js"></script>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <div class="container box-shadow" id="adm_body_div">
         <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
        <div  id="adm_menu_left">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="index.aspx" id="hm_adm">Home</a></li>
                
                <li><a href="#" id="add_std_mnu">Add Student</a></li>
                <li><a href="#" id="add_teacher_mnu">Add Faculty</a></li>
                <li><a href="#" id="mk_arng_mnu">Make Arrangement</a></li>
                <li><a href="#" id="vw_arng_mnu">View Arrangement</a></li>
                <li><a href="#" id="mk_pub_rout_mnu">Make & Publish Routine</a></li>
                <li><a href="#" id="mk_pub_dr_mnu">Make & Publish Duty Roster</a></li>
                <li><a href="#" id="pr_gen_mnu">Progress Report Generation</a></li>
                <li><a href="#" id="exm_req_mnu">Exam. Specific Requirements</a></li>
                    <%--<div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label"></label>
                    <div class="col-sm-9">
                        <input type="text" id="Text2" placeholder="" class="form-control" />
                    </div>
                </div>--%>
                
                
            </ul>
        </div>

         <%--<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Submit">--%>

        <div id="adm_form">

            <!--Header-->
            <%--</form>--%>

            <!--  Body  -->
            <!--        ADD STUDENT         -->
            <div id="adm_home_pg">
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> ADMIN</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                    <div id="home_img_div" class="form-group text-center">
                        <asp:Image ID="Image1" CssClass="form-control" runat="server" Height="281px" Width="221px" >
                        </asp:Image>
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="glyphicon glyphicon-pencil" OnClick="UpdateImage" />
                    </div>
                    <div id="home_info_div">
                        <div class="form-group">
                            <asp:Label ID="Label1" CssClass="col-sm-3 control-label col-sm-offset-2" runat="server" Text="NAME"></asp:Label>
                            <div class="col-sm-6">
                               <asp:Label ID="Label2" CssClass="col-md-6 control-label text-left text-uppercase" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" CssClass="col-sm-3 control-label col-sm-offset-2" runat="server" Text="EMAIL"></asp:Label>
                        
                            <div class="col-sm-6">
                                <asp:Label ID="Label4" CssClass="col-sm-8 control-label text-left" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label5" CssClass="col-sm-3 control-label col-sm-offset-2" runat="server" Text="DATE OF BIRTH"></asp:Label>
                            <div class="col-sm-6">
                                <asp:Label ID="Label6" CssClass="col-sm-6 control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label7" CssClass="col-sm-3 control-label col-sm-offset-2" runat="server" Text="YEAR OF JOINING"></asp:Label>
                            <div class="col-sm-6">
                                <asp:Label ID="Label8" CssClass="col-sm-5 control-label text-right" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label9" CssClass="col-sm-3 control-label col-sm-offset-2" runat="server" Text="DESIGNATION"></asp:Label>
                            <div class="col-sm-6">
                                <asp:Label ID="Label10" CssClass="col-sm-8 control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            

            <div id="add_std">

            <%--<form class="form-horizontal"  role="form">--%>
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> Add Student</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                    <div class="form-group" id="err_msg" runat="server">
                        <asp:Label ID="submit_msg" CssClass="col-sm-6 col-sm-offset-3" Font-Size="Large" runat="server"></asp:Label>
                        
                    </div>
                    <hr class="mt-2 mb-2"/>
                    <div class="form-group">
                        <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Full Name</label>
                        <div class="col-sm-6">
                            <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>

                            <asp:TextBox ID="name" CssClass="form-control" runat="server" ></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Father's Name</label>
                        <div class="col-sm-6">
                            <input type="text" id="fname" placeholder="Candidate's Father's Name" class="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Mother's Name</label>
                        <div class="col-sm-6">
                            <input type="text" id="mname" placeholder="Candidate's Mother's Name" class="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Email</label>
                        <div class="col-sm-6">
                            <input type="email" id="email" placeholder="Email" class="form-control" runat="server"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Alternate Email</label>
                        <div class="col-sm-6">
                            <input type="email" id="alt_email" placeholder="Alternate Email" class="form-control" runat="server"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Contact No.</label>
                        <div class="col-sm-6">
                            <input type="text" id="contact" placeholder="Contact No." class="form-control" runat="server"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthDate" class="col-sm-2 col-sm-offset-2 control-label">Date of Birth</label>
                        <div class="col-sm-6">
                            <input type="date" id="birthDate" class="form-control" runat="server"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Address</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="3" id="adds" placeholder="Enter Address of the Student" runat="server"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Contact No.</label>
                        <div class="col-sm-6">
                            <input type="text" id="pin" placeholder="Pin No." class="form-control" runat="server"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="country" class="col-sm-2 col-sm-offset-2 control-label">Country</label>
                        <div class="col-sm-6">
                            <select id="country" class="form-control" runat="server">
                            
                                <option>India</option>
                                <option>Other</option>
                            </select>
                        </div>
                    </div> <!-- /.form-group -->
                    <div class="form-group">
                        <asp:Label ID="Label36" CssClass="col-sm-2 col-sm-offset-2 control-label" Font-Bold="true" runat="server" Text="Image"></asp:Label>
                        <div class="col-sm-6">
                            <asp:FileUpload ID="Image_Upload1" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-sm-offset-2">Gender</label>
                        <div class="col-sm-6">
                            <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" Width="195px" ForeColor="#0066CC">
                                <asp:ListItem Selected="True">Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div> <!-- /.form-group -->
                </div>
                
                <div>
                <div class="form-horizontal" role="form">
                <hr class="mt-4 mb-4"/>
                    <div class="form-group">
                        <label for="country" class="col-sm-2 col-sm-offset-2 control-label">Department</label>
                        <div class="col-sm-6">
                            <select id="std_dept" class="form-control" runat="server">
                                <option value="CSE">CSE</option>
                                <option value="ECE">ECE</option>
                                <option value="ME">ME</option>
                                <option value="IT">IT</option>
                            </select>
                        </div>
                    </div> <!-- /.form-group -->
                    <div class="form-group">
                        <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Session</label>
                        <div class="col-sm-6">
                            <input type="text" id="std_session" placeholder="" required="required" class="form-control" runat="server"/>
                        </div>
                    </div>
                        <%--<asp:Button ID="st_submit" runat="server" Text="Add Teacher" OnClick="Add_Teacher_Submit" CausesValidation="False" ></asp:Button>--%>

                    <div class="form-group">
                    
						    <div class="col-sm-12 text-center">
                                <%--<asp:Button ID="st_submit" runat="server" Text="Add Staff" OnClick="Add_Staff" ></asp:Button>--%>
                                     <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Add Student" OnClick="Add_Student_Submit"/>
						    </div>
					
                    </div>
                </div>
                </div>

            </div>

            <!--        ADD TEACHER         -->
            <div id="add_teacher">
                <%--</form>--%>
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> Add Teacher</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                    <div class="form-group" id="err_msg_staff" runat="server">
                        <asp:Label ID="submit_msg_staff" CssClass="col-sm-6 col-sm-offset-3" Font-Size="Large" runat="server"></asp:Label>
                        
                    </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 col-sm-offset-2 control-label">Full Name</label>
                    <div class="col-sm-6">
                       <input type="text" id="st_name" placeholder="Full Name" class="form-control" runat="server" />
                        <%--<form class="form-horizontal"  role="form">--%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" id="st_email" placeholder="Email" class="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Alternate Email</label>
                    <div class="col-sm-6">
                        <input type="email" id="st_alt_email" placeholder="Alternate Email" class="form-control" runat="server"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Contact No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="st_contact" placeholder="Contact No." class="form-control" runat="server"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-2 col-sm-offset-2 control-label">Date of Birth</label>
                    <div class="col-sm-6">
                        <input type="date" id="st_dob" class="form-control" runat="server"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Address</label>
                    <div class="col-sm-6">
                        <textarea class="form-control" rows="3" id="st_ads" placeholder="Enter Address of the Student" runat="server"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Pin No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="st_pin" placeholder="Pin No." class="form-control" runat="server"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="country" class="col-sm-2 col-sm-offset-2 control-label" >Country</label>
                    <div class="col-sm-6">
                        <select id="st_country" class="form-control" runat="server">
                            
                            <option>India</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div> <!-- /.form-group -->
                    <div class="form-group">
                        <asp:Label ID="Label37" CssClass="col-sm-2 col-sm-offset-2 control-label" Font-Bold="true" runat="server" Text="Image"></asp:Label>
                        <div class="col-sm-6">
                            <asp:FileUpload ID="Image_Upload2" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                <div class="form-group">
                    <label class="control-label col-sm-2 col-sm-offset-2">Gender</label>
                    <div class="col-sm-6">
                        <%--<input type="email" id="Email4" placeholder="Alternate Email" class="form-control"/>--%>

                         <asp:RadioButtonList ID="st_gender" runat="server" RepeatDirection="Horizontal" Width="195px" ForeColor="#0066CC">
                            <asp:ListItem Selected="True">Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>

                    </div>
                </div> <!-- /.form-group -->
                </div>
                <div>
                 
                <div class="form-horizontal" role="form">
                    <hr class="mt-4 mb-4"/>
                <div class="form-group">
                    <label for="country" class="col-sm-2 col-sm-offset-2 control-label">Department</label>
                    <div class="col-sm-6">
                        <select id="st_dept" class="form-control" runat="server">
                            <option>CSE</option>
                            <option>ECE</option>
                            <option>ME</option>
                            <option>IT</option>
                        </select>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Year of Joining</label>
                    <div class="col-sm-6">
                        <input type="text" id="st_year" placeholder="" class="form-control" required="required" runat="server"/>
                    </div>
                </div>
                    <%--<input type="email" id="email3" placeholder="Email" class="form-control"/>--%>
                    <div class="form-group">
                    
						<div class="col-sm-12 text-center">
                            <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>                      
                              <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>                     
                               <%--<input type="email" id="Email4" placeholder="Alternate Email" class="form-control"/>--%>
                            <asp:Button ID="myBtnID100" CssClass="btn btn-primary" runat="server" Text="Add TEACHER" OnClick="Add_Teacher_Submit"/>
						</div>
					
                </div>

                    </div>
                </div>
                <%--<input type="email" id="email3" placeholder="Email" class="form-control"/>--%>
                </div>


            <!--        MAKE ARRANGEMENT         -->

            <div id="make_arrange">
                <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> Make Arrangement</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">

                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Date</label>
                    <div class="col-sm-6">
                        <ASP:TextBox runat="server" CssClass="form-control" ID="txtDate"></ASP:TextBox>

                    </div>
                </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-sm-offset-2 control-label">Time</label> 
                        <div class="col-sm-6">
                            <input type="time" id="mk_ar_time" class="form-control" runat="server"/>
                        </div>
                    </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Exam Type</label>
                    <div class="col-sm-6">
                        <select id="mk_ar_exmtype" runat="server" class="form-control">
                            <option>...........Select Exam........</option>
                            <option>Internal</option>
                            <option>Semester Theory</option>
                            <%--<option>Semester Lab</option>--%>
                        </select>

                    </div>
                </div>

                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Room No</label>
                    <div class="col-sm-6">
                        <input type="text" runat="server" id="mk_ar_roomno"  class="form-control"/>

                    </div>
                </div>
                    <%--
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Capacity</label>
                    <div class="col-sm-6">
                        <input type="text" runat="server" id="mk_ar_cap"  class="form-control"/>

                    </div>
                </div>
                    --%>

                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Row</label>
                    <div class="col-sm-6">
                        <input type="text" runat="server" id="mk_ar_row"  class="form-control"/>

                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Column</label>
                    <div class="col-sm-6">
                        <input type="text" runat="server" id="mk_ar_col"  class="form-control"/>

                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Year 1</label>
                    <div class="col-sm-6">
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                        <select id="mk_ar_year1" runat="server" class="form-control">
                            <option>..........Select Year.........</option>
                            <option> 1St Year</option>
                            <option> 2nd Year</option>
                            <option> 3rd Year</option>
                            <option> 4th Year</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Department</label>
                    <div class="col-sm-6">
                        <%--<div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Total Student</label>
                    <div class="col-sm-6">
                        <input type="text" id="mk_ar_ttlstd" placeholder="Candidate's Mother's Name" class="form-control" runat="server" />
                        
                    </div>
                </div>--%>
                        <select id="mk_ar_dept1" runat="server" class="form-control">
                            <option> Select The Depertment</option>
                            <option> CSE</option>
                            <option> ECE</option>
                            <option> IT</option>
                            <option> ME</option>

                        </select>
                    </div>
                </div>
                

                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Start Roll No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="mk_ar_strtroll1" placeholder="Enter The Starting Roll No" class="form-control" runat="server" />
                    </div>
                </div>
                <%--<div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">End Roll No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="mk_ar_endroll1" placeholder="Enter The End Roll No" class="form-control" runat="server" />
                        
                    </div>
                </div>--%>

                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Year 2</label>
                    <div class="col-sm-6">
                        <%--</form>--%>
                        <select id="mk_ar_year2" runat="server" class="form-control">
                            <option>..........Select Year.........</option>
                            <option> 1St Year</option>
                            <option> 2nd Year</option>
                            <option> 3rd Year</option>
                            <option> 4th Year</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Department</label>
                    <div class="col-sm-6">
                        <%--<form class="form-horizontal"  role="form">--%>
                        <select id="mk_ar_dept2" runat="server" class="form-control">
                            <option> Select The Depertment</option>
                            <option> CSE</option>
                            <option> ECE</option>
                            <option> IT</option>
                            <option> ME</option>

                        </select>
                    </div>
                </div>
                

                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Start Roll No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="mk_ar_strtroll2" placeholder="Enter The Starting Roll No" class="form-control" runat="server" />
                        <%--</form>--%>
                    </div>
                </div>
                <%--<div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">End Roll No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="mk_ar_endroll2" placeholder="Enter The End Roll No" class="form-control" runat="server" />
                        
                    </div>
                </div>--%>
                <div class="form-group">
                    
					<div class="col-sm-12 text-center">
                                <asp:Button ID="mk_arrangement" CssClass="btn btn-primary" runat="server" Text="Make Arrangement" onClick="MakeArrangement"/>
					</div>
					
                </div>
                </div>
                
            <%--<input type="text" id="Text13" placeholder="Full Name" class="form-control" />--%>
            </div>


            <!--            View Arrangement                -->

            <div id="view_arrange">
                <%--<option>......Select Semester......</option>--%>
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> View Arrangement</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="firstName" class="col-sm-2 control-label col-sm-offset-1">Room No</label>
                        <div class="col-sm-4">
                            <%--<input type="text" class="form-control" runat="server" id="vw_arng_rno" />--%>
                            <asp:DropDownList ID="vw_arng_rno" CssClass="form-control text-center" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-sm-4 text-center">
                            <asp:Button ID="vw_arng_btn" CssClass="btn btn-primary" runat="server" Text="View Arrangement" OnClick="ViewArrangement" />
                        </div>
                    </div>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form" id="vw_arng_div" runat="server">
                    <%--<hr class="mt-2 mb-2"/>--%>
                    <div class="form-group">
                        <div class="col-sm-3 col-sm-offset-1">
                            <asp:Label ID="Label17" CssClass="col-sm-7 text-uppercase" runat="server" Text="Room No:"></asp:Label>
                            <asp:Label ID="Label18" CssClass="col-sm-5" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label ID="Label19" CssClass="col-sm-3 text-uppercase" runat="server" Text="Date:"></asp:Label>
                            <asp:Label ID="Label20" CssClass="col-sm-9" runat="server"></asp:Label>
                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label21" CssClass="col-sm-3 text-uppercase" runat="server" Text="Exam:"></asp:Label>
                            <asp:Label ID="Label22" CssClass="col-sm-9 text-uppercase" runat="server"></asp:Label>
                        </div>
                        
                    </div>
                    <hr class="mt-2 mb-2"/>
                    <div class="form-group ">
                        <div class="col-sm-12 text-center">
                            <asp:GridView ID="view_arrangement_grid" runat="server"  AutoGenerateColumns="false"  DataKeyNames = "Id" CssClass="text-center">
                                <Columns>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col3") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col4") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col5") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col6") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col7") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_duty_nos" CssClass="form-control" runat="server" Text='<%# Bind("Col8") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                
            </div>


            <!--       Make & Publish Routine        -->

            <div id="make_pub_routine">
                <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> Make And Publish Routine</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">

                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Year</label>
                    <div class="col-sm-6">
                        <select id="mk_rt_year" runat="server" class="form-control">
                            <option value="1st">1St Year</option>
                            <option value="2nd">2nd Year</option>
                            <option value="3rd">3rd Year</option>
                            <option value="4th">4th Year</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Exam. Type</label>
                    <div class="col-sm-6">
                        <%--<option> Select The Depertment</option>--%>                        <%--<input type="datetime" runat="server" id="mk_rt_dt1" class="form-control"/>--%>
                        <select id="mk_rt_exm" runat="server" class="form-control">
                            <%--<input type="datetime" runat="server" id="mk_rt_dt2" class="form-control"/>--%>
                            <option> Internal 1</option>
                            <option> Internal 2</option>
                            <option> Semester Lab</option>
                            <option> Semester Theory</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Semester</label>
                    <div class="col-sm-6">
                        <%--<input type="datetime" runat="server" id="mk_rt_dt3" class="form-control"/>--%>
                        <select id="mk_rt_sem" class="form-control" runat="server">
                            <%--<input type="datetime" runat="server" id="mk_rt_dt4" class="form-control"/>--%>
                            <option value="Sem 1">Semester1</option>
                            <option value="Sem 2">Semester2</option>
                            <option value="Sem 3">Semester3</option>
                            <option value="Sem 4">Semester4</option>
                            <option value="Sem 5">Semester5</option>
                            <option value="Sem 6">Semester6</option>
                            <option value="Sem 7">Semester7</option>
                            <option value="Sem 8">Semester8</option>

                        </select>
                        
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 col-sm-offset-2 control-label">Department</label>
                    <div class="col-sm-6">
                        <select id="mk_rt_dept" runat="server" class="form-control"> 
                            <option>CSE</option>
                            <option>ECE</option>
                            <option>IT</option>
                            <option>ME</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 col-sm-offset-2 control-label">Time</label> 
                    <div class="col-sm-6">
                        <input type="time" id="mk_rt_time" class="form-control" runat="server"/>
                    </div>
                </div>

                    <div class="form-group">
                    <label class="col-sm-2 col-sm-offset-2 control-label">No of Subjects</label> 
                    <div class="col-sm-6">
                        <select runat="server" id="mk_rt_nosub" class="form-control">
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12 text-center">
                        <asp:Button ID="mk_rt_get_sub" CssClass="btn btn-primary" runat="server" Text="Get Subjects" OnClick="GetSubjects" />
                    </div> 
                </div>
            </div>
            <div class="form-horizontal" role="form" id="mk_rt_getsubdiv" runat="server">
                <hr class="mt-4 mb-4"/>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Subject 1</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="mk_rt_sub1" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <%--<asp:Button ID="mk_routine" runat="server" Text="Make Routine" onClick="MakeRoutine"/>--%>
                        <asp:TextBox ID="mk_rt_dt1" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CalendarExtender ID="mk_rt_dt1_CalendarExtender" runat="server" Enabled="True" TargetControlID="mk_rt_dt1">
                        </asp:CalendarExtender>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Subject 2</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="mk_rt_sub2" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <%--</form>--%>
                        <asp:TextBox ID="mk_rt_dt2" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CalendarExtender ID="mk_rt_dt2_CalendarExtender" runat="server" Enabled="True" TargetControlID="mk_rt_dt2">
                        </asp:CalendarExtender>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Subject 3</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="mk_rt_sub3" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <%--<form class="form-horizontal"  role="form">--%>
                        <asp:TextBox ID="mk_rt_dt3" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CalendarExtender ID="mk_rt_dt3_CalendarExtender" runat="server" Enabled="True" TargetControlID="mk_rt_dt3">
                        </asp:CalendarExtender>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Subject 4</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="mk_rt_sub4" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                            <asp:TextBox ID="mk_rt_dt4" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CalendarExtender ID="mk_rt_dt4_CalendarExtender" runat="server" Enabled="True" TargetControlID="mk_rt_dt4">
                        </asp:CalendarExtender>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Subject 5</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="mk_rt_sub5" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                        <asp:TextBox ID="mk_rt_dt5" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CalendarExtender ID="mk_rt_dt5_CalendarExtender" runat="server" Enabled="True" TargetControlID="mk_rt_dt5">
                        </asp:CalendarExtender>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Subject 6</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="mk_rt_sub6" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                            <asp:TextBox ID="mk_rt_dt6" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CalendarExtender ID="mk_rt_dt6_CalendarExtender" runat="server" Enabled="True" TargetControlID="mk_rt_dt6" >
                        </asp:CalendarExtender>
                    </div>
                </div>
                
                <div class="form-group">
                    
						<div class="col-sm-12 text-center">
                            
                            <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" Text="Make Routine"  OnClick="MakeRoutine"/>
						</div>
					
                </div>
                </div>
                
            <%--<form class="form-horizontal"  role="form">--%>
            </div>



            <!--        Make & Publish Duty Roster       -->

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

            <!--            Progress Report Generation          -->

            <div id="pr_gen">
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i>Progress Report Generation</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                
                    <div class="form-group">
                        <asp:Label ID="Label15"  CssClass="col-sm-2 col-sm-offset-3 control-label" runat="server" Text="Year"></asp:Label>
                        <div class="col-sm-4">
                            <select id="pr_gen_year" runat="server" class="form-control">
                                <option>..........Select Year.........</option>
                                <option value="1st"> 1St Year</option>
                                <option value="2nd"> 2nd Year</option>
                                <option value="3rd"> 3rd Year</option>
                                <option value="4th"> 4th Year</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label23" CssClass="col-sm-2 col-sm-offset-3 control-label" runat="server" Text="Semester"></asp:Label>
                        <div class="col-sm-4">
                            <select id="pr_gen_sem" runat="server" class="form-control">
                                <option value="Sem 1">Semester 1</option>
                                <option value="Sem 2">Semester 2</option>
                                <option value="Sem 3">Semester 3</option>
                                <option value="Sem 4">Semester 4</option>
                                <option value="Sem 5">Semester 5</option>
                                <option value="Sem 6">Semester 6</option>
                                <option value="Sem 7">Semester 7</option>
                                <option value="Sem 8">Semester 8</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label16" CssClass="col-sm-2 col-sm-offset-3 control-label" runat="server" Text="Department"></asp:Label>
                        <div class="col-sm-4">       
                            <select id="pr_rpt_gen_stddept" runat="server" class="form-control">
                                <option value="0"> Select The Depertment</option>
                                <option value="CSE"> Computer Science</option>
                                <option value="ECE"> Electronics And Communication</option>
                                <option value="IT"> Information Technology</option>
                                <option value="ME"> Mechanical</option>

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <asp:Button ID="pr_rpt_getmrks" CssClass="btn btn-primary" runat="server" Text="View Marks" onClick="ViewObtainMarks"/>
						</div>
                    </div>
                </div>
                <div class="form-horizontal" role="form" id="vw_obtn_mrks_div" runat="server">
                    <hr class="mt-2 mb-2"/>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                            <asp:Label ID="Label24" CssClass="col-sm-1 text-uppercase" runat="server"></asp:Label>
                            <asp:Label ID="Label25" CssClass="col-sm-10" runat="server"></asp:Label>
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                            <asp:Label ID="Label30" CssClass="col-sm-1 text-uppercase" runat="server"></asp:Label>
                            <asp:Label ID="Label31" CssClass="col-sm-10" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                            <asp:Label ID="Label26" CssClass="col-sm-1 text-uppercase" runat="server"></asp:Label>
                            <asp:Label ID="Label27" CssClass="col-sm-10" runat="server"></asp:Label>
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                            <asp:Label ID="Label32" CssClass="col-sm-1 text-uppercase" runat="server"></asp:Label>
                            <asp:Label ID="Label33" CssClass="col-sm-10" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                            <asp:Label ID="Label28" CssClass="col-sm-1 text-uppercase" runat="server"></asp:Label>
                            <asp:Label ID="Label29" CssClass="col-sm-10" runat="server"></asp:Label>
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                            <asp:Label ID="Label34" CssClass="col-sm-1 text-uppercase" runat="server"></asp:Label>
                            <asp:Label ID="Label35" CssClass="col-sm-10" runat="server"></asp:Label>
                        </div>
                    </div>
                    <hr class="mt-2 mb-2"/>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-1 text-center">
                            <asp:GridView ID="view_std_marks" runat="server" AutoGenerateColumns="false"  DataKeyNames = "Id" CssClass="text-center">
                                <Columns>
                                    <asp:TemplateField HeaderText="#" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_nos" CssClass="form-control" runat="server" Text='<%# view_std_marks.Rows.Count + 1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Roll No" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_roll" CssClass="form-control" runat="server" Text='<%# Bind("Roll_No") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S1" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_s1" CssClass="form-control" runat="server" Text='<%# Bind("Sub1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S2" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_s2" CssClass="form-control" runat="server" Text='<%# Bind("Sub2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S3" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_s3" CssClass="form-control" runat="server" Text='<%# Bind("Sub3") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S4" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_s4" CssClass="form-control" runat="server" Text='<%# Bind("Sub4") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S5" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_s5" CssClass="form-control" runat="server" Text='<%# Bind("Sub5") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="S6" HeaderStyle-CssClass="col-sm-1 text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="view_std_marks_s6" CssClass="form-control" runat="server" Text='<%# Bind("Sub6") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <asp:Button ID="pr_rpt_gen_btn" runat="server" CssClass="btn btn-primary" Text="Generate Progress Report" OnClick="ProgressReportGen" />
                        </div>
                    </div>
                </div>
            </div>

            <!--            Exam. Specific Requireme            -->

            <div id="es_req">
                <%--</form>--%>
                <div class="text-center">
                    <h3><i class="fa fa-envelope"></i> Exam Specific Requirement</h3>
                    <hr class="mt-2 mb-2"/>
                </div>
                <div class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 col-sm-offset-1 control-label">Date:</label>
                    <div class="col-sm-6">
                        <input type="text" id="exm_sp_req_date" placeholder="Exam. Date" runat="server" class="form-control" />
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 col-sm-offset-1 control-label">Time:</label>
                    <div class="col-sm-6">
                        <input type="text" id="exm_sp_req_time" placeholder="Exam Time" runat="server" class="form-control" />
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Room No.</label>
                    <div class="col-sm-6">
                        <input type="text" id="exm_sp_req_rno" runat="server" placeholder="Enter Room No" class="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 col-sm-offset-1 control-label">Exam Type</label>
                    <div class="col-sm-6">
                        <select id="exm_sp_req_exmtype" runat="server" class="form-control">
                            <option>...........Select Exam........</option>
                            <option>Internal</option>
                            <option>Semester Theory</option>
                            <option>Semester Lab</option>
                        </select>

                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Year 1</label>
                    <div class="col-sm-6">
                        <select id="exm_sp_req_yr1" runat="server" class="form-control">
                            <option>..........Select Year.........</option>
                            <option> 1St Year</option>
                            <option> 2nd Year</option>
                            <option> 3rd Year</option>
                            <option> 4th Year</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Department 1</label>
                    <div class="col-sm-6">
                        <select id="exm_sp_req_dept1" runat="server" class="form-control">
                            <option> Select The Depertment</option>
                            <option> CSE</option>
                            <option> ECE</option>
                            <option> IT</option>
                            <option> ME</option>

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 col-sm-offset-1 control-label">Total Question Paper 1</label>
                    <div class="col-sm-6">
                        <input type="text" id="exm_sp_req_ttlqp1" placeholder="Total no of Question Paper" runat="server" class="form-control" />
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Other Requirements 1</label>
                    <div class="col-sm-4">
                        <input type="text" id="exm_sp_req_othreq1" placeholder="Other Requerments" runat="server" class="form-control"/>
                        <%--<input type="text" id="exm_sp_req_otrnos" placeholder="no of req " runat="server" class="form-control" />--%>
                    </div>
                    <div class="col-sm-2">
                        <%--<input type="text" id="Text2" placeholder="Other Requerments" runat="server" class="form-control"/>--%>
                        <input type="text" id="exm_sp_req_otrnos1" placeholder="no of req " runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Year 2</label>
                    <div class="col-sm-6">
                        <select id="exm_sp_req_yr2" runat="server" class="form-control">
                            <option>..........Select Year.........</option>
                            <option> 1St Year</option>
                            <option> 2nd Year</option>
                            <option> 3rd Year</option>
                            <option> 4th Year</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Department 2</label>
                    <div class="col-sm-6">
                        <select id="exm_sp_req_dept2" runat="server" class="form-control">
                            <option> Select The Depertment</option>
                            <option> CSE</option>
                            <option> ECE</option>
                            <option> IT</option>
                            <option> ME</option>

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 col-sm-offset-1 control-label">Total Question Paper 2</label>
                    <div class="col-sm-6">
                        <input type="text" id="exm_sp_req_ttlqp2" placeholder="Total no of Question Paper" runat="server" class="form-control" />
                        <%--<span class="help-block">Last Name, First Name, eg.: Smith, Harry</span>--%>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email" class="col-sm-3 col-sm-offset-1 control-label">Other Requirements 2</label>
                    <div class="col-sm-4">
                        <input type="text" id="exm_sp_req_othreq2" placeholder="Other Requerments" runat="server" class="form-control"/>
                        <%--<input type="text" id="exm_sp_req_otrnos" placeholder="no of req " runat="server" class="form-control" />--%>
                    </div>
                    <div class="col-sm-2">
                        <%--<input type="text" id="Text2" placeholder="Other Requerments" runat="server" class="form-control"/>--%>
                        <input type="text" id="exm_sp_req_othnos2" placeholder="no of req " runat="server" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    
						<div class="col-sm-12 text-center">
							<%--<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Submit">--%>
                                 <asp:Button ID="exm_sp_req_btn" runat="server" CssClass="btn btn-primary" Text="Exam Specific Req" onClick="ExmSpecificReq"/>
						</div>
					
                </div>
               
                </div>
                
            <%--</form>--%>
            </div>



        
        </div>

    </div>

</asp:Content>

