<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUpdateAccount.aspx.cs" Inherits="myfreelance.AdminUpdateAccount" %>
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

.signupbtn {
  padding: 14px 20px;
  background-color: #83eb34;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
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
  <div class="container">
    <h1>Update (Admin mode) </h1>
    <hr>

      <h3>
    <label for="name"><b>Name</b></label><asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="(Enter your name)" ControlToValidate="update_name" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="update_name" runat="server" placeholder="Enter Name"></asp:TextBox>

    <label for="email"><b>Email</b></label><asp:RegularExpressionValidator ID="rev_email" runat="server" ControlToValidate="update_email" ValidationExpression="^\S+@\S+$" ErrorMessage="(Email is not valid)" ForeColor="Red"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="rfv_email" runat="server" ErrorMessage="(Enter your email)" ControlToValidate="update_email" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="update_email" runat="server" placeholder="Enter Email" type="email"></asp:TextBox>

    <label for="contact"><b>Contact</b></label><asp:RegularExpressionValidator ID="rv_contact" runat="server" ControlToValidate="update_contact" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?\d{3}?\d{2}$" ErrorMessage="(Phone number is not valid)" ForeColor="Red"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="rfv_contact" runat="server" ErrorMessage="(Enter your contact)" ControlToValidate="update_contact" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="update_contact" runat="server" placeholder="Enter Contact" ></asp:TextBox>

    <label for="dob"><b>Date of Birth</b></label>
    <asp:TextBox ID="update_date_birth" runat="server" placeholder="Enter Date of Birth" type="date"></asp:TextBox>

    <label for="license"><b>License</b></label><asp:CompareValidator ID="cv_license" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="update_license" ErrorMessage="(License number must be in integer)" ForeColor="Red"></asp:CompareValidator>
    <asp:TextBox ID="update_license" runat="server" placeholder="Enter license" ></asp:TextBox>

    <label for="role"><b>Chose your role</b></label>
    <asp:TextBox ID="update_role" runat="server" placeholder="Enter role"></asp:TextBox>

    <label for="loginid"><b>LoginID</b></label>
    <asp:TextBox ID="update_id" runat="server" placeholder="Enter login ID"></asp:TextBox>

    <label for="psw"><b>Password</b></label><asp:RequiredFieldValidator ID="rfv_password" runat="server" ErrorMessage="(Enter your password)" ControlToValidate="update_password" ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
    <asp:TextBox ID="update_password" runat="server" placeholder="Enter password" type="password"></asp:TextBox>
          <br />
       <label for="otp"><b>Do you want OTP?</b></label>
          <asp:RadioButtonList ID="rbl_otp" runat="server">
              <asp:ListItem Value="Yes"></asp:ListItem>
              <asp:ListItem Value="No"></asp:ListItem>
          </asp:RadioButtonList>

      <br />
      <label for="uimage"><b>Current Image</b></label><asp:Label ID="uimage" runat="server" Text="Image text"></asp:Label>
      <asp:Image ID="user_image" runat="server" Height="84px" Width="113px" />
      </h3>
      <br />
      <label for="nimage"><b>New Image</b></label>
      <asp:FileUpload ID="update_image" runat="server" />
      <br />
      <br />

    <div class="clearfix">
      <asp:Button ID="cancel_btn" runat="server" class="cancelbtn" Text="Cancel" Width="538px" OnClick="cancel_btn_Click" CausesValidation="False"/>
      <asp:Button ID="update_btn" runat="server" class="signupbtn" Text="Update" Width="538px" OnClick="update_btn_Click"/>
      
    </div>
  </div>


</body>
</html>
</asp:Content>
