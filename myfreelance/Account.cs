using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace myfreelance
{
    public class Account
    {
        string _connstr = ConfigurationManager.ConnectionStrings["MyFreelanceDBContext"].ConnectionString;

        private string _loginID = null;
        private string _name = "";
        private string _password = "";
        private string _email = null;
        private string _contact = "";
        private string _dateOfBirth = "";
        private string _dateJoined = null;
        private int _contributionPoints = 0;
        private int _noOfDeals = 0;
        private string _role = null;
        private string _license = "";
        private int _rank = 0;
        private int _accountStatus = 0;
        private string _image = "";
        private int _money = 0;
        private string _otp = "";
        public Account()
        {
        }

        public Account(string loginID, string name, string password, string email, string contact, string dateOfBirth, string dateJoined, int contributionPoints, int noOfDeals, string role, string license, int rank, int accountStatus, string image, int money, string otp)
        {
            _loginID = loginID;
            _name = name;
            _password = password;
            _email = email;
            _contact = contact;
            _dateOfBirth = dateOfBirth;
            _dateJoined = dateJoined;
            _contributionPoints = contributionPoints;
            _noOfDeals = noOfDeals;
            _role = role;
            _license = license;
            _rank = rank;
            _accountStatus = accountStatus;
            _image = image;
            _money = money;
            _otp = otp;
        }

        public Account(string name, string password, string email, string contact, string dateOfBirth, string dateJoined, int contributionPoints, int noOfDeals, string role, string license, int rank, int accountStatus, string image, int money, string otp)
            : this(null, name, password, email, contact, dateOfBirth, dateJoined, contributionPoints, noOfDeals, role, license, rank, accountStatus, image,money, otp)
        {
        }

        public Account(string loginID)
            : this(loginID, "", "", null, "", "", null, 0, 0, null, "", 0, 0, "", 0, "")
        {

        }
        public string loginID
        {
            get { return _loginID; }
            set { _loginID = value; }
        }
        public string name
        {
            get { return _name; }
            set { _name = value; }
        }
        public string password
        {
            get { return _password; }
            set { _password = value; }
        }
        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string contact
        {
            get { return _contact; }
            set { _contact = value; }
        }
        public string dateOfBirth
        {
            get { return _dateOfBirth; }
            set { _dateOfBirth = dateOfBirth; }
        }
        public string dateJoined
        {
            get { return _dateJoined; }
            set { _dateJoined = dateJoined; }
        }
        public int contributionPoints
        {
            get { return _contributionPoints; }
            set { _contributionPoints = value; }
        }
        public int noOfDeals
        {
            get { return _noOfDeals; }
            set { _noOfDeals = value; }
        }
        public string role
        {
            get { return _role; }
            set { _role = value; }
        }
        public string license
        {
            get { return _license; }
            set { _license = value; }
        }
        public int rank
        {
            get { return _rank; }
            set { _rank = value; }
        }
        public int accountStatus
        {
            get { return _accountStatus; }
            set { _accountStatus = value; }
        }
        public string image
        {
            get { return _image; }
            set { _image = value; }
        }
        public int money
        {
            get { return _money; }
            set { _money = value; }
        }
        public string otp
        {
            get { return _otp; }
            set { _otp = value; }
        }
        public int AccountInsert()
        {
            int result = 0;

            string queryStr = "INSERT INTO Accounts(loginID,name,password,email, contact,dateOfBirth, dateJoined, contributionPoints, noOfDeals, role, license, rank, accountStatus, image, money, otp)"
                            + "VALUES (@loginID, @Name, @password, @email, @contact, @dateOfBirth, @dateJoined, @contributionPoints, @noOfDeals, @role, @license, @rank, @accountStatus, @image, @money, @otp)";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", this.loginID);
            cmd.Parameters.AddWithValue("@name", this.name);
            cmd.Parameters.AddWithValue("@password", this.password);
            cmd.Parameters.AddWithValue("@email", this.email);
            cmd.Parameters.AddWithValue("@contact", this.contact);
            cmd.Parameters.AddWithValue("@dateOfBirth", this.dateOfBirth);
            cmd.Parameters.AddWithValue("@dateJoined", this.dateJoined);
            cmd.Parameters.AddWithValue("@contributionPoints", this.contributionPoints);
            cmd.Parameters.AddWithValue("@noOfDeals", this.noOfDeals);
            cmd.Parameters.AddWithValue("@role", this.role);
            cmd.Parameters.AddWithValue("@license", this.license);
            cmd.Parameters.AddWithValue("@rank", this.rank);
            cmd.Parameters.AddWithValue("@accountStatus", this.accountStatus);
            cmd.Parameters.AddWithValue("@image", this.image);
            cmd.Parameters.AddWithValue("@money", this.money);
            cmd.Parameters.AddWithValue("@otp", this.otp);

            conn.Open();
            result = cmd.ExecuteNonQuery(); //Returns no. of rows afffected. Must be > 0
            conn.Close();

            return result;
        }//end Insert

        public string CheckPassword(string loginID)
        {
            string check_password = null;

            string queryStr = "SELECT * FROM Accounts WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                check_password = dr["password"].ToString();
            }
            else
            {
                check_password = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return check_password;
        }
        public Account RetriveAccount(string loginID)
        {
            Account accdetail = null;

            string name, password, email, contact, dateOfBirth, dateJoined, license, role, image, otp;
            int contributionPoints, noOfDeals, accountStatus, rank;

            string queryStr = "SELECT * FROM Accounts WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                name = dr["name"].ToString();
                password = dr["password"].ToString();
                email = dr["email"].ToString();
                contact = dr["contact"].ToString();
                dateOfBirth = dr["dateOfBirth"].ToString();
                dateJoined = dr["dateJoined"].ToString();
                license = dr["license"].ToString();
                role = dr["role"].ToString();
                image = dr["image"].ToString();
                contributionPoints = int.Parse(dr["contributionPoints"].ToString());
                noOfDeals = int.Parse(dr["noOfDeals"].ToString());
                accountStatus = int.Parse(dr["accountStatus"].ToString());
                rank = int.Parse(dr["rank"].ToString());
                otp = dr["otp"].ToString();

                accdetail = new Account(name, password, email, contact, dateOfBirth, dateJoined, contributionPoints, noOfDeals, role, license, rank, accountStatus, image, money, otp);
            }
            else
            {
                accdetail = null;
            }
            conn.Close();
            dr.Close();
            dr.Dispose();

            return accdetail;
        }
        public int AccountDelete(string loginID)
        {

            string queryStr = "DELETE FROM Accounts WHERE loginID=@loginID";
            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            //  Response.Write("<script>alert('Delete successful');</script>");
            conn.Close();
            return nofRow;

        }//end Delete

        public int AccountUpdate(string uname, string uemail, string ucontact, string udob, string urole, string ulicense, string uloginID, string upassword, string uimage, string uotp)
        {

            string queryStr = "UPDATE Accounts SET" +
               " name = @name, " +
               " email = @email, " +
               " contact = @contact, " +
               " dateOfBirth = @dateOfBirth, " +
               " license = @license, " +
               " role = @role, " +
               " password = @password, " +
               "image = @image, " +
               "otp = @otp" +
               " WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@name", uname);
            cmd.Parameters.AddWithValue("@email", uemail);
            cmd.Parameters.AddWithValue("@contact", ucontact);
            cmd.Parameters.AddWithValue("@dateOfBirth", udob);
            cmd.Parameters.AddWithValue("@license", ulicense);
            cmd.Parameters.AddWithValue("@role", urole);
            cmd.Parameters.AddWithValue("@password", upassword);
            cmd.Parameters.AddWithValue("@image", uimage);
            cmd.Parameters.AddWithValue("@loginID", uloginID);
            cmd.Parameters.AddWithValue("@otp", uotp);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();

            return nofRow;
        }//end Update
        public string SendEmail(string loginID)
        {
            string send_email = null;

            string queryStr = "SELECT * FROM Accounts WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                send_email = dr["email"].ToString();
            }
            else
            {
                send_email = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return send_email;
        }
        public int RecoverPassword(string loginID, string recoverpass)
        {

            string queryStr = "UPDATE Accounts SET" +
               " password = @password " +
               " WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@password", recoverpass);
            cmd.Parameters.AddWithValue("@loginID", loginID);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();

            return nofRow;
        }//end Recover

        public List<Account> getAccountAll()
        {
            List<Account> accList = new List<Account>();

            string name, password, email, contact, dateOfBirth, dateJoined, license, role, image, otp;
            int contributionPoints, noOfDeals, accountStatus, rank, money;

            string queryStr = "SELECT * FROM Accounts Order By name";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                loginID = dr["loginID"].ToString();
                name = dr["name"].ToString();
                password = dr["password"].ToString();
                email = dr["email"].ToString();
                contact = dr["contact"].ToString();
                dateOfBirth = dr["dateOfBirth"].ToString();
                dateJoined = dr["dateJoined"].ToString();
                license = dr["license"].ToString();
                role = dr["role"].ToString();
                image = dr["image"].ToString();
                contributionPoints = int.Parse(dr["contributionPoints"].ToString());
                noOfDeals = int.Parse(dr["noOfDeals"].ToString());
                accountStatus = int.Parse(dr["accountStatus"].ToString());
                rank = int.Parse(dr["rank"].ToString());
                money = int.Parse(dr["money"].ToString());
                otp = dr["otp"].ToString();
                Account a = new Account(loginID, name, password, email, contact, dateOfBirth, dateJoined, contributionPoints, noOfDeals, role, license, rank, accountStatus, image, money, otp);
                accList.Add(a);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return accList;
        }
        public string CheckLoginID(string loginID)
        {
            string check_loginID = null;

            string queryStr = "SELECT * FROM Accounts WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                check_loginID = dr["loginID"].ToString();
            }
            else
            {
                check_loginID = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return check_loginID;
        }
        public string MoneyRetrieve(string loginID)
        {
            string money_retrieve = null;

            string queryStr = "SELECT * FROM Accounts WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                money_retrieve = dr["money"].ToString();
            }
            else
            {
                money_retrieve = "100";
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return money_retrieve;
        }
        public int UpdateMoney(string loginID, int newmoney)
        {

            string queryStr = "UPDATE Accounts SET" +
               " money = @money " +
               " WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@money", newmoney);
            cmd.Parameters.AddWithValue("@loginID", loginID);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();

            return nofRow;
        }//end Update Money
        public int TransferMoney(string loginID, int addmoney)
        {

            string queryStr = "UPDATE Accounts SET" +
               " money = @money " +
               " WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@money", addmoney);
            cmd.Parameters.AddWithValue("@loginID", loginID);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();

            return nofRow;
        }//end Update Money
        public int DeductMoney(string loginID, int submoney)
        {

            string queryStr = "UPDATE Accounts SET" +
               " money = @money " +
               " WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@money", submoney);
            cmd.Parameters.AddWithValue("@loginID", loginID);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();

            return nofRow;
        }//end Update Money
        public string CheckOTP(string loginID)
        {
            string check_otp = null;

            string queryStr = "SELECT * FROM Accounts WHERE loginID = @loginID";

            SqlConnection conn = new SqlConnection(_connstr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@loginID", loginID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                check_otp = dr["otp"].ToString();
            }
            else
            {
                check_otp = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return check_otp;
        }
    }
}

