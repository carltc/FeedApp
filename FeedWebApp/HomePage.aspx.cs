using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

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

    public void liveMeals_Data_Bound(Object sender, DataListItemEventArgs e)
    {
        Image meat_Icon = (Image)e.Item.FindControl("meatIcon");
        Image fish_Icon = (Image)e.Item.FindControl("fishIcon");
        Image shellfish_Icon = (Image)e.Item.FindControl("shellfishIcon");
        Image wheat_Icon = (Image)e.Item.FindControl("wheatIcon");
        Image nut_Icon = (Image)e.Item.FindControl("nutIcon");
        Image dairy_Icon = (Image)e.Item.FindControl("dairyIcon");
        Image egg_Icon = (Image)e.Item.FindControl("eggIcon");

        bool meat_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[5].ToString()));
        bool fish_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[6].ToString()));
        bool shellfish_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[7].ToString()));
        bool gluten_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[8].ToString()));
        bool nut_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[9].ToString()));
        bool dairy_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[10].ToString()));
        bool egg_Bool = Convert.ToBoolean((((DataRowView)e.Item.DataItem).Row.ItemArray[11].ToString()));

        if (meat_Bool){meat_Icon.Visible = true;} else{meat_Icon.Visible = false;}
        if (fish_Bool) { fish_Icon.Visible = true; } else { fish_Icon.Visible = false; }
        if (shellfish_Bool) { shellfish_Icon.Visible = true; } else { shellfish_Icon.Visible = false; }
        if (gluten_Bool) { wheat_Icon.Visible = true; } else { wheat_Icon.Visible = false; }
        if (nut_Bool) { nut_Icon.Visible = true; } else { nut_Icon.Visible = false; }
        if (dairy_Bool) { dairy_Icon.Visible = true; } else { dairy_Icon.Visible = false; }
        if (egg_Bool) { egg_Icon.Visible = true; } else { egg_Icon.Visible = false; }
    }
}