<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="Content/HomePage.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".mealRow").click(function () {
                if ($(this).height() > 300) {
                    $(this).css('height', '100px');
                } else {
                    $(this).css('height', '500px');
                }
            });
            $(".mealRow").mouseenter(function () {
                $(this).css('background-color', '#196F3D');
            });
            $(".mealRow").mouseleave(function () {
                $(this).css('background-color', '#229954');
            });
        });
    </script>

    <div class="jumbotron">
        <h1>Live Meals</h1>
        
            <asp:Table ID="LiveMealTable" 
                runat="server" 
                Height="168px" 
                Width="860px" 
                Font-Size="X-Large"
                Font-Names="Palatino"
                BackColor="#52BE80"
                BorderColor="#52BE80"
                BorderWidth="10"
                ForeColor="#EAFAF1"
                CellPadding="5"
                CellSpacing="5"
                HorizontalAlign="Center">

                <asp:TableHeaderRow 
                    runat="server" 
                    ForeColor="#EAFAF1"
                    BackColor="#145A32"
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

