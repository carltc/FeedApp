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
        try
        {
            myConnection.Open();
            missingDataText.Visible = false;
            myConnection.Close();
        }
        catch
        {
            LiveMeals.ConnectionString = ConfigurationManager.ConnectionStrings["TestDatabase"].ConnectionString;
            missingDataText.Visible = true;
            missingDataText.Text = "Showing test database.";
        }
        LiveMeals.Selected += LiveMeals_Selected;
    }

    private void LiveMeals_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //throw new NotImplementedException();
        if (e.Exception != null)
        {
            //Hide DataList1
            DataList1.Visible = false;

            //Show missing datalist text
            missingDataText.Visible = true;
        }
    }

    void myConnection_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            //Hide DataList1
            DataList1.Visible = false;

            //Show missing datalist text
            missingDataText.Visible = true;
        }
    }
}