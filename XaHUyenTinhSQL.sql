create database XaHuyenTinh
go
use XaHuyenTinh
go
create table Tinh(
--Trách Nhiệm : 
	-- tinh cua viet nam
--Trường :
	id int  primary key,
	Ten nvarchar(300),
--Kết Nối :
)
create table Huyen(
--Trách Nhiệm : 
	-- huyen cua tinh
--Trường :
	id int  primary key,
	Ten nvarchar(300),
--Kết Nối :
   MaTinh int foreign key references  Tinh(id)
)
create table Xa(
--Trách Nhiệm : 
	-- xa cua huyen
--Trường :
	id int  primary key,
	Ten nvarchar(300),
	Cap nvarchar(30),
--Kết Nối :
 Huyen int foreign key references  Huyen(id)
)