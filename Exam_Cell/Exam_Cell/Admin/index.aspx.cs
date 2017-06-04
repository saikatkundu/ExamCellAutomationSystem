using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Text;
using System.Net;
using System.Net.Mail;

using System.Diagnostics;


public partial class Admin_Default : System.Web.UI.Page
{
    string connection = System.Configuration.ConfigurationManager.ConnectionStrings["ExamConString"].ToString();
    MySqlDataAdapter da;
    DataTable dt;




    protected void Page_Load(object sender, EventArgs e)
    {
        this.err_msg.Visible = false;
        this.err_msg_staff.Visible = false;
        this.vw_obtn_mrks_div.Visible = false;
        this.pr_rpt_gen_btn.Visible = false;
        mk_rt_getsubdiv.Visible = false;
        vw_arng_div.Visible = false;
        if (!IsPostBack) {
            this.GetRoomNo();
        }

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        conn.Open();
        string urlimg = "~/Picture/";
        try
        {
            queryStr = "SELECT * FROM student.user WHERE Email_Id = 'saikat.ks100@gmail.com'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr,conn);
            cmd.ExecuteNonQuery();
            MySqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            Image1.ImageUrl = urlimg + rd["User_Img"].ToString();
            Label2.Text = rd["Name"].ToString();
            Label4.Text = rd["Email_ID"].ToString();
            Label8.Text = rd["Y_O_Join"].ToString();
            Label6.Text = rd["DOB"].ToString();
            rd.Close();
            
        }
        catch (Exception)
        {
            throw;
        }
        finally 
        {
            conn.Close();
        }
    }

