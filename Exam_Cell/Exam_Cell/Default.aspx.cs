using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Text;
using System.Diagnostics;

public partial class _Default : System.Web.UI.Page
{
    //public string s;
    string connection = System.Configuration.ConfigurationManager.ConnectionStrings["ExamConString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetRoomNo();
        }
        
    }

    private void GetRoomNo()
    {
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

            //conn.Open();
            //vw_arng_rno.DataSource = cmd.ExecuteReader();
            //vw_arng_rno.DataTextField = "Room_no";
            //vw_arng_rno.DataValueField = "Room_no";
            //vw_arng_rno.DataBind();
            //conn.Close();

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

            //vw_arng_rno.Items.Insert(0, new ListItem("-------------Select Room No---------", "0"));
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

    protected void MakeDutyRoster(object sender, EventArgs e)
    {

        //Response.Write("<script>alert('Hello, SK')</script>");

       // Label1.Text = "Room No: " + this.mk_pub_dr_rno.Text + "Date : " + this.mk_pub_dr_date.Text + " Time: " + this.mk_pub_dr_time.Text;

        //string Date = this.mk_pub_dr_date.Text.ToString();
        //string Time = this.mk_pub_dr_time.Text.ToString();
        //string Room_no = this.mk_pub_dr_rno.Text.ToString();
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

        string Date = "21-06-2017";
        string Time = "10:00";
        string Room_no = "111";
        //Room_no = Room_no.Replace(" ", String.Empty);
        //Date = Date.Replace(" ", String.Empty);
        //Time = Time.Replace(" ", String.Empty);

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr, qstr1, qstr2, qstr3;
        MySql.Data.MySqlClient.MySqlCommand cmd, cmd1, cmd2, cmd3;

        if (Date.IsNullOrEmpty() || Time.IsNullOrEmpty() || Room_no.IsNullOrEmpty())
        {
            Label1.Text = "Input value is not reached";
        }
        else
        {
            Response.Write("<script>alert('" + Room_no + "')</script>");
            Response.Write("<script>alert('" + Date + "')</script>");
            Response.Write("<script>alert('" + Time + "')</script>");
            //Response.Write("<script>alert('" + s2 + "')</script>");
           // Label1.Text = Room_no + "       " + Date + "   " + Time;

            conn.Open();
            // Response.Write("<script>alert('Hello, Google')</script>");
            try
            {
                Debug.WriteLine("Room No:  " + Room_no);
                Debug.WriteLine("Date:  " + Date);
                Debug.WriteLine("Time:  " + Time);

                Trace.Write("Room No:  " + Room_no);
                Trace.Write("Date:  " + Date);
                Trace.Write("Time:  " + Time);

                //Response.Write("<script>alert('Hello, Saikat')</script>");
                qstr1 = "SELECT Col1, Col2 FROM student.arrangement WHERE Room_no = '" + Room_no + "' AND Date = '" + Date + "' AND Time = '" + Time + "' LIMIT 1;";
                qstr1 = "SELECT Col1, Col2 FROM student.arrangement WHERE Room_no = '" + Room_no + "' AND Date = '" + Date + "' AND Time = '" + Time + "' LIMIT 1;";
                //qstr1 = "SELECT Col1, Col2 FROM student.arrangement WHERE Room_no = '" + this.mk_pub_dr_rno.Text + "' AND Date = '" + this.mk_pub_dr_date.Text + "' AND Time = '" + this.mk_pub_dr_time.Text + "' LIMIT 1;";
                cmd1 = new MySql.Data.MySqlClient.MySqlCommand(qstr1, conn);
                cmd1.ExecuteNonQuery();
                MySqlDataReader dept_rd = cmd1.ExecuteReader();
                while (dept_rd.Read())
                {
                    s1 += dept_rd.GetString("Col1");
                    s2 += dept_rd.GetString("Col2");
                }
                dept_rd.Close();
                Label1.Text = s1 + " AND " + s2;
                //Response.Write("<script>alert('" + s1 + "')</script>");
                //Response.Write("<script>alert('" + s2 + "')</script>");
                //if (s1.IsNullOrEmpty() || s2.IsNullOrEmpty())
                //{
                //    Response.Write("<script>alert('Hello')</script>");
                //    conn.Close();
                //}
                //else
                //{
                //    Response.Write("<script>alert( 'hi')</script>");
                //    s1 = s1.Substring(0, s1.Length - 8);
                //    s2 = s2.Substring(0, s2.Length - 8);
                //    do
                //    {

                //        qstr2 = "SELECT * FROM student.staff WHERE Department NOT IN ('" + s1 + "') AND Department NOT IN ('" + s2 + "') LIMIT 0,1;";
                //        cmd2 = new MySql.Data.MySqlClient.MySqlCommand(qstr2, conn);
                //        MySqlDataReader get_sid = cmd2.ExecuteReader();
                //        while (get_sid.Read())
                //        {
                //            s3 += get_sid.GetString("Staff_ID");
                //            s4 += get_sid.GetString("Name");
                //        }

                //        //row = int.Parse(cmd2.ExecuteReader().ToString()); ;

                //        if (get_sid.Read())
                //        {
                //            get_sid.Close();
                //            qstr3 = "SELECT Staff_Id FROM student.duty_roster WHERE Staff_Id = '" + s3 + "';";
                //            cmd3 = new MySql.Data.MySqlClient.MySqlCommand(qstr3, conn);
                //            MySqlDataReader ch_sid = cmd3.ExecuteReader();
                //            if (!ch_sid.Read())
                //            {
                //                ch_sid.Close(); conn.Open();
                //                Staff_Id = s3;
                //                Staff_Name = s4;
                //                queryStr = "INSERT INTO student.duty_roster (Date, Time, Room_no, Exam_Type, Staff_Id, Staff_Name) VALUES (@Date, @Time, @Room_no, @Exam_Type, @Staff_Id, @Staff_Name);";
                //                cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                //                cmd.Parameters.AddWithValue("Date", @Date);
                //                cmd.Parameters.AddWithValue("Time", @Time);
                //                cmd.Parameters.AddWithValue("Room_no", @Room_no);
                //                cmd.Parameters.AddWithValue("Exam_Type", @Exam_Type);
                //                cmd.Parameters.AddWithValue("Staff_Id", @Staff_Id);
                //                cmd.Parameters.AddWithValue("Staff_Name", @Staff_Name);
                //                cmd.ExecuteNonQuery();


                //            }
                //            else
                //            {
                //                ch_sid.Close();
                //                Response.Write("<script>alert'Already Exist'</script>");
                //            }
                //        }
                //        else
                //        {
                //            get_sid.Close();
                //            Response.Write("<script>alert'Not Inserted'</script>");
                //        }
                //        get_sid.Close();
                //        i = i + 1;
                //        j = j + 1;
                //    } while (n < row);








                //    //queryStr = "INSERT INTO student.duty_roster (Date, Time, Room_no, Exam_Type, Staff_Id, Staff_Name) VALUES (@Date, @Time, @Room_no, @Exam_Type, @Staff_Id, @Staff_Name);";
                //    //cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
                //    //cmd.Parameters.AddWithValue("Date", @Date);
                //    //cmd.Parameters.AddWithValue("Time", @Time);
                //    //cmd.Parameters.AddWithValue("Room_no", @Room_no);
                //    //cmd.Parameters.AddWithValue("Exam_Type", @Exam_Type);
                //    //cmd.Parameters.AddWithValue("Staff_Id", @Staff_Id);
                //    //cmd.Parameters.AddWithValue("Staff_Name", @Staff_Name);
                //    //cmd.ExecuteNonQuery();

                //    conn.Close();
                //}
                conn.Close();
            }

            catch (Exception e1)
            {
                throw e1;
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
}