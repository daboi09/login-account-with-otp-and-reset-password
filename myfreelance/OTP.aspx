<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="OTP.aspx.cs" Inherits="myfreelance.OTP" %>
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

.otpbtn {
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
    <h1>OTP</h1>
    <hr>


    <label for="loginID"><b>Key in your OTP</b></label>
    <asp:TextBox ID="tb_otp" runat="server" placeholder="Enter OTP"></asp:TextBox>

    <div class="clearfix">
      <asp:Button ID="otp_btn" runat="server" class="otpbtn" Text="Submit" Width="625px" OnClick="otp_btn_Click"/>
      <br /><br />
        <h3><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
      
    </div>
  </div>


</body> 
</html>
</asp:Content>
