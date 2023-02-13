<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="myfreelance.RecoverPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                     <!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] , input[type=email], input[type=number], input[type=date]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
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

.recoverbtn {
  padding: 14px 20px;
  background-color: #83eb34;
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

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<body>
    <br /><br /><br /><br /><br />
  <div class="container">
    <h1>Time to recover the password</h1>
    <hr>


    <label for="recover"><b>New password</b></label><asp:RequiredFieldValidator ID="rfv_rpassword" runat="server" ErrorMessage="(Enter your password)" ControlToValidate="recover_password" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="rgv_rpass" runat="server" ErrorMessage="Password needs to be at least 8 characters" ControlToValidate="recover_password" ForeColor="Red"  ValidationExpression=".{8}.*" ></asp:RegularExpressionValidator>
    <asp:TextBox ID="recover_password" runat="server" placeholder="Enter new password" type="password"></asp:TextBox>

    <label for="recover"><b>Type in password again</b></label><asp:RequiredFieldValidator ID="rfv_rpassword_2" runat="server" ErrorMessage="(Renter your password)" ControlToValidate="recover_password_2" ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="cpv_rpass" runat="server" ErrorMessage="Password does not match"  ControlToValidate="recover_password_2" ForeColor="Red" Operator="Equal" Type="String" ControlToCompare="recover_password"></asp:CompareValidator>
    <asp:TextBox ID="recover_password_2" runat="server" placeholder="Enter new password again" type="password"></asp:TextBox>

    <div class="clearfix">
      <asp:Button ID="recover_btn" runat="server" class="recoverbtn" Text="Recover" Width="625px" OnClick="recover_btn_Click"/>
      <br /><br />
        <h3><asp:Label ID="LabelRecover" runat="server" Text=""></asp:Label></h3>
      
    </div>
  </div>


</body> 
</html>
</asp:Content>
