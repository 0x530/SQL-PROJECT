create table tblbank
(
bankid int not null,
bankdetails varchar(50)
);


alter table tblbank add constraint pk_bankid primary key (bankid);

insert into tblbank values(1001,'State Bank Of India');
insert into tblbank values(1002,'State Bank OF India');
insert into tblbank values(1003,'State Bank Of India');
insert into tblbank values(1004,'ICICI');
insert into tblbank values(1005,'Punjab');
insert into tblbank values(1006,'HDFC');
insert into tblbank values(1007,'IDBI');
insert into tblbank values(1008,'Karnataka Bank');
insert into tblbank values(1009,'Syndicate Bank');
insert into tblbank values(1010,'Canara Bank');
insert into tblbank values(1011,'Citi Bank');
insert into tblbank values(1012,'Wells Fargo');
insert into tblbank values(1013,'Discover');
insert into tblbank values(1014,'TCF');



create table tbladdaddress
(
addid int not null,
addline1 varchar(100),
addline2 varchar(50),
addcity varchar(50),
addpostcode varchar(15),
addstate varchar(50),
addcountry varchar(50)
);


alter table tbladdaddress add constraint pk_addid primary key  (addid);

insert into tbladdaddress(addid,addline1,addline2,addcity,addpostcode,addstate,addcountry)
values(1001,'9730 37th Place North','Apt#204','Polymouth','55441','MN','USA');
insert into tbladdaddress(addid,addline1,addline2,addcity,addpostcode,addstate,addcountry)
values(1002,'Kombettu House','Padavu,Ujirpade Post Balnad','puttur','574203','Karnataka','India');
insert into tbladdaddress(addid,addline1,addline2,addcity,addpostcode,addstate,addcountry)
values(1003,'302, Sai Manor Towers','X Roads,SR Nagar','Hyderabad','574038','Andra Pradesh','India');


create table tblbtbranchtype
(
bttypecode varchar(4) not null,
bttypedesc varchar(100)
);
alter table tblbtbranchtype add constraint pk_bttypecode primary key (bttypecode);

insert into tblbtbranchtype values('LU','Large Urban');
insert into Tblbtbranchtype values('SR','Small Rural');
insert into tblbtbranchtype values('HO','Head Office');
insert into tblbtbranchtype values('CU','City');




                              -- tblbrbranch(table-4)

create table tblbrbranch
(
brid int not null,
brbankid int,
braddress int,
brbranchtypecode varchar(4),
brbranchname varchar(100),
brbranchphone1 bigint,
brbranchphone2 bigint,
brbranchfax bigint,
brbranchmail varchar(50),
brbranchIFSC varchar(20)
)


select * from sys.tables


alter table tblbrbranch add constraint pk_brid primary key(brid);
alter table tblbrbranch add constraint fk_brbankid foreign key(brbankid) references tblbank(bankid);
alter table tblbrbranch add constraint fk_braddress foreign key(braddress) references tbladdaddress(addid);
alter table tblbrbranch add constraint fk_brbranchtypecode foreign key(brbranchtypecode) references tblbtbranchtype(bttypecode);

INSERT INTO tblbrBranch(brid,brbankid,braddress,brbranchtypecode,brbranchname,brbranchphone1,brbranchphone2,brbranchfax,brbranchmail,brbranchIFSC)
values(1000,1011,1001,'LU','Golden Valley',13234164705,13234164095,17639541522,'wellsforgov@wellsforgo.com','WFGV1015');
INSERT INTO tblbrBranch(brid,brbankid,braddress,brbranchtypecode,brbranchname,brbranchphone1,brbranchphone2,brbranchfax,brbranchmail,brbranchIFSC)
values(1001,1008,1002,'SR','Mangalore',91824247623,91824247624,91824247625,'banker25@karnatakabank.com','KBIN05267');
INSERT INTO tblbrBranch(brid,brbankid,braddress,brbranchtypecode,brbranchname,brbranchphone1,brbranchphone2,brbranchfax,brbranchmail,brbranchIFSC)
values(1002,1001,1003,'HO','Puttur Market',918251249246,918251249247,918251249244,'sbi.04270@sbi.co.in','SBIN004270');



--tblcustomer(table-5)

