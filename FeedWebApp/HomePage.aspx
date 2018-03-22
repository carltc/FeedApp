<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="_Default" %>

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
            //$(".collapsableMenu").click(function () {
            //    $menu = $(this);
            //    //getting the next element
            //    $content = $menu.find('div.menuTable');
            //    $header = $menu.find('div.menuHeader');
            //    $titleIcon = $header.find('i.expandCollapseIcon');
                
            //    $content.slideToggle(500, function () {
            //        $titleIcon.attr('class', function () {
            //            return $content.is(":visible") ? "expandCollapseIcon fa fa-minus" : "expandCollapseIcon fa fa-plus";
            //        });
            //    });
            //});
            $(".menuHeader").click(function () {
                //getting the next element
                $menu = $(this).parent();
                $header = $(this);
                $content = $menu.find('div.menuTable');
                $titleIcon = $header.find('i.expandCollapseIcon');
                
                $content.slideToggle(500, function () {
                    $titleIcon.attr('class', function () {
                        return $content.is(":visible") ? "expandCollapseIcon fa fa-minus" : "expandCollapseIcon fa fa-plus";
                    });
                });
            });
        });
    </script>

<%--    <div id="liveMealsJumbotron" class="jumbotron standard-page" style="visibility:collapse">
        <%--<h1 id="liveMealsHeading" style="color:white">Live Meals</h1>

        HeaderCssClass="liveMealHeader"
                            ContentCssClass="liveMealContent"
                            HeaderSelectedCssClass="liveMealHeaderSelected"

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
                                        <table style="width:100%"> <%--class="mealRow">
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
                                        <table style="width:100%"> <%--class="mealRow">
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

    </div>--%>

    <div id="menuBox">

        <asp:Panel id="breakfastPanel" runat="server">
            <div id="breakfastMenu" class="collapsableMenu">
                <div class="menuHeader container d-flex justify-content-between" style="max-width:1200px;">
                    <i class="expandCollapseIcon fa fa-minus"></i>
                    <p class="menuTitle">Breakfast Menu</p>
                    <p class="expandCollapseIcon"></p>
                </div>
                <div class="menuTable">
                    <asp:DataList ID="breakfastDataList"
                        runat="server"
                        DataSourceID="breakfastDataSource"
                        OnItemDataBound="breakfast_Data_Bound"
                        CssClass="menuTableDataList">
                        <ItemTemplate>  
                            <div class="menuItem">
                                <ajaxToolkit:Accordion ID="breakfastAccordion" runat="server"
                                    ContentCssClass="accordionContent"
                                    FadeTransitions="true"
                                    TransitionDuration="500"
                                    AutoSize="None"
                                    RequireOpenedPane="false"
                                    SelectedIndex="-1">
                                    <Panes>
                                        <ajaxToolkit:AccordionPane ID="breakfastAccordionPane" runat="server">  
                                            <Header>
                                                <asp:HiddenField ID="breakfastMealIDField" runat="server" />
                                                <table style="width:100%"> <%--class="mealRow">--%>
                                                    <tr>
                                                        <td colspan="2" class="mealNameHeader">
                                                            <asp:Label ID="breakfastNameLabel" runat="server" />
                                                        </td>
                                                        <td class="mealSpacesHeader">
                                                            <asp:Label ID="breakfastSpacesLabel" runat="server" />
                                                        </td>
                                                        <td class="mealPriceHeader">
                                                            <asp:Label ID="breakfastPriceLabel" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="UserHeader">
                                                            <asp:Label ID="breakfastChefNameLabel" runat="server" />
                                                            <asp:Image  id="breakfastChefImage" ImageUrl="/SVG/missing-user.svg" width="15" height="15" runat="server" />
                                                        </td>
                                                        <td colspan="2" class="mealTimePlaceHeader">
                                                            <asp:Label ID="breakfastDateLabel" runat="server" />
                                                            <asp:Label ID="breakfastTimeLabel" runat="server" />
                                                            <asp:Label ID="breakfastLocationLabel" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </Header>  
                                            <Content>
                                                <table style="width:100%"> <%--class="mealRow">--%>
                                                    <tr>
                                                        <td class="mealDescription">
                                                            <asp:Label ID="breakfastDescriptionLabel" runat="server" />
                                                        </td>
                                                        <td class="mealDietary">
                                                            <asp:Panel ID="breakfastDietaryPanel" Visible="false" runat="server">
                                                                Contains:
                                                                <div class="mealDietaryBox">
                                                                    <asp:Image  id="breakfastMeatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/009-meat.svg" runat="server" />

                                                                    <asp:Image  id="breakfastFishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/006-fish.svg" runat="server" />

                                                                    <asp:Image  id="breakfastShellfishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/010-shellfish.svg" runat="server" />

                                                                    <asp:Image  id="breakfastWheatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/002-wheat.svg" runat="server" />

                                                                    <asp:Image  id="breakfastNutIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/003-peanut.svg" runat="server" />

                                                                    <asp:Image  id="breakfastDairyIcon" CssClass="dietSymbolImage" ImageUrl="/SVG//004-cheese.svg" runat="server" />

                                                                    <asp:Image  id="breakfastEggIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/008-egg.svg" runat="server" />
                                                                </div>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="mealJoinContent" colspan="2" style="padding:15px;">
                                                            <asp:Button CssClass="btn btn-default mealJoinButton"
                                                                CommandName="join"
                                                                OnCommand="joinButton_Command"
                                                                id="breakfastJoinButton"
                                                                Text="Join"
                                                                visible="false"
                                                                style="width:100%"
                                                                runat="server" />
                                                            <asp:Button CssClass="btn btn-default mealJoinButton"
                                                                CommandName="leave"
                                                                OnCommand="leaveButton_Command"
                                                                id="breakfastLeaveButton"
                                                                Text="Leave"
                                                                visible="false"
                                                                style="width:100%"
                                                                runat="server" />
                                                            <asp:Button CssClass="btn btn-default mealJoinButton"
                                                                CommandName="manage"
                                                                OnCommand="manageButton_Command"
                                                                id="breakfastManageButton"
                                                                Text="Manage"
                                                                visible="false"
                                                                style="width:100%"
                                                                runat="server" />
                                                            <asp:Label ID="breakfastLoginToJoinLabel" CssClass="mealLoginToJoinLabel" Text="Login/Register to join." Visible="true" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </Content>  
                                        </ajaxToolkit:AccordionPane>
                                    </Panes>  
                                </ajaxToolkit:Accordion>
                            </div>
                            <hr>
                            </ItemTemplate>
                        </asp:DataList>
                    <asp:SqlDataSource ID="breakfastDataSource"
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
                            WHERE lm.MealType = 'Breakfast' AND lm.MealStatus = 'Open'">
                    </asp:SqlDataSource>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel id="brunchPanel" runat="server">
        <div id="brunchMenu" class="collapsableMenu">
            <div class="menuHeader container d-flex justify-content-between" style="max-width:1200px; ">
                <i class="expandCollapseIcon fa fa-minus"></i>
                <p class="menuTitle">Brunch Menu</p>
                <p class="expandCollapseIcon"></p>
            </div>
            <div class="menuTable">
                <asp:DataList ID="brunchDataList"
                    runat="server"
                    DataSourceID="brunchDataSource"
                    OnItemDataBound="brunch_Data_Bound"
                    CssClass="menuTableDataList">
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
                                                                    <asp:Image  id="brunchMeatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/009-meat.svg" runat="server" />

                                                                    <asp:Image  id="brunchFishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/006-fish.svg" runat="server" />

                                                                    <asp:Image  id="brunchShellfishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/010-shellfish.svg" runat="server" />

                                                                    <asp:Image  id="brunchWheatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/002-wheat.svg" runat="server" />

                                                                    <asp:Image  id="brunchNutIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/003-peanut.svg" runat="server" />

                                                                    <asp:Image  id="brunchDairyIcon" CssClass="dietSymbolImage" ImageUrl="/SVG//004-cheese.svg" runat="server" />

                                                                    <asp:Image  id="brunchEggIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/008-egg.svg" runat="server" />
                                                                </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="mealJoinContent" colspan="2" style="padding:15px;">
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
                            <hr>
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
                        WHERE lm.MealType = 'Brunch' AND lm.MealStatus = 'Open'">
                </asp:SqlDataSource>
            </div>
        </div>
        </asp:Panel>

        <asp:Panel id="lunchPanel" runat="server">
        <div id="lunchMenu" class="collapsableMenu">
            <div class="menuHeader container d-flex justify-content-between" style="max-width:1200px; ">
                <i class="expandCollapseIcon fa fa-minus"></i>
                <p class="menuTitle">Lunch Menu</p>
                <p class="expandCollapseIcon"></p>
            </div>
            <div class="menuTable">
                <asp:DataList ID="lunchDataList"
                    runat="server"
                    DataSourceID="lunchDataSource"
                    OnItemDataBound="lunch_Data_Bound"
                    CssClass="menuTableDataList">
                    <ItemTemplate>  
                        <div class="menuItem">
                            <ajaxToolkit:Accordion ID="lunchAccordion" runat="server"
                                ContentCssClass="accordionContent"
                                FadeTransitions="true"
                                TransitionDuration="500"
                                AutoSize="None"
                                RequireOpenedPane="false"
                                SelectedIndex="-1">
                                <Panes>
                                    <ajaxToolkit:AccordionPane ID="lunchAccordionPane" runat="server">  
                                        <Header>
                                            <asp:HiddenField ID="lunchMealIDField" runat="server" />
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td colspan="2" class="mealNameHeader">
                                                        <asp:Label ID="lunchNameLabel" runat="server" />
                                                    </td>
                                                    <td class="mealSpacesHeader">
                                                        <asp:Label ID="lunchSpacesLabel" runat="server" />
                                                    </td>
                                                    <td class="mealPriceHeader">
                                                        <asp:Label ID="lunchPriceLabel" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="UserHeader">
                                                        <asp:Label ID="lunchChefNameLabel" runat="server" />
                                                        <asp:Image  id="lunchChefImage" ImageUrl="/SVG/missing-user.svg" width="15" height="15" runat="server" />
                                                    </td>
                                                    <td colspan="2" class="mealTimePlaceHeader">
                                                        <asp:Label ID="lunchDateLabel" runat="server" />
                                                        <asp:Label ID="lunchTimeLabel" runat="server" />
                                                        <asp:Label ID="lunchLocationLabel" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Header>  
                                        <Content>
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td class="mealDescription">
                                                        <asp:Label ID="lunchDescriptionLabel" runat="server" />
                                                    </td>
                                                    <td class="mealDietary">
                                                        <asp:Panel ID="lunchDietaryPanel" Visible="false" runat="server">
                                                            Contains:
                                                            <div class="mealDietaryBox">
                                                                <asp:Image  id="lunchMeatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/009-meat.svg" runat="server" />

                                                                <asp:Image  id="lunchFishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/006-fish.svg" runat="server" />

                                                                <asp:Image  id="lunchShellfishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/010-shellfish.svg" runat="server" />

                                                                <asp:Image  id="lunchWheatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/002-wheat.svg" runat="server" />

                                                                <asp:Image  id="lunchNutIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/003-peanut.svg" runat="server" />

                                                                <asp:Image  id="lunchDairyIcon" CssClass="dietSymbolImage" ImageUrl="/SVG//004-cheese.svg" runat="server" />

                                                                <asp:Image  id="lunchEggIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/008-egg.svg" runat="server" />
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="mealJoinContent" colspan="2" style="padding:15px;">
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="join"
                                                            OnCommand="joinButton_Command"
                                                            id="lunchJoinButton"
                                                            Text="Join"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="leave"
                                                            OnCommand="leaveButton_Command"
                                                            id="lunchLeaveButton"
                                                            Text="Leave"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="manage"
                                                            OnCommand="manageButton_Command"
                                                            id="lunchManageButton"
                                                            Text="Manage"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Label ID="lunchLoginToJoinLabel" CssClass="mealLoginToJoinLabel" Text="Login/Register to join." Visible="true" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Content>  
                                    </ajaxToolkit:AccordionPane>
                                </Panes>  
                            </ajaxToolkit:Accordion>
                        </div>
                            <hr>
                        </ItemTemplate>
                    </asp:DataList>
                <asp:SqlDataSource ID="lunchDataSource"
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
                        WHERE lm.MealType = 'Lunch' AND lm.MealStatus = 'Open'">
                </asp:SqlDataSource>
            </div>
        </div>
        </asp:Panel>

        <asp:Panel id="dinnerPanel" runat="server">        
        <div id="dinnerMenu" class="collapsableMenu">
            <div class="menuHeader container d-flex justify-content-between" style="max-width:1200px;">
                <i class="expandCollapseIcon fa fa-minus"></i>
                <p class="menuTitle">Dinner Menu</p>
                <p class="expandCollapseIcon"></p>
            </div>
            <div class="menuTable">
                <asp:DataList ID="dinnerDataList"
                    runat="server"
                    DataSourceID="dinnerDataSource"
                    OnItemDataBound="dinner_Data_Bound"
                    CssClass="menuTableDataList">
                    <ItemTemplate>  
                        <div class="menuItem">
                            <ajaxToolkit:Accordion ID="dinnerAccordion" runat="server"
                                ContentCssClass="accordionContent"
                                FadeTransitions="true"
                                TransitionDuration="500"
                                AutoSize="None"
                                RequireOpenedPane="false"
                                SelectedIndex="-1">
                                <Panes>
                                    <ajaxToolkit:AccordionPane ID="dinnerAccordionPane" runat="server">  
                                        <Header>
                                            <asp:HiddenField ID="dinnerMealIDField" runat="server" />
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td colspan="2" class="mealNameHeader">
                                                        <asp:Label ID="dinnerNameLabel" runat="server" />
                                                    </td>
                                                    <td class="mealSpacesHeader">
                                                        <asp:Label ID="dinnerSpacesLabel" runat="server" />
                                                    </td>
                                                    <td class="mealPriceHeader">
                                                        <asp:Label ID="dinnerPriceLabel" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="UserHeader">
                                                        <asp:Label ID="dinnerChefNameLabel" runat="server" />
                                                        <asp:Image  id="dinnerChefImage" ImageUrl="/SVG/missing-user.svg" width="15" height="15" runat="server" />
                                                    </td>
                                                    <td colspan="2" class="mealTimePlaceHeader">
                                                        <asp:Label ID="dinnerDateLabel" runat="server" />
                                                        <asp:Label ID="dinnerTimeLabel" runat="server" />
                                                        <asp:Label ID="dinnerLocationLabel" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Header>  
                                        <Content>
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td class="mealDescription">
                                                        <asp:Label ID="dinnerDescriptionLabel" runat="server" />
                                                    </td>
                                                    <td class="mealDietary">
                                                        <asp:Panel ID="dinnerDietaryPanel" Visible="false" runat="server">
                                                            Contains:
                                                            <div class="mealDietaryBox">
                                                                <asp:Image  id="dinnerMeatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/009-meat.svg" runat="server" />

                                                                <asp:Image  id="dinnerFishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/006-fish.svg" runat="server" />

                                                                <asp:Image  id="dinnerShellfishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/010-shellfish.svg" runat="server" />

                                                                <asp:Image  id="dinnerWheatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/002-wheat.svg" runat="server" />

                                                                <asp:Image  id="dinnerNutIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/003-peanut.svg" runat="server" />

                                                                <asp:Image  id="dinnerDairyIcon" CssClass="dietSymbolImage" ImageUrl="/SVG//004-cheese.svg" runat="server" />

                                                                <asp:Image  id="dinnerEggIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/008-egg.svg" runat="server" />
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="mealJoinContent" colspan="2" style="padding:15px;">
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="join"
                                                            OnCommand="joinButton_Command"
                                                            id="dinnerJoinButton"
                                                            Text="Join"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="leave"
                                                            OnCommand="leaveButton_Command"
                                                            id="dinnerLeaveButton"
                                                            Text="Leave"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="manage"
                                                            OnCommand="manageButton_Command"
                                                            id="dinnerManageButton"
                                                            Text="Manage"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Label ID="dinnerLoginToJoinLabel" CssClass="mealLoginToJoinLabel" Text="Login/Register to join." Visible="true" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Content>  
                                    </ajaxToolkit:AccordionPane>
                                </Panes>  
                            </ajaxToolkit:Accordion>
                        </div>
                            <hr>
                        </ItemTemplate>
                    </asp:DataList>
                <asp:SqlDataSource ID="dinnerDataSource"
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
                        WHERE (lm.MealType = 'Dinner' OR lm.MealType = 'Main') AND lm.MealStatus = 'Open'">
                </asp:SqlDataSource>
            </div>
        </div>
        </asp:Panel>

        <asp:Panel id="dessertPanel" runat="server">        
        <div id="dessertMenu" class="collapsableMenu">
            <div class="menuHeader container d-flex justify-content-between" style="max-width:1200px;">
                <i class="expandCollapseIcon fa fa-minus"></i>
                <p class="menuTitle">Dessert Menu</p>
                <p class="expandCollapseIcon"></p>
            </div>
            <div class="menuTable">
                <asp:DataList ID="dessertDataList"
                    runat="server"
                    DataSourceID="dessertDataSource"
                    OnItemDataBound="dessert_Data_Bound"
                    CssClass="menuTableDataList">
                    <ItemTemplate>  
                        <div class="menuItem">
                            <ajaxToolkit:Accordion ID="dessertAccordion" runat="server"
                                ContentCssClass="accordionContent"
                                FadeTransitions="true"
                                TransitionDuration="500"
                                AutoSize="None"
                                RequireOpenedPane="false"
                                SelectedIndex="-1">
                                <Panes>
                                    <ajaxToolkit:AccordionPane ID="dessertAccordionPane" runat="server">  
                                        <Header>
                                            <asp:HiddenField ID="dessertMealIDField" runat="server" />
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td colspan="2" class="mealNameHeader">
                                                        <asp:Label ID="dessertNameLabel" runat="server" />
                                                    </td>
                                                    <td class="mealSpacesHeader">
                                                        <asp:Label ID="dessertSpacesLabel" runat="server" />
                                                    </td>
                                                    <td class="mealPriceHeader">
                                                        <asp:Label ID="dessertPriceLabel" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="UserHeader">
                                                        <asp:Label ID="dessertChefNameLabel" runat="server" />
                                                        <asp:Image  id="dessertChefImage" ImageUrl="/SVG/missing-user.svg" width="15" height="15" runat="server" />
                                                    </td>
                                                    <td colspan="2" class="mealTimePlaceHeader">
                                                        <asp:Label ID="dessertDateLabel" runat="server" />
                                                        <asp:Label ID="dessertTimeLabel" runat="server" />
                                                        <asp:Label ID="dessertLocationLabel" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Header>  
                                        <Content>
                                            <table style="width:100%"> <%--class="mealRow">--%>
                                                <tr>
                                                    <td class="mealDescription">
                                                        <asp:Label ID="dessertDescriptionLabel" runat="server" />
                                                    </td>
                                                    <td class="mealDietary">
                                                        <asp:Panel ID="dessertDietaryPanel" Visible="false" runat="server">
                                                            Contains:
                                                            <div class="mealDietaryBox">
                                                                <asp:Image  id="dessertMeatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/009-meat.svg" runat="server" />

                                                                <asp:Image  id="dessertFishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/006-fish.svg" runat="server" />

                                                                <asp:Image  id="dessertShellfishIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/010-shellfish.svg" runat="server" />

                                                                <asp:Image  id="dessertWheatIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/002-wheat.svg" runat="server" />

                                                                <asp:Image  id="dessertNutIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/003-peanut.svg" runat="server" />

                                                                <asp:Image  id="dessertDairyIcon" CssClass="dietSymbolImage" ImageUrl="/SVG//004-cheese.svg" runat="server" />

                                                                <asp:Image  id="dessertEggIcon" CssClass="dietSymbolImage" ImageUrl="/SVG/008-egg.svg" runat="server" />
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="mealJoinContent" colspan="2" style="padding:15px;">
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="join"
                                                            OnCommand="joinButton_Command"
                                                            id="dessertJoinButton"
                                                            Text="Join"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="leave"
                                                            OnCommand="leaveButton_Command"
                                                            id="dessertLeaveButton"
                                                            Text="Leave"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Button CssClass="btn btn-default mealJoinButton"
                                                            CommandName="manage"
                                                            OnCommand="manageButton_Command"
                                                            id="dessertManageButton"
                                                            Text="Manage"
                                                            visible="false"
                                                            style="width:100%"
                                                            runat="server" />
                                                        <asp:Label ID="dessertLoginToJoinLabel" CssClass="mealLoginToJoinLabel" Text="Login/Register to join." Visible="true" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </Content>  
                                    </ajaxToolkit:AccordionPane>
                                </Panes>  
                            </ajaxToolkit:Accordion>
                        </div>
                            <hr>
                        </ItemTemplate>
                    </asp:DataList>
                <asp:SqlDataSource ID="dessertDataSource"
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
                        WHERE lm.MealType = 'Dessert' AND lm.MealStatus = 'Open'">
                </asp:SqlDataSource>
            </div>
        </div>
        </asp:Panel>

    </div>

    <div class="hostButtonRow">
        <p>
            <a class="btn btn-default" id="hostButton" href="/Host" style="width:100%; color:white">HOST</a>
        </p>
    </div>

<asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:FeedMeDataBaseConnectionString-testUser %>" SelectCommand="SELECT * FROM [LiveMeals]"></asp:SqlDataSource>
<asp:SqlDataSource ID="TestDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:TestDatabase %>" SelectCommand="SELECT * FROM [TestLiveMeals]"></asp:SqlDataSource>

</asp:Content>

