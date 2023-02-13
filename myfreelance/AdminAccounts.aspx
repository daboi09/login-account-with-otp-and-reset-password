<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAccounts.aspx.cs" Inherits="myfreelance.AdminAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<style>
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
            .buttonback {
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
</style>
<body>
    <center><h3>Admin mode, please be caution</h3></center>
<div class="container mt-5">
    
    <div class="row d-flex justify-content-center">
        
        <div class="col-md-7">
            
            <div class="card p-3 py-4">
                
                <div class="text-center">
                    <asp:Image ID="user_image" runat="server" Height="131px" Width="125px" />
&nbsp;</div>
                
                <div class="text-center mt-3">
                    <h3>
                    loginID:
                    <asp:Label ID="lbl_user_loginid" runat="server" Text="LoginID"></asp:Label>
                    <br />
                    Name:
                    <asp:Label ID="lbl_user_name" runat="server" Text="Name"></asp:Label>
                    <br />
                    Email:
                    <asp:Label ID="lbl_user_email" runat="server" Text="Email"></asp:Label>
                    <br />
                    Contact:
                    <asp:Label ID="lbl_user_contact" runat="server" Text="Contact"></asp:Label>
                    <br />
                    DOB:
                    <asp:Label ID="lbl_user_dob" runat="server" Text="Date of Birth"></asp:Label>
                    <br />
                    Date Joined:
                    <asp:Label ID="lbl_user_dj" runat="server" Text="Date Joined"></asp:Label>
                    <br />
                    Contribution Points: <asp:Label ID="lbl_user_cp" runat="server" Text="Contribution Points"></asp:Label>
                    <br />
                    No of deals: <asp:Label ID="lbl_user_deals" runat="server" Text="No of deals"></asp:Label>
                    <br />
                    Role:
                    <asp:Label ID="lbl_user_role" runat="server" Text="Role"></asp:Label>
                    <br />
                    License:
                    <asp:Label ID="lbl_user_license" runat="server" Text="License"></asp:Label>
                    <br />
                    Rank:
                    <asp:Label ID="lbl_user_rank" runat="server" Text="Rank"></asp:Label>
                    <br />
                    OTP:
                    <asp:Label ID="lbl_otp" runat="server" Text="OTP"></asp:Label></h3>
&nbsp;<div class="buttons">
                        
                        <asp:Button ID="admin_update" runat="server" Text="Update" class="buttonupdate" OnClick="admin_update_Click"/>
                        <asp:Button ID="admin_delete" runat="server" Text="Delete" class="buttondelete" OnClientClick="return confirm('Are you sure you want to delete your account?');" OnClick="admin_delete_Click"/>
                         <asp:Button ID="admin_back" runat="server" Text="Back" class="buttonback" OnClick="admin_back_Click"/>
                    </div>
                    
                    
                </div>
                
               
                
                
            </div>
            
        </div>
        
    </div>
    
</div>

</body>
</html>
</asp:Content>