create table tblcustomer
(
cstid int not null,
cstaddid int,
cstbranchid int,
cstfirstname varchar(50),
cstlastname varchar(50),
cstmiddlename varchar(50),
cstdate date,
cstsince date,
cstphone1 bigint,
cstphone2 bigint,
cstfax varchar(20),
cstgender varchar(10),
cstemail varchar(50)
);
alter table tblcustomer add constraint pk_cstid primary key(cstid);
alter table tblcustomer add constraint fk_cstaddid foreign key(cstaddid) references tbladdaddress(addid);
alter table tblcustomer add constraint fk_cstbranchid foreign key(cstbranchid) references tblbrbranch(brid);
insert into tblcustomer(cstid,cstaddid,cstbranchid,cstfirstname,cstlastname,cstmiddlename,cstdate,cstsince,cstphone1,cstphone2,cstfax,cstgender,cstemail)
values(1000,1001,1000,'Nitin','Kumar','','9-nov-1985','10-aug-1996',247623,null,'null','Male','x');
insert into tblcustomer(cstid,cstaddid,cstbranchid,cstfirstname,cstlastname,cstmiddlename,cstdate,cstsince,cstphone1,cstphone2,cstfax,cstgender,cstemail)
values(1001,1002,1001,'Gaurao','Tarpe','','25-dec-1986','19-mar-2000',918251246,null,null,'Male','y');
insert into tblcustomer(cstid,cstaddid,cstbranchid,cstfirstname,cstlastname,cstmiddlename,cstdate,cstsince,cstphone1,cstphone2,cstfax,cstgender,cstemail)
values(1002,1003,1002,'Chithra','Kunjathaya','Nitin','19-jan-1990','6-jun-2005',918251247,null,null,'Female','y');
insert into tblcustomer(cstid,cstaddid,cstbranchid,cstfirstname,cstlastname,cstmiddlename,cstdate,cstsince,cstphone1,cstphone2,cstfax,cstgender,cstemail)
values(1003,1002,1001,'Adarsh','Hedge','','19-jan-1990','1-mar-2015',918251249246,null,null,'Male','Y');
insert into tblcustomer(cstid,cstaddid,cstbranchid,cstfirstname,cstlastname,cstmiddlename,cstdate,cstsince,cstphone1,cstphone2,cstfax,cstgender,cstemail)
values(1004,1003,1002,'Nathan','Kumas','','10-nov-1985','20-aug-1996',13234164705,null,null,'Male','y');


                             --tblaccaccountstatus(table-6)

create table tblaccaccountstatus
(
accstatuscode varchar(10) not null,
accstatusdesc varchar(50)
);
alter table tblaccaccountstatus add constraint pk_accstatuscode primary key(accstatuscode);
insert into tblaccaccountstatus values('A','Active');
insert into tblaccaccountstatus values('C','Closed');

sp_rename 'tblaccaccountstatus.accstatuscode' , 'accstatus';
                           
						   
						   
						   --tblaccaccounttype(table-7)

create table tblaccaccounttype
(
acctypecode varchar(10) not null,
acctypedesc varchar(100)
);
alter table tblaccaccounttype add constraint pk_acctypecode primary key (acctypecode);
insert into tblaccaccounttype values('CHK','Checking');
insert into tblaccaccounttype values('SAV','Saving');
insert into tblaccaccounttype values('CUR','Current');
insert into tblaccaccounttype values('LN','Loan');
sp_rename 'tblaccaccounttype.acctypecode', 'acctype'

                   
                             --tblaccaccount(table-8)

create table tblaccaccount
(
accint int not null,
accstatuscode varchar(10),
acctypecode varchar(10),
acccustomerid int,
accbalance int
);
select * from tblaccaccounttype
alter table tblaccaccount add constraint pk_accint primary key(accint);
alter table tblaccaccount add constraint fk_accstatuscode foreign key(accstatuscode) references tblaccaccountstatus(accstatus);
alter table tblaccaccount add constraint fk_acctypecode foreign key(acctypecode) references tblaccaccounttype(acctype);
insert into tblaccaccount(accint,accstatuscode,acctypecode,acccustomerid,accbalance) values(10000,'A','SAV',1000,11000);
insert into tblaccaccount values(10001,'A','CUR',1001,200000.9897);
insert into tblaccaccount values(10002,'A','SAV',1002,30000.456);
insert into tblaccaccount values(10003,'C','CHK',1003,5000);
insert into tblaccaccount values(10004,'C','SAV',1004,500);
insert into tblaccaccount values(10005,'A','SAV',1004,500);


                           --tbltransactiontype(table-9)

create table tbltransactiontype
(
trantypecode varchar(6) not null,
trantypedesc varchar(50)
);
alter table tbltransactiontype add constraint pk_trantypecode primary key(trantypecode);
insert into tbltransactiontype values('D','Deposit');
insert into tbltransactiontype values('W','Withdrawal');


                          --tbltrantransaction(table-10)

