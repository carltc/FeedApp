﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            //$(".mealRow").click(function () {
            //    if ($(this).height() > 300) {
            //        $(this).css('height', '100px');
            //    } else {
            //        $(this).css('height', '500px');
            //    }
            //});
            $(".mealRow").mouseenter(function () {
                $(this).css('background-color', '#196F3D');
            });
            $(".mealRow").mouseleave(function () {
                $(this).css('background-color', '#229954');
            });
        });
    </script>

    <div id="liveMealsJumbotron" class="jumbotron standard-page">
        <%--<h1 id="liveMealsHeading" style="color:white">Live Meals</h1>--%>

<%--        HeaderCssClass="liveMealHeader"
                            ContentCssClass="liveMealContent"
                            HeaderSelectedCssClass="liveMealHeaderSelected"--%>

        <div class="liveMealsTable">
            <asp:DataList ID="DataList1"
                runat="server"
                DataSourceID="LiveMeals"
                OnItemDataBound="liveMeals_Data_Bound"
                OnItemCommand="joinButton_Command"
                CssClass="liveMealsTableDataList">
                <ItemTemplate>  
                    <div class="mealRow">
                        <ajaxToolkit:Accordion ID="liveMealsAccordion" runat="server"
                            ContentCssClass="accordionContent"
                            FadeTransitions="true"
                            TransitionDuration="500"
                            AutoSize="None"
                            RequireOpenedPane="false"
                            SelectedIndex="-1">
                            <Panes>
                                <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">  
                                    <Header>
                                        <asp:HiddenField ID="mealIDField" runat="server" />
                                        <table style="width:100%"> <%--class="mealRow">--%>
                                            <tr>
                                                <td colspan="2" class="mealNameHeader">
                                                    <asp:Label ID="MealNameLabel" runat="server" />
                                                </td>
                                                <td class="mealSpacesHeader">
                                                    <asp:Label ID="MealSpacesLabel" runat="server" />
                                                </td>
                                                <td class="mealPriceHeader">
                                                    <asp:Label ID="MealPriceLabel" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="mealUserHeader">
                                                    <asp:Label ID="ChefNameLabel" runat="server" />
                                                    <asp:Image  id="userImage" ImageUrl="/SVG/missing-user.svg" width="15" height="15" runat="server" />
                                                </td>
                                                <td colspan="2" class="mealTimePlaceHeader">
                                                    <asp:Label ID="MealDateLabel" runat="server" />
                                                    <asp:Label ID="MealTimeLabel" runat="server" />
                                                    <asp:Label ID="MealLocationLabel" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </Header>  
                                    <Content>
                                        <table style="width:100%"> <%--class="mealRow">--%>
                                            <tr>
                                                <td class="mealDescription">
                                                    <asp:Label ID="MealDescriptionLabel" runat="server" />
                                                </td>
                                                <td class="mealDietary">
                                                    <asp:Panel ID="mealDietaryPanel" Visible="false" runat="server">
                                                        Contains:
                                                        <div class="mealDietaryBox">
                                                            <asp:Image  id="meatIcon" ImageUrl="/SVG/009-meat.svg" width="30" height="30" runat="server" />

                                                            <asp:Image  id="fishIcon" ImageUrl="/SVG/006-fish.svg" width="30" height="30" runat="server" />

                                                            <asp:Image  id="shellfishIcon" ImageUrl="/SVG/010-shellfish.svg" width="30" height="30" runat="server" />

                                                            <asp:Image  id="wheatIcon" ImageUrl="/SVG/002-wheat.svg" width="30" height="30" runat="server" />

                                                            <asp:Image  id="nutIcon" ImageUrl="/SVG/003-peanut.svg" width="30" height="30" runat="server" />

                                                            <asp:Image  id="dairyIcon" ImageUrl="/SVG//004-cheese.svg" width="30" height="30" runat="server" />

                                                            <asp:Image  id="eggIcon" ImageUrl="/SVG/008-egg.svg" width="30" height="30" runat="server" />
                                                        </div>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding:15px;">
                                                    <asp:Button CssClass="btn btn-default mealJoinButton"
                                                        CommandName="join"
                                                        OnCommand="joinButton_Command"
                                                        id="joinButton"
                                                        Text="Join"
                                                        visible="false"
                                                        style="width:100%"
                                                        runat="server" />
                                                    <asp:Button CssClass="btn btn-default mealJoinButton"
                                                        CommandName="leave"
                                                        OnCommand="leaveButton_Command"
                                                        id="leaveButton"
                                                        Text="Leave"
                                                        visible="false"
                                                        style="width:100%"
                                                        runat="server" />
                                                    <asp:Button CssClass="btn btn-default mealJoinButton"
                                                        CommandName="manage"
                                                        OnCommand="manageButton_Command"
                                                        id="manageButton"
                                                        Text="Manage"
                                                        visible="false"
                                                        style="width:100%"
                                                        runat="server" />
                                                    <asp:Label ID="loginToJoinLabel" CssClass="mealLoginToJoinLabel" Text="Login/Register to join." Visible="true" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </Content>  
                                </ajaxToolkit:AccordionPane>
                            </Panes>  
                        </ajaxToolkit:Accordion>
                    </div>
                    </ItemTemplate>
                </asp:DataList>
            <asp:SqlDataSource ID="LiveMeals"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:LiveMealsQuery %>"
                SelectCommand="SELECT
                                MealID,
                                MealName,
                                ChefID,
                                ChefName,
                                ROUND(MealPrice, 2) AS MealPrice,
                                MealLocation,
                                FORMAT(MealTime,'hh:mm tt') as MealTime,
                                FORMAT([MealTime],'d'
                                    +IIF(DAY([MealTime]) IN (1,21,31),'''st'''
                                    ,IIF(DAY([MealTime]) IN (2,22),'''nd'''
                                    ,IIF(DAY([MealTime]) IN (3,23),'''rd''','''th''')))
                                    +' MMMM yyyy') As [formattedDate],
                                dietary_Meat,
                                dietary_Fish,
                                dietary_Shellfish,
                                dietary_Gluten,
                                dietary_Nut,
                                dietary_Dairy,
                                dietary_Egg,
                                MealSpaces,
                                (SELECT COUNT(DISTINCT GuestID)
                                    FROM [dbo].[LiveMealGuests] lmg
                                    WHERE lmg.MealID = lm.MealID) AS GuestCount,
                                Description
                              FROM [LiveMeals] lm"></asp:SqlDataSource>
            <asp:Label ID="missingDataText" runat="server">No meals found.</asp:Label>
        </div>

    </div>

    <div id="menuBox">

        <div id="brunchMenu">
            <p class="menuTitle">Brunch Menu</p>
            <div class="menuTable">
                <asp:DataList ID="brunchDataList"
                    runat="server"
                    DataSourceID="brunchDataSource"
                    OnItemDataBound="brunch_Data_Bound"
                    CssClass="brunchTableDataList">
                    <ItemTemplate>  
                        <div class="menuItem">
                            <ajaxToolkit:Accordion ID="brunchAccordion" runat="server"
                                ContentCssClass="accordionContent"
                                FadeTransitions="true"
                                TransitionDuration="500"
                                AutoSize="None"
                                RequireOpenedPane="false"
                                SelectedIndex="-1">
                                <Panes>
                                    <ajaxToolkit:AccordionPane ID="brunchAccordionPane" runat="server">  
                                        <Header>
                                            <asp:HiddenField ID="brunchMealIDField" runat="server" />
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td colspan="2" class="mealNameHeader">
                                                        <asp:Label ID="brunchNameLabel" runat="server" />
                                                    </td>
                                                    <td class="mealSpacesHeader">
                                                        <asp:Label ID="brunchSpacesLabel" runat="server" />
                                                    </td>
                                                    <td class="mealPriceHeader">
                                                        <asp:Label ID="brunchPriceLabel" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="UserHeader">
                                                        <asp:Label ID="brunchChefNameLabel" runat="server" />
                                                        <asp:Image  id="brunchChefImage" ImageUrl="/SVG/missing-user.svg" width="15" height="15" runat="server" />
                                                    </td>
                                                    <td colspan="2" class="mealTimePlaceHeader">
                                                        <asp:Label ID="brunchDateLabel" runat="server" />
                                                        <asp:Label ID="brunchTimeLabel" runat="server" />
                                                        <asp:Label ID="brunchLocationLabel" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Header>  
                                        <Content>
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td class="mealDescription">
                                                        <asp:Label ID="brunchDescriptionLabel" runat="server" />
                                                    </td>
                                                    <td class="mealDietary">
                                                        <asp:Panel ID="brunchDietaryPanel" Visible="false" runat="server">
                                                            Contains:
                                                            <div class="mealDietaryBox">
                                                                <asp:Image  id="brunchMeatIcon" ImageUrl="/SVG/009-meat.svg" width="30" height="30" runat="server" />

                                                                <asp:Image  id="brunchFishIcon" ImageUrl="/SVG/006-fish.svg" width="30" height="30" runat="server" />

                                                                <asp:Image  id="brunchShellfishIcon" ImageUrl="/SVG/010-shellfish.svg" width="30" height="30" runat="server" />

                                                                <asp:Image  id="brunchWheatIcon" ImageUrl="/SVG/002-wheat.svg" width="30" height="30" runat="server" />

                                                                <asp:Image  id="brunchNutIcon" ImageUrl="/SVG/003-peanut.svg" width="30" height="30" runat="server" />

                                                                <asp:Image  id="brunchDairyIcon" ImageUrl="/SVG//004-cheese.svg" width="30" height="30" runat="server" />

                                                                <asp:Image  id="brunchEggIcon" ImageUrl="/SVG/008-egg.svg" width="30" height="30" runat="server" />
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="padding:15px;">
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="join"
                                                            OnCommand="joinButton_Command"
                                                            id="brunchJoinButton"
                                                            Text="Join"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="leave"
                                                            OnCommand="leaveButton_Command"
                                                            id="brunchLeaveButton"
                                                            Text="Leave"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="manage"
                                                            OnCommand="manageButton_Command"
                                                            id="brunchManageButton"
                                                            Text="Manage"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Label ID="brunchLoginToJoinLabel" CssClass="mealLoginToJoinLabel" Text="Login/Register to join." Visible="true" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Content>  
                                    </ajaxToolkit:AccordionPane>
                                </Panes>  
                            </ajaxToolkit:Accordion>
                        </div>
                        </ItemTemplate>
                    </asp:DataList>
                <asp:SqlDataSource ID="brunchDataSource"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:LiveMealsQuery %>"
                    SelectCommand="SELECT
                        MealID,
                        MealName,
                        ChefID,
                        ChefName,
                        ROUND(MealPrice, 2) AS MealPrice,
                        MealLocation,
                        FORMAT(MealTime,'hh:mm tt') as MealTime,
                        FORMAT([MealTime],'d'
                            +IIF(DAY([MealTime]) IN (1,21,31),'''st'''
                            ,IIF(DAY([MealTime]) IN (2,22),'''nd'''
                            ,IIF(DAY([MealTime]) IN (3,23),'''rd''','''th''')))
                            +' MMMM yyyy') As [formattedDate],
                        dietary_Meat,
                        dietary_Fish,
                        dietary_Shellfish,
                        dietary_Gluten,
                        dietary_Nut,
                        dietary_Dairy,
                        dietary_Egg,
                        MealSpaces,
                        (SELECT COUNT(DISTINCT GuestID)
                            FROM [dbo].[LiveMealGuests] lmg
                            WHERE lmg.MealID = lm.MealID) AS GuestCount,
                        Description
                        FROM [LiveMeals] lm
                        WHERE lm.MealType = 'Brunch'">
                </asp:SqlDataSource>
            </div>
        </div>

    </div>

    <div class="hostButtonRow">
        <p>
            <a class="btn btn-default" id="hostButton" href="/Host" style="width:100%; color:white">HOST</a>
        </p>
    </div>

<asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:FeedMeDataBaseConnectionString-testUser %>" SelectCommand="SELECT * FROM [LiveMeals]"></asp:SqlDataSource>
<asp:SqlDataSource ID="TestDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:TestDatabase %>" SelectCommand="SELECT * FROM [TestLiveMeals]"></asp:SqlDataSource>

</asp:Content>

