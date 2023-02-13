<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeletePage.aspx.cs" Inherits="myfreelance.DeletePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your account has been deleted</title>
    <style>
        :root {
  --cat-color: #141416;
  --sill-color: #C1BDBD;
}

body{
  background: #03BA98;
}


.box-canvas{
  position: relative;
  margin: auto;
  display: block;
  margin-top: 8%;
  margin-bottom: 8%;
  width: 210px;
  height:300px;
}

.window {
  position: absolute;
  background: #7BD1FF;
  transform: translateX(-50%);
  left: 50%;
  width: 150px;
  height: 220px;
  border: 10px solid white;
  overflow: hidden;
}

.window::before {
  content: '';
  position: absolute;
  top: 100px;
  width: 300px;
  height: 300px;
  transform: rotate(45deg);
  background: rgba(255,255,255,0.5);
}

.curtain {
  width: 100px;
  height: 250px;
  position: absolute;
  background: pink;
  top: -30px;
}

.curtain.left {
  left: -60px;
  border-radius: 0 0 50% 0;
  transform: rotate(10deg);
}

.curtain.right {
  right: -60px;
  border-radius: 0 0 0 50%;
  transform: rotate(-10deg);
}

.windowsill {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  width: 210px;
  height: 30px;
  background: var(--sill-color);
  top: 240px;
}

.window-top {
  position: absolute;
  width: 210px;
  left: 50%;
  transform: translateX(-50%);
  background: var(--sill-color);
  height: 10px;
  top: -10px;
}

.windowsill::after {
  content: '';
  position: absolute;
  top: -15px;
  right: 15px;
  height: 30px;
  width: 30px;
  border: 10px solid var(--cat-color);
  border-radius: 50%;
  border-left-color: transparent;
  border-top-color: transparent;
  transform: rotate(-20deg);
}

.cat {
  position: absolute;
  top: 145px;
  right: 20px;
  width: 50px;
  height: 100px;
}

.head {
  position: absolute;
  top: 10px;
  left: 50%;
  transform: translateX(-50%);
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--cat-color);
}

/* Left ear */
.head::before {
  content: '';
  position: absolute;
  left: -5px;
  top: -7px;
  clip-path: polygon(30% 0, 0% 100%, 100% 100%);
  width: 20px;
  height: 20px;
  background: var(--cat-color);
  transform: rotate(-25deg);
}

/* Right ear */
.head::after {
  content: '';
  position: absolute;
  top: -10px;
  right: 0;
  width: 20px;
  height: 20px;
  background: var(--cat-color);
  clip-path: polygon(75% 0, 0% 100%, 100% 100%);
  transform: rotate(20deg);
}

.eye {
  position: absolute;
  top: 12px;
  width: 8px;
  height: 8px;
  background: #03BA98;
  border-radius: 50%;
}

.eye.left {
   left: 8px;
}

.eye.right {
  right: 8px;
}

.eye::before {
  content: '';
  position: absolute;
  left: 50%;
  transform: translateX(-50%) rotate(-10deg);
  width: 3px;
  height: 8px;
  background: var(--cat-color);
  border-radius: 50%;
}

.nose {
  position: absolute;
  top: 23px;
  left: 50%;
  transform: translateX(-50%);
  width: 0; 
  height: 0; 
  border-left: 3px solid transparent;
  border-right: 3px solid transparent;
  
  border-top: 3px solid pink;
}

.body {
  position: absolute;
  bottom: 0;
  width: 50px;
  height: 60px;
  background: var(--cat-color);
  border-radius: 50%;
}
      .button {
    border-radius: 4px;
    background-color: green;
    border: none;
    color: #FFFFFF;
    text-align: center;
    font-size: 15px;
    width: 100px;
    height:50px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 5px;

  }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <body>
        <center><h1>Your account has been deleted</h1>
        </center>
        <center><h1>You can go back now or stare at the cat</h1>
        </center>
  <div class="box-canvas">
    <div class="window-top"></div>
    <div class="window">
      <div class="curtain left"></div>
      <div class="curtain right"></div>
    </div>
    <div class="cat">
      <div class="head">
        <div class="eye left"></div>
        <div class="eye right"></div>
        <div class="nose"></div>
      </div>
      <div class="body"></div>
    </div>
    <div class="windowsill">
    </div>
  </div>

</body>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="user_return" runat="server" Text="Return home" class="button" OnClick="user_return_Click"/>
    </form>
</body>
</html>
