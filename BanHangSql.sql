create database Sell2
Use Sell2
GO

/****** Object:  Table [dbo].[Seo]    Script Date: 6/26/2020 10:06:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Seo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Meta] [nvarchar](200) NULL,
	[Link] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[LoginAccount]    Script Date: 6/26/2020 10:07:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LoginAccount](
	[NameUser] [varchar](50) NOT NULL,
	[PassUser] [varchar](100) NOT NULL,
	[HaskPass] [varchar](100) NOT NULL,
	[Email] [varchar](300) NOT NULL,
	[delet] [bit] NOT NULL,
	[phanQuyen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NameUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LoginAccount] ADD  DEFAULT ((0)) FOR [phanQuyen]
GO

ALTER TABLE [dbo].[LoginAccount]  WITH CHECK ADD CHECK  (([phanQuyen]>(-1) AND [phanQuyen]<(3)))
GO

GO

/****** Object:  Table [dbo].[infomationUser]    Script Date: 6/26/2020 10:08:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[infomationUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [nvarchar](max) NOT NULL,
	[NameUser] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[Adress] [nvarchar](300) NOT NULL,
	[Sdt] [numeric](14, 0) NOT NULL,
	[ngayCapNhat] [date] NULL,
	[Account] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[infomationUser] ADD  DEFAULT ((18)) FOR [age]
GO

ALTER TABLE [dbo].[infomationUser] ADD  DEFAULT (getdate()) FOR [ngayCapNhat]
GO

ALTER TABLE [dbo].[infomationUser]  WITH CHECK ADD FOREIGN KEY([Account])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[infomationUser]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Supplier]    Script Date: 6/26/2020 10:08:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [varchar](max) NOT NULL,
	[TenTrang] [nvarchar](30) NOT NULL,
	[createTime] [date] NOT NULL,
	[da_Xoa] [bit] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (getdate()) FOR [createTime]
GO

ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ((0)) FOR [da_Xoa]
GO

ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[ThemeProduct]    Script Date: 6/26/2020 10:09:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ThemeProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameTheme] [nvarchar](300) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ThemeProduct] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[ThemeProduct] ADD  DEFAULT (getdate()) FOR [EndDate]
GO

ALTER TABLE [dbo].[ThemeProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

GO

/****** Object:  Table [dbo].[categoryProduct]    Script Date: 6/26/2020 10:10:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[categoryProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameCategory] [nvarchar](300) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsDelete] [bit] NULL,
	[Theme] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[categoryProduct] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[categoryProduct] ADD  DEFAULT (getdate()) FOR [EndDate]
GO

ALTER TABLE [dbo].[categoryProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[categoryProduct]  WITH CHECK ADD FOREIGN KEY([Theme])
REFERENCES [dbo].[ThemeProduct] ([id])
GO

GO

/****** Object:  Table [dbo].[ImageProduct]    Script Date: 6/26/2020 10:11:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImageProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[anh1] [varchar](max) NOT NULL,
	[anh2] [varchar](max) NOT NULL,
	[anh3] [varchar](max) NOT NULL,
	[anh5] [varchar](max) NOT NULL,
	[anh6] [varchar](max) NOT NULL,
	[anh7] [varchar](max) NOT NULL,
	[Isdelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ImageProduct] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

GO

/****** Object:  Table [dbo].[Product]    Script Date: 6/26/2020 10:11:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](100) NOT NULL,
	[gia] [money] NOT NULL,
	[soLuong] [int] NULL,
	[soLuongconlai] [int] NULL,
	[bao_hanh] [int] NOT NULL,
	[gioiThieu] [nvarchar](500) NULL,
	[color] [nvarchar](30) NOT NULL,
	[size] [nvarchar](30) NOT NULL,
	[Isdelete] [bit] NULL,
	[Supplier] [int] NULL,
	[ImageProduct] [int] NULL,
	[categoryProduct] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryProduct])
REFERENCES [dbo].[categoryProduct] ([id])
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ImageProduct])
REFERENCES [dbo].[ImageProduct] ([id])
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Supplier])
REFERENCES [dbo].[Supplier] ([id])
GO 

GO

/****** Object:  Table [dbo].[Clothes]    Script Date: 6/26/2020 10:12:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Clothes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chatlieu] [nvarchar](50) NOT NULL,
	[DangAo] [nvarchar](50) NOT NULL,
	[cachGiat] [nvarchar](50) NOT NULL,
	[xuatXu] [nvarchar](50) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Clothes] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Phone]    Script Date: 6/26/2020 10:12:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Phone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[man_hinh] [nvarchar](100) NOT NULL,
	[he_dieu_hanh] [varchar](30) NOT NULL,
	[camera_Truoc] [nvarchar](50) NOT NULL,
	[camera_Sau] [nvarchar](50) NOT NULL,
	[Loi_san_Pham] [nvarchar](100) NOT NULL,
	[di_Kem] [nvarchar](100) NOT NULL,
	[ram] [nvarchar](50) NOT NULL,
	[cpu] [nvarchar](50) NOT NULL,
	[bo_nho] [int] NOT NULL,
	[the_nho] [nvarchar](50) NOT NULL,
	[sim] [nvarchar](50) NOT NULL,
	[doPhanGiai] [nvarchar](100) NOT NULL,
	[Man_Hinh_rong] [nvarchar](100) NOT NULL,
	[KinhCamUng] [nvarchar](100) NOT NULL,
	[chipset] [varchar](30) NOT NULL,
	[TocDocpu] [varchar](30) NOT NULL,
	[GPU] [varchar](30) NOT NULL,
	[DoPhanGiaiCammeraTruoc] [varchar](30) NOT NULL,
	[VideoCall] [varchar](30) NOT NULL,
	[ThongTinKhacCamMera] [varchar](30) NOT NULL,
	[DoPhanGiaiCamerasau] [varchar](30) NOT NULL,
	[quayPhim] [varchar](30) NOT NULL,
	[denFlash] [varchar](30) NOT NULL,
	[chupAnhNangCao] [varchar](30) NOT NULL,
	[hoTroMang] [nvarchar](50) NOT NULL,
	[wifi] [nvarchar](50) NOT NULL,
	[GPS] [nvarchar](50) NOT NULL,
	[bluetooth] [nvarchar](50) NOT NULL,
	[congKetNoi] [nvarchar](50) NOT NULL,
	[JackTaiNGhe] [nvarchar](50) NOT NULL,
	[ketNoiKhac] [nvarchar](50) NOT NULL,
	[thietKe] [nvarchar](50) NOT NULL,
	[ChatLieu] [nvarchar](50) NOT NULL,
	[TrongLuong] [nvarchar](50) NOT NULL,
	[LoaiPin] [nvarchar](50) NOT NULL,
	[CongNghePin] [nvarchar](50) NOT NULL,
	[dung_luong_Pin] [int] NOT NULL,
	[BaoMat] [nvarchar](50) NOT NULL,
	[TinhNangNoiBat] [nvarchar](50) NOT NULL,
	[GhiAm] [nvarchar](50) NOT NULL,
	[Radio] [nvarchar](50) NOT NULL,
	[XemPhim] [nvarchar](50) NOT NULL,
	[NGheNHac] [nvarchar](50) NOT NULL,
	[ThoiDiemRaMat] [nvarchar](50) NOT NULL,
	[LoaiSanPham] [bit] NOT NULL,
	[Isdelete] [bit] NULL,
	[Seo] [int] NULL,
	[Product] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Phone] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Phone]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Phone]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Headphone]    Script Date: 6/26/2020 10:13:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Headphone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chungLoai] [int] NOT NULL,
	[TuongThich] [nvarchar](50) NULL,
	[congXuat] [int] NULL,
	[cachKetNoi] [nvarchar](50) NULL,
	[PhimDieuKhien] [nvarchar](50) NULL,
	[TinhNangKhac] [nvarchar](50) NULL,
	[KhoangCachBluetooth] [int] NULL,
	[kichThuocSieuTram] [nvarchar](50) NULL,
	[KichThuocVeTinh] [nvarchar](50) NULL,
	[trongLuong] [int] NULL,
	[thuongHieu] [nvarchar](50) NULL,
	[XuatSu] [nvarchar](50) NULL,
	[BoBanHangChuan] [nvarchar](50) NULL,
	[CongSac] [nvarchar](50) NULL,
	[ThoiGianSuDung] [int] NULL,
	[KetNoiCungLuc] [int] NULL,
	[ThoiGianXacDay] [int] NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Headphone] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Headphone]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Headphone]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[Headphone]  WITH CHECK ADD CHECK  (([chungLoai]>(0) AND [chungLoai]<(5)))
GO 

GO

/****** Object:  Table [dbo].[Computer]    Script Date: 6/26/2020 10:13:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Computer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cpu] [nvarchar](50) NOT NULL,
	[loaiCPU] [nvarchar](50) NOT NULL,
	[tocdocpu] [int] NULL,
	[tocdoToida] [int] NULL,
	[loaiRam] [nvarchar](50) NOT NULL,
	[tocDoBusRam] [nvarchar](50) NOT NULL,
	[hoTroRamToiDa] [nvarchar](50) NOT NULL,
	[Ram] [nvarchar](50) NOT NULL,
	[OCung] [nvarchar](50) NOT NULL,
	[kichthuocManHinh] [nvarchar](50) NOT NULL,
	[DoPhanGiai] [nvarchar](50) NOT NULL,
	[CongNgheManHinh] [nvarchar](50) NOT NULL,
	[ManHinhCamUng] [bit] NULL,
	[ThietKeCard] [nvarchar](50) NOT NULL,
	[cardDoHoa] [nvarchar](50) NOT NULL,
	[CongNgheAmThanh] [nvarchar](50) NOT NULL,
	[congGiaoTiep] [nvarchar](50) NOT NULL,
	[ketnoiKhongday] [nvarchar](50) NOT NULL,
	[kheDocTheNho] [nvarchar](50) NOT NULL,
	[OdiaQuang] [nvarchar](50) NOT NULL,
	[WebCam] [nvarchar](50) NOT NULL,
	[TinhNangKhac] [nvarchar](50) NOT NULL,
	[DenBanPhm] [nvarchar](50) NOT NULL,
	[pin] [nvarchar](50) NOT NULL,
	[thongTinPhin] [nvarchar](50) NOT NULL,
	[HeDieuHanh] [nvarchar](50) NOT NULL,
	[TrongLuong] [nvarchar](50) NOT NULL,
	[ChatLieu] [nvarchar](50) NOT NULL,
	[ThoiDiemRaMat] [nvarchar](50) NOT NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Computer] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Computer]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Computer]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[TechnologyWatch]    Script Date: 6/26/2020 10:14:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TechnologyWatch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[man_hinh] [nvarchar](100) NOT NULL,
	[congNgheManHinh] [nvarchar](30) NULL,
	[KichThucManHinh] [varchar](30) NULL,
	[doPhanGiai] [varchar](30) NULL,
	[duongKinhMat] [int] NULL,
	[cpu] [varchar](30) NULL,
	[boNhoTrong] [varchar](30) NULL,
	[HeDieuHanh] [varchar](30) NULL,
	[ketNoiHeDieuHanh] [varchar](30) NULL,
	[congSac] [varchar](30) NULL,
	[ThoiGianSuDungPin] [int] NULL,
	[thoiGianSac] [int] NULL,
	[dungLuongPin] [int] NULL,
	[theoDoiSucKhoe] [varchar](50) NULL,
	[HienThiThongBao] [varchar](50) NULL,
	[TienIchKhac] [varchar](50) NULL,
	[ketnoi] [varchar](30) NULL,
	[cammera] [varchar](30) NULL,
	[dodaiDay] [int] NULL,
	[doRongDay] [int] NULL,
	[chatlieuday] [varchar](30) NULL,
	[daycoThethaoroi] [bit] NULL,
	[chatlieukhungvien] [varchar](30) NULL,
	[ngonNgu] [varchar](30) NULL,
	[khichThuoc] [varchar](30) NULL,
	[trongLuong] [int] NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TechnologyWatch] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[TechnologyWatch]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[TechnologyWatch]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[FashionWatch]    Script Date: 6/26/2020 10:16:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FashionWatch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loaimay] [nvarchar](30) NULL,
	[duongKinhmat] [int] NULL,
	[chatLieuMatKinh] [nvarchar](30) NULL,
	[chatLieuKhungVien] [nvarchar](30) NULL,
	[chongxuoc] [nvarchar](30) NULL,
	[dodayMat] [int] NULL,
	[chatLieuDay] [nvarchar](30) NULL,
	[tienIch] [nvarchar](30) NULL,
	[doRongDay] [int] NULL,
	[NguonNangLuong] [nvarchar](30) NULL,
	[ThoiGianSuDungPin] [nvarchar](30) NULL,
	[DoiTuongSuDung] [nvarchar](30) NULL,
	[ThuongHieu] [nvarchar](30) NULL,
	[noiSanXuat] [nvarchar](50) NULL,
	[ThoiDiemRaMat] [nvarchar](50) NOT NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FashionWatch] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[FashionWatch]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[FashionWatch]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Pin]    Script Date: 6/26/2020 10:17:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HieuXuatXac] [int] NULL,
	[dungluong] [int] NULL,
	[thoiGianXac] [int] NULL,
	[nguonvao] [nvarchar](30) NULL,
	[loiPin] [nvarchar](30) NULL,
	[congnghe] [nvarchar](30) NULL,
	[tienich] [nvarchar](30) NULL,
	[trongLuong] [int] NULL,
	[thuongHieu] [nvarchar](30) NULL,
	[NguonGoc] [nvarchar](30) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pin] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Pin]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Pin]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[ChargingCable]    Script Date: 6/26/2020 10:17:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChargingCable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loai] [int] NULL,
	[doDaiDay] [int] NULL,
	[chucNang] [nvarchar](30) NULL,
	[dauvao] [nvarchar](30) NULL,
	[dauRa] [nvarchar](30) NULL,
	[congNghe] [nvarchar](30) NULL,
	[tienIch] [nvarchar](30) NULL,
	[ThuongHieu] [nvarchar](30) NULL,
	[NguonGoc] [nvarchar](30) NULL,
	[Product] [int] NULL,
	[Isdelete] [bit] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChargingCable] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[ChargingCable]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[ChargingCable]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[ChargingCable]  WITH CHECK ADD CHECK  (([loai]>(0) AND [loai]<(4)))
GO

GO

/****** Object:  Table [dbo].[Camera]    Script Date: 6/26/2020 10:17:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Camera](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dophangiai] [nvarchar](30) NULL,
	[nguondienvao] [int] NULL,
	[tamNhinHongNgoai] [int] NULL,
	[hoTroTheNho] [nvarchar](30) NULL,
	[hoTroThietBi] [nvarchar](30) NULL,
	[khichthuoc] [nvarchar](30) NULL,
	[trongluong] [int] NULL,
	[nhietdoHoatDong] [nvarchar](30) NULL,
	[thuongHieu] [nvarchar](30) NULL,
	[nguonGoc] [nvarchar](30) NULL,
	[PhuKien] [nvarchar](100) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Camera] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Camera]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Camera]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[NetworkEquipment]    Script Date: 6/26/2020 10:18:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NetworkEquipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loai] [int] NULL,
	[tocDo] [int] NULL,
	[bangTan] [int] NULL,
	[cacCongKetNoi] [nvarchar](50) NULL,
	[DenBaoHieu] [nvarchar](30) NULL,
	[soAngTen] [nvarchar](30) NULL,
	[TruyCapToiDa] [int] NULL,
	[DoPhuSong] [int] NULL,
	[NutBamHoTro] [nvarchar](30) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[NetworkEquipment] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[NetworkEquipment]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[NetworkEquipment]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[NetworkEquipment]  WITH CHECK ADD CHECK  (([loai]>(0) AND [loai]<(4)))
GO

GO

/****** Object:  Table [dbo].[Shoes]    Script Date: 6/26/2020 10:19:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Shoes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[doCao] [int] NULL,
	[loaiMui] [nvarchar](30) NULL,
	[chatLieu] [nvarchar](50) NULL,
	[HoaVan] [nvarchar](100) NULL,
	[moiTruongSuDung] [nvarchar](100) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Shoes] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Cosmetic]    Script Date: 6/26/2020 10:19:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cosmetic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[thuongHieu] [nvarchar](30) NULL,
	[xuatSu] [nvarchar](30) NULL,
	[thanhPhan] [nvarchar](200) NULL,
	[muiHuong] [nvarchar](30) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cosmetic] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Cosmetic]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Cosmetic]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[WaterPurifier]    Script Date: 6/26/2020 10:19:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WaterPurifier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WaterPurifier] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[WaterPurifier]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[WaterPurifier]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Fashion]    Script Date: 6/26/2020 10:20:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fashion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ThuongHieu] [nvarchar](100) NULL,
	[Isdelete] [bit] NULL,
	[Product] [int] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fashion] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Fashion]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Fashion]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Discount]    Script Date: 6/26/2020 10:21:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[phantram] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[EndDate] [int] NULL,
	[oneUsing] [bit] NULL,
	[MoreUsing] [bit] NULL,
	[NumberUsing] [int] NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Discount] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((15)) FOR [EndDate]
GO

ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [oneUsing]
GO

ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [MoreUsing]
GO

ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [NumberUsing]
GO

ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

GO

/****** Object:  Table [dbo].[ProductUsingDiscount]    Script Date: 6/26/2020 10:21:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductUsingDiscount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[soLuong] [int] NULL,
	[IsDelete] [bit] NULL,
	[Product] [int] NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductUsingDiscount] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[ProductUsingDiscount]  WITH CHECK ADD FOREIGN KEY([Discount])
REFERENCES [dbo].[Discount] ([id])
GO

ALTER TABLE [dbo].[ProductUsingDiscount]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

GO

/****** Object:  Table [dbo].[DetailDiscountFromUser]    Script Date: 6/26/2020 10:22:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DetailDiscountFromUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createUsing] [date] NULL,
	[IsDelete] [bit] NULL,
	[NameUser] [varchar](50) NULL,
	[ProductUsingDiscount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DetailDiscountFromUser] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[DetailDiscountFromUser]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[DetailDiscountFromUser]  WITH CHECK ADD FOREIGN KEY([ProductUsingDiscount])
REFERENCES [dbo].[ProductUsingDiscount] ([id])
GO

GO

/****** Object:  Table [dbo].[promotionReposetory]    Script Date: 6/26/2020 10:23:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[promotionReposetory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tongSoLuong] [int] NULL,
	[IsDelete] [bit] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[promotionReposetory] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[promotionReposetory]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[promotionReposetory]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

GO

/****** Object:  Table [dbo].[promotion]    Script Date: 6/26/2020 10:23:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[soluong] [int] NULL,
	[dateCreate] [date] NULL,
	[dateEnd] [date] NULL,
	[IsDelete] [bit] NULL,
	[Product] [int] NULL,
	[promotionReposetory] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[promotion] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[promotion]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[promotion]  WITH CHECK ADD FOREIGN KEY([promotionReposetory])
REFERENCES [dbo].[promotionReposetory] ([id])
GO

GO

/****** Object:  Table [dbo].[promotionHistory]    Script Date: 6/26/2020 10:23:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[promotionHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [date] NULL,
	[IsDelete] [bit] NULL,
	[NameUser] [varchar](50) NULL,
	[promotion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[promotionHistory] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[promotionHistory]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[promotionHistory]  WITH CHECK ADD FOREIGN KEY([promotion])
REFERENCES [dbo].[promotion] ([id])
GO

GO

/****** Object:  Table [dbo].[PlaceOfDelivery]    Script Date: 6/26/2020 10:24:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PlaceOfDelivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DiaDiemRieng] [nvarchar](300) NULL,
	[DiaDiemRieng1] [nvarchar](300) NULL,
	[DiaDiemRieng2] [nvarchar](300) NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PlaceOfDelivery]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[Cart]    Script Date: 6/26/2020 10:24:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[soLuong] [int] NOT NULL,
	[daXoa] [bit] NOT NULL,
	[PlaceOfDelivery] [int] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [daXoa]
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([PlaceOfDelivery])
REFERENCES [dbo].[PlaceOfDelivery] ([id])
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD CHECK  (([soLuong]>(0)))
GO

GO

/****** Object:  Table [dbo].[Purchase]    Script Date: 6/26/2020 10:25:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Purchase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngaydat] [date] NOT NULL,
	[NgayGiao] [date] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Cart] [int] NULL,
	[PlaceOfDelivery] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Purchase] ADD  DEFAULT (getdate()) FOR [ngaydat]
GO

ALTER TABLE [dbo].[Purchase] ADD  DEFAULT (getdate()) FOR [NgayGiao]
GO

ALTER TABLE [dbo].[Purchase] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD FOREIGN KEY([Cart])
REFERENCES [dbo].[Cart] ([id])
GO

ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD FOREIGN KEY([PlaceOfDelivery])
REFERENCES [dbo].[PlaceOfDelivery] ([id])
GO

GO

/****** Object:  Table [dbo].[Pay]    Script Date: 6/26/2020 10:25:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tongtien] [numeric](18, 0) NOT NULL,
	[createDate] [date] NULL,
	[traTruoc] [bit] NULL,
	[traSau] [bit] NULL,
	[TraGop] [bit] NULL,
	[IsDelete] [bit] NULL,
	[Purchase] [int] NULL,
	[promotion] [int] NULL,
	[ProductUsingDiscount] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pay] ADD  DEFAULT ((0)) FOR [tongtien]
GO

ALTER TABLE [dbo].[Pay] ADD  DEFAULT ((0)) FOR [traTruoc]
GO

ALTER TABLE [dbo].[Pay] ADD  DEFAULT ((1)) FOR [traSau]
GO

ALTER TABLE [dbo].[Pay] ADD  DEFAULT ((0)) FOR [TraGop]
GO

ALTER TABLE [dbo].[Pay] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[Pay]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Pay]  WITH CHECK ADD FOREIGN KEY([ProductUsingDiscount])
REFERENCES [dbo].[ProductUsingDiscount] ([id])
GO

ALTER TABLE [dbo].[Pay]  WITH CHECK ADD FOREIGN KEY([promotion])
REFERENCES [dbo].[promotion] ([id])
GO

ALTER TABLE [dbo].[Pay]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

GO

/****** Object:  Table [dbo].[HistoryUserBuyProduct]    Script Date: 6/26/2020 10:26:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HistoryUserBuyProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngaydat] [date] NOT NULL,
	[NgayGiao] [date] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Cart] [int] NULL,
	[Purchase] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct] ADD  DEFAULT (getdate()) FOR [ngaydat]
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct] ADD  DEFAULT (getdate()) FOR [NgayGiao]
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct]  WITH CHECK ADD FOREIGN KEY([Cart])
REFERENCES [dbo].[Cart] ([id])
GO

ALTER TABLE [dbo].[HistoryUserBuyProduct]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Prepay]    Script Date: 6/26/2020 10:27:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prepay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[daThanhToan] [bit] NULL,
	[DateCreate] [date] NULL,
	[isDelete] [bit] NULL,
	[Purchase] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Prepay] ADD  DEFAULT ((0)) FOR [daThanhToan]
GO

ALTER TABLE [dbo].[Prepay] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[Prepay]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Prepay]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[Prepay]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Postpaid]    Script Date: 6/26/2020 10:27:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Postpaid](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[daThanhToan] [bit] NULL,
	[DateCreate] [date] NULL,
	[isDelete] [bit] NULL,
	[Purchase] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Postpaid] ADD  DEFAULT ((0)) FOR [daThanhToan]
GO

ALTER TABLE [dbo].[Postpaid] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[Postpaid]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Postpaid]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[Postpaid]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Installment]    Script Date: 6/26/2020 10:28:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Installment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tongTien] [numeric](18, 0) NOT NULL,
	[tongThang] [int] NULL,
	[monThang] [numeric](18, 0) NULL,
	[hoanthanh] [bit] NULL,
	[DateCreate] [date] NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Installment] ADD  DEFAULT ((0)) FOR [hoanthanh]
GO

ALTER TABLE [dbo].[Installment] ADD  DEFAULT ((0)) FOR [isDelete]
GO

GO

/****** Object:  Table [dbo].[InstallmentPaymentPeriod]    Script Date: 6/26/2020 10:29:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InstallmentPaymentPeriod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[thangHienTai] [int] NULL,
	[tienThangHienTai] [numeric](18, 0) NOT NULL,
	[DateCreate] [date] NULL,
	[isDelete] [bit] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Installment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InstallmentPaymentPeriod] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[InstallmentPaymentPeriod]  WITH CHECK ADD FOREIGN KEY([Installment])
REFERENCES [dbo].[Installment] ([id])
GO

ALTER TABLE [dbo].[InstallmentPaymentPeriod]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[InstallmentPaymentPeriod]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

GO

/****** Object:  Table [dbo].[ContractForm]    Script Date: 6/26/2020 10:30:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ContractForm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[html] [nvarchar](max) NULL,
	[dateCreate] [date] NULL,
	[NameUser] [varchar](50) NULL,
	[isDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ContractForm] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[ContractForm]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[IsContract]    Script Date: 6/26/2020 10:31:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IsContract](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[html] [nvarchar](max) NULL,
	[NameUser] [varchar](50) NULL,
	[ContractForm] [int] NULL,
	[Purchase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[IsContract]  WITH CHECK ADD FOREIGN KEY([ContractForm])
REFERENCES [dbo].[ContractForm] ([id])
GO

ALTER TABLE [dbo].[IsContract]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[IsContract]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

GO

/****** Object:  Table [dbo].[PrepareProduct]    Script Date: 6/26/2020 10:31:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PrepareProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[daXoa] [bit] NOT NULL,
	[NgayGiao] [date] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Seo] [int] NULL,
	[Purchase] [int] NULL,
	[IsContract] [int] NULL,
	[Pay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PrepareProduct] ADD  DEFAULT ((0)) FOR [daXoa]
GO

ALTER TABLE [dbo].[PrepareProduct] ADD  DEFAULT (getdate()) FOR [NgayGiao]
GO

ALTER TABLE [dbo].[PrepareProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[PrepareProduct]  WITH CHECK ADD FOREIGN KEY([IsContract])
REFERENCES [dbo].[IsContract] ([id])
GO

ALTER TABLE [dbo].[PrepareProduct]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[PrepareProduct]  WITH CHECK ADD FOREIGN KEY([Pay])
REFERENCES [dbo].[Pay] ([id])
GO

ALTER TABLE [dbo].[PrepareProduct]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[TransportProduct]    Script Date: 6/26/2020 10:32:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TransportProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NgayGiao] [date] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[PrepareProduct] [int] NULL,
	[Seo] [int] NULL,
	[Purchase] [int] NULL,
	[IsContract] [int] NULL,
	[Pay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TransportProduct] ADD  DEFAULT (getdate()) FOR [NgayGiao]
GO

ALTER TABLE [dbo].[TransportProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[TransportProduct]  WITH CHECK ADD FOREIGN KEY([IsContract])
REFERENCES [dbo].[IsContract] ([id])
GO

ALTER TABLE [dbo].[TransportProduct]  WITH CHECK ADD FOREIGN KEY([PrepareProduct])
REFERENCES [dbo].[PrepareProduct] ([id])
GO

ALTER TABLE [dbo].[TransportProduct]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[TransportProduct]  WITH CHECK ADD FOREIGN KEY([Pay])
REFERENCES [dbo].[Pay] ([id])
GO

ALTER TABLE [dbo].[TransportProduct]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[SuccessProduct]    Script Date: 6/26/2020 10:32:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SuccessProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngaydat] [date] NOT NULL,
	[NgayGiao] [date] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[TransportProduct] [int] NULL,
	[PrepareProduct] [int] NULL,
	[Seo] [int] NULL,
	[Purchase] [int] NULL,
	[IsContract] [int] NULL,
	[Pay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SuccessProduct] ADD  DEFAULT (getdate()) FOR [ngaydat]
GO

ALTER TABLE [dbo].[SuccessProduct] ADD  DEFAULT (getdate()) FOR [NgayGiao]
GO

ALTER TABLE [dbo].[SuccessProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[SuccessProduct]  WITH CHECK ADD FOREIGN KEY([IsContract])
REFERENCES [dbo].[IsContract] ([id])
GO

ALTER TABLE [dbo].[SuccessProduct]  WITH CHECK ADD FOREIGN KEY([PrepareProduct])
REFERENCES [dbo].[PrepareProduct] ([id])
GO

ALTER TABLE [dbo].[SuccessProduct]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[SuccessProduct]  WITH CHECK ADD FOREIGN KEY([TransportProduct])
REFERENCES [dbo].[TransportProduct] ([id])
GO

ALTER TABLE [dbo].[SuccessProduct]  WITH CHECK ADD FOREIGN KEY([Pay])
REFERENCES [dbo].[Pay] ([id])
GO

ALTER TABLE [dbo].[SuccessProduct]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Guarantee]    Script Date: 6/26/2020 10:33:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Guarantee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [date] NULL,
	[TimeEnd] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[SuccessProduct] [int] NULL,
	[Purchase] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Guarantee] ADD  DEFAULT (getdate()) FOR [createDate]
GO

ALTER TABLE [dbo].[Guarantee] ADD  DEFAULT ((90)) FOR [TimeEnd]
GO

ALTER TABLE [dbo].[Guarantee] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[Guarantee]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Guarantee]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[Guarantee]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[Guarantee]  WITH CHECK ADD FOREIGN KEY([SuccessProduct])
REFERENCES [dbo].[SuccessProduct] ([id])
GO

GO

/****** Object:  Table [dbo].[ReturnTheProduct]    Script Date: 6/26/2020 10:33:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ReturnTheProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lyDo] [nvarchar](300) NULL,
	[TransportProduct] [int] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReturnTheProduct]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[ReturnTheProduct]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[ReturnTheProduct]  WITH CHECK ADD FOREIGN KEY([TransportProduct])
REFERENCES [dbo].[TransportProduct] ([id])
GO

ALTER TABLE [dbo].[ReturnTheProduct]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[Evaluate]    Script Date: 6/26/2020 10:34:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Evaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](max) NOT NULL,
	[soSao] [int] NULL,
	[thoiGian] [date] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Evaluate] ADD  DEFAULT ((3)) FOR [soSao]
GO

ALTER TABLE [dbo].[Evaluate] ADD  DEFAULT (getdate()) FOR [thoiGian]
GO

ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD CHECK  (([soSao]>(0) AND [soSao]<(6)))
GO

GO

/****** Object:  Table [dbo].[RepEvaluate]    Script Date: 6/26/2020 10:34:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RepEvaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](max) NOT NULL,
	[thoiGian] [date] NULL,
	[Evaluate] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[RepEvaluate] ADD  DEFAULT (getdate()) FOR [thoiGian]
GO

ALTER TABLE [dbo].[RepEvaluate]  WITH CHECK ADD FOREIGN KEY([Evaluate])
REFERENCES [dbo].[Evaluate] ([id])
GO

ALTER TABLE [dbo].[RepEvaluate]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[LikeEvaluate]    Script Date: 6/26/2020 10:35:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LikeEvaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_like] [bit] NULL,
	[dislike] [bit] NULL,
	[thoiGian] [date] NULL,
	[Evaluate] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LikeEvaluate] ADD  DEFAULT (getdate()) FOR [thoiGian]
GO

ALTER TABLE [dbo].[LikeEvaluate]  WITH CHECK ADD FOREIGN KEY([Evaluate])
REFERENCES [dbo].[Evaluate] ([id])
GO

ALTER TABLE [dbo].[LikeEvaluate]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[LikeRepEvaluate]    Script Date: 6/26/2020 10:35:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LikeRepEvaluate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[_like] [bit] NULL,
	[dislike] [bit] NULL,
	[thoiGian] [date] NULL,
	[RepEvaluate] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LikeRepEvaluate] ADD  DEFAULT (getdate()) FOR [thoiGian]
GO

ALTER TABLE [dbo].[LikeRepEvaluate]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[LikeRepEvaluate]  WITH CHECK ADD FOREIGN KEY([RepEvaluate])
REFERENCES [dbo].[RepEvaluate] ([id])
GO

GO

/****** Object:  Table [dbo].[RepositoryXU]    Script Date: 6/26/2020 10:36:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RepositoryXU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xu] [int] NULL,
	[mucgiaMin] [numeric](18, 0) NULL,
	[mucgiaMax] [numeric](18, 0) NULL,
	[DateCreate] [date] NULL,
	[DateEnd] [date] NULL,
	[isDelete] [bit] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RepositoryXU] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[RepositoryXU]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[ProductUsingXu]    Script Date: 6/26/2020 10:36:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductUsingXu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreate] [date] NULL,
	[DateEnd] [date] NULL,
	[SaoDanhGia] [float] NULL,
	[SoXu] [int] NULL,
	[isDelete] [bit] NULL,
	[Product] [int] NULL,
	[RepositoryXU] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductUsingXu] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[ProductUsingXu]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[ProductUsingXu]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

ALTER TABLE [dbo].[ProductUsingXu]  WITH CHECK ADD FOREIGN KEY([RepositoryXU])
REFERENCES [dbo].[RepositoryXU] ([id])
GO

GO

/****** Object:  Table [dbo].[CouponsAndCents]    Script Date: 6/26/2020 10:37:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CouponsAndCents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xuMin] [int] NULL,
	[xuMax] [int] NULL,
	[DateCreate] [date] NULL,
	[DateEnd] [date] NULL,
	[isDelete] [bit] NULL,
	[Discount] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CouponsAndCents] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[CouponsAndCents]  WITH CHECK ADD FOREIGN KEY([Discount])
REFERENCES [dbo].[Discount] ([id])
GO

ALTER TABLE [dbo].[CouponsAndCents]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[HistoryOfReceivingCoins]    Script Date: 6/26/2020 10:38:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HistoryOfReceivingCoins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[soXu] [int] NULL,
	[DateCreate] [date] NULL,
	[DateEnd] [date] NULL,
	[isDelete] [bit] NULL,
	[Discount] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HistoryOfReceivingCoins] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[HistoryOfReceivingCoins]  WITH CHECK ADD FOREIGN KEY([Discount])
REFERENCES [dbo].[Discount] ([id])
GO

ALTER TABLE [dbo].[HistoryOfReceivingCoins]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[reasonRepository]    Script Date: 6/26/2020 10:38:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[reasonRepository](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[link] [nvarchar](100) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[reasonRepository]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[DeliveryFailed]    Script Date: 6/26/2020 10:39:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DeliveryFailed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Purchase] [int] NULL,
	[NameUser] [varchar](50) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeliveryFailed]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[DeliveryFailed]  WITH CHECK ADD FOREIGN KEY([Purchase])
REFERENCES [dbo].[Purchase] ([id])
GO

ALTER TABLE [dbo].[DeliveryFailed]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[GiveItBack]    Script Date: 6/26/2020 10:39:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GiveItBack](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[link] [nvarchar](100) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GiveItBack]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[CatalogSupport]    Script Date: 6/26/2020 10:40:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CatalogSupport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[link] [nvarchar](100) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CatalogSupport]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[RepositorySupport]    Script Date: 6/26/2020 10:40:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RepositorySupport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[link] [nvarchar](100) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RepositorySupport]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[CustomerCare]    Script Date: 6/26/2020 10:41:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CustomerCare](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog] [nvarchar](max) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[CustomerCare]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[AccountSupport]    Script Date: 6/26/2020 10:41:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AccountSupport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog] [nvarchar](max) NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[AccountSupport]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

GO

/****** Object:  Table [dbo].[DescriptionProduct]    Script Date: 6/26/2020 10:42:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DescriptionProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog] [nvarchar](max) NULL,
	[createDate] [date] NULL,
	[IsDelete] [bit] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[DescriptionProduct] ADD  DEFAULT (getdate()) FOR [createDate]
GO

ALTER TABLE [dbo].[DescriptionProduct] ADD  DEFAULT ((0)) FOR [IsDelete]
GO

ALTER TABLE [dbo].[DescriptionProduct]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[DescriptionProduct]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

GO

/****** Object:  Table [dbo].[LogUser]    Script Date: 6/26/2020 10:42:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LogUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateCreate] [date] NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LogUser]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[LogUser]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

GO

/****** Object:  Table [dbo].[IsAction]    Script Date: 6/26/2020 10:42:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IsAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urlClick] [nvarchar](300) NOT NULL,
	[timeCreate] [datetime] NOT NULL,
	[dateEnd] [datetime] NOT NULL,
	[isDelete] [bit] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[IsAction] ADD  DEFAULT ((0)) FOR [isDelete]
GO

ALTER TABLE [dbo].[IsAction]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[KeySearch]    Script Date: 6/26/2020 10:43:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KeySearch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[keySearch] [nvarchar](300) NOT NULL,
	[dateSearch] [date] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[KeySearch] ADD  DEFAULT (getdate()) FOR [dateSearch]
GO

ALTER TABLE [dbo].[KeySearch]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[ChangePass]    Script Date: 6/26/2020 10:43:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChangePass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[passOld] [varchar](100) NOT NULL,
	[passNew] [varchar](100) NOT NULL,
	[HaskPass] [varchar](100) NOT NULL,
	[ConfEmail] [varchar](300) NOT NULL,
	[delet] [bit] NOT NULL,
	[timeChange] [date] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ChangePass] ADD  DEFAULT (getdate()) FOR [timeChange]
GO

ALTER TABLE [dbo].[ChangePass]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[capcha]    Script Date: 6/26/2020 10:43:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[capcha](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](300) NOT NULL,
	[img] [nvarchar](300) NULL,
	[dateCreate] [date] NOT NULL,
	[dateEnd] [date] NOT NULL,
	[sussces] [bit] NOT NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[capcha] ADD  DEFAULT ((0)) FOR [sussces]
GO

ALTER TABLE [dbo].[capcha]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

GO

/****** Object:  Table [dbo].[Advertisement]    Script Date: 6/26/2020 10:44:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatarRieng] [nvarchar](100) NULL,
	[link] [nvarchar](50) NULL,
	[DateCreate] [date] NULL,
	[dateEnd] [int] NULL,
	[Isdelete] [bit] NULL,
	[noidung] [nvarchar](100) NULL,
	[Product] [int] NULL,
	[NameUser] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT ((15)) FOR [dateEnd]
GO

ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD FOREIGN KEY([NameUser])
REFERENCES [dbo].[LoginAccount] ([NameUser])
GO

ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([id])
GO

GO

/****** Object:  Table [dbo].[IsPolicyRepository]    Script Date: 6/26/2020 11:08:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IsPolicyRepository](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameIsPolicy] [nvarchar](100) NULL,
	[LinkIsPolicy] [nvarchar](100) NULL,
	[Isdelete] [bit] NULL,
	[Seo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[IsPolicyRepository] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[IsPolicyRepository]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO

ALTER TABLE [dbo].[IsPolicyRepository]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO
/****** Object:  Table [dbo].[IsPolicy]    Script Date: 6/26/2020 10:45:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IsPolicy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](max) NULL,
	[Isdelete] [bit] NULL,
	[Seo] [int] NULL,
	[IsPolicyRepository] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[IsPolicy] ADD  DEFAULT ((0)) FOR [Isdelete]
GO

ALTER TABLE [dbo].[IsPolicy]  WITH CHECK ADD FOREIGN KEY([IsPolicyRepository])
REFERENCES [dbo].[IsPolicyRepository] ([id])
GO

ALTER TABLE [dbo].[IsPolicy]  WITH CHECK ADD FOREIGN KEY([Seo])
REFERENCES [dbo].[Seo] ([id])
GO 

GO

/****** Object:  Table [dbo].[ErrorOperation]    Script Date: 6/26/2020 10:45:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ErrorOperation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Error] [nvarchar](300) NULL,
	[createDate] [date] NULL,
	[Isdelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ErrorOperation] ADD  DEFAULT ((1)) FOR [Isdelete]
GO