﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTransfer.aspx.cs" Inherits="myfreelance.UserTransfer" %>
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
                    <h1>
                    Balance: $<asp:Label ID="lbl_user_money" runat="server" Text="$"></asp:Label></h1>
                        <br /><br />
                    <h2><label for="transfer">Transfer to</label><br /><asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="(Enter login ID)" ControlToValidate="user_id_transfer" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    <asp:TextBox ID="user_id_transfer" runat="server" placeholder="Enter login ID"></asp:TextBox>
                    <br /><br />
                    <label for="amount">Amount</label><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(Enter your amount)" ControlToValidate="user_amount" ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="cv_license" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="user_amount" ErrorMessage="(Amount must be in integer)" ForeColor="Red"></asp:CompareValidator>
                        <br />
                    <asp:TextBox ID="user_amount" runat="server" placeholder="Enter amount"></asp:TextBox>
                    <br />
                    </h2>
                    <p>
                        &nbsp;</p>
                    <p>
                        &nbsp;</p>
&nbsp;<div class="buttons">
                        
                        <asp:Button ID="user_transfer" runat="server" Text="Transfer" class="buttonupdate" OnClick="user_transfer_Click" />
                        <asp:Button ID="user_back" runat="server" Text="Back" class="buttondelete" OnClick="user_back_Click" CausesValidation="False"/>
                    </div>
                    
                    
                </div>
                
               
                
                
            </div>
            
        </div>
        
    </div>
    
</div>

</body>
</html>
</asp:Content>
