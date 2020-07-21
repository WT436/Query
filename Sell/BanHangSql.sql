create database Sell
go
Use Sell
GO
/******    Seo   X    ******/
CREATE TABLE Seo(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Meta nvarchar(200) NULL,
	Link nvarchar(200) NULL,
	NameTab nvarchar(15) null,
--=========>Connect Table<===========--
	
)
Go
/******    Tài khoản  X   ******/
CREATE TABLE LoginAccount(
--=========>Trường Dữ Liệu<===========--
	NameUser varchar(50) NOT NULL primary key,
	PassUser varchar(100) NOT NULL,
	HaskPass varchar(100) NOT NULL,
	Email varchar(300) NOT NULL,
	Delet bit NOT NULL,
	PhanQuyen int NOT NULL default 0 check(phanQuyen>-1 and phanQuyen<3)
--=========>Connect Table<===========--
)
GO
/******    Thông tin tài khoản  X   ******/
CREATE TABLE infomationUser(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Avatar nvarchar(max) NOT NULL,
	NameUser varchar(50) NOT NULL,
	Age int NOT NULL default 18,
	Adress nvarchar(300) NOT NULL,
	Sdt numeric(14, 0) NOT NULL,
	DateUpdate date not NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	Account varchar(50) FOREIGN KEY(Account) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Nhà cung Cấp  X   ******/
CREATE TABLE Supplier(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Avatar varchar(max) NOT NULL,
	TenTrang nvarchar(30) NOT NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	IsDelete bit NULL  DEFAULT (0),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Chủ đề sản phẩm  X   ******/
CREATE TABLE ThemeProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NameTheme nvarchar(300) NOT NULL,
	DateCreate datetime NOT NULL DEFAULT (getdate()),
	DateEnd datetime NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
)
GO
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Điện Thoại',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Quần Áo',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Cáp Sạc',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Đồng Hồ Công Nghệ',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Đồng Hồ Thời Trang',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Camera',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Giày Dép',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Máy Lọc Nước',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Máy Tính',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Mỹ Phẩm',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Pin',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Tai Nghe',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Thiết Bị Mạng',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Thời Trang',getdate(),getdate(),0)
INSERT ThemeProduct (nameTheme,DateCreate,DateEnd,IsDelete) VALUES (N'Lập Trình',getdate(),getdate(),0)
GO
/******    Loại chủ đề san phẩm  X   ******/
CREATE TABLE CategoryProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NameCategory nvarchar(300) NOT NULL,
	DateCreate datetime NOT NULL DEFAULT (getdate()),
	DateEnd datetime NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Theme int NULL FOREIGN KEY (Theme) REFERENCES ThemeProduct (Id),
)
GO
/******    Ảnh Sản Phẩm  X   ******/
CREATE TABLE ImageProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Anh1 varchar(max) NOT NULL,
	Anh2 varchar(max) NOT NULL,
	Anh3 varchar(max) NOT NULL,
	Anh4 varchar(max) NOT NULL,
	Anh5 varchar(max) NOT NULL,
	Anh6 varchar(max) NOT NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
)
GO
/******    Sản Phẩm  X   ******/
CREATE TABLE Product(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ten nvarchar(100) NOT NULL,
	Gia money NOT NULL,
	SoLuong int NULL,
	SoLuongCoSan int NULL,
	Bao_hanh int NOT NULL,
	GioiThieu nvarchar(500) NULL,
	Color nvarchar(30) NOT NULL,
	Size nvarchar(30) NOT NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Supplier int NULL FOREIGN KEY(Supplier) REFERENCES Supplier (Id),
	ImageProduct int NULL FOREIGN KEY(ImageProduct) REFERENCES ImageProduct (Id),
	CategoryProduct int NULL FOREIGN KEY(CategoryProduct) REFERENCES CategoryProduct (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Quần Áo  X   ******/
CREATE TABLE Clothes(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Chatlieu nvarchar(50) NOT NULL,
	DangAo nvarchar(50) NOT NULL,
	CachGiat nvarchar(50) NOT NULL,
	XuatXu nvarchar(50) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Điện Thoại  X   ******/
CREATE TABLE Phone(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Man_hinh nvarchar(100) NOT NULL,
	He_dieu_hanh varchar(30) NOT NULL,
	Camera_Truoc nvarchar(50) NOT NULL,
	Camera_Sau nvarchar(50) NOT NULL,
	Loi_san_Pham nvarchar(100) NOT NULL,
	Di_Kem nvarchar(100) NOT NULL,
	Ram nvarchar(50) NOT NULL,
	Cpu nvarchar(50) NOT NULL,
	Bo_nho int NOT NULL,
	The_nho nvarchar(50) NOT NULL,
	Sim nvarchar(50) NOT NULL,
	DoPhanGiai nvarchar(100) NOT NULL,
	Man_Hinh_rong nvarchar(100) NOT NULL,
	KinhCamUng nvarchar(100) NOT NULL,
	Chipset varchar(30) NOT NULL,
	TocDocpu varchar(30) NOT NULL,
	GPU varchar(30) NOT NULL,
	DoPhanGiaiCammeraTruoc varchar(30) NOT NULL,
	VIdeoCall varchar(30) NOT NULL,
	ThongTinKhacCamMera varchar(30) NOT NULL,
	DoPhanGiaiCamerasau varchar(30) NOT NULL,
	QuayPhim varchar(30) NOT NULL,
	DenFlash varchar(30) NOT NULL,
	ChupAnhNangCao varchar(30) NOT NULL,
	HoTroMang nvarchar(50) NOT NULL,
	Wifi nvarchar(50) NOT NULL,
	GPS nvarchar(50) NOT NULL,
	Bluetooth nvarchar(50) NOT NULL,
	CongKetNoi nvarchar(50) NOT NULL,
	JackTaiNGhe nvarchar(50) NOT NULL,
	KetNoiKhac nvarchar(50) NOT NULL,
	ThietKe nvarchar(50) NOT NULL,
	ChatLieu nvarchar(50) NOT NULL,
	TrongLuong nvarchar(50) NOT NULL,
	LoaiPin nvarchar(50) NOT NULL,
	CongNghePin nvarchar(50) NOT NULL,
	Dung_luong_Pin int NOT NULL,
	BaoMat nvarchar(50) NOT NULL,
	TinhNangNoiBat nvarchar(50) NOT NULL,
	GhiAm nvarchar(50) NOT NULL,
	Radio nvarchar(50) NOT NULL,
	XemPhim nvarchar(50) NOT NULL,
	NGheNHac nvarchar(50) NOT NULL,
	ThoIdiemRaMat nvarchar(50) NOT NULL,
	LoaiSanPham bit NOT NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
)
GO
/******    Tai Nghe  X   ******/
CREATE TABLE Headphone(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	ChungLoai int NOT NULL CHECK  ((chungLoai>(0) AND chungLoai<(5))),
	TuongThich nvarchar(50) NULL,
	CongXuat int NULL,
	CachKetNoi nvarchar(50) NULL,
	PhimDieuKhien nvarchar(50) NULL,
	TinhNangKhac nvarchar(50) NULL,
	KhoangCachBluetooth int NULL,
	KichThuocSieuTram nvarchar(50) NULL,
	KichThuocVeTinh nvarchar(50) NULL,
	TrongLuong int NULL,
	ThuongHieu nvarchar(50) NULL,
	XuatSu nvarchar(50) NULL,
	BoBanHangChuan nvarchar(50) NULL,
	CongSac nvarchar(50) NULL,
	ThoiGianSuDung int NULL,
	KetNoiCungLuc int NULL,
	ThoiGianXacDay int NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Máy Tính  X   ******/
CREATE TABLE Computer(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Cpu nvarchar(50) NOT NULL,
	LoaiCPU nvarchar(50) NOT NULL,
	Tocdocpu int NULL,
	TocdoToIda int NULL,
	LoaiRam nvarchar(50) NOT NULL,
	TocDoBusRam nvarchar(50) NOT NULL,
	HoTroRamToIda nvarchar(50) NOT NULL,
	Ram nvarchar(50) NOT NULL,
	OCung nvarchar(50) NOT NULL,
	KichthuocManHinh nvarchar(50) NOT NULL,
	DoPhanGiai nvarchar(50) NOT NULL,
	CongNgheManHinh nvarchar(50) NOT NULL,
	ManHinhCamUng bit NULL,
	ThietKeCard nvarchar(50) NOT NULL,
	CardDoHoa nvarchar(50) NOT NULL,
	CongNgheAmThanh nvarchar(50) NOT NULL,
	CongGiaoTiep nvarchar(50) NOT NULL,
	KetnoiKhongday nvarchar(50) NOT NULL,
	KheDocTheNho nvarchar(50) NOT NULL,
	OdiaQuang nvarchar(50) NOT NULL,
	WebCam nvarchar(50) NOT NULL,
	TinhNangKhac nvarchar(50) NOT NULL,
	DenBanPhm nvarchar(50) NOT NULL,
	Pin nvarchar(50) NOT NULL,
	ThongTinPhin nvarchar(50) NOT NULL,
	HeDieuHanh nvarchar(50) NOT NULL,
	TrongLuong nvarchar(50) NOT NULL,
	ChatLieu nvarchar(50) NOT NULL,
	ThoIdiemRaMat nvarchar(50) NOT NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)

GO
/******    Đồng Hồ Công Nghệ  X   ******/
CREATE TABLE TechnologyWatch(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Man_hinh nvarchar(100) NOT NULL,
	CongNgheManHinh nvarchar(30) NULL,
	KichThucManHinh varchar(30) NULL,
	DoPhanGiai varchar(30) NULL,
	DuongKinhMat int NULL,
	Cpu varchar(30) NULL,
	BoNhoTrong varchar(30) NULL,
	HeDieuHanh varchar(30) NULL,
	KetNoiHeDieuHanh varchar(30) NULL,
	CongSac varchar(30) NULL,
	ThoiGianSuDungPin int NULL,
	ThoiGianSac int NULL,
	DungLuongPin int NULL,
	TheoDoiSucKhoe varchar(50) NULL,
	HienThiThongBao varchar(50) NULL,
	TienIchKhac varchar(50) NULL,
	Ketnoi varchar(30) NULL,
	Cammera varchar(30) NULL,
	DodaIday int NULL,
	DoRongDay int NULL,
	Chatlieuday varchar(30) NULL,
	DaycoThethaoroi bit NULL,
	Chatlieukhungvien varchar(30) NULL,
	NgonNgu varchar(30) NULL,
	KhichThuoc varchar(30) NULL,
	TrongLuong int NULL,
	Isdelete bit NOT NULL DEFAULT (0),
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
--=========>Connect Table<===========--
)
GO
/******    Đồng Hồ Thời Trang  X   ******/
CREATE TABLE FashionWatch(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Loaimay nvarchar(30) NULL,
	DuongKinhmat int NULL,
	ChatLieuMatKinh nvarchar(30) NULL,
	ChatLieuKhungVien nvarchar(30) NULL,
	Chongxuoc nvarchar(30) NULL,
	DodayMat int NULL,
	ChatLieuDay nvarchar(30) NULL,
	TienIch nvarchar(30) NULL,
	DoRongDay int NULL,
	NguonNangLuong nvarchar(30) NULL,
	ThoiGianSuDungPin nvarchar(30) NULL,
	DoiTuongSuDung nvarchar(30) NULL,
	ThuongHieu nvarchar(30) NULL,
	NoiSanXuat nvarchar(50) NULL,
	ThoIdiemRaMat nvarchar(50) NOT NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Pin  X   ******/
CREATE TABLE Pin(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	HieuXuatXac int NULL,
	Dungluong int NULL,
	ThoiGianXac int NULL,
	Nguonvao nvarchar(30) NULL,
	LoiPin nvarchar(30) NULL,
	Congnghe nvarchar(30) NULL,
	Tienich nvarchar(30) NULL,
	TrongLuong int NULL,
	ThuongHieu nvarchar(30) NULL,
	NguonGoc nvarchar(30) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Cáp sạc  X  ******/
CREATE TABLE ChargingCable(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Loai int NULL  CHECK  ((loai>(0) AND loai<(4))), 
	DoDaIday int NULL,
	ChucNang nvarchar(30) NULL,
	Dauvao nvarchar(30) NULL,
	DauRa nvarchar(30) NULL,
	CongNghe nvarchar(30) NULL,
	TienIch nvarchar(30) NULL,
	ThuongHieu nvarchar(30) NULL,
	NguonGoc nvarchar(30) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    máy ảnh  X   ******/
CREATE TABLE Camera(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Dophangiai nvarchar(30) NULL,
	Nguondienvao int NULL,
	TamNhinHongNgoai int NULL,
	HoTroTheNho nvarchar(30) NULL,
	HoTroThietBi nvarchar(30) NULL,
	Khichthuoc nvarchar(30) NULL,
	Trongluong int NULL,
	NhietdoHoatDong nvarchar(30) NULL,
	ThuongHieu nvarchar(30) NULL,
	NguonGoc nvarchar(30) NULL,
	PhuKien nvarchar(100) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id)
)
GO
/******    Thiết bị mạng  X  ******/
CREATE TABLE NetworkEquipment(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Loai int NULL CHECK  ((loai>(0) AND loai<(4))),
	TocDo int NULL,
	BangTan int NULL,
	CacCongKetNoi nvarchar(50) NULL,
	DenBaoHieu nvarchar(30) NULL,
	SoAngTen nvarchar(30) NULL,
	TruyCapToIda int NULL,
	DoPhuSong int NULL,
	NutBamHoTro nvarchar(30) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Giày dép  X   ******/
CREATE TABLE Shoes(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DoCao int NULL,
	LoaiMui nvarchar(30) NULL,
	ChatLieu nvarchar(50) NULL,
	HoaVan nvarchar(100) NULL,
	MoiTruongSuDung nvarchar(100) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Mỹ phẩm  X   ******/
CREATE TABLE Cosmetic(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	ThuongHieu nvarchar(30) NULL,
	XuatSu nvarchar(30) NULL,
	ThanhPhan nvarchar(200) NULL,
	MuiHuong nvarchar(30) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Máy Lọc Nước  X   ******/
CREATE TABLE WaterPurifier(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Thời Trang  X   ******/
CREATE TABLE Fashion(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	ThuongHieu nvarchar(100) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Giảm Giá  X   ******/
CREATE TABLE Discount(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Code nvarchar(10) NOT NULL,
	Phantram int NOT NULL,
	DateCreate date NULL DEFAULT (getdate()),
	DateEnd int NULL DEFAULT ((15)),
	OneUsing bit NULL DEFAULT (0),
	MoreUsing bit NULL DEFAULT (0),
	NumberUsing int NULL DEFAULT (0),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
)
GO
/******    Sản phẩm sử dụng giảm giá  X   ******/
CREATE TABLE ProductUsingDiscount(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	SoLuong int not NULL,	
	DateCreate date Default Getdate() not null,
	DateEnd int default 120 not null,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	Discount int NULL FOREIGN KEY(Discount) REFERENCES Discount (Id),
)
GO
/******    Giảm giá chi tiết từ người dùng  X   ******/
CREATE TABLE DetailDiscountFromUser(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	SoLuong int NULL,	
	CreateUsing date NULl default getdate(),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	ProductUsingDiscount int NULL FOREIGN KEY(ProductUsingDiscount) REFERENCES ProductUsingDiscount (Id),
)
GO
/******    Kho lưu trữ khuyến mãi   ******/
CREATE TABLE promotionReposetory(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	TongSoLuong int NULL,
	DateCreate date Default Getdate() not null,
	DateEnd int default 120 not null,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    khuyến mãi     ******/
CREATE TABLE promotion(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Soluong int NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd int NOT NULL DEFAULT (120),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	promotionReposetory int NULL FOREIGN KEY(promotionReposetory) REFERENCES promotionReposetory (Id),
)
GO
/******    Lịch sử khuyến mãi    ***/
CREATE TABLE promotionHistory(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	promotion int NULL FOREIGN KEY(promotion) REFERENCES promotion (Id),
)
GO
/******    Địa điểm giao hàng   ***/
CREATE TABLE PlaceOfDelivery(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DiaDiemRieng nvarchar(300) NULL,
	DiaDiemRieng1 nvarchar(300) NULL,
	DiaDiemRieng2 nvarchar(300) NULL,
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    giỏ hàng    *****/
CREATE TABLE Cart(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	SoLuong int NOT NULL CHECK  ((soLuong>(0))),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
    promotion int NULL FOREIGN KEY(promotion) REFERENCES promotion (Id),
	ProductUsingDiscount int NULL FOREIGN KEY(ProductUsingDiscount) REFERENCES ProductUsingDiscount (Id),
	PlaceOfDelivery int NULL FOREIGN KEY(PlaceOfDelivery) REFERENCES PlaceOfDelivery (Id),
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Mua sản Phẩm    *****/
CREATE TABLE Purchase(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ngaydat date NOT NULL DEFAULT (getdate()),
	NgayGiao date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),ChuanBi bit not null default 0,
	DangGiao bit not null default 0,
	DaGiao bit not null default 0,
	Trave bit not null default 0,
--=========>Connect Table<===========--
	Cart int NULL FOREIGN KEY(Cart) REFERENCES Cart (Id),
	PlaceOfDelivery int NULL FOREIGN KEY(PlaceOfDelivery) REFERENCES PlaceOfDelivery (Id),
)
GO
/******    Thanh Toán   **/
CREATE TABLE Pay(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Tongtien numeric(18, 0) NOT NULL DEFAULT (0),
	DateCreate date NOT NULL DEFAULT (getdate()),
	TraTruoc bit NULL DEFAULT (0),
	TraSau bit NULL DEFAULT (0),
	TraGop bit NULL DEFAULT (0),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	promotion int NULL FOREIGN KEY(promotion) REFERENCES promotion (Id),
	ProductUsingDiscount int NULL FOREIGN KEY(ProductUsingDiscount) REFERENCES ProductUsingDiscount (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Trả trước  ***/
CREATE TABLE Prepay(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DaThanhToan bit NULL DEFAULT (0),
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Trả Sau   *****/
CREATE TABLE PostpaId(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DaThanhToan bit NULL DEFAULT (0),
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Trả góp   ****/
CREATE TABLE Installment(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	TongTien numeric(18, 0) NOT NULL,
	TongThang int NULL,
	MonThang numeric(18, 0) NULL,
	Hoanthanh bit NULL DEFAULT (0),
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
)
GO
/******    Thời hạn thanh toán trả góp   ***/
CREATE TABLE InstallmentPaymentPeriod(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	ThangHienTai int NULL,
	TienThangHienTai numeric(18, 0) NOT NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Installment int NULL FOREIGN KEY(Installment) REFERENCES Installment (Id),
)
GO
/******    Mẫu hợp đồng   ***/
CREATE TABLE ContractForm(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Html nvarchar(max) NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    hợp đồng   ****/
CREATE TABLE IsContract(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Html nvarchar(max) NULL,
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	ContractForm int NULL  FOREIGN KEY (ContractForm) REFERENCES ContractForm (Id),
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
)
GO
/******    Chuẩn bị sản phẩm    *****/
CREATE TABLE PrepareProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NgayGiao date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	IsContract int NULL FOREIGN KEY(IsContract) REFERENCES IsContract (Id),
	Pay int NULL FOREIGN KEY(Pay) REFERENCES Pay (Id),
)
GO
/******    Sản phẩm thành công    ****/
CREATE TABLE SuccessProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ngaydat date NOT NULL DEFAULT (getdate()),
	NgayGiao date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	PrepareProduct int NULL FOREIGN KEY(PrepareProduct) REFERENCES PrepareProduct (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	IsContract int NULL FOREIGN KEY(IsContract) REFERENCES IsContract (Id),
	Pay int NULL FOREIGN KEY(Pay) REFERENCES Pay (Id),
)
GO
/******    Bảo hành    ****/
CREATE TABLE Guarantee(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd date NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Trả lại sản phẩm   ****/
CREATE TABLE ReturnTheProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	LyDo nvarchar(300) NULL,
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Đánh giá X  ****/
CREATE TABLE Evaluate(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NoIdung nvarchar(max) NOT NULL,
	SoSao int NULL DEFAULT ((3)) CHECK  ((soSao>(0) AND soSao<(6))),
	ThoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Rep Đánh giá  X  *****/
CREATE TABLE RepEvaluate(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NoIdung nvarchar(max) NOT NULL,
	ThoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	Evaluate int NULL FOREIGN KEY(Evaluate) REFERENCES Evaluate (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Like Đánh giá  X  *****/
CREATE TABLE LikeEvaluate(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Islike bit NULL,
	Dislike bit NULL,
	ThoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	Evaluate int NULL FOREIGN KEY(Evaluate) REFERENCES Evaluate (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Like Rep Đánh giá  X ****/
CREATE TABLE LikeRepEvaluate(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Islike bit NULL,
	dislike bit NULL,
	ThoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	RepEvaluate int NULL FOREIGN KEY(RepEvaluate) REFERENCES RepEvaluate (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Kho XU    ****/
CREATE TABLE RepositoryXU(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Xu int NULL,
	MucgiaMin numeric(18, 0) NULL,
	MucgiaMax numeric(18, 0) NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Sản Phẩm Sảu dụng xu   *****/
CREATE TABLE ProductUsingXu(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd date NOT NULL DEFAULT (getdate()),
	SaoDanhGia float NULL,
	SoXu int NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	RepositoryXU int NULL FOREIGN KEY(RepositoryXU) REFERENCES RepositoryXU (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Phiếu giảm giá    ****/
CREATE TABLE CouponsAndCents(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	XuMin int NULL,
	XuMax int NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Discount int NULL FOREIGN KEY(Discount) REFERENCES Discount (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Lịch sử nhận Coins    *****/
CREATE TABLE HistoryOfReceivingCoins(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	SoXu int NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Discount int NULL FOREIGN KEY(Discount) REFERENCES Discount (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    lý do lưu trữ    ****/
CREATE TABLE reasonRepository(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ten nvarchar(100) NULL,
	Noidung nvarchar(max),
	Link nvarchar(100) NULL,
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    GiveItBack v  *****/
CREATE TABLE GiveItBack(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ten nvarchar(100) NULL,
	Link nvarchar(100) NULL,
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Hỗ trợ danh mục  v  *****/
CREATE TABLE CatalogSupport(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ten nvarchar(100) NULL,
	Link nvarchar(100) NULL,
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Kho lưu trữ hỗ trợ  v *****/
CREATE TABLE RepositorySupport(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Ten nvarchar(100) NULL,
	Link nvarchar(100) NULL,
--=========>Connect Table<===========--
	CatalogSupport int FOREIGN KEY REFERENCES CatalogSupport (Id),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Hỗ trợ v *****/
CREATE TABLE Support(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Blog nvarchar(max) NULL,
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Mô tả Sản phẩm  X  ****/
CREATE TABLE DescriptionProduct(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Blog nvarchar(max) NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Đăng nhập người dùng  v *****/
CREATE TABLE LogUser(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	DateCreate date NOT NULL DEFAULT (getdate()),
	IpClient varchar(20) ,
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    hành động  v  ***/
CREATE TABLE IsAction(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	UrlClick nvarchar(300) NOT NULL,
	TimeCreate datetime NOT NULL,
	DateEnd datetime NOT NULL,
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	LogUser int NULL FOREIGN KEY(LogUser) REFERENCES LogUser (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Key Tìm Kiếm  ****/
CREATE TABLE KeySearch(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	KeySearch nvarchar(300) NOT NULL,
	DateSearch date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    đổi mật khẩu   ****/
CREATE TABLE ChangePass(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	PassOld varchar(100) NOT NULL,
	PassNew varchar(100) NOT NULL,
	HaskPass varchar(100) NOT NULL,
	ConfEmail varchar(300) NOT NULL,
	Delet bit NOT NULL,
	TimeChange date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    captcha  v  *****/
CREATE TABLE capcha(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Code varchar(300) NOT NULL,
	Img nvarchar(max) NULL,
	DateCreate date NOT NULL,
	DateEnd date NOT NULL,
	Sussces bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Quảng cáo  v  ****/
CREATE TABLE Advertisement(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	AvatarRieng nvarchar(MAX) NULL,
	Link nvarchar(50) NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	DateEnd int NULL,
	Isdelete bit NOT NULL DEFAULT (0),
	NoIdung nvarchar(100) NULL,
--=========>Connect Table<===========--
	Product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	NameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Carousel v  *****/
CREATE TABLE Carousel(
--=========>Trường Dữ Liệu<===========--
	Id int NOT NULL primary key,
	Link nvarchar(300) NULL,
	Title nvarchar(300) NULL,
--=========>Connect Table<===========--
	Product int NULL foreign key references Product(Id),
	MainCarousel int NULL FOREIGN KEY(MainCarousel) REFERENCES Carousel (Id),
	IsDelete bit default 0
)
GO
/******    Kho lưu trữ chính sách   *****/
CREATE TABLE IsPolicyRepository(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NameIsPolicy nvarchar(100) NULL,
	LinkIsPolicy nvarchar(100) NULL,
	Isdelete bit not NULL default 0,
--=========>Connect Table<===========--
	Seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Chính sách    *****/
CREATE TABLE IsPolicy(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	NoIdung nvarchar(max) NULL,
	Isdelete bit NOT NULL DEFAULT (0),
	Seo int FOREIGN KEY REFERENCES Seo (Id),
--=========>Connect Table<===========--
	IsPolicyRepository int NULL FOREIGN KEY(IsPolicyRepository) REFERENCES IsPolicyRepository (Id),
)
GO
/******    Lỗi hoạt động v  *****/
CREATE TABLE ErrorOperation(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	Error nvarchar(300) NULL,
	DateCreate date NOT NULL DEFAULT (getdate()),
	Isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
)
GO
/******    Tinh  v  *****/
CREATE TABLE Tinh(
--=========>Trường Dữ Liệu<===========--
	IdTP int NOT NULL primary key,
	NameTP nvarchar(300) NULL,
--=========>Connect Table<===========--
)
GO
/******    Huyen v  *****/
CREATE TABLE Huyen(
--=========>Trường Dữ Liệu<===========--
	IdQH int NOT NULL primary key,
	NameQH nvarchar(300) NULL,
--=========>Connect Table<===========--
	IdTP int NULL FOREIGN KEY(IdTP) REFERENCES Tinh (IdTP),
)
GO
/******    Xa v  ***/
CREATE TABLE Xa(
--=========>Trường Dữ Liệu<===========--
	IdPX int NOT NULL primary key,
	NameXa nvarchar(300) NULL,
	Cap nvarchar(30) NULL,
--=========>Connect Table<===========--
	IdQH int NULL FOREIGN KEY(IdQH) REFERENCES Huyen (IdQH),
)
GO
/******   Kho Tính năng  v *****/
CREATE TABLE RepositoryFearture(
--=========>Trường Dữ Liệu<===========--
	Id int primary key,
	NameFearture  nvarchar(50) not null,
	LinkFearture nvarchar(50) not null,
	IconFearture varchar(20) not null,
	Isdelete bit default 0
--=========>Connect Table<===========--
)
GO
/******    Tài Khoản Sử Dụng Tính Năng  v *****/
CREATE TABLE  FeartureUser(
--=========>Trường Dữ Liệu<===========--
	Id int primary key,
	Isdelete bit default 0,
--=========>Connect Table<===========--
	IdFearture int  not null foreign key references RepositoryFearture(Id),
	NameUser varchar(50) not null foreign key references LoginAccount(NameUser),
)
