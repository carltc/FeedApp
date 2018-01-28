<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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

    <div class="jumbotron standard-page">
        <h1>Live Meals</h1>

        <div class="liveMealsTable">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="LiveMeals" CssClass="liveMealsTableDataList">
                <ItemTemplate>
                    <table style="width:100%" class="mealRow">
                        <tr>
                            <td colspan="4" class="mealHeader">
                                <asp:Label ID="MealNameLabel" runat="server" Text='<%# Eval("MealName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="mealContent">
                                <asp:Label ID="ChefNameLabel" runat="server" Text='<%# Eval("ChefName") %>' />
                            </td>
                            <td class="mealContent">
                                £<asp:Label ID="MealPriceLabel" runat="server" Text='<%# Eval("MealPrice") %>' />
                            </td>
                            <td class="mealContent">
                                <asp:Label ID="MealLocationLabel" runat="server" Text='<%# Eval("MealLocation") %>' />
                            </td>
                            <td class="mealContent">
                                <asp:Label ID="MealTimeLabel" runat="server" Text='<%# Eval("MealTime") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="LiveMeals" runat="server" ConnectionString="<%$ ConnectionStrings:LiveMealsQuery %>" SelectCommand="SELECT MealName, ChefName, ROUND(MealPrice, 2) AS MealPrice, MealLocation, FORMAT(MealTime,'hh:mm tt') as MealTime FROM [LiveMeals]"></asp:SqlDataSource>
            <asp:Label ID="missingDataText" runat="server">No meals found.</asp:Label>
        </div>
            
    </div>

    <div class="hostButtonRow">
        <p>
            <a class="btn btn-default" id="hostButton" href="/Host" style="width:100%">HOST</a>
        </p>
    </div>

<asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:FeedMeDataBaseConnectionString-testUser %>" SelectCommand="SELECT * FROM [LiveMeals]"></asp:SqlDataSource>
<asp:SqlDataSource ID="TestDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:TestDatabase %>" SelectCommand="SELECT * FROM [TestLiveMeals]"></asp:SqlDataSource>

</asp:Content>