create table tbltrantransaction
(
tranid int not null,
tranaccountint int,
trantypecode varchar(6),
tranmerchantid varchar(10),
trandate date,
tranamount int,
trandescription varchar(50)
);
alter table tbltrantransaction add constraint pk_tranid primary key(tranid);
alter table tbltrantransaction add constraint fk_tranaccountint foreign key(tranaccountint) references tblaccaccount(accint);
alter table tbltrantransaction add constraint fk_trantypecode foreign key(trantypecode) references tbltransactiontype(trantypecode);
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20000,10000,'D','Self','10-nov-2017',20500.456,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20001,10002,'W','Discover','3-aug-2018',200000,'Withdrawal');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20002,10000,'D','Self','18-aug-2018',13.45,'Cheque#5001');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20003,10001,'D','Self','17-jun-2018',2500,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20004,10002,'W','Discover','14-may-2017',25000,'Withdrawal');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20005,10004,'D','','20-may-2018',1300.45,'Cheque#5001');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20006,10002,'D','Self','12-may-2018',20500.456,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20007,10000,'W','Discover','4-may-2017',200000,'Withdrawal');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20008,10001,'D','','8-may-2018',13.45,'Cheque#5001');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20009,10003,'D','Self','17-may-2018',20500.456,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20010,10001,'D','Self','31-oct-2018',20500.456,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20011,10004,'W','Discover','18-may-2018',200000,'Withdrawal');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20012,10001,'D','Self','20-nov-2018',20500.456,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20013,10000,'D','Self','17-oct-2017',20500.456,'Self Deposit');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20014,10002,'W','Discover','17-jul-18',25000,'Withdrawal');
insert into tbltrantransaction(tranid,tranaccountint,trantypecode,tranmerchantid,trandate,tranamount,trandescription)
values(20015,null,'W','Self','18-aug-2018',25001,'Withdrawal');

                              synonym

--SYNONYMS ARE PERMENANT ALTERNATE NAMES TO TABLES-----

create synonym synbank for tblbank;
create synonym synaddress for tbladdaddress;
create synonym synbranchtype for tblbtbranchtype;
create synonym synbranch for tblbrbranch;
create synonym syncustomer for tblcustomer;
create synonym synaccountstatus for tblaccaccountstatus;
create synonym synaccounttype for tblaccaccounttype;
create synonym synaccount for tblaccaccount;
create synonym syntransactiontype for tbltransactiontype;
create synonym syntransaction for tbltrantransaction;


-----------------------------phase 2---------------------------------------------------------------
-- 1. CREATE FUNCTION TO GET ACCOUNT STATEMENT FOR A GIVEN CUSTOMER ?

CREATE FUNCTION FN_ACC_STATEMENT ( @CSTID BIGINT )
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM tblaccAccount
	INNER JOIN
	tblCustomer
	on accCustomerId=cstId 
	WHERE 
	cstId=@CSTID
)
 


--how to execute function?

SELECT * FROM FN_ACC_STATEMENT(1003)



--2. List all Banks and their Branches with total number of Accounts in each Branch
select bankId, bankDetails, brBranchTypeCode,count(*) as total_account
from 
tblCustomer
inner join
TblaccAccount
on accCustomerId=cstId  
inner join
tblbrBranch
on brID=cstBranchId   
inner  join
TblBank
on bankId=brBankId  
group by brBranchTypeCode, bankId, bankDetails


-- 3. List total number of Customers for each Branch
select brid,brBranchName,count(cstid) as total_cust from
tblbrBranch 
inner join
tblCustomer 
on
brID=cstBranchid
group by brid, brBranchName


-- 4. Find all Customer Accounts that does not have any Transaction
SELECT * FROM tblCustomer 
left outer JOIN
tblaccAccount
on accCustomerId=cstId 
LEFT OUTER JOIN tbltranTransaction 
on accint=tranAccountint
where 
tranID is null


-- 5. Find all Customer Accounts that  have all Transaction details
SELECT * FROM tblCustomer 
left outer JOIN
tblaccAccount
on accCustomerId=cstId 
LEFT OUTER JOIN tbltranTransaction 
on accint=tranAccountint
where 
tranID is not null

