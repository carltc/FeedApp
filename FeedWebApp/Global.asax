<%@ Application Language="C#" %>
<%@ Import Namespace="FeedWebApp" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

        // Get the exception object.
        Exception exc = Server.GetLastError();

        // Handle HTTP errors
        if (exc.GetType() == typeof(HttpException))
        {
            // The Complete Error Handling Example generates
            // some errors using URLs with "NoCatch" in them;
            // ignore these here to simulate what would happen
            // if a global.asax handler were not implemented.
            if (exc.Message.Contains("NoCatch") || exc.Message.Contains("maxUrlLength"))
                return;

            //Redirect HTTP errors to HttpError page
            Server.Transfer("ErrorPage.aspx");
        }
        else if(exc.InnerException.Message.StartsWith("Cannot open server \'feedmedatabase\' requested by the login."))
        {
            Server.Transfer("HomePage.aspx");
            return;
        }
        else if (exc.InnerException.Message.StartsWith("A connection was successfully established with the server, but then an error occurred during the login process."))
        {
            Server.Transfer("HomePage.aspx");
            return;
        }

        // For other kinds of errors give the user some information
        // but stay on the default page
        Response.Write("<h2>Global Page Error</h2>\n");
        Response.Write(
            "<p>" + exc.Message + "</p>\n");
        Response.Write(
            "<p>" + exc.InnerException.Message + "</p>\n");
        Response.Write("Return to the <a href='HomePage.aspx'>" +
            "Default Page</a>\n");

        // Log the exception and notify system operators
        ExceptionUtility.LogException(exc, "DefaultPage");
        ExceptionUtility.NotifySystemOps(exc);

        // Clear the error from the server
        Server.ClearError();
    }

</script>
