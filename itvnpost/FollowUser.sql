create database FollowUser
 go 
use FollowUser

go
--kiem tra den tu dau , nguoi dung moi chiem bao nhieu % truy cap boi trinh duyet nao 
--muc tieu :










create table LocationUser(
Id	int primary key identity(1,1),
IpClient	varchar(30) not null,
Locations	varchar(200),
DateCreate	date default getdate(),
DateEnd	int default(60)
)
create table LocationDetail(
id	int primary key identity(1,1),
Country	nvarchar(50) not null,
Province	nvarchar(50) not null,
District	nvarchar(50) not null,
SmallAddress	nvarchar(100),
IdLocationUser	int foreign key references LocationUser(Id)
)
create table FollowWorkingPage(
id	int primary key identity(1,1),
LinkPage	varchar(300),
ViewCount	int default 1 check(ViewCount>0),
Duration	int  default 0,
IdPageUser	int foreign key references LocationUser(Id)
)
--kiem tra : so lan lan chuot : len xuong click