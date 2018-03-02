using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using AjaxControlToolkit;
using Microsoft.AspNet.Identity;

public partial class _Default : Page
{   
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    int total_Meal_Spaces, taken_Meal_Spaces;

    protected void Page_Load(object sender, EventArgs e)
    {
        //using (myConnection)
        //{
        //    try
        //    {
        //        myConnection.Open();
        //        missingDataText.Visible = false;
        //    }
        //    catch (SqlException ex)
        //    {
        //        //Switch to local offline test database
        //        LiveMeals.ConnectionString = ConfigurationManager.ConnectionStrings["TestDatabase"].ConnectionString;
        //        missingDataText.Visible = true;
        //        missingDataText.Text = "Showing test database.";
        //    }
        //}
        //LiveMeals.Selected += LiveMeals_Selected;

        if (breakfastDataList.Items.Count == 0){breakfastPanel.Visible = false; }
        if (brunchDataList.Items.Count == 0) { brunchPanel.Visible = false; }
        if (lunchDataList.Items.Count == 0) { lunchPanel.Visible = false; }
        if (dinnerDataList.Items.Count == 0) { dinnerPanel.Visible = false; }
        if (dessertDataList.Items.Count == 0) { dessertPanel.Visible = false; }
    }

    private void LiveMeals_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        ////throw new NotImplementedException();
        //if (e.Exception != null)
        //{
        //    //Hide DataList1
        //    DataList1.Visible = false;