--6. Rank the Customers for each Bank & Branch based on number of Transactions. 
--   Customer with maximum number of Transaction gets 1 Rank (Position)
SELECT 
A.BankDetails, B.brBranchName, c.cstId,E.tranAccountint,
dense_RANK() OVER (ORDER BY c.cstId desc) AS RANK_value
FROM tblBank A
LEFT JOIN tblbrbranch B ON A.BankID=B.brBankId
LEFT JOIN tblcustomer C ON B.brID = C.cstBranchId
LEFT JOIN tblaccaccount D ON C.cstId= D.accCustomerId
LEFT JOIN tbltrantransaction E ON D.accint=E.tranAccountint
GROUP BY A.BankDetails, B.brBranchName, c.cstId, E.tranaccountint
ORDER BY RANK_value asc


--7. LIST OF ALL CUSTOMERS WITH ACCOUNTS BASED ON ACCOUNT STATUS

select accstatuscode,t.* ,
dense_RANK() OVER (partition by accstatuscode ORDER BY cstId asc) AS RANK_value
FROM tblcustomer t inner join tblaccaccount ac on ac.acccustomerid=t.cstid

---------------------------OR---------------------------------------------------

create view v1 as select distinct(t.cstid), ac.accstatuscode from tblcustomer t inner join tblaccaccount ac on ac.acccustomerid=t.cstid group by ac.accstatuscode,cstid
select v1.accstatuscode,t.*  from tblcustomer t inner join v1 on t.cstid=v1.cstid

-- 8. LIST OF ALL CUSTOMERS WITH ACCOUNTS BASED ON ACCOUNT STATUS & TYPES WITHOUT ANY TRANSACTIONS

create view v2 as 
select distinct(t.cstid), ac.accstatuscode,acctypecode from tblcustomer t inner join tblaccaccount ac on ac.acccustomerid=t.cstid where accint  in 
(select tranaccountint from tbltrantransaction) group by ac.accstatuscode,acctypecode,cstid 
select v2.accstatuscode,v2.acctypecode,t.*  from tblcustomer t inner join v2 on t.cstid=v2.cstid


-- 9. LIST OF ALL BANKS BASED ON CUSTOMERS AND TRANSACTION AMOUNTS

select bankdetails,cstfirstname,cstlastname,tranamount from tbltrantransaction t inner join tblaccaccount ta on t.tranaccountint=ta.accint inner join tblcustomer tc on ta.acccustomerid=tc.cstid inner join tblbrbranch tb on tc.cstbranchid=tb.brbankid inner join tblbank b on tb.brbankid=b.bankid 


-- 10. LIST OF ALL BANKS WITH CUSTOMERS BUT NO TRANSACTIONS
-- LIST ALL CUSTOMERS WITH ACCOUNTS BUT WITHOUT ANY TRANSACTIONS

select bankdetails,cstfirstname,cstlastname,tranamount from tbltrantransaction t inner join tblaccaccount ta on t.tranaccountint=ta.accint inner join tblcustomer tc on ta.acccustomerid=tc.cstid inner join tblbrbranch tb on tc.cstbranchid=tb.brbankid inner join tblbank b on tb.brbankid=b.bankid where accint not in ( select tranaccountint from tbltrantransaction)

select cstid from tblcustomer where cstid in( select acccustomerid from tblaccaccount where accint not in ( select tranaccountint from tbltrantransaction))


-- 11. LIST OF ALL ZIP CODES WITH MISSING CUSTOMER ADDRESS

select addpostcode from tbladdaddress where addid in (select cstaddid from tblcustomer where cstaddid is  null)

 -- 12. MONTHLY STATEMENT transactions for a given month for a given customer id
  
create proc mstmt (@month int,@custid int)
as
begin
declare @t bigint=(select sum(tranamount) from tbltrantransaction tt inner join tblaccaccount tc on tt.tranaccountint=tc.accint inner join tblcustomer t on tc.acccustomerid=t.cstid where month(trandate)=@month and cstid=@custid)
print('total transaction for custid '+cast(@custid as varchar)+' for month '+cast(@month as varchar)+' is : '+cast(@t as char))
end
exec mstmt 6,1001

-- 13. ACCOUNTS WITH DEPOSITS TXNs total deposits by month for any account in 2017
 
select sum(tranamount) as ttl_txn ,month(trandate) month from tbltrantransaction where trantypecode='d' and year(trandate)=2017 group by month(trandate)


-- 14. LIST ALL ACCOUNTS total monthly deposits
 
select tranaccountint accno , sum(tranamount) txn_per_month ,month(trandate) momnth from tbltrantransaction group by month(trandate),tranaccountint order by accno,month(trandate)