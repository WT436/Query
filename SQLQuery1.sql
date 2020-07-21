create database TTS_ASP_Core
go
use TTS_ASP_Core
go
create table IsLogin
					(account varchar(50) primary key ,
					 Passwork varchar(100) not null,
					 haskPassword nvarchar(10) not null,
					 email varchar(100) not null,
					 deleted bit  not null default 0,
					 decentralization bit not null default 0
					)
					go
create table Infomation(
						InfomationId varchar(50) primary key foreign key references IsLogin(account),
						IsName nvarchar(50) not null, 
						IsAge int check(IsAge>0 and IsAge<0) not null default 8,
						IsAddress nvarchar(300) not null,
						IsPhone NUMERIC(15,0) not null,
						deleted bit  not null default 0,
)
go
create table IsTheme(
					ThemeId int identity(1,1) primary key,
					Isname nvarchar(50) not null,
					IsTitle nvarchar(50) not null,
					deleted bit  not null default 0,
					AvatarTheme nvarchar(300) not null )
					go
create table IsSpecies(
					SpeciesId int identity(1,1) primary key,
					Isname nvarchar(50) not null,
					IsTitle nvarchar(50) not null,
					AvatarSpecies nvarchar(300) not null ,
					deleted bit  not null default 0,
					ThemeId int foreign key references IsTheme(ThemeId),
					ThemeDab int foreign key references IsSpecies(SpeciesId)
					)
					go

create table IsPost(
					PostId int identity(1,1) primary key,
					Title nvarchar(100) not null,
					DayInPost date not null default getdate(),
					avataIndex nvarchar(200) not null,
					Content ntext not null,
					ViewPost int default 0,
					deleted bit  not null default 0,
					SpeciesId int foreign key references IsSpecies(SpeciesId)
)
go
create table IsVideo(
				    VideoId int identity(1,1) primary key,
					Title nvarchar(100) not null,
					DayInPost date not null default getdate(),
					VideoIndex nvarchar(200) not null,
					Content ntext not null,
					ViewPost int default 0,
					deleted bit  not null default 0,
					SpeciesId int foreign key references IsSpecies(SpeciesId)
)
--admin  confing view layout
					go
Create table IsNavSinger(
						NavbarSingerId int identity(1,1) primary key ,
						title nvarchar(300) not null,
						imageSinger nvarchar(100) not null,
						linkImage nvarchar(100) not null,
						deleted bit  not null default 0,
						dateCreate date not null default getdate(),
						dateUpdate date not null default getdate(),
						dateDelete date not null default getdate()
						)
go
create table IsNavbar(  NavbarId int identity(1,1) primary key ,
						NavbarSingerId int foreign key references IsNavSinger(NavbarSingerId),
						stt int  check(stt>0 and stt<10),
						boNavBar int foreign key references IsNavbar(NavbarId),
)
go
create table IsMenuSinger1 -- làm phần config menu tùy chỉnh cho người dùng
                    (MenuId int identity(1,1) primary key ,
					ThemeId int foreign key references IsTheme(ThemeId),
					stt int check(stt>0 and stt <10),
					boN int foreign key references IsMenuSinger1(MenuId),
					)
--create table IsMenuSinger2 -- làm phần config menu tùy chỉnh cho người dùng
--                    (MenuId int identity(1,1) primary key ,
--					ThemeId int foreign key references IsTheme(ThemeId),
--					stt int check(stt>0 and stt <4),
--					boN int foreign key references IsMenuSinger2(MenuId),
--					)
--create table IsMenuSinger3 -- làm phần config menu tùy chỉnh cho người dùng
--                    (MenuId int identity(1,1) primary key ,
--					ThemeId int foreign key references IsTheme(ThemeId),
--					stt int check(stt>0 and stt <7),
--					boN int foreign key references IsMenuSinger3(MenuId),
--					)
					go
create table ThanTrang( 
                     MenuId int identity(1,1) primary key ,
					 patialView nvarchar(300) not null,
					 stt int ,
					 boN int foreign key references ThanTrang(MenuId)
)
create table IsAdmin(
					AdminId int identity(1,1) primary key ,
					MenuId1 int foreign key references IsMenuSinger1(MenuId),
					logo nvarchar(100) not null, 
					MenuId2 int foreign key references IsMenuSinger1(MenuId),
					MenuId3 int foreign key references IsMenuSinger1(MenuId),
					MenuId int foreign key references ThanTrang(MenuId),
					footer nvarchar(300) not null
					)
