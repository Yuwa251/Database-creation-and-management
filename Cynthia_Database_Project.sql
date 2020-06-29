create Database SQLDatabaseCreationProject_Cynthia
use SQLDatabaseCreationProject_Cynthia

CREATE TABLE UserLogins(
	UserLoginID smallint primary key NOT NULL,
	UserLogin varchar(15),
	UserPassword varchar (20))
 
Insert into UserLogins values
(1001,'nami12','rthed512'),
(1002,'redmi12','rgfd56'),
(1003,'katd23','hdeed03'),
(1004,'naom12','ytad671'),
(1005,'Yeshua23','Osalo67')


CREATE TABLE UserSecurityQuestions(
UserSecurityQuestionID tinyint Primary Key NOT NULL,
UserSecurityQuestion varchar(50))

Insert into UserSecurityQuestions values(
101,'What Is Mothers Maidens Name'),
(102,'Name of First Pet'),
(103,'Name of favourite HighSchool Teacher'),
(104,'Name of Favourite Book'),
(105,'Favourite Country')

CREATE TABLE AccountType(
	AccountTypeID tinyint Primary Key NOT NULL,
	AccountTypeDescription varchar (30))


Insert Into AccountType Values
(120,'Chequing Account'),
(121,'Saving Account'),
(122,'Chequing Account'),
(123,'Chequing Account'),
(124,'Saving Account')

CREATE TABLE SavingsInterestRates(
InterestSavingsRateID tinyint Primary Key NOT NULL,
InterestRateValue numeric(9,9),
InterestRateDescription varchar(20))

Insert into SavingsInterestRates VALUES
(1,0.1666,'6 months Rate'),
(2,0.7007,'7 years Rate'),
(3,0.8333,'3 Months Rate'),
(4,0.8003,'8 years Rate'),
(5,0.4004,'4 years Rate')


CREATE TABLE AccountStatusType(
	AccountStatusTypeID tinyint primary Key NOT NULL,
	AccountStatusTypeDescription varchar(30))

Insert into AccountStatusType VALUES
(10,'Active'),
(20,'Deactive'),
(30,'Blocked'),
(40,'Student'),
(50,'Hold')

CREATE TABLE Employee(
	EmployeeID int  Primary Key NOT NULL,
	EmployeeFirstName varchar(25),
	EmployeeMiddleInitial char (1),
	EmployeeLastName varchar (25) NULL,
	EmployeeIsManager bit)

Insert into Employee VALUES
(11001,'Mary','R','Levi',0),
(11002,'Mark','T', 'Vank', 1),
(11003,	'Ryan','S','Davis',0),
(11004,'Lucy','O','Taju',1),
(11005,'Raj','T','Kumari',0)


CREATE TABLE TransactionType (
	TransactionTypeID tinyint Primary Key NOT NULL,
	TransactionTypeName char(10),
	TransactionTypeDescription varchar(50),
	TransactionTypeAmount money)

Insert into TransactionType values
(1,'Debit','Salary Cheque Deposit',5800.00),
(2,'Credit','Mobile Transfer to Mike',500.00),
(3,'Debit','E-Transfer from Mary',1500.00),
(4,'Credit','Point of Sale at Walmart',156.90),
(5,'Debit','Cash withdrawl at Bloor ATM',400.00)

CREATE TABLE LoginErrorLog(
	ErrorLogID int Primary Key Not Null,
	ErrorTime datetime,
	FailedTransactionXML xml)

Insert Into LoginErrorLog Values
(401,'2019-10-11 01:52','<FailedTransactionXML> Deposit Fail</FailedTransactionXML>'),
(404,'2019-12-16 18:32','<FailedTransactionXML> Void Transaction </FailedTransactionXML>'),
(550,'2019-12-24 12:32','<FailedTransactionXML> Wrong Password </FailedTransactionXML>'),
(701,'2020-01-01 10:32','<FailedTransactionXML> Insufficient Funds</FailedTransactionXML>'),
(707,'2020-03-18 02:32','<FailedTransactionXML> Card Declined </FailedTransactionXML>')

CREATE TABLE FailedTransactionErrorType(
	FailedTransactionErrorTypeID tinyint  primary Key Not NULL,
	FailedTransactionErrorTypeDescription varchar (50))

