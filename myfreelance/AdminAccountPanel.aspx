<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAccountPanel.aspx.cs" Inherits="myfreelance.AdminAccountPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>
<h1>This is an Admin Panel</h1>
        <asp:GridView ID="gvAccount" runat="server" Height="293px" OnSelectedIndexChanged="gvAccount_SelectedIndexChanged"  Width="1293px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="loginID" HeaderText="login ID" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="contact" HeaderText="Contact" />
                <asp:BoundField DataField="dateOfBirth" HeaderText="Date Of Birth" />
                <asp:BoundField DataField="dateJoined" HeaderText="Date Joined" />
                <asp:BoundField DataField="contributionPoints" HeaderText="Contribution Points" />
                <asp:BoundField DataField="noOfDeals" HeaderText="No of deals" />
                <asp:BoundField DataField="role" HeaderText="Role" />
                <asp:BoundField DataField="license" HeaderText="License" />
                <asp:BoundField DataField="rank" HeaderText="Rank" />
                <asp:BoundField DataField="accountStatus" HeaderText="Account Status" />
                <asp:BoundField DataField="money" HeaderText="Money" />
                <asp:BoundField DataField="otp" HeaderText="OTP" />
                <asp:BoundField DataField="image" HeaderText="Image" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height ="80px" Width ="80px"
                            ImageUrl =image/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height ="80px" Width ="80px"
                            ImageUrl ="~\\Images\\rickroll.gif"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>


</body>
</html>
</asp:Content>
