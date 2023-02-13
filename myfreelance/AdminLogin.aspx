<%@ Page Title="" Language="C#" MasterPageFile="~/Guest.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="myfreelance.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 30%;
  height: 30%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
  .button {
    border-radius: 4px;
    background-color: green;
    border: none;
    color: #FFFFFF;
    text-align: center;
    font-size: 15px;
    padding: 10px;
    width: 100px;
    height:50px;
    transition: all 0.5s;
    cursor: pointer;
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
</head>
<body>

  <div class="imgcontainer">
    <img src="Images/admin.gif" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>Admin name</b></label>
    <asp:TextBox ID="admin_login" runat="server" placeholder="LoginID"></asp:TextBox>

    <label for="psw"><b>Password</b></label>
    <asp:TextBox ID="admin_password" runat="server" placeholder="Password" type="password"></asp:TextBox>

      <label for="otp"><b>Click to retrieve OTP ...</b></label><asp:Button ID="otp_btn" runat="server" Text="OTP" class="otpbutton" OnClick="otp_btn_Click"/>
    &nbsp;&nbsp;
      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
&nbsp;<asp:TextBox ID="tb_otp" runat="server" placeholder="OTP"></asp:TextBox>
        
    <asp:Button ID="user_login" runat="server" Text="Confirm" class="button" OnClick="user_login_Click"/>
  </div>

</body>
</html>
</asp:Content>