Insert into FailedTransactionErrorType values
(41,'Deposit Fail'),
(44,'Void Transaction'),
(50,'Wrong Password'),
(71,'Insufficient Funds'),
(77,'Card Declined')

	----WITH FOREIGN KEYS---

CREATE TABLE Account(
	AccountID int primary key NOT NULL,
	CurrentBalance int,
	AccountTypeID tinyint,
	AccountStatusTypeID tinyint,
	InterestSavingsRateID tinyint,
	Foreign KEY (AccountTypeID) References AccountType(AccountTypeID),
    FOREIGN KEY (AccountStatusTypeID ) REFERENCES AccountStatustype (AccountStatusTypeID),
	Foreign Key (InterestSavingsRateID) References SavingsInterestRates(InterestSavingsRateID))

Insert into Account Values
(101198,2000,120,10,1),
(101233,200,121,30,3),
(101904,50,123,40,5),
(102802,20000,121,20,2),
(102985,100000,124,50,4)

CREATE TABLE Login_Account(
	UserLoginID smallint,
	AccountID int,
	Foreign KEY (UserLoginID) References UserLogins(UserLoginID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID))

	Insert into Login_Account values
(1001,101198),
(1002,102802),
(1003,101233),
(1004,101904),
(1005,102985)
	

Create TABLE UserSecurityAnswers(
UserLoginID smallint  Primary Key NOT NULL,
UserSecurityAnswer varchar (20),
UserSecurityQuestionID tinyint,
Foreign KEY (UserLoginID) References UserLogins(UserLoginID),
FOREIGN KEY (UserSecurityQuestionID) REFERENCES UserSecurityQuestions(UserSecurityQuestionID))

Insert into UserSecurityAnswers Values
(1001,'Namila',101),
(1002,'Ginger',102),
(1003,'MS Cornwell',103),
(1004,'Data',104),
(1005,'Tokyo',105)


CREATE TABLE OverDraftLog(
	AccountID int Primary Key NOT NULL,
	OverDraftDate datetime,
	OverDraftAmount money,
	OverDraftTrasactionXML xml,
	  FOREIGN KEY (AccountID) REFERENCES Account(AccountID))
    
	Insert Into OverDraftLog Values
(101198,'2019-01-14 20:56:00.000',20.00,'<OverDraftTrasactionXML> Withdrawal Limit Exceeded </OverDraftTrasactionXML>'),
(101233,'2020-03-11 11:57:00.000',26.00,'<OverDraftTrasactionXML> Withdrawal Limit Exceeded </OverDraftTrasactionXML>'),
(101904,'2016-09-03 12:32:00.000',180.00,'<OverDraftTrasactionXML> Withdrawal Limit Exceeded </OverDraftTrasactionXML>'),
(102802,'2012-08-29 16:35:00.000',65.00,'<OverDraftTrasactionXML> Withdrawal Limit Exceeded </OverDraftTrasactionXML>'),
(102985,'2011-01-30 02:48:00.000',50.00,'<OverDraftTrasactionXML> Withdrawal Limit Exceeded </OverDraftTrasactionXML>')


	 Create TABLE Customer(
	CustomerID int primary key not null,
	AccountID int,
	CustomerAddress1 varchar(30),
	CustomerAddress2 varchar (30) ,
	CustomerFirstName varchar(30),
	CustomerMiddleInitial char (1),
	CustomerLastName varchar (30),
	City varchar(20),
	Province char(2),
	Zipcode varchar(10) ,
	EmailAddress varchar (40),
	HomePhone char(10),
	CellPhone char (10),
	WorkPhone char (10),
	SSN CHAR (9),
	UserLoginID smallint,
	 FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
	  Foreign KEY (UserLoginID) References UserLogins(UserLoginID))

	Insert into Customer Values
(1001014,102985,'128 Gergorer Road','109 WestView Road','Charlotte','M','Bay','Charlottetown','PE','Z0R6U6','Charlotbay@Mane.com',3474876,4242908227,6664488,1439084,1003),
(1001256,101198,'276 Toranqe Avenue',NULL,'Jane',NULL,'Zwilling','Missisagua','ON','M4A2S2','jazllin76@gmail.com',2472100,9247210011,NULL,1439085,1001),
(1001458,102802,'23 Bigertao Street','25 Sunrise Bolevard','Matthew','G','Chang','Airdrie','AB','K8Y1U2','chamat@yhoomail.com',3372111,7248213919,8198676,1439086,1002),
(1001610,101233,'45 High Park Street','1905 Eglinton Avenue','Yui','B','Chen','Toronto','ON','W9T2T1','chenB@yui.com',2473856,9247315098,7111989,1439087,1003),
(1001812,101904,'234 Torekh Road',NULL,'Peter','P','Hook','Maple Creek','SK','T4A3Q9','hooet23@gmail.com','9473509',1046197080,	NULL,1439088,1003)

