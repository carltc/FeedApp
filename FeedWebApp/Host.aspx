<%@ Page Title="Host" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Host.aspx.cs" Inherits="Host" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:PlaceHolder runat="server" ID="NeedsToRegister" Visible="false">
        <h2>Register</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>

        <div class="form-horizontal">
            <h4>Register to  host a meal.</h4>
            <hr />
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <%--<asp:Button runat="server" OnClick="registerButton_Click" Text="Register" CssClass="btn btn-default" />--%>
                    <a class="btn btn-default" href="Account/Register">Register</a>
                </div>
            </div>
        </div>    
    </asp:PlaceHolder>

    <asp:PlaceHolder runat="server" ID="HasRegistered" Visible="false">
        <h2><%: Title %>.</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="Literal1" />
        </p>

        <div class="form-horizontal">
            <h4>Host a meal.</h4>
            <hr />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="MealName" CssClass="col-md-2 control-label">Meal Name</asp:Label>
                <div class="col-md-10">
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
                <asp:Label runat="server" AssociatedControlID="MealCost" CssClass="col-md-2 control-label">Cost</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="MealCost" TextMode="Number" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MealCost"
                        CssClass="text-danger" ErrorMessage="The meal cost is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="MealLocation" CssClass="col-md-2 control-label">Meal Location</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="MealLocation" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MealLocation"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The meal location is required." />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" OnClick="hostButton_Click" Text="Host" CssClass="btn btn-default" />
                </div>
            </div>
        </div>    
    </asp:PlaceHolder>

</asp:Content>