        //    //Show missing datalist text
        //    missingDataText.Visible = true;
        //}
    }

    void myConnection_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //if (e.Exception != null)
        //{
        //    //Hide DataList1
        //    DataList1.Visible = false;

        //    //Show missing datalist text
        //    missingDataText.Visible = true;
        //}
    }

    //public void liveMeals_Data_Bound(Object sender, DataListItemEventArgs e)
    //{
    //    // Get Live Meal data
    //    DataRowView item1 = (DataRowView)e.Item.DataItem;
    //    object[] meal_Data = item1.Row.ItemArray;

    //    // Get the current datalist entry.
    //    Accordion live_Meals_Accordion = (Accordion)e.Item.FindControl("liveMealsAccordion");

    //    //Find meal labels
    //    Label name_Label = (Label)live_Meals_Accordion.FindControl("MealNameLabel");
    //    Label chef_Label = (Label)live_Meals_Accordion.FindControl("ChefNameLabel");
    //    Label price_Label = (Label)live_Meals_Accordion.FindControl("MealPriceLabel");
    //    Label location_Label = (Label)live_Meals_Accordion.FindControl("MealLocationLabel");
    //    Label time_Label = (Label)live_Meals_Accordion.FindControl("MealTimeLabel");
    //    Label date_Label = (Label)live_Meals_Accordion.FindControl("MealDateLabel");
    //    Label description_Label = (Label)live_Meals_Accordion.FindControl("MealDescriptionLabel");
        
    //    //Find dietary icons
    //    Image meat_Icon = (Image)live_Meals_Accordion.FindControl("meatIcon");
    //    Image fish_Icon = (Image)live_Meals_Accordion.FindControl("fishIcon");
    //    Image shellfish_Icon = (Image)live_Meals_Accordion.FindControl("shellfishIcon");
    //    Image wheat_Icon = (Image)live_Meals_Accordion.FindControl("wheatIcon");
    //    Image nut_Icon = (Image)live_Meals_Accordion.FindControl("nutIcon");
    //    Image dairy_Icon = (Image)live_Meals_Accordion.FindControl("dairyIcon");
    //    Image egg_Icon = (Image)live_Meals_Accordion.FindControl("eggIcon");

    //    //Store mealID
    //    int meal_ID = (int)meal_Data[0];
    //    mealIDField.Value = meal_ID.ToString();

    //    //Populate meal info
    //    name_Label.Text = (string)meal_Data[1];
    //    chef_Label.Text = (string)meal_Data[3];
    //    double price = Convert.ToDouble(meal_Data[4]);
    //    price_Label.Text = price.ToString("c");
    //    location_Label.Text = (string)meal_Data[5];
    //    time_Label.Text = (string)meal_Data[6];
    //    date_Label.Text = (string)meal_Data[7];

    //    //Showing dietary
    //    if ((Boolean)meal_Data[8]){meat_Icon.Visible = true; mealDietaryPanel.Visible = true; } else{meat_Icon.Visible = false;}
    //    if ((Boolean)meal_Data[9]) { fish_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
    //    if ((Boolean)meal_Data[10]) { shellfish_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
    //    if ((Boolean)meal_Data[11]) { wheat_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
    //    if ((Boolean)meal_Data[12]) { nut_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
    //    if ((Boolean)meal_Data[13]) { dairy_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
    //    if ((Boolean)meal_Data[14]) { egg_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

    //    //Meal spaces
    //    total_Meal_Spaces = (int)meal_Data[15];
    //    taken_Meal_Spaces = (int)meal_Data[16];
    //    string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
    //    MealSpacesLabel.Text = meal_Spaces;

    //    //Add description
    //    description_Label.Text = (string)meal_Data[17];

    //    //Check if logged in if not hide button, show text
    //    if (string.IsNullOrEmpty(User.Identity.GetUserId()))
    //    {
    //        live_Meals_Accordion.FindControl("joinButton").Visible = false;
    //        live_Meals_Accordion.FindControl("leaveButton").Visible = false;
    //        live_Meals_Accordion.FindControl("manageButton").Visible = false;
    //        live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = true;
    //    }
    //    else
    //    {
    //        //Check if user has hosted meal
    //        if ((string)meal_Data[2] == User.Identity.GetUserId())
    //        {
    //            live_Meals_Accordion.FindControl("joinButton").Visible = false;
    //            live_Meals_Accordion.FindControl("leaveButton").Visible = false;
    //            live_Meals_Accordion.FindControl("manageButton").Visible = true;
    //            live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = false;
    //        }
    //        else
    //        {
    //            //Check if user has already joined meal
    //            if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
    //            {
    //                live_Meals_Accordion.FindControl("joinButton").Visible = false;
    //                live_Meals_Accordion.FindControl("leaveButton").Visible = true;
    //                live_Meals_Accordion.FindControl("manageButton").Visible = false;
    //                live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = false;
    //            }
    //            else
    //            {
    //                live_Meals_Accordion.FindControl("joinButton").Visible = true;
    //                live_Meals_Accordion.FindControl("leaveButton").Visible = false;
    //                live_Meals_Accordion.FindControl("manageButton").Visible = false;
    //                live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = false;
    //            }
    //        }
    //    }
    //}

    public void breakfast_Data_Bound(Object sender, DataListItemEventArgs e)
    {
        // Get Live Meal data
        DataRowView item1 = (DataRowView)e.Item.DataItem;
        object[] breakfast_Data = item1.Row.ItemArray;

        // Get the current datalist entry.
        Accordion breakfast_Accordion = (Accordion)e.Item.FindControl("breakfastAccordion");

        //Find meal labels
        Label name_Label = (Label)breakfast_Accordion.FindControl("breakfastNameLabel");
        Label chef_Label = (Label)breakfast_Accordion.FindControl("breakfastChefNameLabel");
        Label price_Label = (Label)breakfast_Accordion.FindControl("breakfastPriceLabel");
        Label location_Label = (Label)breakfast_Accordion.FindControl("breakfastLocationLabel");
        Label time_Label = (Label)breakfast_Accordion.FindControl("breakfastTimeLabel");
        Label date_Label = (Label)breakfast_Accordion.FindControl("breakfastDateLabel");
        Label description_Label = (Label)breakfast_Accordion.FindControl("breakfastDescriptionLabel");
        Label spaces_Label = (Label)breakfast_Accordion.FindControl("breakfastSpacesLabel");

        //Find dietary icons
        Image meat_Icon = (Image)breakfast_Accordion.FindControl("breakfastMeatIcon");
        Image fish_Icon = (Image)breakfast_Accordion.FindControl("breakfastFishIcon");
        Image shellfish_Icon = (Image)breakfast_Accordion.FindControl("breakfastShellfishIcon");
        Image wheat_Icon = (Image)breakfast_Accordion.FindControl("breakfastWheatIcon");
        Image nut_Icon = (Image)breakfast_Accordion.FindControl("breakfastNutIcon");
        Image dairy_Icon = (Image)breakfast_Accordion.FindControl("breakfastDairyIcon");
        Image egg_Icon = (Image)breakfast_Accordion.FindControl("breakfastEggIcon");

        //Store mealID
        int meal_ID = (int)breakfast_Data[0];
        breakfastMealIDField.Value = meal_ID.ToString();

        //Populate meal info
        name_Label.Text = (string)breakfast_Data[1];
        chef_Label.Text = (string)breakfast_Data[3];
        double price = Convert.ToDouble(breakfast_Data[4]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)breakfast_Data[5];
        time_Label.Text = (string)breakfast_Data[6];
        date_Label.Text = (string)breakfast_Data[7];

        //Showing dietary
        if ((Boolean)breakfast_Data[8]) { meat_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { meat_Icon.Visible = false; }
        if ((Boolean)breakfast_Data[9]) { fish_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)breakfast_Data[10]) { shellfish_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)breakfast_Data[11]) { wheat_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)breakfast_Data[12]) { nut_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)breakfast_Data[13]) { dairy_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)breakfast_Data[14]) { egg_Icon.Visible = true; breakfastDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

        //Meal spaces
        total_Meal_Spaces = (int)breakfast_Data[15];
        taken_Meal_Spaces = (int)breakfast_Data[16];
        string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
        spaces_Label.Text = meal_Spaces;

        //Add description
        description_Label.Text = (string)breakfast_Data[17];

        //Check if logged in if not hide button, show text
        if (string.IsNullOrEmpty(User.Identity.GetUserId()))
        {
            breakfast_Accordion.FindControl("breakfastJoinButton").Visible = false;
            breakfast_Accordion.FindControl("breakfastLeaveButton").Visible = false;
            breakfast_Accordion.FindControl("breakfastManageButton").Visible = false;
            breakfast_Accordion.FindControl("breakfastLoginToJoinLabel").Visible = true;
        }
        else
        {
            //Check if user has hosted meal
            if ((string)breakfast_Data[2] == User.Identity.GetUserId())
            {
                breakfast_Accordion.FindControl("breakfastJoinButton").Visible = false;
                breakfast_Accordion.FindControl("breakfastLeaveButton").Visible = false;
                breakfast_Accordion.FindControl("breakfastManageButton").Visible = true;
                breakfast_Accordion.FindControl("breakfastLoginToJoinLabel").Visible = false;
            }
            else
            {
                //Check if user has already joined meal
                if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
                {
                    breakfast_Accordion.FindControl("breakfastJoinButton").Visible = false;
                    breakfast_Accordion.FindControl("breakfastLeaveButton").Visible = true;
                    breakfast_Accordion.FindControl("breakfastManageButton").Visible = false;
                    breakfast_Accordion.FindControl("breakfastLoginToJoinLabel").Visible = false;
                }
                else
                {
                    breakfast_Accordion.FindControl("breakfastJoinButton").Visible = true;
                    breakfast_Accordion.FindControl("breakfastLeaveButton").Visible = false;
                    breakfast_Accordion.FindControl("breakfastManageButton").Visible = false;
                    breakfast_Accordion.FindControl("breakfastLoginToJoinLabel").Visible = false;
                }
            }
        }
    }

    public void brunch_Data_Bound(Object sender, DataListItemEventArgs e)
    {
        // Get Live Meal data
        DataRowView item1 = (DataRowView)e.Item.DataItem;
        object[] brunch_Data = item1.Row.ItemArray;

        // Get the current datalist entry.
        Accordion brunch_Accordion = (Accordion)e.Item.FindControl("brunchAccordion");

        //Find meal labels
        Label name_Label = (Label)brunch_Accordion.FindControl("brunchNameLabel");
        Label chef_Label = (Label)brunch_Accordion.FindControl("brunchChefNameLabel");
        Label price_Label = (Label)brunch_Accordion.FindControl("brunchPriceLabel");
        Label location_Label = (Label)brunch_Accordion.FindControl("brunchLocationLabel");
        Label time_Label = (Label)brunch_Accordion.FindControl("brunchTimeLabel");
        Label date_Label = (Label)brunch_Accordion.FindControl("brunchDateLabel");
        Label description_Label = (Label)brunch_Accordion.FindControl("brunchDescriptionLabel");
        Label spaces_Label = (Label)brunch_Accordion.FindControl("brunchSpacesLabel");

        //Find dietary icons
        Image meat_Icon = (Image)brunch_Accordion.FindControl("brunchMeatIcon");
        Image fish_Icon = (Image)brunch_Accordion.FindControl("brunchFishIcon");
        Image shellfish_Icon = (Image)brunch_Accordion.FindControl("brunchShellfishIcon");
        Image wheat_Icon = (Image)brunch_Accordion.FindControl("brunchWheatIcon");
        Image nut_Icon = (Image)brunch_Accordion.FindControl("brunchNutIcon");
        Image dairy_Icon = (Image)brunch_Accordion.FindControl("brunchDairyIcon");
        Image egg_Icon = (Image)brunch_Accordion.FindControl("brunchEggIcon");

        //Store mealID
        int meal_ID = (int)brunch_Data[0];
        brunchMealIDField.Value = meal_ID.ToString();

        //Populate meal info
        name_Label.Text = (string)brunch_Data[1];
        chef_Label.Text = (string)brunch_Data[3];
        double price = Convert.ToDouble(brunch_Data[4]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)brunch_Data[5];
        time_Label.Text = (string)brunch_Data[6];
        date_Label.Text = (string)brunch_Data[7];

        //Showing dietary
        if ((Boolean)brunch_Data[8]) { meat_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { meat_Icon.Visible = false; }
        if ((Boolean)brunch_Data[9]) { fish_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)brunch_Data[10]) { shellfish_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)brunch_Data[11]) { wheat_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)brunch_Data[12]) { nut_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)brunch_Data[13]) { dairy_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)brunch_Data[14]) { egg_Icon.Visible = true; brunchDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

        //Meal spaces
        total_Meal_Spaces = (int)brunch_Data[15];
        taken_Meal_Spaces = (int)brunch_Data[16];
        string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
        spaces_Label.Text = meal_Spaces;

        //Add description
        description_Label.Text = (string)brunch_Data[17];

        //Check if logged in if not hide button, show text
        if (string.IsNullOrEmpty(User.Identity.GetUserId()))
        {
            brunch_Accordion.FindControl("brunchJoinButton").Visible = false;
            brunch_Accordion.FindControl("brunchLeaveButton").Visible = false;
            brunch_Accordion.FindControl("brunchManageButton").Visible = false;
            brunch_Accordion.FindControl("brunchLoginToJoinLabel").Visible = true;
        }
        else
        {
            //Check if user has hosted meal
            if ((string)brunch_Data[2] == User.Identity.GetUserId())
            {
                brunch_Accordion.FindControl("brunchJoinButton").Visible = false;
                brunch_Accordion.FindControl("brunchLeaveButton").Visible = false;
                brunch_Accordion.FindControl("brunchManageButton").Visible = true;
                brunch_Accordion.FindControl("brunchLoginToJoinLabel").Visible = false;
            }
            else
            {
                //Check if user has already joined meal
                if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
                {
                    brunch_Accordion.FindControl("brunchJoinButton").Visible = false;
                    brunch_Accordion.FindControl("brunchLeaveButton").Visible = true;
                    brunch_Accordion.FindControl("brunchManageButton").Visible = false;
                    brunch_Accordion.FindControl("brunchLoginToJoinLabel").Visible = false;
                }
                else
                {
                    brunch_Accordion.FindControl("brunchJoinButton").Visible = true;
                    brunch_Accordion.FindControl("brunchLeaveButton").Visible = false;
                    brunch_Accordion.FindControl("brunchManageButton").Visible = false;
                    brunch_Accordion.FindControl("brunchLoginToJoinLabel").Visible = false;
                }
            }
        }
    }

    public void lunch_Data_Bound(Object sender, DataListItemEventArgs e)
    {
        // Get Live Meal data
        DataRowView item1 = (DataRowView)e.Item.DataItem;
        object[] lunch_Data = item1.Row.ItemArray;

        // Get the current datalist entry.
        Accordion lunch_Accordion = (Accordion)e.Item.FindControl("lunchAccordion");

        //Find meal labels
        Label name_Label = (Label)lunch_Accordion.FindControl("lunchNameLabel");
        Label chef_Label = (Label)lunch_Accordion.FindControl("lunchChefNameLabel");
        Label price_Label = (Label)lunch_Accordion.FindControl("lunchPriceLabel");
        Label location_Label = (Label)lunch_Accordion.FindControl("lunchLocationLabel");
        Label time_Label = (Label)lunch_Accordion.FindControl("lunchTimeLabel");
        Label date_Label = (Label)lunch_Accordion.FindControl("lunchDateLabel");
        Label description_Label = (Label)lunch_Accordion.FindControl("lunchDescriptionLabel");
        Label spaces_Label = (Label)lunch_Accordion.FindControl("lunchSpacesLabel");

        //Find dietary icons
        Image meat_Icon = (Image)lunch_Accordion.FindControl("lunchMeatIcon");
        Image fish_Icon = (Image)lunch_Accordion.FindControl("lunchFishIcon");
        Image shellfish_Icon = (Image)lunch_Accordion.FindControl("lunchShellfishIcon");
        Image wheat_Icon = (Image)lunch_Accordion.FindControl("lunchWheatIcon");
        Image nut_Icon = (Image)lunch_Accordion.FindControl("lunchNutIcon");
        Image dairy_Icon = (Image)lunch_Accordion.FindControl("lunchDairyIcon");
        Image egg_Icon = (Image)lunch_Accordion.FindControl("lunchEggIcon");

        //Store mealID
        int meal_ID = (int)lunch_Data[0];
        lunchMealIDField.Value = meal_ID.ToString();

        //Populate meal info
        name_Label.Text = (string)lunch_Data[1];
        chef_Label.Text = (string)lunch_Data[3];
        double price = Convert.ToDouble(lunch_Data[4]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)lunch_Data[5];
        time_Label.Text = (string)lunch_Data[6];
        date_Label.Text = (string)lunch_Data[7];

        //Showing dietary
        if ((Boolean)lunch_Data[8]) { meat_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { meat_Icon.Visible = false; }
        if ((Boolean)lunch_Data[9]) { fish_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)lunch_Data[10]) { shellfish_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)lunch_Data[11]) { wheat_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)lunch_Data[12]) { nut_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)lunch_Data[13]) { dairy_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)lunch_Data[14]) { egg_Icon.Visible = true; lunchDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

        //Meal spaces
        total_Meal_Spaces = (int)lunch_Data[15];
        taken_Meal_Spaces = (int)lunch_Data[16];
        string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
        spaces_Label.Text = meal_Spaces;

        //Add description
        description_Label.Text = (string)lunch_Data[17];

        //Check if logged in if not hide button, show text
        if (string.IsNullOrEmpty(User.Identity.GetUserId()))
        {
            lunch_Accordion.FindControl("lunchJoinButton").Visible = false;
            lunch_Accordion.FindControl("lunchLeaveButton").Visible = false;
            lunch_Accordion.FindControl("lunchManageButton").Visible = false;
            lunch_Accordion.FindControl("lunchLoginToJoinLabel").Visible = true;
        }
        else
        {
            //Check if user has hosted meal
            if ((string)lunch_Data[2] == User.Identity.GetUserId())
            {
                lunch_Accordion.FindControl("lunchJoinButton").Visible = false;
                lunch_Accordion.FindControl("lunchLeaveButton").Visible = false;
                lunch_Accordion.FindControl("lunchManageButton").Visible = true;
                lunch_Accordion.FindControl("lunchLoginToJoinLabel").Visible = false;
            }
            else
            {
                //Check if user has already joined meal
                if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
                {
                    lunch_Accordion.FindControl("lunchJoinButton").Visible = false;
                    lunch_Accordion.FindControl("lunchLeaveButton").Visible = true;
                    lunch_Accordion.FindControl("lunchManageButton").Visible = false;
                    lunch_Accordion.FindControl("lunchLoginToJoinLabel").Visible = false;
                }
                else
                {
                    lunch_Accordion.FindControl("lunchJoinButton").Visible = true;
                    lunch_Accordion.FindControl("lunchLeaveButton").Visible = false;
                    lunch_Accordion.FindControl("lunchManageButton").Visible = false;
                    lunch_Accordion.FindControl("lunchLoginToJoinLabel").Visible = false;
                }
            }
        }
    }

    public void dinner_Data_Bound(Object sender, DataListItemEventArgs e)
    {
        // Get Live Meal data
        DataRowView item1 = (DataRowView)e.Item.DataItem;
        object[] dinner_Data = item1.Row.ItemArray;

        // Get the current datalist entry.
        Accordion dinner_Accordion = (Accordion)e.Item.FindControl("dinnerAccordion");

        //Find meal labels
        Label name_Label = (Label)dinner_Accordion.FindControl("dinnerNameLabel");
        Label chef_Label = (Label)dinner_Accordion.FindControl("dinnerChefNameLabel");
        Label price_Label = (Label)dinner_Accordion.FindControl("dinnerPriceLabel");
        Label location_Label = (Label)dinner_Accordion.FindControl("dinnerLocationLabel");
        Label time_Label = (Label)dinner_Accordion.FindControl("dinnerTimeLabel");
        Label date_Label = (Label)dinner_Accordion.FindControl("dinnerDateLabel");
        Label description_Label = (Label)dinner_Accordion.FindControl("dinnerDescriptionLabel");
        Label spaces_Label = (Label)dinner_Accordion.FindControl("dinnerSpacesLabel");

        //Find dietary icons
        Image meat_Icon = (Image)dinner_Accordion.FindControl("dinnerMeatIcon");
        Image fish_Icon = (Image)dinner_Accordion.FindControl("dinnerFishIcon");
        Image shellfish_Icon = (Image)dinner_Accordion.FindControl("dinnerShellfishIcon");
        Image wheat_Icon = (Image)dinner_Accordion.FindControl("dinnerWheatIcon");
        Image nut_Icon = (Image)dinner_Accordion.FindControl("dinnerNutIcon");
        Image dairy_Icon = (Image)dinner_Accordion.FindControl("dinnerDairyIcon");
        Image egg_Icon = (Image)dinner_Accordion.FindControl("dinnerEggIcon");

        //Store mealID
        int meal_ID = (int)dinner_Data[0];
        dinnerMealIDField.Value = meal_ID.ToString();

        //Populate meal info
        name_Label.Text = (string)dinner_Data[1];
        chef_Label.Text = (string)dinner_Data[3];
        double price = Convert.ToDouble(dinner_Data[4]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)dinner_Data[5];
        time_Label.Text = (string)dinner_Data[6];
        date_Label.Text = (string)dinner_Data[7];

        //Showing dietary
        if ((Boolean)dinner_Data[8]) { meat_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { meat_Icon.Visible = false; }
        if ((Boolean)dinner_Data[9]) { fish_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)dinner_Data[10]) { shellfish_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)dinner_Data[11]) { wheat_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)dinner_Data[12]) { nut_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)dinner_Data[13]) { dairy_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)dinner_Data[14]) { egg_Icon.Visible = true; dinnerDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

        //Meal spaces
        total_Meal_Spaces = (int)dinner_Data[15];
        taken_Meal_Spaces = (int)dinner_Data[16];
        string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
        spaces_Label.Text = meal_Spaces;

        //Add description
        description_Label.Text = (string)dinner_Data[17];

        //Check if logged in if not hide button, show text
        if (string.IsNullOrEmpty(User.Identity.GetUserId()))
        {
            dinner_Accordion.FindControl("dinnerJoinButton").Visible = false;
            dinner_Accordion.FindControl("dinnerLeaveButton").Visible = false;
            dinner_Accordion.FindControl("dinnerManageButton").Visible = false;
            dinner_Accordion.FindControl("dinnerLoginToJoinLabel").Visible = true;
        }
        else
        {
            //Check if user has hosted meal
            if ((string)dinner_Data[2] == User.Identity.GetUserId())
            {
                dinner_Accordion.FindControl("dinnerJoinButton").Visible = false;
                dinner_Accordion.FindControl("dinnerLeaveButton").Visible = false;
                dinner_Accordion.FindControl("dinnerManageButton").Visible = true;
                dinner_Accordion.FindControl("dinnerLoginToJoinLabel").Visible = false;
            }
            else
            {
                //Check if user has already joined meal
                if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
                {
                    dinner_Accordion.FindControl("dinnerJoinButton").Visible = false;
                    dinner_Accordion.FindControl("dinnerLeaveButton").Visible = true;
                    dinner_Accordion.FindControl("dinnerManageButton").Visible = false;
                    dinner_Accordion.FindControl("dinnerLoginToJoinLabel").Visible = false;
                }
                else
                {
                    dinner_Accordion.FindControl("dinnerJoinButton").Visible = true;
                    dinner_Accordion.FindControl("dinnerLeaveButton").Visible = false;
                    dinner_Accordion.FindControl("dinnerManageButton").Visible = false;
                    dinner_Accordion.FindControl("dinnerLoginToJoinLabel").Visible = false;
                }
            }
        }
    }

    public void dessert_Data_Bound(Object sender, DataListItemEventArgs e)
    {
        // Get Live Meal data
        DataRowView item1 = (DataRowView)e.Item.DataItem;
        object[] dessert_Data = item1.Row.ItemArray;

        // Get the current datalist entry.
        Accordion dessert_Accordion = (Accordion)e.Item.FindControl("dessertAccordion");

        //Find meal labels
        Label name_Label = (Label)dessert_Accordion.FindControl("dessertNameLabel");
        Label chef_Label = (Label)dessert_Accordion.FindControl("dessertChefNameLabel");
        Label price_Label = (Label)dessert_Accordion.FindControl("dessertPriceLabel");
        Label location_Label = (Label)dessert_Accordion.FindControl("dessertLocationLabel");
        Label time_Label = (Label)dessert_Accordion.FindControl("dessertTimeLabel");
        Label date_Label = (Label)dessert_Accordion.FindControl("dessertDateLabel");
        Label description_Label = (Label)dessert_Accordion.FindControl("dessertDescriptionLabel");
        Label spaces_Label = (Label)dessert_Accordion.FindControl("dessertSpacesLabel");

        //Find dietary icons
        Image meat_Icon = (Image)dessert_Accordion.FindControl("dessertMeatIcon");
        Image fish_Icon = (Image)dessert_Accordion.FindControl("dessertFishIcon");
        Image shellfish_Icon = (Image)dessert_Accordion.FindControl("dessertShellfishIcon");
        Image wheat_Icon = (Image)dessert_Accordion.FindControl("dessertWheatIcon");
        Image nut_Icon = (Image)dessert_Accordion.FindControl("dessertNutIcon");
        Image dairy_Icon = (Image)dessert_Accordion.FindControl("dessertDairyIcon");
        Image egg_Icon = (Image)dessert_Accordion.FindControl("dessertEggIcon");

        //Store mealID
        int meal_ID = (int)dessert_Data[0];
        dessertMealIDField.Value = meal_ID.ToString();

        //Populate meal info
        name_Label.Text = (string)dessert_Data[1];
        chef_Label.Text = (string)dessert_Data[3];
        double price = Convert.ToDouble(dessert_Data[4]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)dessert_Data[5];
        time_Label.Text = (string)dessert_Data[6];
        date_Label.Text = (string)dessert_Data[7];

        //Showing dietary
        if ((Boolean)dessert_Data[8]) { meat_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { meat_Icon.Visible = false; }
        if ((Boolean)dessert_Data[9]) { fish_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)dessert_Data[10]) { shellfish_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)dessert_Data[11]) { wheat_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)dessert_Data[12]) { nut_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)dessert_Data[13]) { dairy_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)dessert_Data[14]) { egg_Icon.Visible = true; dessertDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

        //Meal spaces
        total_Meal_Spaces = (int)dessert_Data[15];
        taken_Meal_Spaces = (int)dessert_Data[16];
        string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
        spaces_Label.Text = meal_Spaces;

        //Add description
        description_Label.Text = (string)dessert_Data[17];

        //Check if logged in if not hide button, show text
        if (string.IsNullOrEmpty(User.Identity.GetUserId()))
        {
            dessert_Accordion.FindControl("dessertJoinButton").Visible = false;
            dessert_Accordion.FindControl("dessertLeaveButton").Visible = false;
            dessert_Accordion.FindControl("dessertManageButton").Visible = false;
            dessert_Accordion.FindControl("dessertLoginToJoinLabel").Visible = true;
        }
        else
        {
            //Check if user has hosted meal
            if ((string)dessert_Data[2] == User.Identity.GetUserId())
            {
                dessert_Accordion.FindControl("dessertJoinButton").Visible = false;
                dessert_Accordion.FindControl("dessertLeaveButton").Visible = false;
                dessert_Accordion.FindControl("dessertManageButton").Visible = true;
                dessert_Accordion.FindControl("dessertLoginToJoinLabel").Visible = false;
            }
            else
            {
                //Check if user has already joined meal
                if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
                {
                    dessert_Accordion.FindControl("dessertJoinButton").Visible = false;
                    dessert_Accordion.FindControl("dessertLeaveButton").Visible = true;
                    dessert_Accordion.FindControl("dessertManageButton").Visible = false;
                    dessert_Accordion.FindControl("dessertLoginToJoinLabel").Visible = false;
                }
                else
                {
                    dessert_Accordion.FindControl("dessertJoinButton").Visible = true;
                    dessert_Accordion.FindControl("dessertLeaveButton").Visible = false;
                    dessert_Accordion.FindControl("dessertManageButton").Visible = false;
                    dessert_Accordion.FindControl("dessertLoginToJoinLabel").Visible = false;
                }
            }
        }
    }

    protected void joinButton_Command(object sender, CommandEventArgs e)
    {
        // Get meal ID
        Button join_Button = (Button)sender;
        AccordionPane live_Meal = (AccordionPane)join_Button.Parent.Parent;
        HiddenField meal_ID_Field = (HiddenField)live_Meal.FindControl("mealIDField");
        string meal_ID = meal_ID_Field.Value;
        
        //Get user ID
        string user_ID = User.Identity.GetUserId();

        if (!string.IsNullOrEmpty(user_ID) && !string.IsNullOrEmpty(meal_ID))
        {
            //Create query to be executed
            string query = "INSERT INTO [dbo].[LiveMealGuests] (MealID,GuestID) VALUES ('" + meal_ID.ToString() + "','" + user_ID.ToString() + "');";

            //Open connection and execute non-scalar
            StringBuilder errorMessages = new StringBuilder();

            using (myConnection)
            {
                SqlCommand command = new SqlCommand(query, myConnection);
                try
                {
                    command.Connection.Open();
                    int rows = command.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    for (int i = 0; i < ex.Errors.Count; i++)
                    {
                        errorMessages.Append("Index #" + i + "\n" +
                            "Message: " + ex.Errors[i].Message + "\n" +
                            "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                            "Source: " + ex.Errors[i].Source + "\n" +
                            "Procedure: " + ex.Errors[i].Procedure + "\n");
                    }
                    Console.WriteLine(errorMessages.ToString());
                }
            }
            Response.Redirect("/HomePage.aspx");
        }
    }

    protected void leaveButton_Command(object sender, CommandEventArgs e)
    {
        // Get meal ID
        Button join_Button = (Button)sender;
        AccordionPane live_Meal = (AccordionPane)join_Button.Parent.Parent;
        HiddenField meal_ID_Field = (HiddenField)live_Meal.FindControl("mealIDField");
        string meal_ID = meal_ID_Field.Value;

        //Get user ID
        string user_ID = User.Identity.GetUserId();

        if (!string.IsNullOrEmpty(user_ID) && !string.IsNullOrEmpty(meal_ID))
        {
            //Create query to be executed
            string query = "DELETE FROM [dbo].[LiveMealGuests] WHERE MealID = '" + meal_ID + "' AND GuestID = '" + user_ID + "'";

            //Open connection and execute non-scalar
            StringBuilder errorMessages = new StringBuilder();
            using (myConnection)
            {
                SqlCommand command = new SqlCommand(query, myConnection);
                try
                {
                    command.Connection.Open();
                    int rows = command.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    for (int i = 0; i < ex.Errors.Count; i++)
                    {
                        errorMessages.Append("Index #" + i + "\n" +
                            "Message: " + ex.Errors[i].Message + "\n" +
                            "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                            "Source: " + ex.Errors[i].Source + "\n" +
                            "Procedure: " + ex.Errors[i].Procedure + "\n");
                    }
                    Console.WriteLine(errorMessages.ToString());
                }
            }
            Response.Redirect("/HomePage.aspx");
        }
    }

    protected void manageButton_Command(object sender, CommandEventArgs e)
    {

    }

    public bool meal_Guest_Check(string meal_ID, string user_ID)
    {
        //Create variables
        string query = "SELECT COUNT(*) FROM [dbo].[LiveMealGuests] WHERE MealID = '" + meal_ID + "' AND GuestID = '" + user_ID + "'";
        int rows = 0;

        //Open connection and execute scalar
        StringBuilder errorMessages = new StringBuilder();
        if (myConnection.ConnectionString == "") { myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString); }
        using (myConnection)
        {
            SqlCommand command = new SqlCommand(query, myConnection);
            try
            {
                command.Connection.Open();
                rows = (int)command.ExecuteScalar();
            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    errorMessages.Append("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" +
                        "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
                Console.WriteLine(errorMessages.ToString());
            }
        }

        //If anything returned then user exists as guest
        if (rows <= 0){return false;}else{return true;}
    }
}