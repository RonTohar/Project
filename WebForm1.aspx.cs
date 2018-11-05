using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
namespace validation_exercise
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public bool IsExsitingUser()
        { 
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = connection.GetConnectionString();
                OleDbCommand command = new OleDbCommand("select username,email from users where username=@username or email=@email or id=@id", conn);
                command.Parameters.AddWithValue("@username", user.Text);
                command.Parameters.AddWithValue("@email", Email.Text);
                command.Parameters.AddWithValue("@id", ID.Text);
                conn.Open();
                OleDbDataReader reader = command.ExecuteReader();

                return reader.Read();
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Email.Text = "";
            Birthday.Text = "";
            user.Text = "";
            password.Text = "";
            confirmPassword.Text = "";
            firstname.Text = "";
            lastname.Text = "";
            
        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            if (IsValid)
            {
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = connection.GetConnectionString();
                try
                {
                    if (!IsExsitingUser())
                    {
                        string q = "insert into users values(@id, @firstname, @lastname, @username, @password, @email)";

                        OleDbCommand command = new OleDbCommand(q,conn);
                        
                        
                        command.Parameters.AddWithValue("@id", ID.Text.ToString());
                        command.Parameters.AddWithValue("@firstname",firstname.Text.ToString());
                        command.Parameters.AddWithValue("@lastname",lastname.Text.ToString());
                        command.Parameters.AddWithValue("@username",user.Text.ToString());
                        command.Parameters.AddWithValue("@password",password.Text.ToString());
                        command.Parameters.AddWithValue("@email",Email.Text.ToString());
                        conn.Open();
                        command.ExecuteNonQuery();
                        Label1.Text = "<script> alert('You have registered successfuly');</script>";

                    }
                    else { Label1.Text = "<script> alert('User already exists');</script>"; }
                }
                catch(OleDbException ex)
                {
                    Console.WriteLine("Error" + ex.Message);
                    Console.WriteLine("stack trace-->" + ex.StackTrace);
                }
                catch(Exception ex)
                {
                    Console.WriteLine("General Error" + ex.Message);
                    Console.WriteLine("stack trace-->" + ex.StackTrace);
                }
                finally { conn.Close();}

            }

        }

        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            string check = args.Value.ToString();
          bool x=  check.ToCharArray().Any(char.IsDigit);
            if (x)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string check = args.Value.ToString();
            bool x = check.ToCharArray().Any(char.IsDigit);
            if (x)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;

        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string check = args.Value.ToString();
            int x = check.Length;
            if (x != 9)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = connection.GetConnectionString();
            string q = "DELETE FROM users WHERE id=@ron";
                
            OleDbCommand command = new OleDbCommand(q, conn);
            command.Parameters.AddWithValue("@ron", 209888932);
            conn.Open();
            command.ExecuteNonQuery();
            conn.Close();

        }
    }
}