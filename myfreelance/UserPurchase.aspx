<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPurchase.aspx.cs" Inherits="myfreelance.UserPurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <html>
        <head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

.moneybtn {
  padding: 14px 2px;
  background-color: #83eb34;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .moneybtn {
  float: left;
  width: 10%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

</style>
</head>
        <body>
              <div class="col-50">
            <h1>Purchasing myfreelance money</h1>
                  <br />
            <label for="fmoney">How much money would you like</label><asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="(Enter your amount)" ControlToValidate="user_money_buy" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="user_money_buy" runat="server" placeholder="Enter amount"></asp:TextBox>
            <label for="cname">Name on Card</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(Enter your credit card name)" ControlToValidate="user_name" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="user_name" runat="server" placeholder="Enter card name"></asp:TextBox>
            <label for="ccnum">Credit card number</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(Enter your credit card number)" ControlToValidate="user_number" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="user_number" runat="server" placeholder="Enter credit card number"></asp:TextBox>
            <label for="ccnum">Expiry Month</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(Enter your expiry month)" ControlToValidate="user_expmonth" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox ID="user_expmonth" runat="server" placeholder="Enter exp month"></asp:TextBox>
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(Enter your expiry year)" ControlToValidate="user_expyear" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="user_expyear" runat="server" placeholder="Enter exp year"></asp:TextBox>
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(Enter your ccv)" ControlToValidate="user_cvv" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="user_cvv" runat="server" placeholder="Enter cvv"></asp:TextBox>
              </div>
            </div>
          </div>
            <asp:Button ID="cancel_btn" runat="server" class="cancelbtn" Text="Cancel" Width="550px" CausesValidation="False" OnClick="cancel_btn_Click"/>
            <asp:Button ID="purchase_btn" runat="server" class="moneybtn" Text="Purchase" Width="550px" OnClick="purchase_btn_Click" />
            </body>
          </html>
</asp:Content>
