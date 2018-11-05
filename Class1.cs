using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;


namespace validation_exercise
{
    public class connection
    {
        public static string GetConnectionString()
        {
            string FileName = "Database3.accdb";
            string location = HttpContext.Current.Server.MapPath("~/App_Data/" + FileName);
            string connectionstring = @"provider=Microsoft.ACE.OLEDB.12.0; data source=" + location;
            return connectionstring;
        }

    }
    
}