using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using AjaxControlToolkit;

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
        // Get Live Meal data
        DataRowView item1 = (DataRowView)e.Item.DataItem;
        object[] meal_Data = item1.Row.ItemArray;

        // Get the current datalist entry.
        Accordion live_Meals_Accordion = (Accordion)e.Item.FindControl("liveMealsAccordion");

        //Find meal labels
        Label name_Label = (Label)live_Meals_Accordion.FindControl("MealNameLabel");
        Label chef_Label = (Label)live_Meals_Accordion.FindControl("ChefNameLabel");
        Label price_Label = (Label)live_Meals_Accordion.FindControl("MealPriceLabel");
        Label location_Label = (Label)live_Meals_Accordion.FindControl("MealLocationLabel");
        Label time_Label = (Label)live_Meals_Accordion.FindControl("MealTimeLabel");
        Label description_Label = (Label)live_Meals_Accordion.FindControl("MealDescriptionLabel");


        //Find dietary icons
        Image meat_Icon = (Image)live_Meals_Accordion.FindControl("meatIcon");
        Image fish_Icon = (Image)live_Meals_Accordion.FindControl("fishIcon");
        Image shellfish_Icon = (Image)live_Meals_Accordion.FindControl("shellfishIcon");
        Image wheat_Icon = (Image)live_Meals_Accordion.FindControl("wheatIcon");
        Image nut_Icon = (Image)live_Meals_Accordion.FindControl("nutIcon");
        Image dairy_Icon = (Image)live_Meals_Accordion.FindControl("dairyIcon");
        Image egg_Icon = (Image)live_Meals_Accordion.FindControl("eggIcon");

        //Populate meal info
        name_Label.Text = (string)meal_Data[0];
        chef_Label.Text = (string)meal_Data[1];
        double price = Convert.ToDouble(meal_Data[2]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)meal_Data[3];
        time_Label.Text = (string)meal_Data[4];

        //Showing dietary
        if ((Boolean)meal_Data[5]){meat_Icon.Visible = true;} else{meat_Icon.Visible = false;}
        if ((Boolean)meal_Data[6]) { fish_Icon.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)meal_Data[7]) { shellfish_Icon.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)meal_Data[8]) { wheat_Icon.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)meal_Data[9]) { nut_Icon.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)meal_Data[10]) { dairy_Icon.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)meal_Data[11]) { egg_Icon.Visible = true; } else { egg_Icon.Visible = false; }

        //Add description
        description_Label.Text = (string)meal_Data[12];
    }
}