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
        //Check if connection works
        try
        {
            myConnection.Open();
            missingDataText.Visible = false;
            myConnection.Close();
        }
        catch
        {
            //Switch to local offline test database
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
        Label date_Label = (Label)live_Meals_Accordion.FindControl("MealDateLabel");
        Label description_Label = (Label)live_Meals_Accordion.FindControl("MealDescriptionLabel");
        
        //Find dietary icons
        Image meat_Icon = (Image)live_Meals_Accordion.FindControl("meatIcon");
        Image fish_Icon = (Image)live_Meals_Accordion.FindControl("fishIcon");
        Image shellfish_Icon = (Image)live_Meals_Accordion.FindControl("shellfishIcon");
        Image wheat_Icon = (Image)live_Meals_Accordion.FindControl("wheatIcon");
        Image nut_Icon = (Image)live_Meals_Accordion.FindControl("nutIcon");
        Image dairy_Icon = (Image)live_Meals_Accordion.FindControl("dairyIcon");
        Image egg_Icon = (Image)live_Meals_Accordion.FindControl("eggIcon");

        //Store mealID
        int meal_ID = (int)meal_Data[0];
        mealIDField.Value = meal_ID.ToString();

        //Populate meal info
        name_Label.Text = (string)meal_Data[1];
        chef_Label.Text = (string)meal_Data[3];
        double price = Convert.ToDouble(meal_Data[4]);
        price_Label.Text = price.ToString("c");
        location_Label.Text = (string)meal_Data[5];
        time_Label.Text = (string)meal_Data[6];
        date_Label.Text = (string)meal_Data[7];

        //Showing dietary
        if ((Boolean)meal_Data[8]){meat_Icon.Visible = true; mealDietaryPanel.Visible = true; } else{meat_Icon.Visible = false;}
        if ((Boolean)meal_Data[9]) { fish_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { fish_Icon.Visible = false; }
        if ((Boolean)meal_Data[10]) { shellfish_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { shellfish_Icon.Visible = false; }
        if ((Boolean)meal_Data[11]) { wheat_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { wheat_Icon.Visible = false; }
        if ((Boolean)meal_Data[12]) { nut_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { nut_Icon.Visible = false; }
        if ((Boolean)meal_Data[13]) { dairy_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { dairy_Icon.Visible = false; }
        if ((Boolean)meal_Data[14]) { egg_Icon.Visible = true; mealDietaryPanel.Visible = true; } else { egg_Icon.Visible = false; }

        //Meal spaces
        total_Meal_Spaces = (int)meal_Data[15];
        taken_Meal_Spaces = (int)meal_Data[16];
        string meal_Spaces = taken_Meal_Spaces.ToString() + "/" + total_Meal_Spaces.ToString();
        MealSpacesLabel.Text = meal_Spaces;

        //Add description
        description_Label.Text = (string)meal_Data[17];

        //Check if logged in if not hide button, show text
        if (string.IsNullOrEmpty(User.Identity.GetUserId()))
        {
            live_Meals_Accordion.FindControl("joinButton").Visible = false;
            live_Meals_Accordion.FindControl("leaveButton").Visible = false;
            live_Meals_Accordion.FindControl("manageButton").Visible = false;
            live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = true;
        }
        else
        {
            //Check if user has hosted meal
            if ((string)meal_Data[2] == User.Identity.GetUserId())
            {
                live_Meals_Accordion.FindControl("joinButton").Visible = false;
                live_Meals_Accordion.FindControl("leaveButton").Visible = false;
                live_Meals_Accordion.FindControl("manageButton").Visible = true;
                live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = false;
            }
            else
            {
                //Check if user has already joined meal
                if (meal_Guest_Check(meal_ID.ToString(), User.Identity.GetUserId()))
                {
                    live_Meals_Accordion.FindControl("joinButton").Visible = false;
                    live_Meals_Accordion.FindControl("leaveButton").Visible = true;
                    live_Meals_Accordion.FindControl("manageButton").Visible = false;
                    live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = false;
                }
                else
                {
                    live_Meals_Accordion.FindControl("joinButton").Visible = true;
                    live_Meals_Accordion.FindControl("leaveButton").Visible = false;
                    live_Meals_Accordion.FindControl("manageButton").Visible = false;
                    live_Meals_Accordion.FindControl("loginToJoinLabel").Visible = false;
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