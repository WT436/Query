create database testIT
go
USE testIT
GO
CREATE TABLE Layout(
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](250) NOT NULL
	)
go
CREATE TABLE AppUser(
	[Id] [uniqueidentifier] NOT NULL primary key,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[DateOfBirth] [datetime2](7) NULL
	)
go
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[OrderPosition] [int] NULL,
	[IsDisplayHome] [bit] NOT NULL,
	[LayoutId] [int] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[UserIdCreated] [uniqueidentifier] NULL foreign key references AppUser(id),
	[UserIdModified] [uniqueidentifier] NULL foreign key references AppUser(id)
	)
	go
create table LayoutNew(
                        id int identity(1,1) primary key,
						names varchar(max) not null
)
go
create table News(
				Id	int identity(1,1) primary key,
				Names	nvarchar(255),
				Title	nvarchar(255),
				Images	nvarchar(Max),
				Detail	nvarchar(Max),
				DateCreated	datetime,
				DateModified	datetime,
				UserIdCreated	uniqueidentifier foreign key references AppUser(id),
				UserIdModified	uniqueidentifier foreign key references AppUser(id),
				Isdelete	bit default 0,
				Alias	nvarchar(255),
				MenuId	int foreign key references Menu(id),
				IdLayoutNew	int foreign key references LayoutNew(id)
)