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

public partial class Host : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["FeedMeDataBaseConnectionString-testUser"].ConnectionString);
    public bool dietary_Vegan = false;
    public bool dietary_Vegetarian = false;
    public bool dietary_Fish = false;
    public bool dietary_Nut = false;
    public bool dietary_Dairy = false;
    public bool dietary_Egg = false;
    public bool dietary_Gluten = false;

    private bool UserExists(UserManager manager)
    {
        var user = manager.FindById(User.Identity.GetUserId());
        return (user != null);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        dietary_Egg = false;
        //Create clicks for each table row
        var eggDietOff = eggDiet.BackColor;

        // Set date today and time now
        MealDate.Text = DateTime.Now.ToString();
        MealStartTime.Text = DateTime.Now.ToString("hh:mm");
        MealFinishTime.Text = DateTime.Now.AddHours(1).ToString("hh:mm");

        // Determine the sections to render
        UserManager manager = new UserManager();
        if (UserExists(manager))
        {
            HasRegistered.Visible = true;
            NeedsToRegister.Visible = false; // change to FALSE for deploy
        }
        else
        {
            HasRegistered.Visible = true; // change to FALSE for deploy
            NeedsToRegister.Visible = false;
        }
    }

    protected void hostButton_Click(object sender, EventArgs e)
    {
        var eggDietOn = eggDiet.BackColor;

        if (vegeBool.Value == "selected")
        {
            dietary_Vegetarian = true;
        }
        else
        {
            dietary_Vegetarian = false;
        }

        var userID = User.Identity.GetUserId();
        string userName = User.Identity.GetUserName();

        myConnection.Open();
        string maxIdQuery = "SELECT MAX(MealID) FROM [dbo].[LiveMeals]";
        SqlCommand maxIdCommand = new SqlCommand(maxIdQuery, myConnection);

        var returnParameter = maxIdCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
        returnParameter.Direction = ParameterDirection.ReturnValue;
        maxIdCommand.ExecuteNonQuery();
        var maxId = returnParameter.Value;
        int mealId = (int)maxId + 1;

        // Add Meal to Database
        string query = "INSERT INTO [dbo].[LiveMeals] " +
            "(MealID," +
            "MealName," +
            "ChefID," +
            "ChefName," +
            "MealPrice," +
            "MealLocation," +
            "MealTime) " +
            "VALUES (" + mealId.ToString() +
            ", '" + MealName.Text + 
            "', 15" + 
            ", '" + userName + 
            "', " + MealCost.Text.ToString() + 
            ", '" + MealLocation.Text.ToString() + 
            "', GETDATE()); ";
        SqlCommand command = new SqlCommand(query, myConnection);
        int rows = command.ExecuteNonQuery();
        myConnection.Close();
        
        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
    }

    //protected void vege_Click(object sender, ImageClickEventArgs e)
    //{
    //    vegeButton.Attributes.Add("BackColor", "var(--background-normal)");
    //}

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