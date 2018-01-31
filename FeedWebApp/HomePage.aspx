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
            $(".liveMealsTable").load(function () {
                alert(<%# Eval("MealName") %>);
                if (<%# Eval("MealName") %> == "1") {
                    $("#meatIcon").css('visible', 'false');
                }
            });
        });
    </script>

    <div id="liveMealsJumbotron" class="jumbotron standard-page">
        <h1 id="liveMealsHeading">Live Meals</h1>

        <div class="liveMealsTable">
            <asp:DataList ID="DataList1"
                runat="server"
                DataSourceID="LiveMeals"
                OnItemDataBound="liveMeals_Data_Bound"
                CssClass="liveMealsTableDataList">
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
                        <tr>
                            <td class="mealContent" colspan="4">
                                <asp:Image  id="meatIcon" CssClass="dietaryIcons" ImageUrl="/SVG/009-meat.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="meatBool" Value='<%# Eval("dietary_Meat") %>' ClientIDMode="Static" runat="server" />
                                
                                <asp:Image  id="fishIcon" CssClass="dietaryIcons" ImageUrl="/SVG/006-fish.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="fishBool" Value='<%# Eval("dietary_Fish") %>' ClientIDMode="Static" runat="server" />
                                
                                <asp:Image  id="shellfishIcon" CssClass="dietaryIcons" ImageUrl="/SVG/010-shellfish.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="shellfishBool" Value='<%# Eval("dietary_Shellfish") %>' ClientIDMode="Static" runat="server" />
                                
                                <asp:Image  id="wheatIcon" CssClass="dietaryIcons" ImageUrl="/SVG/002-wheat.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="glutenBool" Value='<%# Eval("dietary_Gluten") %>' ClientIDMode="Static" runat="server" />
                                
                                <asp:Image  id="nutIcon" CssClass="dietaryIcons" ImageUrl="/SVG/003-peanut.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="nutBool" Value='<%# Eval("dietary_Nut") %>' ClientIDMode="Static" runat="server" />
                                
                                <asp:Image  id="dairyIcon" CssClass="dietaryIcons" ImageUrl="/SVG//004-cheese.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="dairyBool" Value='<%# Eval("dietary_Dairy") %>' ClientIDMode="Static" runat="server" />
                                
                                <asp:Image  id="eggIcon" CssClass="dietaryIcons" ImageUrl="/SVG/008-egg.svg" width="50" height="50" runat="server" />
                                <asp:HiddenField ID="eggBool" Value='<%# Eval("dietary_Egg") %>' ClientIDMode="Static" runat="server" />

                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="LiveMeals"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:LiveMealsQuery %>"
                SelectCommand="SELECT 
                                MealName,
                                ChefName,
                                ROUND(MealPrice, 2) AS MealPrice,
                                MealLocation,
                                FORMAT(MealTime,'hh:mm tt') as MealTime,
                                dietary_Meat,
                                dietary_Fish,
                                dietary_Shellfish,
                                dietary_Gluten,
                                dietary_Nut,
                                dietary_Dairy,
                                dietary_Egg
                              FROM [LiveMeals]"></asp:SqlDataSource>
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

