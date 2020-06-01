Create Database Sell
go--***************************************************************************
use Sell
go--***************************************************************************
--seo
create table Seo-- Tên : hỗ trợ seo
(
--Trách Nhiệm : hỗ trợ các link và các meta trên google
--Trường :
	id int identity(1,1) primary key,
	Meta nvarchar(200),
	Link nvarchar(200),
--Kết Nối :
)
go--***************************************************************************
--DANG NHAP
create table LoginAccount-- Tên : Tài khoản
( 
--Trách Nhiệm : nơi đang nhập tại đây nó sẽ có công dụng chung xác định tài khoản đang đang nhập vào hệ thống
--Trường :
	NameUser varchar(50) primary key,
	PassUser varchar(100) not null,
	HaskPass varchar(100) not null,
	Email varchar(300) not null,
	delet bit not null,
	phanQuyen int not null default 0 check (phanQuyen>-1 and phanQuyen<3)
--Kết Nối :
)
go--***************************************************************************
create table infomationUser-- Tên : Thông Tin Tài Khoản
(

--Trách Nhiệm : nơi lưu trữ các thông tin của khách hàng
--Trường :
	id int identity(1,1) primary key,
	avatar nvarchar(100) not null,
	NameUser varchar(50) not null,
	age int not null default(18),
	Adress nvarchar(300) not null,
	Sdt numeric(14)not null,
	ngayCapNhat date default getdate(),
--Kết Nối :
	Account varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id)
)
go--***************************************************************************
create table Supplier-- Tên : Nhà cung Cấp
(
--Trách Nhiệm : 
	--trang của nhà cung cấp cũng như  thông tin chi tiết của nhà cung cấp
--Trường :
	id int identity(1,1) primary key ,
	Avatar varchar(100) not null,
	TenTrang nvarchar(30) not null,
	createTime date default getdate() not null,
	da_Xoa bit default 0,
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
-- SAN PHAM
create table ThemeProduct-- Tên : chủ đề sản phẩm
(
--Trách Nhiệm : chủ đề chung nhất phân loại các mặt hàng với nhau
--Trường :
	id int identity(1,1) primary key,
	nameTheme nvarchar(300) not null,
	CreateDate datetime  not null default (getdate()),
	EndDate datetime  not null default (getdate()),
	link nvarchar(300) not null,
	IsDelete bit default 0
--Kết Nối :
)
go--***************************************************************************
create table categoryProduct-- Tên :  Loại chủ đề
(
--Trách Nhiệm : 
	--phân chia các chủ để ra nhỏ hơn nữa để xác định các thành phần của sản phẩm
--Trường :
	id int identity(1,1) primary key,
	nameCategory nvarchar(300) not null,
	CreateDate datetime  not null default (getdate()),
	EndDate datetime  not null default (getdate()),
	link nvarchar(300) not null,
	IsDelete bit default 0,
--Kết Nối :
	Theme int foreign key references ThemeProduct(id)
)
go--***************************************************************************
create table ImageProduct-- Tên : Ảnh sản phẩm
(
--Trách Nhiệm : 
	--ảnh của sản phẩm lưu trữ bộ ảnh này để cho sản phẩm dùng đến nó
--Trường :
	id int identity(1,1) primary key ,
	anh1 varchar(100) not null,
	anh2 varchar(100) not null,
	anh3 varchar(100) not null,
	anh5 varchar(100) not null,
	anh6 varchar(100) not null,
	anh7 varchar(100) not null,
	Isdelete bit default 0,
--Kết Nối :
)
go--***************************************************************************
create table ColorProduct-- Tên : Màu sản phẩm
(
--Trách Nhiệm : 
	--bất kể sản phẩm nào cũng có màu sắc 
--Trường :
	id int identity(1,1) primary key ,
	color1 nvarchar(30) not null,
	color2 nvarchar(30) not null,
	color3 nvarchar(30) not null,
	color4 nvarchar(30) not null,
	color5 nvarchar(30) not null,
	color6 nvarchar(30) not null,
	color7 nvarchar(30) not null,
	Isdelete bit default 0,
--Kết Nối :
)
go--***************************************************************************
create table sizeReposetory--Tên : Kích thước Sản phẩm
(
--Trách Nhiệm : 
	--bất kể sản phẩm nào cũng có kích thước
--Trường :
	id int identity(1,1) primary key,
	size1 nvarchar(30) not null,
	size2 nvarchar(30) not null,
	size3 nvarchar(30) not null,
	size4 nvarchar(30) not null,
	size5 nvarchar(30) not null,
	size6 nvarchar(30) not null,
	size7 nvarchar(30) not null,
	Isdelete bit default (0)
--Kết Nối :
)
go--***************************************************************************
create table Product-- Tên : Sản Phẩm
(
--Trách Nhiệm : 
	-- hiển thị tất cả sản phẩm có phần chung hiển thị thông tin đầu tiên khách hàng nhìn thấy
--Trường :
	id int identity(1,1) primary key,
	ten nvarchar(100) not null,				
	gia money not null,
	soLuong int,
	soLuongconlai int,
	bao_hanh int not null,	
	link nvarchar(300),
	Isdelete bit default 0,
--Kết Nối :
	ColorProduct int foreign key references ColorProduct(id),
	sizeReposetory int foreign key references sizeReposetory(id),
	Supplier int foreign key references Supplier(id),
	ImageProduct int foreign key references ImageProduct(id),
	categoryProduct int foreign key references categoryProduct(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
--DETAIL PRODUCT
create table Clothes--Tên : Sản phẩm quần áo
(
--Trách Nhiệm : 
	--chi tiết của sản phẩm là quần áo
--Trường :
	id int identity(1,1) primary key,
	chatlieu nvarchar(50) not null,
	DangAo nvarchar(50) not null,
	cachGiat nvarchar(50) not null,
	xuatXu nvarchar(50),
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Phone--Tên : Sản phẩm Điện Thoại 
(
--Trách Nhiệm : 
	--chi tiết của sản phẩm là điện thoại
	--bao gồm có tablet và điện thoại
--Trường :
	id int identity(1,1) primary key ,
	man_hinh nvarchar(100) not null,
	he_dieu_hanh varchar(30) not null,
	camera_Truoc nvarchar(50) not null,
	camera_Sau nvarchar(50) not null,
	Loi_san_Pham nvarchar(100) not null,
	di_Kem nvarchar(100) not null,
	ram nvarchar(50) not null,
	cpu nvarchar(50) not null,
	bo_nho int  not null,
	the_nho nvarchar(50) not null,
	sim nvarchar(50) not null,
	doPhanGiai nvarchar(100) not null,
	Man_Hinh_rong nvarchar(100) not null,
	KinhCamUng nvarchar(100) not null,										
	chipset varchar(30) not null,
	TocDocpu varchar(30) not null,
	GPU varchar(30) not null,									
	DoPhanGiaiCammeraTruoc varchar(30) not null,
	VideoCall varchar(30) not null,
	ThongTinKhacCamMera varchar(30) not null,					
	DoPhanGiaiCamerasau varchar(30) not null,
	quayPhim varchar(30) not null,
	denFlash varchar(30) not null,
	chupAnhNangCao varchar(30) not null,									
	hoTroMang nvarchar(50) not null,
	wifi nvarchar(50) not null,
	GPS nvarchar(50) not null,
	bluetooth nvarchar(50) not null,
	congKetNoi nvarchar(50) not null,
	JackTaiNGhe nvarchar(50) not null,
	ketNoiKhac nvarchar(50) not null,
	thietKe nvarchar(50) not null,
	ChatLieu nvarchar(50) not null,
	TrongLuong nvarchar(50) not null,
	LoaiPin nvarchar(50) not null,
	CongNghePin nvarchar(50) not null,
	dung_luong_Pin int  not null,
	BaoMat nvarchar(50) not null,
	TinhNangNoiBat nvarchar(50) not null,
	GhiAm nvarchar(50) not null,
	Radio nvarchar(50) not null,
	XemPhim nvarchar(50) not null,
	NGheNHac nvarchar(50) not null,
	ThoiDiemRaMat nvarchar(50) not null,
	LoaiSanPham bit not null ,--1 la dienthoai 0 laf tablet
	Isdelete bit default 0,
--Kết Nối :
	Seo int foreign key references Seo(id),	
	Product int foreign key references Product(id),
)
go--***************************************************************************
create table Headphone-- Tên : Sản phẩm tai nghe 
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng tai nghe
--Trường :
	id int identity(1,1) primary key ,
	chungLoai int  check(chungLoai>0 and chungLoai<5) not null,
	TuongThich nvarchar(50),
	congXuat int,
	cachKetNoi nvarchar(50),
	PhimDieuKhien nvarchar(50),
	TinhNangKhac nvarchar(50),
	KhoangCachBluetooth int,
	kichThuocSieuTram nvarchar(50),
	KichThuocVeTinh nvarchar(50),
	trongLuong int,
	thuongHieu nvarchar(50),
	XuatSu nvarchar(50),
	BoBanHangChuan nvarchar(50),
	CongSac nvarchar(50),
	ThoiGianSuDung int,
	KetNoiCungLuc int,
	ThoiGianXacDay int,
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Computer-- Tên : Sản phẩm máy tính
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng máy tính
--Trường :
	id int identity(1,1) primary key ,
	cpu nvarchar(50) not null,
	loaiCPU nvarchar(50) not null,
	tocdocpu int ,
	tocdoToida int ,
	loaiRam nvarchar(50) not null,
	tocDoBusRam nvarchar(50) not null,
	hoTroRamToiDa nvarchar(50) not null,
	Ram nvarchar(50) not null,
	OCung nvarchar(50) not null,
	kichthuocManHinh nvarchar(50) not null,
	DoPhanGiai nvarchar(50) not null,
	CongNgheManHinh nvarchar(50) not null,
	ManHinhCamUng bit ,
	ThietKeCard nvarchar(50) not null,
	cardDoHoa nvarchar(50) not null,
	CongNgheAmThanh nvarchar(50) not null,
	congGiaoTiep nvarchar(50) not null,
	ketnoiKhongday nvarchar(50) not null,
	kheDocTheNho nvarchar(50) not null,
	OdiaQuang nvarchar(50) not null,
	WebCam nvarchar(50) not null,
	TinhNangKhac nvarchar(50) not null,
	DenBanPhm nvarchar(50) not null,
	pin nvarchar(50) not null,
	thongTinPhin nvarchar(50) not null,
	HeDieuHanh nvarchar(50) not null,
	TrongLuong nvarchar(50) not null,
	ChatLieu nvarchar(50) not null,
	ThoiDiemRaMat nvarchar(50) not null,
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table TechnologyWatch--Tên : Sản phẩm đồng hồ công nghệ
(
--Trách Nhiệm :
	--lưu các sản phẩm thuộc dòng đồng hồ công nghệ
--Trường :
	id int identity(1,1) primary key ,
	man_hinh nvarchar(100) not null,
	congNgheManHinh nvarchar(30),
	KichThucManHinh varchar(30),
	doPhanGiai varchar(30),
	duongKinhMat int,
	cpu varchar(30),
	boNhoTrong varchar(30),
	HeDieuHanh varchar(30),
	ketNoiHeDieuHanh varchar(30),
	congSac varchar(30),
	ThoiGianSuDungPin int,
	thoiGianSac int,
	dungLuongPin int,
	theoDoiSucKhoe varchar(50),
	HienThiThongBao varchar(50),
	TienIchKhac varchar(50),
	ketnoi varchar(30),
	cammera varchar(30),
	dodaiDay int ,
	doRongDay int,
	chatlieuday varchar(30),
	daycoThethaoroi bit,
	chatlieukhungvien varchar(30),
	ngonNgu varchar(30),
	khichThuoc varchar(30),
	trongLuong int ,
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table FashionWatch--Tên : Sản phẩm đồng hồ thời trang
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng đồng hồ thời trang
--Trường :
	id int identity(1,1) primary key ,
	loaimay nvarchar(30),
	duongKinhmat int ,
	chatLieuMatKinh nvarchar(30),
	chatLieuKhungVien nvarchar(30),
	chongxuoc nvarchar(30),
	dodayMat int ,
	chatLieuDay nvarchar(30),
	tienIch nvarchar(30),
	doRongDay int , 
	NguonNangLuong nvarchar(30),
	ThoiGianSuDungPin nvarchar(30),
	DoiTuongSuDung  nvarchar(30),
	ThuongHieu nvarchar(30),
	noiSanXuat nvarchar(50),
	ThoiDiemRaMat nvarchar(50) not null,
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Pin--Tên : Sản phẩm pin
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng pin máy tính .....
--Trường :
	id int identity(1,1) primary key ,
	HieuXuatXac int ,
	dungluong int , 
	thoiGianXac int ,
	nguonvao nvarchar(30),
	loiPin  nvarchar(30),
	congnghe  nvarchar(30),
	tienich  nvarchar(30),
	trongLuong int ,
	thuongHieu  nvarchar(30),
	NguonGoc  nvarchar(30),
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table ChargingCable-- Tên : Sản phẩm Cáp sạc
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng cáp sạc 
--Trường :
	id int identity(1,1) primary key ,
	loai int  check(loai>0 and loai <4),
	doDaiDay int ,
	chucNang nvarchar(30),
	dauvao nvarchar(30),
	dauRa nvarchar(30),
	congNghe nvarchar(30),
	tienIch nvarchar(30),
	ThuongHieu nvarchar(30),
	NguonGoc nvarchar(30),
--Kết Nối :
	Product int foreign key references Product(id),
	Isdelete bit default 0,
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Camera-- Tên : Sản phẩm máy ảnh
(
--Trách Nhiệm :
	--lưu các sản phẩm thuộc dòng máy ảnh
--Trường :
	id int identity(1,1) primary key ,
	dophangiai  nvarchar(30),
	nguondienvao int,
	tamNhinHongNgoai int ,
	hoTroTheNho  nvarchar(30),
	hoTroThietBi  nvarchar(30),
	khichthuoc  nvarchar(30),
	trongluong int ,
	nhietdoHoatDong  nvarchar(30),
	thuongHieu  nvarchar(30),
	nguonGoc  nvarchar(30),
	PhuKien  nvarchar(100),
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table NetworkEquipment-- Tên : Sản phẩm thiết bị mạng
(
--Trách Nhiệm : 
		--lưu các sản phẩm thuộc dòng thiết bị mạng
--Trường :
	id int identity(1,1) primary key ,
	loai int  check(loai>0 and loai <4),
	tocDo int , 
	bangTan int ,
	cacCongKetNoi nvarchar(50),
	DenBaoHieu nvarchar(30),
	soAngTen nvarchar(30),
	TruyCapToiDa int ,
	DoPhuSong int ,
	NutBamHoTro nvarchar(30),
	Isdelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Shoes--Tên : Sản phẩm giày dép
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng giày dép
--Trường :
    id int identity(1,1) primary key,
	doCao int ,
	loaiMui nvarchar(30),
	chatLieu nvarchar(50),
	HoaVan nvarchar(100),
	moiTruongSuDung nvarchar(100),
	Isdelete bit default(0),
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Cosmetic-- Tên : Sản phẩm mỹ phẩm
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng mỹ phẩm
--Trường :
	id int identity(1,1) primary key,
	thuongHieu nvarchar(30),
	xuatSu nvarchar(30),
	thanhPhan nvarchar(200),
	muiHuong nvarchar(30),
	Isdelete bit default(0),
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table WaterPurifier-- Tên : Sản phẩm máy lọc nước
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng máy lọc nước
--Trường :
	id int identity(1,1) primary key,
	Isdelete bit default(0),
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Fashion-- Tên : Sản phẩm thời trang
(
--Trách Nhiệm : 
	--lưu các sản phẩm thuộc dòng thời trang
--Trường :
	id int identity(1,1) primary key,
	Isdelete bit default(0),
--Kết Nối :
	Product int foreign key references Product(id),
	Seo int foreign key references Seo(id),
)
--MA GIAM GIA
go--***************************************************************************
create table Discount--Tên :  Giảm giá
(
--Trách Nhiệm : 
	--lưu mã giảm giá  chung 
	-- có thể nói đây là chỉ là một cái kho lưu trữ mã giảm giá mà thôi
--Trường :
	id int identity(1,1) primary key,
	code nvarchar(10) not null,
	phantram int not null,
	CreateDate date default(getdate()),
	EndDate int  default(15),
	oneUsing bit default 0,
	MoreUsing bit default 0,
	NumberUsing int default 0,
	IsDelete bit default 0,
--Kết Nối :
)
go--***************************************************************************
create table ProductUsingDiscount--Tên : giảm giá sản phẩm
(
--Trách Nhiệm : 
	--lấy mã giảm giá và sản phẩm kết hợp chúng lại 
	--khi kiểm tra mã giảm giá sẽ lấy từ đây đi ra 
--Trường :
	id int identity(1,1) primary key,
	soLuong int,
	IsDelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	Discount int foreign key references Discount(id),
)
go--***************************************************************************
create table DetailDiscountFromUser--Tên : người dùng mã giảm giá
(
--Trách Nhiệm : 
	--lưu trữ số lượng mã giảm giá đã được sử dụng và tài khoản nào sử dụng
--Trường :
	id int identity(1,1) primary key,
	createUsing date,
    IsDelete bit default 0,
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	ProductUsingDiscount int foreign key references ProductUsingDiscount(id),
)
go--***************************************************************************
--KHUYEN MAI
create table promotionReposetory--Tên : kho khuyến mại
(
--Trách Nhiệm : 
	--cài đặt các khuyến mãi bằng sản phẩm tặng thêm ở đây
--Trường :
	id int identity(1,1) primary key,
	tongSoLuong int,
	IsDelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table promotion--Tên : mua sản phảm đuọc khuyến mại
(
--Trách Nhiệm : 
	--kết hợp giữa sản phẩm đk khuyến mãi và sản phẩm cho khuyến mại
--Trường :
	id int identity(1,1) primary key,
	soluong int,
	dateCreate date,
	dateEnd date,
	IsDelete bit default 0,
--Kết Nối :
	Product int foreign key references Product(id),
	promotionReposetory int foreign key references promotionReposetory(id),
)
go--***************************************************************************
create table promotionHistory--Tên : lịch sử sử dụng khuyến mãi
(
--Trách Nhiệm : 
	-- người dùng nào đã mua sản phẩm được khuyến mãi
--Trường :
	id int identity(1,1) primary key,
	createDate  date,
	IsDelete bit default 0,
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	promotion int foreign key references promotion(id),
)
go--***************************************************************************
-- GIAO DICH
create table PlaceOfDelivery--Tên : địa điểm giao hàng
(
--Trách Nhiệm : 
	-- người dùng sẽ cài đặt địa điểm giao hàng cho mình
--Trường :
	id int identity(1,1) primary key,
	DiaDiemRieng nvarchar(300),
	DiaDiemRieng1 nvarchar(300),
	DiaDiemRieng2 nvarchar(300),
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table Cart--Tên : giỏ hàng
(
--Trách Nhiệm : 
	--khi người dùng bấm xem sản phẩm và cài đặt các sản phẩm để mua 
--Trường :
	id int identity(1,1) primary key,
	soLuong int check(soLuong>0) not null,
	daXoa bit default 0 not null,
--Kết Nối :
	PlaceOfDelivery int foreign key references PlaceOfDelivery(id),
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Purchase--Tên : chờ nhận hàng
(
--Trách Nhiệm : 
	--khi người dùng xác nhận thì sản phẩm sẽ đk đóng gói và gửi đi cho khách hàng
--Trường :
	id int identity(1,1) primary key,
	ngaydat date default  getdate() not null,
	NgayGiao date default  getdate() not null,
	IsDelete bit default 0 not null,
--Kết Nối :
	Cart int foreign key references Cart(id),
	PlaceOfDelivery int foreign key references PlaceOfDelivery(id),
)
go--***************************************************************************
create table Pay  --Tên :tính tiền 
(
--Trách Nhiệm : 
	--tại đây sẽ tính giá trị và lưu lại tổng tiền khách hàng đã đặt sản phẩm
	--tại đây nó sẽ lấy mã giảm giá , khuyến mại giá gốc mà người dùng nhập vào 
	--khi người dùng bấm mua hàng thì sẽ tự động thêm vào bảng này 
--Trường :
	id int identity(1,1) primary key,
	tongtien numeric(18) not null default (0),
	createDate date ,
	traTruoc bit default (0),
	traSau bit default(1),
	TraGop bit default (0),
	IsDelete bit default 0, 
--Kết Nối :
	Purchase int foreign key references Purchase(id),
	promotion int foreign key references promotion(id),
	ProductUsingDiscount int foreign key references ProductUsingDiscount(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table HistoryUserBuyProduct--Tên : lịch sử mua hàng
(
--Trách Nhiệm : 
	-- các mặt hàng đã hủy hoặc đã thành công
--Trường :
	id int identity(1,1) primary key,
	ngaydat date default  getdate() not null,
	NgayGiao date default  getdate() not null,
	IsDelete bit default 0 not null,
--Kết Nối :
	Cart int foreign key references Cart(id),
	Purchase int foreign key references Purchase(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
--THANH TOAN
create table Prepay--Tên :  trả trước
(
--Trách Nhiệm : 
	--thông báo về việc trả trước cho sản phẩm đã mua
--Trường :
	id int identity(1,1) primary key,
	daThanhToan bit default(0),
	DateCreate date ,
	isDelete bit default(0),
--Kết Nối :
	Purchase int foreign key references Purchase(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Postpaid--Tên : trả sau
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	daThanhToan bit default(0),
	DateCreate date ,
	isDelete bit default(0),
--Kết Nối :
	Purchase int foreign key references Purchase(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table Installment--Tên : trả góp
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	tongTien numeric(18) not null,
	tongThang int ,
	monThang numeric(18),
	hoanthanh bit default(0),
	DateCreate date ,
	isDelete bit default(0),
--Kết Nối :
)
go--***************************************************************************
create table InstallmentPaymentPeriod--Tên : tính thời gian trả góp
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	thangHienTai int ,
	tienThangHienTai numeric(18) not null,
	DateCreate date ,
	isDelete bit default(0),
--Kết Nối :
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Installment int foreign key references Installment(id),
)
go--***************************************************************************
create table ContractForm--Tên : mẫu hợp đồng
(
--Trách Nhiệm : 
	--khởi tạo ra các mẫu  hợp đồng khác nhau cho các trường hợp khác nhau
--Trường :
	id int identity(1,1) primary key,
	html nvarchar(max),
	dateCreate date,
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	isDelete bit default (0)
--Kết Nối :
)
go--***************************************************************************
create table IsContract--Tên : hợp đồng
(
--Trách Nhiệm : tạo ra bản hợp đồng hay gọi là hóa đơn cho khách hàng
--Trường :
	id int identity(1,1) primary key,
	html nvarchar(max),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
--Kết Nối :
	ContractForm int foreign key references ContractForm(id),
	Purchase int foreign key references Purchase(id),
)
--VAN CHUYEN
go--***************************************************************************
create table PrepareProduct--Tên : sản phẩm chuẩn bị giao
(
--Trách Nhiệm : 
	--giao cho khách hàng các thứ cần thiết
--Trường :
	id int identity(1,1) primary key,
	daXoa bit default 0 not null,	
	NgayGiao date default  getdate() not null,
	IsDelete bit default 0 not null,
--Kết Nối :
	Seo int foreign key references Seo(id),
	Purchase int foreign key references Purchase(id),
	IsContract int foreign key references IsContract(id),
	Pay int foreign key references Pay(id),
)
go--***************************************************************************
create table TransportProduct--Tên : sản phẩm đang giao
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	NgayGiao date default  getdate() not null,
	IsDelete bit default 0 not null,
--Kết Nối :
	PrepareProduct int foreign key references PrepareProduct(id),
	Seo int foreign key references Seo(id),
	Purchase int foreign key references Purchase(id),
	IsContract int foreign key references IsContract(id),
	Pay int foreign key references Pay(id),
)
go--***************************************************************************
create table SuccessProduct--Tên : sản phẩm giao thành công
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	ngaydat date default  getdate() not null,
	NgayGiao date default  getdate() not null,
	IsDelete bit default 0 not null,
--Kết Nối :
	TransportProduct int foreign key references TransportProduct(id),
	PrepareProduct int foreign key references PrepareProduct(id),
	Seo int foreign key references Seo(id),
	Purchase int foreign key references Purchase(id),
	IsContract int foreign key references IsContract(id),
	Pay int foreign key references Pay(id),
)
go--***************************************************************************
--SAU THANH TOAN
create table Guarantee--Tên : bảo hành
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	createDate date default (getdate()),
	TimeEnd int default(90),
	IsDelete bit default 0 not null,
--Kết Nối :
	SuccessProduct int foreign key references SuccessProduct(id),
	Purchase int foreign key references Purchase(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table ReturnTheProduct--Tên : sản phẩm  trả lại
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	lyDo nvarchar(300),
--Kết Nối :
	TransportProduct int foreign key references TransportProduct(id),
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
--DANH GIA
create table Evaluate--Tên : đánh giá
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key ,
	noidung nvarchar(max) not null,
	soSao int check(soSao>0 and soSao<5) default 3,
	thoiGian date default getdate(),
--Kết Nối :
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table RepEvaluate--Tên : trả lời đánh giá
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	noidung nvarchar(max) not null,
	thoiGian date default getdate(),
--Kết Nối :
	Evaluate int foreign key references Evaluate(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table LikeEvaluate--Tên : thích đánh giá
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key ,
	_like bit  ,
	dislike bit ,
	thoiGian date default getdate(),
--Kết Nối :
	Evaluate int foreign key references Evaluate(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table LikeRepEvaluate--Tên : thích trả lời đánh giá
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key ,
	_like bit  ,
	dislike bit ,
	thoiGian date default getdate(),
--Kết Nối :
	RepEvaluate int foreign key references RepEvaluate(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),

)
-- mua hang doi xu
go--***************************************************************************
--XU SAN PHAM
create table RepositoryXU--Tên : kho xu
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	xu int ,
	mucgiaMin numeric(18),
	mucgiaMax numeric(18),
	DateCreate date ,
	DateEnd date,
	isDelete bit default (0),
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table ProductUsingXu--Tên : cài đặt xu và sản phẩm
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	DateCreate date ,
	DateEnd date,
	SaoDanhGia float,
	SoXu int,
	isDelete bit default (0),
--Kết Nối :
	Product int foreign key references Product(id),
	RepositoryXU int foreign key references RepositoryXU(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table CouponsAndCents--Tên : kho xu của khách hàng
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	xuMin int ,
	xuMax int ,
	DateCreate date ,
	DateEnd date,
	isDelete bit default (0),
--Kết Nối :
	Discount int foreign key references Discount(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table HistoryOfReceivingCoins--Tên : lịch sử đổi xu
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	soXu int,
	DateCreate date,
	DateEnd date,
	isDelete bit default (0),
--Kết Nối :
	Discount int foreign key references Discount(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
-- HO TRO
go--***************************************************************************
create table reasonRepository--Tên : kho lý do
(
--Trách Nhiệm : 
--Trường :
	id int identity(1,1) primary key,
	Ten nvarchar(100),
	link nvarchar(100),
--Kết Nối :
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table DeliveryFailed--Tên : giao hàng thất bại
(
--Trách Nhiệm : 
	--người giao hàng đã đi nhưng khách hàng đã không nhận sản phẩm 
--Trường :
	id int identity(1,1) primary key,
--Kết Nối :
	Purchase int foreign key references Purchase(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table GiveItBack
(
--Trách Nhiệm : 
	--dell hiểu nó có Trách Nhiệm gì heehe 
--Trường :
	id int identity(1,1) primary key,
	Ten nvarchar(100),
	link nvarchar(100),
--Kết Nối :
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table CatalogSupport--Tên : hỗ trọ sản phẩm
(
--Trách Nhiệm : 
	--lưu các vấn đề thắc mắc về sản phẩm
--Trường :
	id int identity(1,1) primary key,
	Ten nvarchar(100),
	link nvarchar(100),
--Kết Nối :
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table RepositorySupport--Tên : kho hỗ trợ
(
--Trách Nhiệm : 
	--nơi mà phần mục lục của trang hỗ trợ được lưu lại
--Trường :
	id int identity(1,1) primary key,
	Ten nvarchar(100),
	link nvarchar(100),
--Kết Nối :
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table CustomerCare--Tên : chăm sóc khách hàng
(
--Trách Nhiệm : 
	--chăm sóc các bé cưng
--Trường :
	id int identity(1,1) primary key,
	blog nvarchar(max),
--Kết Nối :
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table AccountSupport--Tên : hỗ trợ về tài khoản
(
--Trách Nhiệm : 
	-- ở đây sẽ tiếp nhân phản hồi từ các khách hàng về vấn đề tài khoản
	-- đưa ra hướng giải quyết cho họ
--Trường :
	id int identity(1,1) primary key,
	blog nvarchar(max),
--Kết Nối :
	Seo int foreign key references Seo(id),
)
--blog
go--***************************************************************************
create table DescriptionProduct--Tên : bài viết sản phẩm
(
--Trách Nhiệm : 
	--bài viết sẽ làm rõ cho người dùng thấy sản phẩm họ quan tâm có chi tiết ntn
--Trường :
	id int identity(1,1) primary key,
	blog text,
	createDate date default(getdate()),
	IsDelete bit default (0),
--Kết Nối :
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
--BACK UP
--HÀNH ĐỘNG CỦA USER
go--***************************************************************************
create table LogUser--Tên : lịch sử của user 
(
--Trách Nhiệm : 
	--kết hợp với phần bên dưới xem khách hàng có đủ khả năng mua sản phẩm không
--Trường :
	id int identity(1,1) primary key,
	dateCreate date,
--Kết Nối :
	Product int foreign key references Product(id),
	NameUser varchar(50) foreign key references LoginAccount(NameUser),
)
go--***************************************************************************
create table IsAction--Tên : hành động của user
(
--Trách Nhiệm : 
	--lưu lại các trang mà người dùng xem qua
	--kiểm tra xem tài khoản này thích mặt hàng nào và đang tìm hiểu mặt hàng nào 
--Trường :
	id int identity(1,1) primary key,
	urlClick nvarchar(300) not null,
	timeCreate datetime not null,
	dateEnd datetime not null,
	isDelete bit default 0,
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser)
)
go--***************************************************************************
create table KeySearch--Tên : user tìm kiếm từ khóa
(
--Trách Nhiệm : 
	--khi khách hàng tìm kiếm từ khóa thì nó sẽ dk lưu tại đây
	-- nó sẽ dùng để xác nhận sản phẩm nào có nhiều khách ghé thăm
--Trường :
	id int identity(1,1) primary key,
	keySearch nvarchar(300) not null,
	dateSearch date default(getdate()),
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser)
)
go--***************************************************************************
create table ChangePass--Tên : lịch sử thay đổi mật khẩu
(
--Trách Nhiệm : 
	--lưu lại các lần đổi mật khẩu của người dùng để khi có biến thì chúng ta có thế sử lý nó
--Trường :
	id int identity(1,1) primary key,
	passOld varchar(100) not null,
	passNew varchar(100) not null,
	timeChange date default(getdate()),
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser)
)
go--***************************************************************************
create table capcha--Tên : mã để xác nhận đăng nhập và đổi mật khẩu
(
--Trách Nhiệm : 
	--mã code này dùng để xác thực người dùng khi đổi mật khẩu của tài khoản
--Trường :
	id int identity(1,1) primary key,
	code varchar(300) not null,
	img nvarchar(300),
	dateCreate date  not null,
	dateEnd date not null,
	sussces bit default 0 not null,
--Kết Nối :
	NameUser varchar(50) foreign key references LoginAccount(NameUser)
)
--SETTING
create table Advertisement--Tên : quảng cáo
(
--Trách Nhiệm : 
	--quảng cáo ngoài cho các sản phẩm tiềm năng khi người dùng vào trang home
--Trường :
	id int identity(1,1) primary key,
	avatarRieng nvarchar(100),
	DateCreate date,
	Isdelete bit default 0,
	noidung nvarchar(100),
--Kết Nối :
	Product int foreign key references Product(id),
)
go--***************************************************************************
create table IsPolicy--Tên : chính sách
(
--Trách Nhiệm : 
	--chính sách của trang web
--Trường :
	id int identity(1,1) primary key,
	noidung nvarchar(max),
	Isdelete bit default 0,
--Kết Nối :
	Seo int foreign key references Seo(id),
)
go--***************************************************************************
create table ErrorOperation--Tên : lỗi hệ thống
(
--Trách Nhiệm : 
	--Khi có lỗi bất ngờ sảy ra thì sẽ đổ mã lỗi nó vào đây
--Trường :
	id int identity(1,1) primary key,
	Error nvarchar(300),
	createDate date ,
	Isdelete bit default 1,
--Kết Nối :
)