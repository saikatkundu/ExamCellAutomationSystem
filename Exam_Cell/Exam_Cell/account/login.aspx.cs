using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Diagnostics;

public partial class account_login : System.Web.UI.Page
{
    string connection = System.Configuration.ConfigurationManager.ConnectionStrings["ExamConString"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogInNow(object sender, EventArgs e)
    {
        string emailid = this.emailid.Value;
        string pwd = this.pwd.Value;

        Debug.WriteLine("User Id:  "+ emailid);
        Debug.WriteLine("PassWord:  "+ pwd);

        MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(connection);
        string queryStr;
        MySql.Data.MySqlClient.MySqlCommand cmd;

        conn.Open();
        try
        {

            queryStr = "SELECT * FROM student.user where Email_ID='" + emailid + "'and Pwd='" + pwd + "';";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            string utype = string.Empty;
            MySqlDataReader login = cmd.ExecuteReader();
            while (login.Read())
            {
                utype += login["User_Type"].ToString();
            }

            Debug.WriteLine("User type:  " + utype);
                //Response.Redirect("~/Admin/index.aspx");
                if (!utype.IsNullOrEmpty())
                {
                    //Response.Redirect("~/Admin/index.aspx");

                    Debug.WriteLine("Readed User type:  " + utype);

                    if (utype == "Admin") {
                        Response.Write("Success");
                        Session["uname"] = this.emailid.Value;
                        Response.Redirect("~/Admin/index.aspx");

                        //conn.Close();
                    }
                    else if (utype == "Student") {
                        Response.Write("Success");
                        Session["uname"] = this.emailid.Value;
                        Response.Redirect("~/Student/index.aspx");

                       // conn.Close();
                    }
                    else if (utype == "Staff")
                    {
                        Response.Write("Success");
                        Session["uname"] = this.emailid.Value;
                        Response.Redirect("~/Teacher/index.aspx");

                        //conn.Close();
                    }
                    //conn.Close();
                }
                else
                {
                    Response.Write("Error");
                    //conn.Close();
                    Debug.WriteLine("Not Found");
                }
            //}
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