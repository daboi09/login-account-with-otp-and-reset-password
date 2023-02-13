<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="CreateLogin.aspx.cs" Inherits="myfreelance.CreateLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
             <!DOCTYPE html>

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
    .otpbutton {
    border-radius: 4px;
    background-color: green;
    border: none;
    color: #FFFFFF;
    text-align: center;
    font-size: 15px;
    padding: 5px;
    width: 50px;
    height:30px;
    transition: all 0.5s;
    cursor: pointer;
  }
</style>
<body>
  <div class="container">
    <h1>Sign Up </h1>
    <hr>

      <h3>
    <label for="name"><b>Name</b></label><asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="(Enter your name)" ControlToValidate="login_name" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="login_name" runat="server" placeholder="Enter Name"></asp:TextBox>

    <label for="email"><b>Email</b></label><asp:RegularExpressionValidator ID="rev_email" runat="server" ControlToValidate="login_email" ValidationExpression="^\S+@\S+$" ErrorMessage="(Email is not valid)" ForeColor="Red"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="rfv_email" runat="server" ErrorMessage="(Enter your email)" ControlToValidate="login_email" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="login_email" runat="server" placeholder="Enter Email" type="email"></asp:TextBox>

    <label for="emailotp"><b>Email OTP</b></label>&nbsp;&nbsp;<asp:Button ID="otp_btn" runat="server" Text="OTP" class="otpbutton" OnClick="otp_btn_Click"/>&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:TextBox ID="tb_otp" runat="server" placeholder="OTP"></asp:TextBox>

    <label for="contact"><b>Contact</b></label><asp:RegularExpressionValidator ID="rv_contact" runat="server" ControlToValidate="login_contact" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?\d{3}?\d{2}$" ErrorMessage="(Phone number is not valid)" ForeColor="Red"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="rfv_contact" runat="server" ErrorMessage="(Enter your contact)" ControlToValidate="login_contact" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="login_contact" runat="server" placeholder="Enter Contact" ></asp:TextBox>

    <label for="dob"><b>Date of Birth</b></label><asp:CompareValidator ID="cv_dob" runat="server" ErrorMessage="(You must be at least 18 years old)" ControlToValidate="login_date_birth" ValueToCompare="31/12/2004" Type="Date" Operator="LessThan" ForeColor="Red"></asp:CompareValidator>
      <br />
    <asp:TextBox ID="login_date_birth" runat="server" placeholder="Enter Date of Birth" type="date"></asp:TextBox>

    <label for="license"><b>License (only for business, leave blank for freelancer)</b></label><asp:CompareValidator ID="cv_license" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="login_license" ErrorMessage="(License number must be in integer)" ForeColor="Red"></asp:CompareValidator>
    <asp:TextBox ID="login_license" runat="server" placeholder="Enter license" ></asp:TextBox>

    <label for="role"><b>Chose your role</b></label>
          <asp:RadioButtonList ID="rbl_role" runat="server">
              <asp:ListItem Value="Business"></asp:ListItem>
              <asp:ListItem Value="Freelancer"></asp:ListItem>
          </asp:RadioButtonList>
          <br />

    <label for="loginid"><b>LoginID</b></label><asp:RequiredFieldValidator ID="rfv_login_id" runat="server" ErrorMessage="(Enter your loginid)" ControlToValidate="login_id" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox ID="login_id" runat="server" placeholder="Enter login ID"></asp:TextBox>


    <label for="psw"><b>Password</b></label><asp:RequiredFieldValidator ID="rfv_password" runat="server" ErrorMessage="(Enter your password)" ControlToValidate="login_password" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="rgv_pass" runat="server" ErrorMessage="Password needs to be at least 8 characters" ControlToValidate="login_password" ForeColor="Red"  ValidationExpression=".{8}.*" ></asp:RegularExpressionValidator>
      <br />
    <asp:TextBox ID="login_password" runat="server" placeholder="Enter password" type="password"></asp:TextBox>
      <br />
      <label for="psw"><b>Renter password</b></label><asp:RequiredFieldValidator ID="rfv_password_2" runat="server" ErrorMessage="(Renter your password)" ControlToValidate="login_password_2" ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="cpv_pass" runat="server" ErrorMessage="Password does not match"  ControlToValidate="login_password_2" ForeColor="Red" Operator="Equal" Type="String" ControlToCompare="login_password"></asp:CompareValidator>
      <asp:TextBox ID="login_password_2" runat="server" placeholder="Renter password" type="password"></asp:TextBox>
       <br />
       <label for="otp"><b>Do you want OTP?</b></label>
          <asp:RadioButtonList ID="rbl_otp" runat="server">
              <asp:ListItem Value="Yes"></asp:ListItem>
              <asp:ListItem Value="No"></asp:ListItem>
          </asp:RadioButtonList>
      <br />
      <label for="license"><b>Image</b></label></h3>
      <asp:FileUpload ID="login_image" runat="server" />
      <br />
      <br />
      <br />


    <div class="clearfix">
      <asp:Button ID="cancel_btn" runat="server" class="cancelbtn" Text="Cancel" Width="538px" OnClick="btn_cancel_Click" CausesValidation="False"/>
      <asp:Button ID="signup_btn" runat="server" class="signupbtn" Text="Sign Up" Width="538px" OnClick="btn_signup_Click"/>
      
    </div>
  </div>


</body>
</html>
</asp:Content>
