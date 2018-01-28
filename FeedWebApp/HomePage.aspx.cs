using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedMeDataBaseConnectionString-testUser"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        //// LOAD LIVE MEALs
        //myConnection.Open();

        //string query = "SELECT * FROM [dbo].[LiveMeals]";
        ////SqlCommand selectCommand = new SqlCommand(query, myConnection);
        ////string results = selectCommand.ExecuteReader();
        ////string noti = selectCommand.Notification.ToString();

        //SqlCommand command = new SqlCommand(query, myConnection);
        //SqlDataReader reader = command.ExecuteReader();
        //while (reader.Read())
        //{
        //    TableRow tRow = new TableRow();
        //    int[] columnsNeeded = new int[] { 1, 3, 4, 5, 6 };
        //    foreach (int ii in columnsNeeded)
        //    {
        //        TableCell tCell = new TableCell();
        //        tCell.Text = reader[ii].ToString();
        //        tRow.Cells.Add(tCell);
        //        Console.WriteLine(String.Format("{0}", reader[0]));
        //    }
        //    //tRow.Attributes["onclick"] = "expandRow(this);";
        //    tRow.Attributes["class"] = "mealRow";
        //    tRow.Attributes["border-spacing"] = "5em";
        //    LiveMealTable.Rows.Add(tRow);
        //}

        //SqlCommand insertCommand = new SqlCommand(query, myConnection);
        //insertCommand.Parameters.AddWithValue("@name", TextBox1.Text);
        //insertCommand.Parameters.AddWithValue("@add", TextBox2.Text);
        //insertCommand.ExecuteNonQuery();
        //myConnection.Close();
    }
}