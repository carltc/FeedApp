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

public partial class Host : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedMeDataBaseConnectionString-testUser"].ConnectionString);
    bool dietary_Meat = false;
    bool dietary_Shellfish = false;
    bool dietary_Fish = false;
    bool dietary_Nut = false;
    bool dietary_Dairy = false;
    bool dietary_Egg = false;
    bool dietary_Gluten = false;
    int meal_Spaces = 1; 

    private bool UserExists(UserManager manager)
    {
        var user = manager.FindById(User.Identity.GetUserId());
        return (user != null);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Set date today and time now only if it is not a postback
        if (!IsPostBack)
        {
            MealDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            MealStartTime.Text = DateTime.Now.ToString("HH:mm");
        }

        // Determine the sections to render
        UserManager manager = new UserManager();
        if (UserExists(manager))
        {
            HasRegistered.Visible = true;
            NeedsToRegister.Visible = false; // change to FALSE for deploy
        }
        else
        {
            HasRegistered.Visible = false; // change to FALSE for deploy
            NeedsToRegister.Visible = true;
        }
    }

    protected void hostButton_Click(object sender, EventArgs e)
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
        string query = "INSERT INTO [dbo].[LiveMeals] " +
            "(MealName," +
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
            "Description" +
            ") " +
            "VALUES ('" + MealName.Text + 
            "', '" + userID +
            "', '" + userName +
            "', '" + MealCost.Text +
            "', '" + MealLocation.Text +
            "', CONVERT(datetime, '" + date.ToString("dd/MM/yyyy") + " " + time.ToString("HH:mm") + "',103)" +
            ", '" + dietary_Meat.ToString() +
            "', '" + dietary_Fish.ToString() +
            "', '" + dietary_Shellfish.ToString() +
            "', '" + dietary_Gluten.ToString() +
            "', '" + dietary_Nut.ToString() +
            "', '" + dietary_Dairy.ToString() +
            "', '" + dietary_Egg.ToString() +
            "', '" + meal_Spaces.ToString() +
            "', '" + MealDescriptionTextbox.Text +
            "'); ";
        myConnection.Open();
        SqlCommand command = new SqlCommand(query, myConnection);
        int rows = command.ExecuteNonQuery();
        myConnection.Close();

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

    //protected void registerButton_Click(object sender, EventArgs e)
    //{
    //    // Add Meal to Database
    //    myConnection.Open();
    //    string query = "INSERT INTO dbo.LiveMeals" +
    //        "(MealID," +
    //        "MealName," +
    //        "ChefID," +
    //        "ChefName," +
    //        "MealPrice," +
    //        "MealLocation," +
    //        "MealTime)" +
    //        "VALUES(2, 'Test Meal', 2, 'Test Man', 0, 'Testville, Testerton', GETDATE()); ";
    //    SqlCommand command = new SqlCommand(query, myConnection);
    //    int rows = command.ExecuteNonQuery();
    //    myConnection.Close();
    //}
}