CREATE TABLE Customer_Account(
	AccountID int NOT NULL,
	CustomerID INT
	  FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
	    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID))

Insert into Customer_Account Values
(101198,1001256),
(101233,1001610),
(101904,1001812),
(102802,1001458),
(102985,1001014)


CREATE TABLE TransactionLog(
	TransactionID int primary key NOT NULL,
	TransactionDate datetime,
	TransactionTypeID tinyint,
	TransactionAmount money,
	NewBalance money,
	AccountID int,
	CustomerID int,
	EmployeeID int,
	UserLoginID smallint,
	  FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
	    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
		Foreign Key (EmployeeID) References EMployee (EmployeeID),
		Foreign Key (TransactionTYpeID) References TransactionType (TransactionTYpeID),
		 Foreign KEY (UserLoginID) References UserLogins(UserLoginID))

		 Insert Into TransactionLog Values
(111,'2020-02-16 11:11:00.000',1,5800.00,2000.00,101198,1001256,11001,1001),
(222,'2020-04-26 01:59:00.000',2,500.00,20000.00,102802,1001458,11002,1002),
(333,'2019-12-26 18:47:00.000',3,1500.00,200.00,101233,1001610,11003,1003),
(444,'2020-01-30 05:02:00.000',	4,156.90,50.00,101904,1001812,11004,1004),
(555,'2019-12-31 18:35:00.000',5,400.00,100000.00,102985,1001014,11005,1005)


CREATE TABLE FailedTransactionLog(
	FailedTransactionID int Primary Key Not Null,
	FailedTransactionErrorTypeID tinyint,
	FailedTransactionerrorTime datetime,
	FailedTransactionXML xml,
	Foreign Key (FailedTransactionErrorTypeID) References FailedTransactionErrorType(FailedTransactionErrorTypeID)) 

Insert Into FailedTransactionLog Values 
(1111,50,'2016-10-11 01:52:00.000','<FailedTransactionXML> Wrong Password </FailedTransactionXML>'),
(3333,44,'2020-01-01 10:32:00.000','<FailedTransactionXML> Void Transaction </FailedTransactionXML>'),
(5555,41,'2020-02-16 18:32:00.000','<FailedTransactionXML> Deposit Fail</FailedTransactionXML>'),
(7777,71,'2020-05-24 12:32:00.000','<FailedTransactionXML> Card Declined</FailedTransactionXML>'),
(9999,77,'2020-03-18 02:32:00.000','<FailedTransactionXML> Insufficient Funds </FailedTransactionXML>')


-----VIEW CREATIONS---


---1.
GO
Create View ONCheckAcc
as
select C.CustomerID,c.CustomerFirstName+' '+c.CustomerLastName [Custome Name],c.province,at.AccountTypeDescription
from Customer c 
  join Customer_Account ca 
   on C.CustomerID=ca.CustomerID
   join Account a
   on ca.AccountID=a.AccountID
   join AccountType at
   on a.AccountTypeID=at.AccountTypeID
where at.AccountTypeDescription='Chequing Account' and c.Province='ON';

GO
   
 ----2 
Create View CustomerOverDraft AS
select C.CustomerID,c.CustomerFirstName+' '+c.CustomerLastName [Custome_Name],o.OverDraftDate,o.OverDraftAmount
from Customer c 
  join Customer_Account ca 
   on C.CustomerID=ca.CustomerID
   join Account a
   on ca.AccountID=a.AccountID
   join OverDraftLog o
   on a.AccountID=o.AccountID
   group by c.CustomerID,c.CustomerFirstName,c.CustomerLastName,o.OverDraftDate,o.OverDraftAmount

GO

