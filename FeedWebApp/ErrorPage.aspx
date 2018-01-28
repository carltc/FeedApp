<%@ Page Title="ErrorPage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<script runat="server">
    protected Exception ex = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Get the last error from the server
        Exception ex = Server.GetLastError();

        // Create a safe message
        string safeMsg = "A problem has occurred in the web site. ";

        // Show Inner Exception fields for local access
        if (ex != null)
        {
            if (ex.InnerException != null)
        {
            innerTrace.Text = ex.InnerException.StackTrace;
            InnerErrorPanel.Visible = Request.IsLocal;
            innerMessage.Text = ex.InnerException.Message;
        }
        // Show Trace for local access
        if (Request.IsLocal)
            exTrace.Visible = true;
        else
            ex = new Exception(safeMsg, ex);

        // Fill the page fields
        exMessage.Text = ex.Message;
        exTrace.Text = ex.StackTrace;

        // Log the exception and notify system operators
        ExceptionUtility.LogException(ex, "Generic Error Page");
        ExceptionUtility.NotifySystemOps(ex);

        // Clear the error from the server
        Server.ClearError();
        }
    }
</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <div>
        <h2>
          Generic Error Page</h2>
        <asp:Panel ID="InnerErrorPanel" runat="server" Visible="false">
          <p>
            Inner Error Message:<br />
            <asp:Label ID="innerMessage" runat="server" Font-Bold="true" 
              Font-Size="Large" /><br />
          </p>
          <pre>
            <asp:Label ID="innerTrace" runat="server" />
          </pre>
        </asp:Panel>
        <p>
          Error Message:<br />
          <asp:Label ID="exMessage" runat="server" Font-Bold="true" 
            Font-Size="Large" />
        </p>
        <pre>
          <asp:Label ID="exTrace" runat="server" Visible="false" />
        </pre>
        <br />
        Return to the <a href='/HomePage.aspx'> Default Page</a>
      </div>
</asp:Content>
