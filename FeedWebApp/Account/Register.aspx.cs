using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using FeedWebApp;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
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
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}