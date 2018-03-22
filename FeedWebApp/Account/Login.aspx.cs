using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using FeedWebApp;
using System.Data.SqlClient;
using System.Configuration;

public partial class Account_Login : Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["feedWebAppUser"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                myConnection.Open();
                myConnection.Close();
            }
            catch
            {
                ConfigurationManager.ConnectionStrings["feedWebAppUser"].ConnectionString = ConfigurationManager.ConnectionStrings["feedWebAppUser"].ConnectionString;
            }

        RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = new UserManager();
                ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                    //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    if (this.Request.QueryString["ReturnUrl"] !=null) 
                    {
                        this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                    }
                    else
                    {
                        this.Response.Redirect("/HomePage.aspx");
                    }
                }
                else
                {
                    FailureText.Text = "Invalid username or password.";
                    ErrorMessage.Visible = true;
                }
            }
        }
}