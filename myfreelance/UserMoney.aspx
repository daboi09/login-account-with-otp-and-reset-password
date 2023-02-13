<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserMoney.aspx.cs" Inherits="myfreelance.UserMoney" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!DOCTYPE html>
<head>
<title>Page Title</title>
</head>
<style>
          .buttonmoney {
    border-radius: 4px;
    background-color: blue;
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
      .buttonupdate {
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
      .buttondelete {
    border-radius: 4px;
    background-color: red;
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
<body>
<div class="container mt-5">
    
    <div class="row d-flex justify-content-center">
        
        <div class="col-md-7">
            
            <div class="card p-3 py-4">
                
                <div class="text-center">
&nbsp;<br />
                </div>
                
                <div class="text-center mt-3">
                    <h2>
                    loginID:
                    <asp:Label ID="lbl_user_loginid" runat="server" Text="LoginID"></asp:Label>
                    <br />
                    Balance: $<asp:Label ID="lbl_user_money" runat="server" Text=""></asp:Label>
                    <br />
                    </h2>
                    <p>
                        &nbsp;</p>
                    <p>
                        &nbsp;</p>
&nbsp;<div class="buttons">
                        
                        <asp:Button ID="user_money" runat="server" Text="Purchase" class="buttonmoney" OnClick="user_money_Click"/>
                        <asp:Button ID="user_transfer" runat="server" Text="Transfer" class="buttonupdate" OnClick="user_transfer_Click"/>
                        <asp:Button ID="user_withdraw" runat="server" Text="Withdraw" class="buttondelete" OnClick="user_withdraw_Click"/>
                        <asp:Button ID="user_back" runat="server" Text="Back" class="buttonmoney" OnClick="user_back_Click"/>
                    </div>
                    
                    
                </div>
                
               
                
                
            </div>
            
        </div>
        
    </div>
    
</div>

</body>
</html>
</asp:Content>