    protected void Add_Student_Submit(object sender, EventArgs e)
    {
        //Response.Redirect("~/test.aspx");
        //Page.Title = "Add New Student";

        string student_name = name.Text;
        string s_father_name = fname.Value;
        string s_mother_name = mname.Value;
        string s_email = email.Value;
        string s_alt = alt_email.Value;
        string s_contact = contact.Value;
        string s_dob = birthDate.Value.ToString();
        string s_address = adds.Value;
        string s_pin = pin.Value;
        string s_gen = gender.Text;

        string RollOrStaffId;
        string Name = this.name.Text;
        string Email_ID = this.email.Value;
        string User_Type;
        string Pwd;
        string Y_O_Join = this.std_session.Value;
        string DOB = this.birthDate.Value;
        string User_Img = Image_Upload1.FileName;

        if (Image_Upload1.HasFile)
        {
            string fileExtention = System.IO.Path.GetExtension(Image_Upload1.FileName);
            if (fileExtention.ToLower() != ".jpg" && fileExtention.ToLower() != ".jpeg")
            {
                this.err_msg.Visible = true;
                this.submit_msg.Text = ".jpg and .jpeg file only";
                submit_msg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                this.err_msg.Visible = false;
                Image_Upload1.SaveAs(Server.MapPath("~/Picture/" + Image_Upload1.FileName));


                string s1 = std_dept.Value;
                // string date = DateTime.Today.ToShortDateString();
                string s2 = this.std_session.Value;

                string s3, s5, s6;

                MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
                string queryStr, queryStrr, qs1, qs2;
                MySql.Data.MySqlClient.MySqlCommand cmd, cmd1, cmd2, cmd3;
                conn.Open();

                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[8];
                var random = new Random();

                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }

                var finalString = new String(stringChars);

                try
                {

                    queryStrr = "Select Roll_No FROM student.student Where Department='" + this.std_dept.Value + "' Order By Student_ID Desc limit 1 ;";
                    string s4 = string.Empty; ;
                    cmd1 = new MySql.Data.MySqlClient.MySqlCommand(queryStrr, conn);
                    MySqlDataReader reader = cmd1.ExecuteReader();
                    while (reader.Read())
                    {

                        s4 += reader.GetString("Roll_No");

                    }
                    if (string.IsNullOrEmpty(s4))
                    {

                        s3 = s1 + s2 + "7001";

                    }
                    else
                    {
                        //Response.Write("<script>alert( 'hi')</script>");
                        s5 = s4.Substring(s4.Length - 4);
                        int i1 = Int32.Parse(s5);
                        int i2 = i1 + 1;

                        s6 = i2.ToString();
                        s3 = s1 + s2 + s6;
                        //Response.Write("<script>alert( 'Sucessfully Added To The Database')</script>");

                    }
                    reader.Close();

                    qs1 = "SELECT * FROM student.student WHERE Email_ID = '" + Email_ID + "'; ";
                    cmd2 = new MySql.Data.MySqlClient.MySqlCommand(qs1, conn);
                    MySqlDataReader mail_rd = cmd2.ExecuteReader();
                    if (!mail_rd.Read())
                    {

                        queryStr = "Insert into student.student(Name,F_Name,M_Name,Email_ID,Alt_Email_ID,Date_Of_Birth,Contact_No,Address,Pin_no,Country,Gender,Roll_No,Department,Pwd,Session) values ('" + this.name.Text + "','" + this.fname.Value + "','" + this.mname.Value + "','" + this.email.Value + "','" + this.alt_email.Value + "','" + this.birthDate.Value + "','" + this.contact.Value + "','" + this.adds.Value + "','" + this.pin.Value + "','" + this.country.Value + "','" + this.gender.Text + "','" + s3 + "','" + this.std_dept.Value + "','" + finalString + "','" + this.std_session.Value + "');";

                        cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                        cmd.ExecuteNonQuery();

                        RollOrStaffId = s3;
                        Pwd = finalString;
                        User_Type = "Student";

                        qs2 = "INSERT INTO student.user (RollOrStaffId,Name,Email_ID,User_Type,Pwd,Y_O_Join,DOB,User_Img) VALUES (@RollOrStaffId, @Name, @Email_ID, @User_Type, @Pwd, @Y_O_Join, @DOB, @User_Img) ;";
                        cmd3 = new MySql.Data.MySqlClient.MySqlCommand(qs2, conn);
                        cmd3.Parameters.AddWithValue("RollOrStaffId", @RollOrStaffId);
                        cmd3.Parameters.AddWithValue("Name", @Name);
                        cmd3.Parameters.AddWithValue("Email_ID", @Email_ID);
                        cmd3.Parameters.AddWithValue("User_Type", @User_Type);
                        cmd3.Parameters.AddWithValue("Pwd", @Pwd);
                        cmd3.Parameters.AddWithValue("Y_O_Join", @Y_O_Join);
                        cmd3.Parameters.AddWithValue("DOB", @DOB);
                        cmd3.Parameters.AddWithValue("User_Img", @User_Img);
                        cmd3.ExecuteNonQuery();

                        Response.Write("<script>alert( 'Sucessfully Added To The Database')</script>");

                        //string mymailid = "sohamneogy28@gmail.com";
                        //string mypwd = "soh123@am";
                        //string mailbody = "Name: " + this.name +", Roll No: "+ s3 + ", Password: " + finalString;
                        //MailMessage msg = new MailMessage();
                        //msg.From = new MailAddress(mymailid);
                        //msg.To.Add(this.email.Value);
                        //msg.Subject = "Account Details of New Admission ";
                        //msg.Body = mailbody;
                        //SmtpClient sc = new SmtpClient("smtp.gmail.com");
                        //sc.Port = 578;
                        //sc.EnableSsl = true;
                        //sc.Credentials = new NetworkCredential(mymailid,mypwd);

                        //sc.Send(msg);
                        //Response.Write("Mail Sent... :) ");
                    }
                    else {
                        Response.Write("<script>alert('This Email Is Already Exist In Our Database'); </script>");
                    }

                }
                catch (Exception)
                {
                    throw;
                }
                finally
                {
                    if (conn.State == System.Data.ConnectionState.Open)
                    {
                        conn.Close();
                    }
                }

            }
        }
        else {
            submit_msg.Text = "No File Selected";
        }

    }


    protected void Add_Teacher_Submit(object sender, EventArgs e1)
    {

        //Response.Write("<script>alert( 'Hi, Soham Pagla')</script>");

        ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('hai')", true);

        DateTime now = DateTime.Now;
        
        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr, qs1, queryStrr, qs2;
        MySql.Data.MySqlClient.MySqlCommand cmd, cmd1, cmd2, cmd3;
        string sid1, sid2, sid3, sid4, sid5;

        string RollOrStaffId;
        string Name = this.st_name.Value;
        string Email_ID = this.st_email.Value;
        string User_Type;
        string Pwd;
        string Y_O_Join = this.st_year.Value;
        string DOB = this.st_dob.Value;
        string User_Img = Image_Upload2.FileName;

        if (Image_Upload2.HasFile)
        {
            string fileExtention = System.IO.Path.GetExtension(Image_Upload2.FileName);
            if (fileExtention.ToLower() != ".jpg" && fileExtention.ToLower() != ".jpeg")
            {
                this.err_msg_staff.Visible = true;
                this.submit_msg_staff.Text = ".jpg and .jpeg file only";
                submit_msg_staff.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                this.err_msg_staff.Visible = false;
                Image_Upload2.SaveAs(Server.MapPath("~/Picture/" + Image_Upload2.FileName));

                sid1 = this.st_dept.Value;
                sid2 = this.st_year.Value;

                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[8];
                var random = new Random();

                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }

                var finalString = new String(stringChars);

                conn.Open();
                try
                {

                    queryStrr = "Select Staff_ID FROM student.staff Where Department='" + this.st_dept.Value + "' Order By Staff_ID Desc limit 1 ;";
                    string s4 = string.Empty; ;
                    cmd1 = new MySql.Data.MySqlClient.MySqlCommand(queryStrr, conn);
                    MySqlDataReader reader = cmd1.ExecuteReader();
                    while (reader.Read())
                    {
                        s4 += reader.GetString("Staff_ID");
                    }
                    if (string.IsNullOrEmpty(s4))
                    {
                        sid3 = sid1 + sid2 + "5001";
                    }
                    else
                    {
                        sid4 = s4.Substring(s4.Length - 4);
                        int i1 = Int32.Parse(sid4);
                        int i2 = i1 + 1;

                        sid5 = i2.ToString();
                        sid3 = sid1 + sid2 + sid5;

                    }
                    reader.Close();

                    qs1 = "SELECT * FROM student.staff WHERE Email_ID = '" + this.st_email.Value + "';";
                    cmd2 = new MySql.Data.MySqlClient.MySqlCommand(qs1, conn);
                    MySqlDataReader rd = cmd2.ExecuteReader();
                    if (!rd.Read())
                    {
                        rd.Close();
                        queryStr = "Insert into student.staff(Staff_ID,Name,Email_ID,Alt_Email,Contact_No,D_O_B,Address,Country,Pin_no,Gender,Department,Date_of_joining) values ('" + sid3 + "','" + this.st_name.Value + "','" + this.st_email.Value + "','" + this.st_alt_email.Value + "','" + this.st_contact.Value + "','" + this.st_dob.Value + "','" + this.st_ads.Value + "','" + this.st_country.Value + "','" + this.st_pin.Value + "','" + this.st_gender.Text + "','" + this.st_dept.Value + "','" + this.st_year.Value + "')";
                        // queryStr = "Insert into student.staff(Staff_ID,Name,Email_ID,Alt_Email,Contact_No,D_O_B,Address,Country,Pin_no,Gender,Department,Date_of_joining) values ('123','" + this.st_name.Value + "','" + this.st_email.Value + "','" + this.st_alt_email.Value + "','" + this.st_contact.Value + "','" + this.st_dob.Value + "','" + this.st_ads.Value + "','" + this.st_country.Value + "','" + this.st_pin.Value + "','" + this.st_gender.Text + "','" + this.st_dept.Value + "','" + this.st_year.Value + "')";
                        cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                        cmd.ExecuteNonQuery();

                        RollOrStaffId = sid3;
                        Pwd = finalString;
                        User_Type = "Staff";

                        qs2 = "INSERT INTO student.user (RollOrStaffId,Name,Email_ID,User_Type,Pwd,Y_O_Join,DOB,User_Img) VALUES (@RollOrStaffId, @Name, @Email_ID, @User_Type, @Pwd, @Y_O_Join, @DOB, @User_Img) ;";
                        cmd3 = new MySql.Data.MySqlClient.MySqlCommand(qs2, conn);
                        cmd3.Parameters.AddWithValue("RollOrStaffId", @RollOrStaffId);
                        cmd3.Parameters.AddWithValue("Name", @Name);
                        cmd3.Parameters.AddWithValue("Email_ID", @Email_ID);
                        cmd3.Parameters.AddWithValue("User_Type", @User_Type);
                        cmd3.Parameters.AddWithValue("Pwd", @Pwd);
                        cmd3.Parameters.AddWithValue("Y_O_Join", @Y_O_Join);
                        cmd3.Parameters.AddWithValue("DOB", @DOB);
                        cmd3.Parameters.AddWithValue("User_Img", @User_Img);
                        cmd3.ExecuteNonQuery();

                        Response.Write("<script>alert( 'Sucessfully Added To The Database')</script>");

                    }
                    else
                    {
                        Response.Write("<script>alert('This Email Is Already Exist In Our Database'); </script>");

                        this.st_email.Value = "Enter Another Email Id..";
                    }

                }
                catch (Exception)
                {
                    throw;
                }
                finally
                {
                    if (conn.State == System.Data.ConnectionState.Open)
                    {
                        conn.Close();
                    }
                }
            }
        }
        else
        {
            submit_msg_staff.Text = "No File Selected";
        }
    }

    
    protected void MakeRoutine(object sender, EventArgs e)
    {

        // Response.Redirect("~/Default2.aspx");
        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        conn.Open();
        int nosub = Int32.Parse(this.mk_rt_nosub.Value);
        string Time = this.mk_rt_time.Value;
        try
        {
            string[] str = new string[6];
            str[0] = this.mk_rt_sub1.Text;
            str[1] = this.mk_rt_sub2.Text;
            str[2] = this.mk_rt_sub3.Text;
            str[3] = this.mk_rt_sub4.Text;
            str[4] = this.mk_rt_sub5.Text;
            str[5] = this.mk_rt_sub6.Text;

            string[] strdt = new string[6];
            strdt[0] = this.mk_rt_dt1.Text;
            strdt[1] = this.mk_rt_dt2.Text;
            strdt[2] = this.mk_rt_dt3.Text;
            strdt[3] = this.mk_rt_dt4.Text;
            strdt[4] = this.mk_rt_dt5.Text;
            strdt[5] = this.mk_rt_dt6.Text;

            for (int i = 0; i < nosub; i++)
            {
                queryStr = "INSERT INTO student.routine(Date,Time,Exam_Type,Year,Semester,Department,Subject) VALUES ('" + strdt[i] + "',@Time,'" + this.mk_rt_exm.Value + "','" + this.mk_rt_year.Value + "','" + this.mk_rt_sem.Value + "','" + this.mk_rt_dept.Value + "','" + str[i] + "');";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("Time",@Time);
                cmd.ExecuteNonQuery();
            }
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }

    }



    protected void MakeDutyRoster(object sender, EventArgs e) {

        Response.Write("<script>alert('Hello, SK')</script>");
        
        string Date = this.mk_pub_dr_date.Text;
        string Time = this.mk_pub_dr_time.Text;
        string Room_no = this.mk_pub_dr_rno.Text;
        string Exam_Type = this.mk_pub_dr_etype.Value;
        string Staff_Id, Staff_Name;
        string s1 = string.Empty;
        string s2 = string.Empty;
        string s3 = string.Empty;
        string s4 = string.Empty;
        int n = 1;
        int i = 0;
        int j = 1;
        int row = 2;

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr, qstr1, qstr2, qstr3;
        MySql.Data.MySqlClient.MySqlCommand cmd, cmd1, cmd2, cmd3;

        conn.Open();
        Response.Write("<script>alert('Hello, Google')</script>");
        try {
            Response.Write("<script>alert('Hello, Saikat')</script>");
            //qstr1 = "SELECT Col1, Col2 FROM student.arrangement WHERE Room_no = '" + Room_no + "' AND Date = '" + Date + "' AND Time = '" + Time + "' LIMIT 1;";
            qstr1 = "SELECT Col1, Col2 FROM student.arrangement WHERE Room_no = '111' LIMIT 1;";
            cmd1 = new MySql.Data.MySqlClient.MySqlCommand(qstr1, conn);
            MySqlDataReader dept_rd = cmd1.ExecuteReader();
            if(dept_rd.Read()) { 
                s1 += dept_rd.GetString("Col1");
                s2 += dept_rd.GetString("Col2");
            }
            dept_rd.Close();
            Response.Write("<script>alert('" + s1 + "')</script>");
            Response.Write("<script>alert('" + s2 + "')</script>");
            if (s1.IsNullOrEmpty() || s2.IsNullOrEmpty())
            {
                Response.Write("<script>alert('Hello')</script>");
                conn.Close();
            }
            else
            {
                Response.Write("<script>alert( 'hi')</script>");
                s1 = s1.Substring(0, s1.Length - 8);
                s2 = s2.Substring(0, s2.Length - 8);                
                do{
                
                    qstr2 = "SELECT * FROM student.staff WHERE Department NOT IN ('" + s1 + "') AND Department NOT IN ('" + s2 + "') LIMIT 0,1;";
                    cmd2 = new MySql.Data.MySqlClient.MySqlCommand(qstr2, conn);
                    MySqlDataReader get_sid = cmd2.ExecuteReader();
                    while (get_sid.Read()) {
                        s3 += get_sid.GetString("Staff_ID");
                        s4 += get_sid.GetString("Name");
                    }
                    
                    //row = int.Parse(cmd2.ExecuteReader().ToString()); ;

                    if (get_sid.Read())
                    {
                        get_sid.Close();
                        qstr3 = "SELECT Staff_Id FROM student.duty_roster WHERE Staff_Id = '" + s3 + "';";
                        cmd3 = new MySql.Data.MySqlClient.MySqlCommand(qstr3, conn);
                        MySqlDataReader ch_sid = cmd3.ExecuteReader();
                        if (!ch_sid.Read())
                        {
                            ch_sid.Close(); conn.Open();
                            Staff_Id = s3;
                            Staff_Name = s4;
                            queryStr = "INSERT INTO student.duty_roster (Date, Time, Room_no, Exam_Type, Staff_Id, Staff_Name) VALUES (@Date, @Time, @Room_no, @Exam_Type, @Staff_Id, @Staff_Name);";
                            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                            cmd.Parameters.AddWithValue("Date", @Date);
                            cmd.Parameters.AddWithValue("Time", @Time);
                            cmd.Parameters.AddWithValue("Room_no", @Room_no);
                            cmd.Parameters.AddWithValue("Exam_Type", @Exam_Type);
                            cmd.Parameters.AddWithValue("Staff_Id", @Staff_Id);
                            cmd.Parameters.AddWithValue("Staff_Name", @Staff_Name);
                            cmd.ExecuteNonQuery();


                        }
                        else {
                            ch_sid.Close();
                            Response.Write("<script>alert'Already Exist'</script>");
                        }
                    }
                    else {
                        get_sid.Close();
                        Response.Write("<script>alert'Not Inserted'</script>");
                    }
                    get_sid.Close();
                    i = i + 1;
                    j = j + 1;
                }while(n<row);


                
                
                



                //queryStr = "INSERT INTO student.duty_roster (Date, Time, Room_no, Exam_Type, Staff_Id, Staff_Name) VALUES (@Date, @Time, @Room_no, @Exam_Type, @Staff_Id, @Staff_Name);";
                //cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                //cmd.Parameters.AddWithValue("Date", @Date);
                //cmd.Parameters.AddWithValue("Time", @Time);
                //cmd.Parameters.AddWithValue("Room_no", @Room_no);
                //cmd.Parameters.AddWithValue("Exam_Type", @Exam_Type);
                //cmd.Parameters.AddWithValue("Staff_Id", @Staff_Id);
                //cmd.Parameters.AddWithValue("Staff_Name", @Staff_Name);
                //cmd.ExecuteNonQuery();

                conn.Close();
            }

        }
        catch (Exception e1) {
            throw e1;
        }
        finally {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }

    protected void ViewObtainMarks(object sender, EventArgs e) {
        this.vw_obtn_mrks_div.Visible = true;

        Label24.Text = string.Empty;
        Label25.Text = string.Empty;
        Label30.Text = string.Empty;
        Label31.Text = string.Empty;
        Label26.Text = string.Empty;
        Label27.Text = string.Empty;
        Label32.Text = string.Empty;
        Label33.Text = string.Empty;
        Label28.Text = string.Empty;
        Label29.Text = string.Empty;
        Label34.Text = string.Empty;
        Label35.Text = string.Empty;

        string year = this.pr_gen_year.Value;
        string sem = this.pr_gen_sem.Value;
        string dept = this.pr_rpt_gen_stddept.Value;

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        conn.Open();
        try
        {
            queryStr = "SELECT Subject FROM student.routine WHERE Year = '" + year + "' AND Semester = '" + sem +"' AND Department = '" + dept + "'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            int index = 0;
            string row1 = string.Empty;
            string row2 = string.Empty;
            string row3 = string.Empty;
            string row4 = string.Empty;
            string row5 = string.Empty;
            string row6 = string.Empty;
            while (reader.Read())
            {
                switch (index)
                {
                    case 0:
                        row1 = reader.GetString(0);
                        break;
                    case 1:
                        row2 = reader.GetString(0);
                        break;
                    case 2:
                        row3 = reader.GetString(0);
                        break;
                    case 3:
                        row4 = reader.GetString(0);
                        break;
                    case 4:
                        row5 = reader.GetString(0);
                        break;
                    case 5:
                        row6 = reader.GetString(0);
                        break;
                }
                index += 1;
            }

            Debug.WriteLine("R1  " + row1);
            Debug.WriteLine("R2   " + row2);
            Debug.WriteLine("R3   " + row3);
            Debug.WriteLine("R4  " + row4);
            Debug.WriteLine("R5  " + row5);
            Debug.WriteLine("R6  " + row6);

            if (row1.IsNullOrEmpty() && row2.IsNullOrEmpty() && row3.IsNullOrEmpty() && row4.IsNullOrEmpty() && row5.IsNullOrEmpty() && row6.IsNullOrEmpty()) {
                this.pr_rpt_gen_btn.Visible = false;
                Debug.WriteLine("No Record ");
                Label25.Text = "No Record Found..";
                //Label25.ForeColor = System.Drawing.Color("green");
            }
            else {
                if (!row1.IsNullOrEmpty())
                {
                    Label24.Text = "S1";
                    Label25.Text = row1;
                }
                if (!row2.IsNullOrEmpty())
                {
                    Label30.Text = "S2";
                    Label31.Text = row2;
                }
                if (!row3.IsNullOrEmpty())
                {
                    Label26.Text = "S3";
                    Label27.Text = row3;
                }
                if (!row4.IsNullOrEmpty())
                {
                    Label32.Text = "S4";
                    Label33.Text = row4;
                }
                if (!row5.IsNullOrEmpty())
                {
                    Label28.Text = "S5";
                    Label29.Text = row5;
                }
                if (!row6.IsNullOrEmpty())
                {
                    Label34.Text = "S6";
                    Label35.Text = row6;
                }
                if (IsPostBack) {
                    GetObtainMarks();
                }
                
            }
            reader.Close();
        }
        catch (Exception)
        {
            throw;
        }
        finally {
            if (conn.State == System.Data.ConnectionState.Open) {
                conn.Close();
            }
        }

    }

    private void GetObtainMarks() {

        this.pr_rpt_gen_btn.Visible = true;

        string year = this.pr_gen_year.Value;
        string sem = this.pr_gen_sem.Value;
        string dept = this.pr_rpt_gen_stddept.Value;

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        conn.Open();
        try
        {
            queryStr = "SELECT * FROM student.marks WHERE Year = '" + year + "' AND Semester = '" + sem + "' AND Department = '" + dept + "';";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            if (!reader.Read())
            {
                //this.duty_msg.Visible = true;
                reader.Close();
            }
            else
            {
                reader.Close();
                da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                dt = new DataTable();
                da.Fill(dt);
                view_std_marks.DataSource = dt;
                view_std_marks.DataBind();
            }

        }
        catch (Exception)
        {

        }
        finally
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }

    protected void ProgressReportGen(object sender, EventArgs e) { }

    protected void ExmSpecificReq(object sender, EventArgs e) {

        string Date = this.exm_sp_req_date.Value;
        string Time = this.exm_sp_req_time.Value;
        string Exam_Type = this.exm_sp_req_exmtype.Value;
        string Room_no = this.exm_sp_req_rno.Value;
        string Year_1 = this.exm_sp_req_yr1.Value;
        string Department_1 = this.exm_sp_req_dept1.Value;
        string QP_1 = this.exm_sp_req_ttlqp1.Value;
        string OR_1 = this.exm_sp_req_othreq1.Value;
        string OR_1_NO = this.exm_sp_req_otrnos1.Value;
        string Year_2 = this.exm_sp_req_yr2.Value;
        string Department_2 = this.exm_sp_req_dept2.Value;
        string QP_2 = this.exm_sp_req_ttlqp2.Value;
        string OR_2 = this.exm_sp_req_othreq2.Value;
        string OR_2_NO = this.exm_sp_req_othnos2.Value;

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;

        conn.Open();
        try {
            queryStr = "INSERT INTO student.requirements (Date, Time, Room_no, Exam_Type, Year_1, Department_1, QP_1, OR_1, OR_1_NO, Year_2, Department_2, QP_2, OR_2, OR_2_NO) VALUES (@Date, @Time, @Room_no, @Exam_Type, @Year_1, @Department_1, @QP_1, @OR_1, @OR_1_NO, @Year_2, @Department_2, @QP_2, @OR_2, @OR_2_NO);";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr,conn);
            cmd.Parameters.AddWithValue("Date",@Date);
            cmd.Parameters.AddWithValue("Time",@Time);
            cmd.Parameters.AddWithValue("Room_no",@Room_no);
            cmd.Parameters.AddWithValue("Exam_Type",@Exam_Type);
            cmd.Parameters.AddWithValue("Year_1",@Year_1);
            cmd.Parameters.AddWithValue("Department_1",@Department_1);
            cmd.Parameters.AddWithValue("QP_1",@QP_1);
            cmd.Parameters.AddWithValue("OR_1",@OR_1);
            cmd.Parameters.AddWithValue("OR_1_NO",@OR_1_NO);
            cmd.Parameters.AddWithValue("Year_2",@Year_2);
            cmd.Parameters.AddWithValue("Department_2",@Department_2);
            cmd.Parameters.AddWithValue("QP_2",@QP_2);
            cmd.Parameters.AddWithValue("OR_2",@OR_2);
            cmd.Parameters.AddWithValue("OR_2_NO",@OR_2_NO);
            cmd.ExecuteNonQuery();

            conn.Close();
        }
        catch (Exception) { 
        
        }
        finally {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }

    protected void MakeArrangement(object sender, EventArgs e)
    {
        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr, qst1, qst2;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        string Time = this.mk_ar_time.Value.ToString();
        string Date = this.txtDate.Text;
        conn.Open();

        try
        {
            qst1 = "Select Roll_No FROM student.student Where Department='" + this.mk_ar_dept1.Value + "'; ";


            string s1 = string.Empty; ;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(qst1, conn);
            MySqlDataReader reader1 = cmd.ExecuteReader();
            while (reader1.Read())
            {

                s1 += reader1.GetString("Roll_No");

            }
            conn.Close(); conn.Open();
            qst2 = "Select Roll_No FROM student.student Where Department='" + this.mk_ar_dept2.Value + "'; ";
            string s2 = string.Empty; ;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(qst2, conn);
            MySqlDataReader reader2 = cmd.ExecuteReader();
            while (reader2.Read())
            {

                s2 += reader2.GetString("Roll_No");

            }
            conn.Close(); conn.Open();

            string strtroll1 = this.mk_ar_strtroll1.Value;
            string strtroll2 = this.mk_ar_strtroll2.Value;
            string sr1, sr2;
            sr1 = strtroll1;
            sr2 = strtroll2;
            //if (s1 != strtroll1)
            //{
            //    this.mk_ar_strtroll1.Value = "Enter Valid Roll No.";

            //}
            //else if (s2 != strtroll2) {
            //    this.mk_ar_strtroll2.Value = "Enter Valid Roll No.";
            //}
            //else
            //{

            int r = 0;
            int row = Int32.Parse(this.mk_ar_row.Value);
            int col = Int32.Parse(this.mk_ar_col.Value);

            string[] arr = new string[10];
            for (int k = 0; k < 10; k++)
            {
                arr[k] = "NULL";
            }
            string stroll1, stroll2;

            int l, ii1, ii2, i1, i2;
            string sub1, sub2;
            while (r < row)
            {
                if (r % 2 == 0)
                {
                    for (l = 0; l < col; l++)
                    {
                        if (l % 2 == 0)
                        {
                            arr[l] = strtroll1;
                            
                            stroll1 = strtroll1.Substring(strtroll1.Length - 4);
                            sub1 = strtroll1.Substring(0, 7);
                            i1 = Int32.Parse(stroll1);
                            i2 = i1 + row;
                            strtroll1 = i2.ToString();
                            strtroll1 = sub1 + strtroll1;
                        }
                        else
                        {
                            arr[l] = strtroll2;
                            stroll2 = strtroll2.Substring(strtroll2.Length - 4);
                            sub2 = strtroll2.Substring(0, 7);
                            ii1 = Int32.Parse(stroll2);
                            ii2 = ii1 + row;
                            strtroll2 = ii2.ToString();
                            strtroll2 = sub2 + strtroll2;
                        }



                    }
                    queryStr = "Insert into student.arrangement(Date, Time, Exam_Type,Room_no, Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,Col10) values (@Date, @Time ,'" + this.mk_ar_exmtype.Value + "','" + this.mk_ar_roomno.Value + "','" + arr[0] + "','" + arr[1] + "','" + arr[2] + "','" + arr[3] + "','" + arr[4] + "','" + arr[5] + "','" + arr[6] + "','" + arr[7] + "','" + arr[8] + "','" + arr[9] + "');";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                    cmd.Parameters.AddWithValue("Date", @Date);
                    cmd.Parameters.AddWithValue("Time", @Time);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    for (l = 0; l < col; l++)
                    {
                        if (l % 2 == 0)
                        {
                            arr[l] = strtroll2;
                            
                            stroll2 = strtroll2.Substring(strtroll2.Length - 4);
                            sub2 = strtroll2.Substring(0, 7);
                            i1 = Int32.Parse(stroll2);
                            i2 = i1 + row;
                            strtroll2 = i2.ToString();
                            strtroll2 = sub2 + strtroll2;
                        }
                        else
                        {
                            arr[l] = strtroll1;
                            stroll1 = strtroll1.Substring(strtroll1.Length - 4);
                            sub1 = strtroll1.Substring(0, 7);
                            ii1 = Int32.Parse(stroll1);
                            ii2 = ii1 + row;
                            strtroll1 = ii2.ToString();
                            strtroll1 = sub1 + strtroll1;
                        }



                    }
                    queryStr = "Insert into student.arrangement(Date, Time, Exam_Type,Room_no, Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,Col10) values (@Date, @Time, '" + this.mk_ar_exmtype.Value + "','" + this.mk_ar_roomno.Value + "','" + arr[0] + "','" + arr[1] + "','" + arr[2] + "','" + arr[3] + "','" + arr[4] + "','" + arr[5] + "','" + arr[6] + "','" + arr[7] + "','" + arr[8] + "','" + arr[9] + "');";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                    cmd.Parameters.AddWithValue("Date", @Date);
                    cmd.Parameters.AddWithValue("Time", @Time);
                    cmd.ExecuteNonQuery();
                }
                r = r + 1;

                stroll1 = sr1.Substring(sr1.Length - 4);
                sub1 = sr1.Substring(0, 7);
                i1 = Int32.Parse(stroll1);
                i2 = i1 + 1;
                strtroll1 = i2.ToString();
                strtroll1 = sub1 + strtroll1;
                sr1 = strtroll1;

                stroll2 = sr2.Substring(sr2.Length - 4);
                sub2 = sr2.Substring(0, 7);
                ii1 = Int32.Parse(stroll2);
                ii2 = ii1 + 1;
                strtroll2 = ii2.ToString();
                strtroll2 = sub2 + strtroll2;
                sr2 = strtroll2;
            }


        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }


    protected void ViewArrangement(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.BindGrid();
        }
    }

    private void BindGrid()
    {
        vw_arng_div.Visible = true;
        Label18.Text = this.vw_arng_rno.Text;
        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        conn.Open();
        try {
            queryStr = "SELECT * FROM student.arrangement WHERE Room_No = '" + this.vw_arng_rno.Text + "'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            if (!reader.Read())
            {
                //this.duty_msg.Visible = true;
                reader.Close();
            }
            else
            {
                Label20.Text = reader["Date"].ToString();
                Label22.Text = reader["Exam_Type"].ToString();
                reader.Close();
                da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                dt = new DataTable();
                da.Fill(dt);
                view_arrangement_grid.DataSource = dt;
                view_arrangement_grid.DataBind();
            }

        }
        catch (Exception) { 
        
        }
        finally {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }
   
    protected void GetSubjects(object sender, EventArgs e)
    {
        mk_rt_getsubdiv.Visible = true;
        mk_rt_get_sub.Visible = false;

        if (IsPostBack)
        {
            this.SubBindGrid();
        }
    }

    private void SubBindGrid()
    {
        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        try
        {
            queryStr = "SELECT * FROM student.subject WHERE Semester = '" + this.mk_rt_sem.Value + "' AND Department = '" + this.mk_rt_dept.Value + "' AND Year = '" + this.mk_rt_year.Value + "';";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            mk_rt_sub1.DataSource = cmd.ExecuteReader();
            mk_rt_sub1.DataTextField = "Sub1";
            mk_rt_sub1.DataValueField = "Sub1";
            mk_rt_sub1.DataBind();
            conn.Close();
            conn.Open();
            mk_rt_sub2.DataSource = cmd.ExecuteReader();
            mk_rt_sub2.DataTextField = "Sub2";
            mk_rt_sub2.DataValueField = "Sub2";
            mk_rt_sub2.DataBind();
            conn.Close();
            conn.Open();
            mk_rt_sub3.DataSource = cmd.ExecuteReader();
            mk_rt_sub3.DataTextField = "Sub3";
            mk_rt_sub3.DataValueField = "Sub3";
            mk_rt_sub3.DataBind();
            conn.Close();
            conn.Open();
            mk_rt_sub4.DataSource = cmd.ExecuteReader();
            mk_rt_sub4.DataTextField = "Sub4";
            mk_rt_sub4.DataValueField = "Sub4";
            mk_rt_sub4.DataBind();
            conn.Close();
            conn.Open();
            mk_rt_sub5.DataSource = cmd.ExecuteReader();
            mk_rt_sub5.DataTextField = "Sub5";
            mk_rt_sub5.DataValueField = "Sub5";
            mk_rt_sub5.DataBind();
            conn.Close();
            conn.Open();
            mk_rt_sub6.DataSource = cmd.ExecuteReader();
            mk_rt_sub6.DataTextField = "Sub6";
            mk_rt_sub6.DataValueField = "Sub6";
            mk_rt_sub6.DataBind();
            conn.Close();
            mk_rt_sub1.Items.Insert(0, new ListItem("--Select Subject--", "0"));
            mk_rt_sub2.Items.Insert(0, new ListItem("--Select Subject--", "0"));
            mk_rt_sub3.Items.Insert(0, new ListItem("--Select Subject--", "0"));
            mk_rt_sub4.Items.Insert(0, new ListItem("--Select Subject--", "0"));
            mk_rt_sub5.Items.Insert(0, new ListItem("--Select Subject--", "0"));
            mk_rt_sub6.Items.Insert(0, new ListItem("--Select Subject--", "0"));
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            if(conn.State ==  System.Data.ConnectionState.Open){
                conn.Close();
            }
        }


    }


    private void GetRoomNo() { 
        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr, qs1, qs2;
        MySql.Data.MySqlClient.MySqlCommand cmd, cmd1, cmd2;
        try
        {
            queryStr = "SELECT Room_no FROM student.arrangement GROUP BY Room_no ORDER BY Room_no;";
            qs1 = "SELECT Date FROM student.arrangement GROUP BY Date ORDER BY Date;";
            qs2 = "SELECT Time FROM student.arrangement GROUP BY Time ORDER BY Time;";

            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            cmd1 = new MySql.Data.MySqlClient.MySqlCommand(qs1, conn);
            cmd2 = new MySql.Data.MySqlClient.MySqlCommand(qs2, conn);

            cmd.CommandType = CommandType.Text;
            cmd1.CommandType = CommandType.Text;
            cmd2.CommandType = CommandType.Text;

            cmd.Connection = conn;
            cmd1.Connection = conn;
            cmd2.Connection = conn;

            conn.Open();
            vw_arng_rno.DataSource = cmd.ExecuteReader();
            vw_arng_rno.DataTextField = "Room_no";
            vw_arng_rno.DataValueField = "Room_no";
            vw_arng_rno.DataBind();
            conn.Close();

            conn.Open();
            mk_pub_dr_rno.DataSource = cmd.ExecuteReader();
            mk_pub_dr_rno.DataTextField = "Room_no";
            mk_pub_dr_rno.DataValueField = "Room_no";
            mk_pub_dr_rno.DataBind();
            conn.Close();

            conn.Open();
            mk_pub_dr_date.DataSource = cmd1.ExecuteReader();
            mk_pub_dr_date.DataTextField = "Date";
            mk_pub_dr_date.DataValueField = "Date";
            mk_pub_dr_date.DataBind();
            conn.Close();

            conn.Open();
            mk_pub_dr_time.DataSource = cmd2.ExecuteReader();
            mk_pub_dr_time.DataTextField = "Time";
            mk_pub_dr_time.DataValueField = "Time";
            mk_pub_dr_time.DataBind();
            conn.Close();

            vw_arng_rno.Items.Insert(0, new ListItem("-------------Select Room No---------", "0"));
            mk_pub_dr_rno.Items.Insert(0, new ListItem("-------------Select Room No---------", "0"));
            mk_pub_dr_date.Items.Insert(0, new ListItem("-------------Select Date---------", "0"));
            mk_pub_dr_time.Items.Insert(0, new ListItem("-------------Select Time---------", "0"));



        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }

    protected void UpdateImage(object sender, ImageClickEventArgs e)
    {

    }
}



