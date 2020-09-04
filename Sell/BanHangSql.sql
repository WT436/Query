create database ShopShapphire
go
Use ShopShapphire
GO
--viết thường chữ cái đầu tiên để vào EF nó sẽ tự động in hoa cho phù hợp
/******    Seo   X    ******/
/*seo cho tất cả dữ liệu  liên quan đến truy vấn hay index cho gg*/
CREATE TABLE Seo(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	meta_TieuDe nvarchar(70) NULL,				--Thẻ tiêu đề khi hiển thị trên Google nó sẽ hiển thị từ 60 – 70 ký tự nếu vượt quá số ký tự cho phép thì tiêu đề của bạn sẽ bị cắt phần dư đi và thay bằng dấu 3 chấm (…).
	meta_Description nvarchar(160) NULL,		--Meta Description là thẻ mô tả nội dung của một trang web, tóm tắt ngắn gọn nội dung của trang đó để hiển thị trên công cụ tìm kiếm.
	meta_Keywords nvarchar(200) NULL,			--Meta Keywords là thẻ mô tả từ khóa của một trang. 
	meta_Robots nvarchar(20) NULL,				--Meta Robots có nhiều giá trị nhưng thường thì một trang nên sử dụng 3 giá trị sau đây:
												--noodp: Ngăn cản các công cụ tìm kiếm tạo các mô tả description từ các thư mục danh bạ Web DMOZ như là một phần của snippet trong trang kết quả tìm kiếm.
												--index: Đánh chỉ số trang.
												--follow: Bọ tìm kiếm sẽ đọc các liên kết văn bản trong trang và sau đó sẽ xử lý, truy vấn nó.
												--Cách giá trị cách nhau bằng dấu phẩy (,). Ví dụ: noodp,index,follow.
	meta_Revisit_After nvarchar(20) NULL,		--Meta Revisit After là thẻ khai báo cho bọ tìm kiếm thời gian quay trở lại trang web của bạn.
	meta_Content_Language nvarchar(20) NULL,	--Meta Content Language là thẻ khai bao ngôn ngữ website của bạn, giúp các công cụ tìm kiếm hướng đối tượng người dùng cho website có sử dụng thẻ này.
	meta_Content_Type nvarchar(50) NULL,		--Meta Content Type là thẻ khai báo mã hiển thị ngôn ngữ của website chứa nó.
	meta_Property nvarchar(max) NULL,			-- là thẻ khai báo cấu trúc của một trang web
	isDelete bit default 0  not null,
	isLevel int default 0 not null,
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (Id)
	
)
Go
/******    Tài khoản     ******/
CREATE TABLE LoginAccount(
--=========>Trường Dữ Liệu<===========--
	nameUser varchar(50) NOT NULL primary key,
	passUser varchar(100) NOT NULL,
	haskPass varchar(10) NOT NULL,
	email varchar(300) NOT NULL,
	isDelete bit NOT NULL,
	phanQuyen int NOT NULL default 0 check(phanQuyen>-1 and phanQuyen<4), 
	-- 0 là người dùng
	-- 1 là nhà cung cấp
	-- 2 là admin
	-- 3 là admin cấp cao
	loginFail int  default 0 check(LoginFail <6 ),
	dateFail int  default 0  check (dateFail <15),
--=========>Connect Table<===========--
	account varchar(50) FOREIGN KEY REFERENCES LoginAccount (NameUser),
)
GO
/******    Thông tin tài khoản     ******/
CREATE TABLE InfomationUser(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	avatar nvarchar(max) NOT NULL,
	nameUser varchar(50) NOT NULL,
	age int NOT NULL default 18,
	adress1 nvarchar(300) NOT NULL,
	adress2 nvarchar(300)  NULL,
	adress3 nvarchar(300)  NULL,
	sdt numeric(14, 0) NOT NULL,
	dateUpdate date not NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	account varchar(50) FOREIGN KEY REFERENCES LoginAccount (NameUser),
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Nhà cung Cấp     ******/
CREATE TABLE Supplier(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	tenTrang nvarchar(30) NOT NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	isDelete bit NULL  DEFAULT (0), -- xóa bỏ  nhà cung cấp
	isStatus bit NULL  DEFAULT (0), -- tác dụng kiểm tra nhà cung cấp đã  active tài khoản chưa
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY REFERENCES LoginAccount (NameUser),
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/****** Kho các loại giấy chứng nhận cho nhà cung cấp Nhà cung Cấp     ******/
CREATE TABLE repositoryCertificate(

--=========>Trường Dữ Liệu<===========--
	id int identity(1,1) not null  primary key  ,
	title nvarchar(50) not null,
	htmlCertificate nvarchar(max) not null,
	imageCertificate nvarchar(max) not null,
	descrpition nvarchar(50),
	dateCreate date not null default getdate(),
	isDelete bit NULL  DEFAULT (0)
--=========>Connect Table<===========--
)
GO
/******  các loại giấy chứng nhận cho nhà cung cấp Nhà cung Cấp     ******/
CREATE TABLE supplierCertificate(
--=========>Trường Dữ Liệu<===========--
	id int identity(1,1) not null  primary key ,
	dateCreate date not null default getdate(),
	isLevel int default 0 check(isLevel<7) not null, -- phân chia loại giấy ra làm 6 cấp độ : không có , cực khủng , Tuyệt vời , Tốt , Vừa , Thấp , Kém
	isDelete bit NULL  DEFAULT (0),
--=========>Connect Table<===========--
	idSupper int NOT NULL FOREIGN KEY REFERENCES Supplier(id),
	idCertificate int NOT NULL FOREIGN KEY REFERENCES repositoryCertificate(id),
)
GO
/******   Kho Tính năng  *****/ -- kho tính năng  cho tài khoản sử dụng
CREATE TABLE RepositoryFearture(
--=========>Trường Dữ Liệu<===========--
	id int primary key,
	nameFearture  nvarchar(50) not null,
	linkFearture nvarchar(50) not null,
	iconFearture varchar(20) not null,
	isdelete bit default 0
--=========>Connect Table<===========--
)
GO
/******    Tài Khoản Sử Dụng Tính Năng  v *****/ --mỗn tài khoản sẽ có những tính năng đặc biệt và tính năng vip cho tài khoản ấy
CREATE TABLE  FeartureUser(
--=========>Trường Dữ Liệu<===========--
	id int primary key,
	isdelete bit default 0,
	numberUsing int default 0,
	dateCreate date default getdate(),
--=========>Connect Table<===========--
	idFearture int  not null foreign key references RepositoryFearture(id),
	nameUser varchar(50) not null foreign key references LoginAccount(nameUser),
)
/******    Chủ đề sản phẩm    ******/
CREATE TABLE ThemeProduct(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	title nvarchar(300) NOT NULL,
	dateCreate datetime NOT NULL DEFAULT (getdate()),
	dateEnd datetime NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
)
GO
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Điện Thoại',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Quần Áo',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Cáp Sạc',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Đồng Hồ Công Nghệ',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Đồng Hồ Thời Trang',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Camera',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Giày Dép',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Máy Lọc Nước',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Máy Tính',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Mỹ Phẩm',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Pin',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Tai Nghe',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Thiết Bị Mạng',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Thời Trang',getdate(),getdate(),0)
INSERT ThemeProduct (Title,DateCreate,DateEnd,IsDelete) VALUES (N'Lập Trình',getdate(),getdate(),0)
GO
/******    Nhà cung Cấp đăng ký chủ đề sản phẩm      ******/
CREATE TABLE registeredProvider
(
--=========>Trường Dữ Liệu<===========--
	id int identity(1,1) not null  primary key ,
	dateCreate date not null default getdate(),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	idSupper int NOT NULL FOREIGN KEY REFERENCES Supplier(id),
	idThemeProduct int NOT NULL FOREIGN KEY REFERENCES ThemeProduct(id),
)
GO
/******    Loại chủ đề san phẩm     ******/
CREATE TABLE CategoryProduct(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	nameCategory nvarchar(300) NOT NULL,
	dateCreate datetime NOT NULL DEFAULT (getdate()),
	dateEnd datetime NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	theme int NULL FOREIGN KEY REFERENCES ThemeProduct (id),
)

GO

/******    Sản Phẩm     ******/
CREATE TABLE Product(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	ten nvarchar(100) NOT NULL,
	gia money NOT NULL,
	soLuong int NULL,
	soLuongDaBan int NULL,
	baoHanh int NOT NULL,
	gioiThieu nvarchar(500) NULL,
	color nvarchar(300) NOT NULL, --cách nhau băng 1 ký tự nào đó đêphân chia các loại
	size nvarchar(300) NOT NULL, --cách nhau băng 1 ký tự nào đó đêphân chia các loại
	isImage nvarchar(max) not null,
	giamGiaTrucTiep int check(giamGiaTrucTiep<100),
	VAT int ,-- thuế giá trị gia tăng
	viTri nvarchar(100),
	khoiLuong int ,-- khối lượng của sản phẩm
	theTich int , -- thể tích của sản phẩm
	hangDeVo bit default 0 , --  sản phẩm dễ hư hỏng
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	supplier int NULL FOREIGN KEY(Supplier) REFERENCES Supplier (id), -- nhà cung cấp
	categoryProduct int NULL FOREIGN KEY REFERENCES CategoryProduct (id),-- chủ đề sản phẩm
	seo int FOREIGN KEY REFERENCES Seo (id),-- seo
)
GO
/******    Ảnh Sản Phẩm    ******/
CREATE TABLE ImageProduct(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	src varchar(max) NOT NULL,-- là đường dẫn b64
	alt varchar(300) NOT NULL,
	title varchar(300) NOT NULL,
	isStatus  int default 0,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	supplier int NULL FOREIGN KEY REFERENCES Supplier (id),
	product int NULL FOREIGN KEY REFERENCES Product (id),
)
GO
/******    Quần Áo     ******/
CREATE TABLE Clothes(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	chatlieu nvarchar(50) NOT NULL,
	dangAo nvarchar(50) NOT NULL,
	cachGiat nvarchar(50) NOT NULL,
	xuatXu nvarchar(50) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Điện Thoại  X   ******/
CREATE TABLE Phone(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	manHinh nvarchar(100) NOT NULL,
	heDieuHanh varchar(30) NOT NULL,
	cameraTruoc nvarchar(50) NOT NULL,
	cameraSau nvarchar(50) NOT NULL,
	loiSanPham nvarchar(100) NOT NULL,
	diKem nvarchar(100) NOT NULL,
	ram nvarchar(50) NOT NULL,
	cpu nvarchar(50) NOT NULL,
	boNho int NOT NULL,
	theNho nvarchar(50) NOT NULL,
	sim nvarchar(50) NOT NULL,
	doPhanGiai nvarchar(100) NOT NULL,
	manHinhRong nvarchar(100) NOT NULL,
	kinhCamUng nvarchar(100) NOT NULL,
	chipSet varchar(30) NOT NULL,
	tocDocpu varchar(30) NOT NULL,
	gpu varchar(30) NOT NULL,
	doPhanGiaiCammeraTruoc varchar(30) NOT NULL,
	videoCall varchar(30) NOT NULL,
	thongTinKhacCamMera varchar(30) NOT NULL,
	doPhanGiaiCamerasau varchar(30) NOT NULL,
	quayPhim varchar(30) NOT NULL,
	denFlash varchar(30) NOT NULL,
	chupAnhNangCao varchar(30) NOT NULL,
	hoTroMang nvarchar(50) NOT NULL,
	wifi nvarchar(50) NOT NULL,
	gps nvarchar(50) NOT NULL,
	bluetooth nvarchar(50) NOT NULL,
	congKetNoi nvarchar(50) NOT NULL,
	jackTaiNGhe nvarchar(50) NOT NULL,
	ketNoiKhac nvarchar(50) NOT NULL,
	thietKe nvarchar(50) NOT NULL,
	chatLieu nvarchar(50) NOT NULL,
	trongLuong nvarchar(50) NOT NULL,
	loaiPin nvarchar(50) NOT NULL,
	congNghePin nvarchar(50) NOT NULL,
	dungLuongPin int NOT NULL,
	baoMat nvarchar(50) NOT NULL,
	tinhNangNoiBat nvarchar(50) NOT NULL,
	ghiAm nvarchar(50) NOT NULL,
	radio nvarchar(50) NOT NULL,
	xemPhim nvarchar(50) NOT NULL,
	ngheNhac nvarchar(50) NOT NULL,
	thoiDiemRaMat nvarchar(50) NOT NULL,
	loaiSanPham bit NOT NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (id),
	product int NULL FOREIGN KEY REFERENCES Product (id),
)
GO
/******    Tai Nghe  X   ******/
CREATE TABLE Headphone(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	chungLoai int NOT NULL CHECK  ((chungLoai>(0) AND chungLoai<(5))),
	tuongThich nvarchar(50) NULL,
	congXuat int NULL,
	cachKetNoi nvarchar(50) NULL,
	phimDieuKhien nvarchar(50) NULL,
	tinhNangKhac nvarchar(50) NULL,
	khoangCachBluetooth int NULL,
	kichThuocSieuTram nvarchar(50) NULL,
	kichThuocVeTinh nvarchar(50) NULL,
	trongLuong int NULL,
	thuongHieu nvarchar(50) NULL,
	xuatSu nvarchar(50) NULL,
	boBanHangChuan nvarchar(50) NULL,
	congSac nvarchar(50) NULL,
	thoiGianSuDung int NULL,
	ketNoiCungLuc int NULL,
	thoiGianXacDay int NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Máy Tính  X   ******/
CREATE TABLE Computer(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	cpu nvarchar(50) NOT NULL,
	loaiCPU nvarchar(50) NOT NULL,
	tocdocpu int NULL,
	tocdoToIda int NULL,
	loaiRam nvarchar(50) NOT NULL,
	tocDoBusRam nvarchar(50) NOT NULL,
	hoTroRamToIda nvarchar(50) NOT NULL,
	ram nvarchar(50) NOT NULL,
	oCung nvarchar(50) NOT NULL,
	kichThuocManHinh nvarchar(50) NOT NULL,
	doPhanGiai nvarchar(50) NOT NULL,
	congNgheManHinh nvarchar(50) NOT NULL,
	manHinhCamUng bit NULL,
	thietKeCard nvarchar(50) NOT NULL,
	cardDoHoa nvarchar(50) NOT NULL,
	congNgheAmThanh nvarchar(50) NOT NULL,
	congGiaoTiep nvarchar(50) NOT NULL,
	ketnoiKhongday nvarchar(50) NOT NULL,
	kheDocTheNho nvarchar(50) NOT NULL,
	odiaQuang nvarchar(50) NOT NULL,
	webCam nvarchar(50) NOT NULL,
	tinhNangKhac nvarchar(50) NOT NULL,
	denBanPhm nvarchar(50) NOT NULL,
	pin nvarchar(50) NOT NULL,
	thongTinPhin nvarchar(50) NOT NULL,
	heDieuHanh nvarchar(50) NOT NULL,
	trongLuong nvarchar(50) NOT NULL,
	chatLieu nvarchar(50) NOT NULL,
	thoIdiemRaMat nvarchar(50) NOT NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)

GO
/******    Đồng Hồ Công Nghệ  X   ******/
CREATE TABLE TechnologyWatch(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	manHinh nvarchar(100) NOT NULL,
	congNgheManHinh nvarchar(30) NULL,
	kichThucManHinh varchar(30) NULL,
	doPhanGiai varchar(30) NULL,
	duongKinhMat int NULL,
	cpu varchar(30) NULL,
	boNhoTrong varchar(30) NULL,
	heDieuHanh varchar(30) NULL,
	ketNoiHeDieuHanh varchar(30) NULL,
	congSac varchar(30) NULL,
	thoiGianSuDungPin int NULL,
	thoiGianSac int NULL,
	dungLuongPin int NULL,
	theoDoiSucKhoe varchar(50) NULL,
	hienThiThongBao varchar(50) NULL,
	tienIchKhac varchar(50) NULL,
	ketnoi varchar(30) NULL,
	cammera varchar(30) NULL,
	dodaIday int NULL,
	doRongDay int NULL,
	chatlieuday varchar(30) NULL,
	daycoThethaoroi bit NULL,
	chatlieukhungvien varchar(30) NULL,
	ngonNgu varchar(30) NULL,
	khichThuoc varchar(30) NULL,
	trongLuong int NULL,
	isdelete bit NOT NULL DEFAULT (0),
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
--=========>Connect Table<===========--
)
GO
/******    Đồng Hồ Thời Trang  X   ******/
CREATE TABLE FashionWatch(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	loaimay nvarchar(30) NULL,
	duongKinhmat int NULL,
	chatLieuMatKinh nvarchar(30) NULL,
	chatLieuKhungVien nvarchar(30) NULL,
	chongxuoc nvarchar(30) NULL,
	dodayMat int NULL,
	chatLieuDay nvarchar(30) NULL,
	tienIch nvarchar(30) NULL,
	doRongDay int NULL,
	nguonNangLuong nvarchar(30) NULL,
	thoiGianSuDungPin nvarchar(30) NULL,
	doiTuongSuDung nvarchar(30) NULL,
	thuongHieu nvarchar(30) NULL,
	noiSanXuat nvarchar(50) NULL,
	thoIdiemRaMat nvarchar(50) NOT NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Pin  X   ******/
CREATE TABLE Pin(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	hieuXuatXac int NULL,
	dungluong int NULL,
	thoiGianXac int NULL,
	nguonvao nvarchar(30) NULL,
	loiPin nvarchar(30) NULL,
	congnghe nvarchar(30) NULL,
	tienich nvarchar(30) NULL,
	trongLuong int NULL,
	thuongHieu nvarchar(30) NULL,
	nguonGoc nvarchar(30) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Cáp sạc  X  ******/
CREATE TABLE ChargingCable(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	loai int NULL  CHECK  ((loai>(0) AND loai<(4))), 
	doDaIday int NULL,
	chucNang nvarchar(30) NULL,
	dauvao nvarchar(30) NULL,
	dauRa nvarchar(30) NULL,
	congNghe nvarchar(30) NULL,
	tienIch nvarchar(30) NULL,
	thuongHieu nvarchar(30) NULL,
	nguonGoc nvarchar(30) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    máy ảnh  X   ******/
CREATE TABLE Camera(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	doPhangiai nvarchar(30) NULL,
	nguonDienVao int NULL,
	tamNhinHongNgoai int NULL,
	hoTroTheNho nvarchar(30) NULL,
	hoTroThietBi nvarchar(30) NULL,
	khichthuoc nvarchar(30) NULL,
	trongluong int NULL,
	nhietdoHoatDong nvarchar(30) NULL,
	thuongHieu nvarchar(30) NULL,
	nguonGoc nvarchar(30) NULL,
	phuKien nvarchar(100) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id)
)
GO
/******    Thiết bị mạng  X  ******/
CREATE TABLE NetworkEquipment(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	loai int NULL CHECK  ((loai>(0) AND loai<(4))),
	tocDo int NULL,
	bangTan int NULL,
	cacCongKetNoi nvarchar(50) NULL,
	denBaoHieu nvarchar(30) NULL,
	soAngTen nvarchar(30) NULL,
	truyCapToIda int NULL,
	doPhuSong int NULL,
	nutBamHoTro nvarchar(30) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY(Product) REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Giày dép  X   ******/
CREATE TABLE Shoes(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	doCao int NULL,
	loaiMui nvarchar(30) NULL,
	chatLieu nvarchar(50) NULL,
	hoaVan nvarchar(100) NULL,
	moiTruongSuDung nvarchar(100) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Mỹ phẩm  X   ******/
CREATE TABLE Cosmetic(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	thuongHieu nvarchar(30) NULL,
	xuatSu nvarchar(30) NULL,
	thanhPhan nvarchar(200) NULL,
	muiHuong nvarchar(30) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Máy Lọc Nước  X   ******/
CREATE TABLE WaterPurifier(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	kieuMay nvarchar(100),
	thuongHieu nvarchar(100),
	soLoiLoc nvarchar(100),
	congNghe nvarchar(100),
	dungTich nvarchar(100),
	congXuatLocNuoc nvarchar(100),
	congXuatTieuThu nvarchar(100),
	nhietDo nvarchar(100),
	heThongBomVavanDieuTiet nvarchar(100),
	tienIch nvarchar(100),
	kichThuoc nvarchar(100),
	nguonGoc nvarchar(100),
	noiSanXuat nvarchar(100),
	namRamat nvarchar(100),
	hangSanXuat nvarchar(100),
		
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY(Product) REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Thời Trang  X   ******/
CREATE TABLE Fashion(
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	mauSac nvarchar(100),
	phongCach nvarchar(100),
	kieuMau nvarchar(100),
	vien nvarchar(100),
	chieuDai nvarchar(100),
	kieu nvarchar(100),
	chitiet nvarchar(100),
	chieuDaiTay nvarchar(100),
	thanhPhan nvarchar(100),
	vatLieu nvarchar(100),
	soiVai nvarchar(100),
	nguonGoc nvarchar(100),
	noiSanXuat nvarchar(100),
	namRamat nvarchar(100),
	hangSanXuat nvarchar(100),
	thuongHieu nvarchar(100) NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	seo int FOREIGN KEY REFERENCES Seo (id),
)
GO
/******    Giảm Giá  X   ******/ -- có những mã giảm giác đặc biệt cho các sản phẩm khác nhau của 1 nhà cung cấp
CREATE TABLE Discount(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	code nvarchar(10) NOT NULL,
	phantram int NOT NULL,
	dateCreate date NULL DEFAULT (getdate()),
	dateEnd int NULL DEFAULT ((15)),
	numberUsing int NULL DEFAULT (0),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	supplier int NULL FOREIGN KEY REFERENCES Supplier (id)-- nhà cung cấp tạo mã giảm giá cho chính ,mình
)
GO
/******    Sản phẩm sử dụng giảm giá  X   ******/ -- nhà cung cấp cài đặt mã giảm giá họ tạo cho san phẩm của họ
CREATE TABLE ProductUsingDiscount(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	soLuong int not NULL,	
	dateCreate date Default Getdate() not null,
	dateEnd int default 120 not null,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	discount int NULL FOREIGN KEY REFERENCES Discount (id),
)
GO
/******    Giảm giá chi tiết từ người dùng   ******/
CREATE TABLE DetailDiscountFromUser(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	soLuong int NULL,	
	dateCreate date NULl default getdate(),
	soLanNhapSai int ,
	thanhCong bit ,
	isdelete bit NOT NULL DEFAULT (0), -- nếu như nhập không thành công thì lần sau người dùng này nhập lại sẽ up lại cái bản này
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY REFERENCES LoginAccount (NameUser),
	productUsingDiscount int NULL FOREIGN KEY REFERENCES ProductUsingDiscount (Id),
)
GO
/******    Kho lưu trữ khuyến mãi   ******/
CREATE TABLE promotionReposetory(
--=========>Trường Dữ Liệu<===========--
	id int IDENTITY(1,1) NOT NULL primary key,
	tongSoLuong int NULL,
	dateCreate date Default Getdate() not null,
	dateEnd int default 120 not null,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY REFERENCES Product (id),
	supplier int NULL FOREIGN KEY REFERENCES Supplier (id)-- nhà cung cấp tạo khuyến mãi cho chính mình và sử dụng sản phẩm của mình
)
GO
/******    khuyến mãi     ******/
CREATE TABLE promotion(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	soLuongConLai int NULL,
	soLuongTang int NULL,
	giamGiaTien int null,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd int NOT NULL DEFAULT (120),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int  FOREIGN KEY REFERENCES Product (Id),
	promotionReposetory int  FOREIGN KEY REFERENCES promotionReposetory (id),
)
GO
/******    Lịch sử người dùng khuyến mãi    ***/
CREATE TABLE promotionHistory( -- đầu tien nó sẽ vào đây , khi nó nhận được thằng id của sản phẩm nó sẽ lên bảng  đếm số ak lộn
							   -- lên bảng Kho lưu trữ khuyến mãi , và nó sẽ xác định được các mức và các sản phẩm  kèm theo .
							   -- sau đó khi có tất cả rồi chúng sẽ được tổng hợp vào bảng này 
							   -- sau đó người dùng sẽ dịch chuyển tùy ý dự trên dữ liệu có sẵn , tính tiền hoàn tiền .....
--=========>Trường Dữ Liệu<===========--
	Id int IdENTITY(1,1) NOT NULL primary key,
	soNhan int , -- số sản phẩm mà khách muốn có 
	soHuy int , -- số sản phẩm mà khách từ chối hiểu
	giamGiaTien int, -- nếu khách từ chối hiểu chúng ta sẽ giảm chút tiền cho khách (nâng giá gốc lên mà lấy lãi , chiến thuật cả đấy)
	dateCreate date NOT NULL DEFAULT (getdate()), -- thời gian mà khách tạo cái củ lìn này
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	promotionReposetory int  FOREIGN KEY(promotionReposetory) REFERENCES promotionReposetory (Id), -- Kho lưu trữ khuyến mãi là interface cho tất cacr nhưng table khác thêm vị trí của nó vào
)
GO
/******   kho giá địa chỉ  Ship hàng  *****/
CREATE TABLE MoneyShip
(
	id int identity(1,1) primary key,
	diaDiem1 nvarchar(50),
	diaDiem2 nvarchar(50),
	khoiLuong int ,
	theTich int ,
	giaGiaoBinhThuong int ,
	giaGiaoNhanh int ,
	giaGiaoSieuToc int ,
	isDelete bit default 0
)
GO
/******    giỏ hàng    *****/
CREATE TABLE Cart(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,	
	soLuong int NOT NULL CHECK  ((soLuong>(0))),
	khoiLuong int,
	theTich int,
	giaGiaoHang int,
	giaSanPham int,
	giaCuoiCung int,
	dateCreate date default getdate(),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	promotionHistory int NULL FOREIGN KEY REFERENCES promotionHistory(id),-- các sản phẩm kèm theo , tặng kèm 
	detailDiscountFromUser int NULL FOREIGN KEY REFERENCES DetailDiscountFromUser(Id), --giảm gía khi người dùng nhập vào
	moneyShip int NULL FOREIGN KEY REFERENCES MoneyShip(id),--tiền ship mặt hàng này
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),-- tài khoản người dùng
)
GO

/******    Thanh Toán   **/
CREATE TABLE Pay(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	tongtien numeric(18, 0) NOT NULL DEFAULT (0),
	dateCreate date NOT NULL DEFAULT (getdate()),
	isStatus bit not null default 1 check(isStatus < 5), 
	-- 0 : Thanh toán tiền mặt khi nhận hàng (COD)
	-- 1 : Thanh toán qua thẻ ATM có đăng ký thanh toán trực tuyến 
	-- 2 : Thanh toán qua thẻ Visa/Master/JCB
	-- 3 : Thanh toán qua ví MoMo
	-- 4 : Thanh toán qua ZaloPay
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	cart int NULL FOREIGN KEY REFERENCES Cart(Id), -- sản phẩm đã mua
)
GO
/******    Mua sản Phẩm    *****/
CREATE TABLE Purchase(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	ngaydat date NOT NULL DEFAULT (getdate()),
	ngayGiao date NOT NULL DEFAULT (getdate()),
	isStatus bit not null default 1 check(isStatus < 7), 
	-- 0 : sản phẩm đã xóa khác với sản phẩm giao thành công
	-- 1 : trạng thái đóng gói hàng và chuẩn bị giao dự kiến
	-- 2 : đang trên đường vận chuyển , cái củ lìn này mai sau sẽ tích hợp hệ thống theo dõi từ xa và ship 
	-- 3 : giao hàng thành công
	-- 4 : sản phẩm bị trả về
	-- 5 : sản phẩm bị hủy giữa trừng
	-- 6 : sản phẩm đã giao
--=========>Connect Table<===========--
	cart int NULL FOREIGN KEY(Cart) REFERENCES Cart (Id),-- lấy tất cả thông tin mà khách hàng mặc định bên giỏ hàng và đóng gói gửi cho khách
)
GO
/******    Mẫu hợp đồng   ***/
CREATE TABLE ContractForm(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	html nvarchar(max) NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    hợp đồng   ****/
CREATE TABLE IsContract(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	html nvarchar(max) NULL,
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	contractForm int NULL  FOREIGN KEY (ContractForm) REFERENCES ContractForm (Id),
	purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
)
GO
/******   Sản phẩm Thất Bại   *****/
CREATE TABLE FailureProduct(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	dateCreate date NOT NULL DEFAULT (getdate()),
	lyDo nvarchar(300) ,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (Id),
	purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	isContract int NULL FOREIGN KEY(IsContract) REFERENCES IsContract (Id),
	pay int NULL FOREIGN KEY(Pay) REFERENCES Pay (Id),
)
GO
/******    Bảo hành    ****/
CREATE TABLE Guarantee(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd date NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	purchase int NULL FOREIGN KEY(Purchase) REFERENCES Purchase (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Đánh giá X  ****/
CREATE TABLE Evaluate(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	noIdung nvarchar(max) NOT NULL,
	soSao int NULL DEFAULT ((3)) CHECK  ((soSao>(0) AND soSao<(6))),
	imageEvaluate varchar(max),
	thoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Rep Đánh giá  X  *****/
CREATE TABLE RepEvaluate(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	noIdung nvarchar(max) NOT NULL,
	thoiGian date NULL DEFAULT (getdate()),
	imageEvaluate varchar(max),
--=========>Connect Table<===========--
	evaluate int NULL FOREIGN KEY(Evaluate) REFERENCES Evaluate (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Like Đánh giá  X  *****/
CREATE TABLE LikeEvaluate(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	islike bit NULL,
	dislike bit NULL,
	thoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	evaluate int NULL FOREIGN KEY(Evaluate) REFERENCES Evaluate (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Like Rep Đánh giá  X ****/
CREATE TABLE LikeRepEvaluate(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	islike bit NULL,
	dislike bit NULL,
	thoiGian date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	repEvaluate int NULL FOREIGN KEY(RepEvaluate) REFERENCES RepEvaluate (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Kho XU    ****/
CREATE TABLE RepositoryXU(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	xu int NULL,
	mucgiaMin numeric(18, 0) NULL,
	mucgiaMax numeric(18, 0) NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd date NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Sản Phẩm Sảu dụng xu   *****/
CREATE TABLE ProductUsingXu(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd date NOT NULL DEFAULT (getdate()),
	saoDanhGia float NULL,
	soXu int NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	repositoryXU int NULL FOREIGN KEY(RepositoryXU) REFERENCES RepositoryXU (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Phiếu giảm giá    ****/
CREATE TABLE CouponsAndCents(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	xuMin int NULL,
	xuMax int NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd date NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	discount int NULL FOREIGN KEY(Discount) REFERENCES Discount (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Lịch sử nhận Coins    *****/
CREATE TABLE HistoryOfReceivingCoins(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	soXu int NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd date NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	discount int NULL FOREIGN KEY(Discount) REFERENCES Discount (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/*****************************************************************************************************************/
/******    lý do lưu trữ    ****/
CREATE TABLE reasonRepository(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	ten nvarchar(100) NULL,
	noidung nvarchar(max),
	link nvarchar(100) NULL,
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    GiveItBack v  *****/
CREATE TABLE GiveItBack(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	ten nvarchar(100) NULL,
	link nvarchar(100) NULL,
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Hỗ trợ danh mục  v  *****/
CREATE TABLE CatalogSupport(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	ten nvarchar(100) NULL,
	link nvarchar(100) NULL,
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Kho lưu trữ hỗ trợ  v *****/
CREATE TABLE RepositorySupport(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	ten nvarchar(100) NULL,
	link nvarchar(100) NULL,
--=========>Connect Table<===========--
	catalogSupport int FOREIGN KEY REFERENCES CatalogSupport (Id),
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Hỗ trợ v *****/
CREATE TABLE Support(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	blog nvarchar(max) NULL,
--=========>Connect Table<===========--
	seo int FOREIGN KEY REFERENCES Seo (Id),
)
GO
/******    Mô tả Sản phẩm  X  ****/
CREATE TABLE DescriptionProduct(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	blog nvarchar(max) default (N'Chưa có bào viết nào về sản phẩm này ,quý khách vui lòng quay lại sau ') not NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    hành động  v  ***/
CREATE TABLE IsAction(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	urlClick nvarchar(300) NOT NULL,
	timeCreate datetime NOT NULL,
	dateEnd datetime NOT NULL,
	isdelete bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser)
)
GO
/******    Key Tìm Kiếm  ****/
CREATE TABLE KeySearch(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	keySearch nvarchar(300) NOT NULL,
	keyChon nvarchar(300),
	dateSearch date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser)
)
GO
/******    đổi mật khẩu   ****/
CREATE TABLE ChangePass(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	passOld varchar(100) NOT NULL,
	passNew varchar(100) NOT NULL,
	haskPass varchar(100) NOT NULL,
	confEmail varchar(300) NOT NULL,
	delet bit NOT NULL,
	dateChange date NULL DEFAULT (getdate()),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    captcha  v  *****/
CREATE TABLE capcha(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	code varchar(300) NOT NULL,
	img nvarchar(max) NULL,
	dateCreate date NOT NULL,
	dateEnd date NOT NULL,
	sussces bit NOT NULL DEFAULT (0),
--=========>Connect Table<===========--
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Quảng cáo  v  ****/
CREATE TABLE Advertisement(
--=========>Trường Dữ Liệu<===========--
	id int IdENTITY(1,1) NOT NULL primary key,
	imageRieng nvarchar(MAX) NULL,
	link nvarchar(50) NULL,
	dateCreate date NOT NULL DEFAULT (getdate()),
	dateEnd int NULL,
	isDelete bit NOT NULL DEFAULT (0),
	noiDung nvarchar(100) NULL,
--=========>Connect Table<===========--
	product int NULL FOREIGN KEY(Product) REFERENCES Product (Id),
	nameUser varchar(50) NULL FOREIGN KEY(NameUser) REFERENCES LoginAccount (NameUser),
)
GO
/******    Carousel v  *****/
CREATE TABLE Carousel(
--=========>Trường Dữ Liệu<===========--
	id int NOT NULL primary key,
	link nvarchar(300) NULL,
	title nvarchar(300) NULL,
--=========>Connect Table<===========--
	product int NULL foreign key references Product(Id),
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

