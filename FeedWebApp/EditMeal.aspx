<%@ Page Title="EditMeal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="EditMeal.aspx.cs" Inherits="EditMeal" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            if ($("#meatBool").val() == "1") { $("#meat").toggleClass("selected") }
            if ($("#shellfishBool").val() == "1") { $("#shellfish").toggleClass("selected") }
            if ($("#fishBool").val() == "1") { $("#fish").toggleClass("selected") }
            if ($("#wheatBool").val() == "1") { $("#wheat").toggleClass("selected") }
            if ($("#nutBool").val() == "1") { $("#nut").toggleClass("selected") }
            if ($("#dairyBool").val() == "1") { $("#dairy").toggleClass("selected") }
            if ($("#eggBool").val() == "1") { $("#egg").toggleClass("selected") }

            $(".dietSymbol").click(function () {
                $(this).toggleClass("selected");
            });

            $("#meat").click(function () {
                if ($("#meatBool").val() == "1") {
                    $("#meatBool").val("0");
                }
                else {
                    $("#meatBool").val("1");
                }
            });

            $("#fish").click(function () {
                if ($("#fishBool").val() == "1") {
                    $("#fishBool").val("0");
                }
                else {
                    $("#fishBool").val("1");
                }
            });

            $("#shellfish").click(function () {
                if ($("#shellfishBool").val() == "1") {
                    $("#shellfishBool").val("0");
                }
                else {
                    $("#shellfishBool").val("1");
                }
            });

            $("#wheat").click(function () {
                if ($("#wheatBool").val() == "1") {
                    $("#wheatBool").val("0");
                }
                else {
                    $("#wheatBool").val("1");
                }
            });

            $("#nut").click(function () {
                if ($("#nutBool").val() == "1") {
                    $("#nutBool").val("0");
                }
                else {
                    $("#nutBool").val("1");
                }
            });

            $("#dairy").click(function () {
                if ($("#dairyBool").val() == "1") {
                    $("#dairyBool").val("0");
                }
                else {
                    $("#dairyBool").val("1");
                }
            });

            $("#egg").click(function () {
                if ($("#eggBool").val() == "1") {
                    $("#eggBool").val("0");
                }
                else {
                    $("#eggBool").val("1");
                }
            });

            $("#mealSpaceMinus").click(function () {
                var oldValStr = $("#mealSpacesLabel").text();
                var oldVal = parseFloat(oldValStr);
                if (oldVal > 1) {
                    var newVal = oldVal - 1;
                    $("#mealSpacesLabel").text(newVal);
                    $("#mealSpaces").val(newVal);
                }
            });

            $("#mealSpacePlus").click(function () {
                var oldVal = $("#mealSpacesLabel").text();
                var newVal = parseFloat(oldVal) + 1;
                $("#mealSpacesLabel").text(newVal);
                $("#mealSpaces").val(newVal);
            });
        });
    </script>
    <script type="text/javascript">
        function ConfirmClose()
        {
          if (confirm("Are you sure you want to close the meal? No more guests will be able to join but the meal will still go ahead.")==true)
            return true;
          else
            return false;
        }
        function ConfirmDelete()
        {
          if (confirm("Are you sure you want to delete the meal? Meal will be cancelled and guests will be notified.")==true)
            return true;
          else
            return false;
        }
    </script>

    <div class="jumbotron standard-page">
        <asp:PlaceHolder runat="server" ID="NeedsToRegister" Visible="false">
            <h2>Register</h2>
            <h4>Register to  host/edit meals.</h4>
            <hr />
            <div class="form-group">
                <div>
                    <a class="btn btn-default" href="Account/Register">Register</a>
                </div>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="HasRegistered" Visible="false">
            <h2><%: Title %>.</h2>
            <asp:HiddenField ID="mealIDField" runat="server" />

            <div class="form-horizontal">
                <h4>Host a meal.</h4>
                <hr />
                <asp:Panel id="newMenuPanel" runat="server">
                    <div id="menuBox" class ="form-group">
                        <asp:Panel id="newMenu" CssClass="newMenuItemBox" runat="server">
                            <div class="menuHeader container d-flex justify-content-between" style="max-width:1200px; padding-bottom: 10px; color:var(--textNormal)">
                                <p class="expandCollapseIcon"></p>
                                <asp:DropDownList id="MealType"
                                    OnSelectedIndexChanged="mealType_SelectedIndexChanged"
                                    AutoPostBack="True"
                                    CssClass="newMenuDropDown"
                                    runat="server">
                                    <asp:ListItem Value="Breakfast"> Breakfast Menu </asp:ListItem>
                                    <asp:ListItem Value="Brunch"> Brunch Menu </asp:ListItem>
                                    <asp:ListItem Value="Lunch"> Lunch Menu </asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Main"> Dinner Menu </asp:ListItem>
                                    <asp:ListItem Value="Dessert"> Dessert Menu </asp:ListItem>
                                    <asp:ListItem Value="Snack"> Snack Menu </asp:ListItem>
                                </asp:DropDownList> 
                                <p class="expandCollapseIcon"></p>
                            </div>
                            <div class="menuTable">
                                <div class="menuItem">
                                    <table style="width:100%"> <%--class="mealRow">--%>
                                        <tr>
                                            <td colspan="2" class="mealNameHeader">
                                                <div>
                                                    <asp:textbox ID="MealName" CssClass="newMenuInput" placeholder="[Meal Name]" runat="server" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MealName"
                                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The meal name is required." />
                                                </div>
                                            </td>
                                            <td class="mealSpacesHeader">
                                                <div id="spacesInput" class="container d-flex justify-content-between newMenuInput" style="max-width:100px; padding: 0px;">
                                                    <button id="mealSpaceMinus" type="button" class="newMenuInput btn btn-default btn-sm">
                                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <asp:Label runat="server" ID="mealSpacesLabel" ClientIDMode="Static" Text="1" CssClass="newMenuInput control-label" />
                                                    <button id="mealSpacePlus" type="button" class="newMenuInput btn btn-default btn-sm">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                                <asp:HiddenField ID="mealSpaces" Value="1" ClientIDMode="Static" runat="server" />
                                            </td>
                                            <td class="mealPriceHeader">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="newMenuInput input-group-text">£</div>
                                                    </div>
                                                    <asp:TextBox runat="server" ID="MealCost" TextMode="Number" Step="0.01" Text="2" CssClass="newMenuInput form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MealCost"
                                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The meal cost is required." />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="UserHeader">
                                                <asp:Label ID="mealChefNameLabel" CssClass="newMenuInput" runat="server" />
                                                <asp:Image  id="mealChefImage" CssClass="mealChefImage" ImageUrl="/SVG/missing-user.svg" runat="server" />
                                            </td>
                                            <td class="mealTimePlaceHeader">
                                                <asp:TextBox runat="server" ID="MealLocation" CssClass="newMenuInput" placeholder="[Location]" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="MealLocation"
                                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The meal location is required." />
                                            </td>
                                            <td colspan="2" class="mealTimePlaceHeader">
                                                <asp:TextBox runat="server" ID="MealDate" Type="date" CssClass="newMenuInput" />
                                                <asp:TextBox runat="server" ID="MealStartTime" Type="time" CssClass="newMenuInput" />
                                                <%--<asp:Label ID="MealDate" runat="server" />
                                                <asp:Label ID="MealStartTime" runat="server" />
                                                <asp:Label ID="MealLocation" runat="server" />--%>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width:100%"> <%--class="mealRow">--%>
                                        <tr>
                                            <td class="mealDescription">
                                                <%--<asp:Label ID="MealDescriptionTextbox" runat="server" />--%>
                                                <div style="height:100px;">
                                                    <asp:TextBox ID="MealDescriptionTextbox" CssClass="mealDescriptionTextbox newMenuInput" placeholder="[click to enter meal description]" Height="100%" TextMode="MultiLine" runat="server" />
                                                    <asp:RegularExpressionValidator
                                                        runat="server"
                                                        ControlToValidate="MealDescriptionTextbox"
                                                        ValidationExpression="^[\w\s.\-,]+$"
                                                        CssClass="text-danger"
                                                        Display="Dynamic"
                                                        ErrorMessage="Illegal character. Do not use [']" />
                                                </div>
                                            </td>
                                            <td class="mealDietary" style="width:37%;">
                                                <asp:Panel ID="mealDietaryPanel" runat="server">
                                                    Contains:
                                                    <%--<div class="mealDietaryBox">
                                                        <asp:Image  id="mealMeatIcon" ImageUrl="/SVG/009-meat.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="meatBool" ClientIDMode="Static" runat="server" />
                                                        <asp:Image  id="mealFishIcon" ImageUrl="/SVG/006-fish.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="fishBool" ClientIDMode="Static" runat="server" />
                                                        <asp:Image  id="mealShellfishIcon" ImageUrl="/SVG/010-shellfish.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="shellfishBool" ClientIDMode="Static" runat="server" />
                                                        <asp:Image  id="mealWheatIcon" ImageUrl="/SVG/002-wheat.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="wheatBool" ClientIDMode="Static" runat="server" />
                                                        <asp:Image  id="mealNutIcon" ImageUrl="/SVG/003-peanut.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="nutBool" ClientIDMode="Static" runat="server" />
                                                        <asp:Image  id="mealDairyIcon" ImageUrl="/SVG//004-cheese.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="dairyBool" ClientIDMode="Static" runat="server" />
                                                        <asp:Image  id="mealEggIcon" ImageUrl="/SVG/008-egg.svg" width="30" height="30" runat="server" />
                                                        <asp:HiddenField ID="eggBool" ClientIDMode="Static" runat="server" />
                                                    </div>--%>
                                                    <asp:table ID="dietaryTable" class="dietaryInfoTable" runat="server">
                                                        <asp:TableRow>
                                                            <asp:TableCell ID="meatDiet">
                                                                <div class="dietSymbol" id="meat">
                                                                    <img src="/SVG/009-meat.svg" " class="dietSymbolImage">
                                                                    <asp:HiddenField ID="meatBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="shellfishDiet">
                                                                <div class="dietSymbol" id="shellfish">
                                                                    <img src="/SVG/010-shellfish.svg" class="dietSymbolImage">
                                                                    <asp:HiddenField ID="shellfishBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="fishDiet">
                                                                <div class="dietSymbol" id="fish">
                                                                    <img src="/SVG/006-fish.svg" class="dietSymbolImage">
                                                                    <asp:HiddenField ID="fishBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="wheatDiet">
                                                                <div class="dietSymbol" id="wheat">
                                                                    <img src="/SVG/002-wheat.svg" class="dietSymbolImage">
                                                                    <asp:HiddenField ID="wheatBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell ID="nutDiet">
                                                                <div class="dietSymbol" id="nut">
                                                                    <img src="/SVG/003-peanut.svg" class="dietSymbolImage">
                                                                    <asp:HiddenField ID="nutBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="dairyDiet" columnspan="2">
                                                                <div class="dietSymbol" id="dairy">
                                                                    <img src="/SVG/004-cheese.svg" class="dietSymbolImage">
                                                                    <%--<font size="4">&#47;</font>--%>
                                                                    <img src="/SVG/005-milk.svg" class="dietSymbolImage">
                                                                    <asp:HiddenField ID="dairyBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="eggDiet">
                                                                <div class="dietSymbol" id="egg">
                                                                    <img src="/SVG/008-egg.svg" class="dietSymbolImage">
                                                                    <asp:HiddenField ID="eggBool" ClientIDMode="Static" runat="server" />
                                                                </div>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="padding:15px;">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </asp:Panel>

                <div class="hostButtonRow">
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <asp:Button runat="server" ID="editButton" OnClick="editButton_Click" Text="Edit" CssClass="editMealButtons feedBigButton btn btn-default" />
                    <asp:Button runat="server" ID="closeButton" OnClick="closeButton_Click" OnClientClick="return ConfirmClose();" Text="Close Meal" CssClass="editMealButtons feedBigButton btn btn-default" />
                    <asp:Button runat="server" ID="deleteButton" OnClick="deleteButton_Click" OnClientClick="return ConfirmDelete();" Text="Delete Meal" CssClass="editMealButtons feedBigButton btn btn-default" />
                </div>
                        <%--<p>
                            <a class="btn btn-default" ID="hostButton" OnClick="hostButton_Click" style="width: 100%">HOST</a>
                        </p>--%>
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
    </div>

</asp:Content>
