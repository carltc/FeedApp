using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.Identity;
using FeedWebApp;
using System.Data;
using System.Drawing;

public partial class EditMeal : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["feedWebAppUser"].ConnectionString;
    SqlConnection myConnection = new SqlConnection();
    bool dietary_Meat = false;
    bool dietary_Shellfish = false;
    bool dietary_Fish = false;
    bool dietary_Nut = false;
    bool dietary_Dairy = false;
    bool dietary_Egg = false;
    bool dietary_Gluten = false;
    int meal_Spaces = 1;
    string mealID;

    private bool UserExists(UserManager manager)
    {
        var user = manager.FindById(User.Identity.GetUserId());
        return (user != null);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        myConnection = new SqlConnection(connectionString);
        // Determine the sections to render
        UserManager manager = new UserManager();
        if (UserExists(manager))
        {
            HasRegistered.Visible = true;
            NeedsToRegister.Visible = false; // change to FALSE for deploy

            // Set up meal details
            mealChefNameLabel.Text = User.Identity.GetUserName().ToString();
            Uri editMealURI = new Uri(HttpContext.Current.Request.Url.AbsoluteUri); ;
            mealID = HttpUtility.ParseQueryString(editMealURI.Query).Get("yum");
            if (CheckMealHost())
            {
                mealIDField.Value = mealID;
                if (!IsPostBack)
                {
                    SetMealDetails();
                }
            }
            else
            {
                mealID = "0";
                throw new Exception("Page not found.");
            }
        }
        else
        {
            HasRegistered.Visible = false; // change to FALSE for deploy
            NeedsToRegister.Visible = true;
            mealChefNameLabel.Text = "unregistered";
        }
    }

    protected void editButton_Click(object sender, EventArgs e)
    {
        if (meatBool.Value == "1"){dietary_Meat = true;}else{ dietary_Meat = false;}
        if (shellfishBool.Value == "1") { dietary_Shellfish = true; } else { dietary_Shellfish = false; }
        if (fishBool.Value == "1") { dietary_Fish = true; } else { dietary_Fish = false; }
        if (wheatBool.Value == "1") { dietary_Gluten = true; } else { dietary_Gluten = false; }
        if (nutBool.Value == "1") { dietary_Nut = true; } else { dietary_Nut = false; }
        if (dairyBool.Value == "1") { dietary_Dairy = true; } else { dietary_Dairy = false; }
        if (eggBool.Value == "1") { dietary_Egg = true; } else { dietary_Egg = false; }
        meal_Spaces = Int32.Parse(mealSpaces.Value);
        
        var userID = User.Identity.GetUserId();
        string userName = User.Identity.GetUserName();
        DateTime date = Convert.ToDateTime(MealDate.Text);
        DateTime time = Convert.ToDateTime(MealStartTime.Text);

        // Add Meal to Database
        string query = "UPDATE [dbo].[LiveMeals]" +
            "SET " +
            "MealName = '" + MealName.Text + "'," +
            "MealPrice = '" + MealCost.Text + "'," +
            "MealLocation = '" + MealLocation.Text + "'," +
            "MealTime = CONVERT(datetime, '" + date.ToString("dd/MM/yyyy") + " " + time.ToString("HH:mm") + "',103)" + "," +
            "dietary_Meat = '" + dietary_Meat.ToString() + "'," +
            "dietary_Fish = '" + dietary_Fish.ToString() + "'," +
            "dietary_Shellfish = '" + dietary_Shellfish.ToString() + "'," +
            "dietary_Gluten = '" + dietary_Gluten.ToString() + "'," +
            "dietary_Nut = '" + dietary_Nut.ToString() + "'," +
            "dietary_Dairy = '" + dietary_Dairy.ToString() + "'," +
            "dietary_Egg = '" + dietary_Egg.ToString() + "'," +
            "MealSpaces = '" + meal_Spaces.ToString() + "'," +
            "Description = '" + MealDescriptionTextbox.Text + "'," +
            "MealType = '" + MealType.Text + "' " + 
            "WHERE MealID = '" + mealIDField.Value + "'";

        myConnection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(query, myConnection);
        using (myConnection)
        using (command)
        {
            command.Connection.Open();
            int rows = command.ExecuteNonQuery();
        }

        //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        if (this.Request.QueryString["ReturnUrl"] != null)
        {
            this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
        }
        else
        {
            this.Response.Redirect("~/HomePage.aspx");
        }
    }

    protected void closeButton_Click(object sender, EventArgs e)
    {
        // Add Meal to Database
        string query = "UPDATE [dbo].[LiveMeals] " +
            "SET MealStatus = 'Closed' WHERE MealID = '" + mealIDField.Value + "'";

        myConnection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(query, myConnection);
        using (myConnection)
        using (command)
        {
            command.Connection.Open();
            int rows = command.ExecuteNonQuery();
        }

        //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        if (this.Request.QueryString["ReturnUrl"] != null)
        {
            this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
        }
        else
        {
            this.Response.Redirect("~/HomePage.aspx");
        }
    }

    protected void deleteButton_Click(object sender, EventArgs e)
    {
        // Add Meal to Database
        string query = "UPDATE [dbo].[LiveMeals] " +
            "SET MealStatus = 'Deleted' WHERE MealID = '" + mealIDField.Value + "'";

        myConnection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(query, myConnection);
        using (myConnection)
        using (command)
        {
            command.Connection.Open();
            int rows = command.ExecuteNonQuery();
        }

        //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        if (this.Request.QueryString["ReturnUrl"] != null)
        {
            this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
        }
        else
        {
            this.Response.Redirect("~/HomePage.aspx");
        }
    }

    protected void mealType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (MealType.SelectedItem.Value == "Breakfast")
        {
            MealType.Style["background-color"] = "var(--breakfastNormal)";
            newMenu.Style["background-color"] = "var(--breakfastNormal)";
        }
        else if (MealType.SelectedItem.Value == "Brunch")
        {
            MealType.Style["background-color"] = "var(--brunchNormal)";
            newMenu.Style["background-color"] = "var(--brunchNormal)";
        }
        else if(MealType.SelectedItem.Value == "Lunch")
        {
            MealType.Style["background-color"] = "var(--lunchNormal)";
            newMenu.Style["background-color"] = "var(--lunchNormal)";
        }
        else if (MealType.SelectedItem.Value == "Main")
        {
            MealType.Style["background-color"] = "var(--dinnerNormal)";
            newMenu.Style["background-color"] = "var(--dinnerNormal)";
        }
        else if (MealType.SelectedItem.Value == "Dessert")
        {
            MealType.Style["background-color"] = "var(--dessertNormal)";
            newMenu.Style["background-color"] = "var(--dessertNormal)";
        }
        else if (MealType.SelectedItem.Value == "Snack")
        {
            MealType.Style["background-color"] = "var(--snackNormal)";
            newMenu.Style["background-color"] = "var(--snackNormal)";
        }
    }

    protected bool CheckMealHost()
    {
        int rows = 0;
        string query = "SELECT COUNT(*)" +
            " FROM [dbo].[LiveMeals]" +
            " WHERE MealID = '" + mealID + "'" +
            " AND ChefID = '" + User.Identity.GetUserId() + "'";
        myConnection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(query, myConnection);
        using (myConnection)
        using (command)
        {
            command.Connection.Open();
            rows = (int)command.ExecuteScalar();
        }
        //If anything returned then user exists as guest
        if (rows == 1) { return true; } else { return false; }
    }

    protected void SetMealDetails()
    {
        string query = "SELECT MealName," +
            "ChefID," +
            "ChefName," +
            "MealPrice," +
            "MealLocation," +
            "MealTime," +
            "dietary_Meat," +
            "dietary_Fish," +
            "dietary_Shellfish," +
            "dietary_Gluten," +
            "dietary_Nut," +
            "dietary_Dairy," +
            "dietary_Egg," +
            "MealSpaces," +
            "Description," +
            "MealType," +
            "MealStatus" +
            " FROM [dbo].[LiveMeals]" +
            " WHERE MealID = '" + mealIDField.Value.ToString() + "'";

        myConnection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(query, myConnection);
        using (myConnection)
        using (command)
        {
            myConnection.Open();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                // Call Read before accessing data.
                while (reader.Read())
                {
                    MealName.Text = reader["MealName"].ToString();
                    mealChefNameLabel.Text = reader["ChefName"].ToString();
                    MealCost.Text = reader["MealPrice"].ToString();
                    MealLocation.Text = reader["MealLocation"].ToString();
                    DateTime mealDateTime = DateTime.Parse(reader["MealTime"].ToString());
                    MealDate.Text = mealDateTime.ToString("yyyy-MM-dd");
                    MealStartTime.Text = mealDateTime.ToString("HH:mm");

                    dietary_Meat = bool.Parse(reader["dietary_Meat"].ToString());
                    meatBool.Value = dietary_Meat ? "1" : "0";

                    dietary_Fish = bool.Parse(reader["dietary_Fish"].ToString());
                    fishBool.Value = dietary_Fish ? "1" : "0";

                    dietary_Shellfish = bool.Parse(reader["dietary_Shellfish"].ToString());
                    shellfishBool.Value = dietary_Shellfish ? "1" : "0";

                    dietary_Gluten = bool.Parse(reader["dietary_Gluten"].ToString());
                    wheatBool.Value = dietary_Gluten ? "1" : "0";

                    dietary_Nut = bool.Parse(reader["dietary_Nut"].ToString());
                    nutBool.Value = dietary_Nut ? "1" : "0";

                    dietary_Dairy = bool.Parse(reader["dietary_Dairy"].ToString());
                    dairyBool.Value = dietary_Dairy ? "1" : "0";

                    dietary_Egg = bool.Parse(reader["dietary_Egg"].ToString());
                    eggBool.Value = dietary_Egg ? "1" : "0";

                    meal_Spaces = int.Parse(reader["MealSpaces"].ToString());
                    mealSpacesLabel.Text = meal_Spaces.ToString();
                    mealSpaces.Value = meal_Spaces.ToString();
                    MealDescriptionTextbox.Text = reader["Description"].ToString();

                    // Set the meal type box
                    string mealType = reader["MealType"].ToString();
                    if (mealType == "Breakfast")
                    {
                        MealType.SelectedIndex = 0;
                    }
                    else if (mealType == "Brunch")
                    {
                        MealType.SelectedIndex = 1;
                    }
                    else if (mealType == "Lunch")
                    {
                        MealType.SelectedIndex = 2;
                    }
                    else if (mealType == "Dinner" || mealType == "Main")
                    {
                        MealType.SelectedIndex = 3;
                    }
                    else if (mealType == "Dessert")
                    {
                        MealType.SelectedIndex = 4;
                    }
                    else if (mealType == "Snack")
                    {
                        MealType.SelectedIndex = 5;
                    }
                    mealType_SelectedIndexChanged(new object(), new EventArgs());

                }
            }
        }


        
    }

    //protected void SetDietarySymbols()
    //{
    //    if (dietary_Meat) { meatBool.Value = 1; meat }
    //    dietary_Fish
    //    dietary_Shellfish
    //    dietary_Gluten
    //    dietary_Nut
    //    dietary_Dairy
    //    dietary_Egg
    //}

    //protected string AddClass(string newClass, string currentClasses)
    //{
    //    // Add a class
    //   return String.Join(" ", currentClasses
    //               .Split(' ')
    //               .Except(new string[] { "", newClass })
    //               .Concat(new string[] { newClass })
    //               .ToArray()
    //       );
    //}

    //protected string RemoveClass(string oldClass, string currentClasses)
    //{
    //    // Remove a class
    //   return String.Join(" ", currentClasses
    //              .Split(' ')
    //              .Except(new string[] { "", oldClass })
    //              .ToArray()
    //      );
    //}
}