<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Live Meals</h1>
        
            <asp:Table ID="Table1" 
                runat="server" 
                Height="127px" 
                Width="860px" 
                Font-Size="X-Large"
                Font-Names="Palatino"
                BackColor="Orange"
                BorderColor="DarkRed"
                BorderWidth="2"
                ForeColor="Snow"
                CellPadding="5"
                CellSpacing="5"
                HorizontalAlign="Center">

                <asp:TableHeaderRow 
                    runat="server" 
                    ForeColor="Snow"
                    BackColor="OliveDrab"
                    Font-Bold="true"
                    HorizontalAlign="Center"
                    >
                    <asp:TableHeaderCell HorizontalAlign="Center">Meal</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Chef</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Cost (£)</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Location</asp:TableHeaderCell>
                    <asp:TableHeaderCell HorizontalAlign="Center">Start Time</asp:TableHeaderCell>
                </asp:TableHeaderRow>

            </asp:Table>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Host Meal</h2>
            <p>
                
            </p>
            <p>
                <a class="btn btn-default" href="/Host">HOST</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Find Friends</h2>
            <p>
                Search for friends to host meals for or join for dinner.
            </p>
            <p>
                <a class="btn btn-default" href="Friends">Friends</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Settings</h2>
            <p>
                Update your personal settings
            </p>
            <p>
                <a class="btn btn-default" href="/Settings">Settings</a>
            </p>
        </div>
        <div style="height: 140px">
        </div>
    </div>

<asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:FeedMeDataBaseConnectionString-testUser %>" SelectCommand="SELECT * FROM [LiveMeals]"></asp:SqlDataSource>

</asp:Content>