---3
GO
Create View Account_Login_Password
As
select A.AccountID,u.UserLogin,u.UserPassword
from Login_Account A
  join UserLogins u 
   on A.UserLoginID=u.UserLoginID
    group by A.AccountID,u.UserLogin,u.UserPassword

GO
------4
GO
Create View CustomerAccountType AS
select C.CustomerID,c.CustomerFirstName+' '+c.CustomerLastName [Customer_Name],at.AccountTypeDescription
from Customer c 
  join Customer_Account ca 
   on C.CustomerID=ca.CustomerID
   join Account a
   on ca.AccountID=a.AccountID
   join AccountType at
   on a.AccountTypeID=at.AccountTypeID
   group by c.CustomerID,c.CustomerFirstName,c.CustomerLastName,at.AccountTypeDescription

GO

---------5.
Create View CustomerAccountcount AS
select C.CustomerID,c.CustomerFirstName+' '+c.CustomerLastName [Customer_Name],at.AccountTypeDescription,COUNT(at.AccountTypeDescription) as Number_Of_Account
from Customer c 
  join Customer_Account ca 
   on C.CustomerID=ca.CustomerID
   join Account a
   on ca.AccountID=a.AccountID
   join AccountType at
   on a.AccountTypeID=at.AccountTypeID
   group by c.CustomerID,c.CustomerFirstName,c.CustomerLastName,at.AccountTypeDescription

GO
 ---------6.
GO
Create View Customer_Total_Balance AS
select C.CustomerID,c.CustomerFirstName+'  '+c.CustomerLastName [Customer Name],sum(a.CurrentBalance + s.InterestRateValue)[Total_Balance]
from Customer c 
  join Customer_Account ca 
   on C.CustomerID=ca.CustomerID
   join Account a
   on ca.AccountID=a.AccountID
     Join SavingsInterestRates s
      on s.InterestSavingsRateID = a.InterestSavingsRateID
	   group by c.CustomerID,c.CustomerFirstName,c.CustomerLastName
		  

GO
-------7
GO
Create View Customer_Total_Balance_5000 AS
select *
from Customer_Total_Balance
where Total_Balance >= '5000'

GO


-----Creation of PROCEDURES



------1
GO
Create Procedure Userr_Login_Prefix_ID
(@UserLoginID smallInt out,
@UserLogin char(15) out,
@UserPassword varchar(20) out
)
as
begin
if (@Userlogin in (select Userlogin from UserLogins))
begin
 SELECT('User_'+ @UserLogin) 
end
 else
   begin
    print 'This UserId Is Invalid!'
   end
end
GO
   
------2     

create proc FullNameFromAccountId        
            @AccountID int,                
			                               
			@Fullname nvarchar(100) output 
as
begin
  if (@AccountID in (select AccountID from Account))
    begin
	   select @Fullname=c.customerFirstName+' '+c.customerMiddleInitial+' '+c.customerLastName
	   from customer C
	      join Customer_Account CA
		  on c.CustomerId=ca.CustomerId
		  where ca.AccountId=@AccountID
    end
  else
   begin
    print 'This Account Id does not exists!'
   end
end

go
---3

 Create procedure Current_Balance_withdrawwlll
(@CurrentBalance Int Out, 
 @withdrawl Money Out,
 @AccountID Int Out,
 @FullName VarChar(100) out)

 AS
 Begin
if  (@withdrawl>@CurrentBalance)
Begin
  Print  'Insufficient Funds'
  End
 Else  
If (@AccountID in (select AccountID from Account))
begin
   select @Fullname=c.customerFirstName+' '+c.customerMiddleInitial+' '+c.customerLastName
	   from Customer c
return(select (@CurrentBalance-@withdrawl))
end
 Else
   begin
    print 'Invalid Account ID'
   End
   End

---4.
go
go
 Create procedure Current_Balance_Deposit
(@CurrentBalance Int Out, 
 @Deposit Money Out,
 @AccountID Int Out,
 @FullName VarChar(100) out)
 as
begin
if (@AccountID in (select AccountID from Account))
begin
   select @Fullname=c.customerFirstName+' '+c.customerMiddleInitial+' '+c.customerLastName
	   from Customer c
return(select (@CurrentBalance+@Deposit) as NewBalance)
end
else
   begin
    print 'Account ID not found'
   end
end

GO




----Drop SNN FROM TABLE 

ALTER TABLE Customer DROP COLUMN SSN