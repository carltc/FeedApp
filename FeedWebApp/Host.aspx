<%@ Page Title="Host" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Host.aspx.cs" Inherits="Host" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".dietSymbol").click(function () {
                $(this).toggleClass("selected");
                if ($("vegeBool").val() == "selected") {
                    $("vegeBool").val("unselected");
                }
                else {
                    $("vegeBool").val("selected");
                }
            });
        });
    </script>

    <div class="jumbotron standard-page">
        <asp:PlaceHolder runat="server" ID="NeedsToRegister" Visible="false">
            <h2>Register</h2>
            <h4>Register to  host a meal.</h4>
            <hr />
            <div class="form-group">
                <div>
                    <a class="btn btn-default" href="Account/Register">Register</a>
                </div>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="HasRegistered" Visible="false">
            <h2><%: Title %>.</h2>

            <div class="form-horizontal">
                <h4>Host a meal.</h4>
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="MealName" CssClass="col-md-4 control-label">Name:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="MealName" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="MealName"
                            CssClass="text-danger" ErrorMessage="The meal name is required." />
                        <asp:RegularExpressionValidator
                            runat="server"
                            ControlToValidate="MealName"
                            ValidationExpression="^(\w|\s)+$"
                            CssClass="text-danger"
                            ErrorMessage="Illegal character. Do not use [']" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="MealCost" CssClass="col-md-4 control-label">Cost:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="MealCost" TextMode="Number" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="MealCost"
                            CssClass="text-danger" ErrorMessage="The meal cost is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="MealLocation" CssClass="col-md-4 control-label">Where:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="MealLocation" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="MealLocation"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The meal location is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="MealDate" CssClass="col-md-4 control-label">When:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="MealDate" Type="date" CssClass="form-control" />

                        <asp:TextBox runat="server" ID="MealStartTime" Type="time" CssClass="form-control" />
                        to
                        <asp:TextBox runat="server" ID="MealFinishTime" Type="time" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="MealDate" CssClass="col-md-4 control-label">Select dietary information:</asp:Label>
                    <div class="col-md-8">
                        <asp:table ID="dietaryTable" class="dietaryInfoTable" runat="server">
                            <asp:TableRow>
                                <asp:TableCell ID="vegeDiet">
                                    <div class="dietSymbol">
                                        <img src="/SVG/001-salad.svg" width="50" height="50">
                                        <asp:HiddenField ID="vegeBool" runat="server" />
                                        <%--<asp:ImageButton ID="vegeButton" ImageUrl="/SVG/001-salad.svg" OnClick="vege_Click" runat="server" />--%>
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ID="veganDiet">
                                    <div class="dietSymbol">
                                        <img src="/SVG/007-carrot.svg" width="50" height="50">
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ID="fishDiet">
                                    <div class="dietSymbol">
                                        <img src="/SVG/006-fish.svg" width="50" height="50">
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ID="wheatDiet">
                                    <div class="dietSymbol">
                                        <img src="/SVG/002-wheat.svg" width="50" height="50">
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ID="nutDiet">
                                    <div class="dietSymbol">
                                        <img src="/SVG/003-peanut.svg" width="50" height="50">
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ID="dairyDiet" columnspan="2">
                                    <div class="dietSymbol">
                                        <img src="/SVG/004-cheese.svg" width="40" height="40">
                                        <font size="4">&#47;</font>
                                        <img src="/SVG/005-milk.svg" width="40" height="40">
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ID="eggDiet">
                                    <div class="dietSymbol">
                                        <img src="/SVG/008-egg.svg" width="50" height="50">
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:table>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        <asp:Button runat="server" ID="hostButton" OnClick="hostButton_Click" Text="Host" CssClass="btn btn-default" />
                        <%--<p>
                            <a class="btn btn-default" ID="hostButton" OnClick="hostButton_Click" style="width: 100%">HOST</a>
                        </p>--%>
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
    </div>

</asp:Content>
