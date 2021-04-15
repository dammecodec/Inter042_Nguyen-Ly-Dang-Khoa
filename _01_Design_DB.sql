drop database if exists Furama;

create database Furama;

use Furama;

create table ViTri (
	idViTri int primary key,
    `TenViTri` varchar(45)
);
create table TrinhDo (
	idTrinhDo int primary key,
    `TrinhDo` varchar(45)
);
create table BoPhan (
	idBoPhan int primary key,
    `TenBoPhan` varchar(45)
);
create table NhanVien (
	idNhanVien int primary key,
    `HoTen` varchar(45),
    idVitri int,
    foreign key (idViTri) references ViTri(idViTri),
    idTrinhDo int,
    foreign key (idTrinhDo) references TrinhDo(idTrinhDo),
    idBoPhan int,
    foreign key (idBoPhan) references BoPhan(idBoPhan),
    NgaySinh date,
    SoCMTND varchar(45),
    Luong varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45)
);
create table LoaiKhach (
	idLoaiKhach int primary key,
    `TenLoaiKhach` varchar(45)
);
create table KhachHang (
	idKhachHang int primary key,
    idLoaiKhach int,
    foreign key (idLoaiKhach) references LoaiKhach(idLoaiKhach),
    `HoVaTen` varchar(45),
    NgaySinh date,
    SoCMTND varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45)
);
create table KieuThue (
	idKieuThue int primary key,
    TenKieuThue varchar(45),
    Gia int
);
create table LoaiDichVu (
	idLoaiDichVu int primary key,
    TenLoaiDichVu varchar(45)
);
create table DichVu (
	idDichVu int primary key,
    TenDichVu varchar(45),
    DienTich int,
    SoTang int,
    SoNguoiToiDa varchar(45),
    ChiPhiThue varchar(45),
    idKieuThue int,
    idLoaiDichVu int,
	foreign key(idKieuThue) references KieuThue(idKieuThue),
	foreign key(idLoaiDichVu) references LoaiDichVu(idLoaiDichVu),
    TrangThai varchar(45)
);
create table HopDong (
	idHopDong int primary key,
    idNhanVien int,
    idKhachHang int,
    idDichVu int,
    foreign key(idNhanVien) references NhanVien(idNhanVien),
    foreign key(idKhachHang) references KhachHang(idKhachHang),
    foreign key(idDichVu) references DichVu(idDichVu),
    NgayLamHopDong date,
    NgayKetThuc date,
    TienDatCoc int,
    TongTien int
);
create table DichVuDiKem (
	idDichVuDiKem int primary key,
    TenDichVuDiKem varchar(45),
    Gia int,
    DonVi int,
    TrangThaiKhaDung varchar(45)
);
create table HopDongChiTiet (
	idHopDongChiTiet int primary key,
    idHopDong int,
    idDichVuDiKem int,
    foreign key(idHopDong) references HopDong(idHopDong),
    foreign key(idDichVuDiKem) references DichVuDiKem(idDichVuDiKem),
    SoLuong int
);
insert into ViTri
values
(1,'Le Tan'),
(2,'Phuc Vu'),
(3,'Chuyen Vien'),
(4,'Giam Sat'),
(5,'Quan Ly'),
(6,'Giam Doc');

insert into TrinhDo
values
(1,'Trung Cap'),
(2,'Cao Dang'),
(3,'Dai Hoc'),
(4,'Sau Dai Hoc');

insert into BoPhan
values
(1,'Sale - Marketing'),
(2,'Hanh Chinh'),
(3,'Phuc Vu'),
(4,'Quan Ly');

insert into LoaiKhach
values
(1,'Member'),
(2,'Silver'),
(3,'Gold'),
(4,'Platinum'),
(5,'Diamond');

insert into KieuThue
values
(1,'4n3d',900000),
(2,'3n2d',800000),
(3,'2n1d',700000),
(4,'1n',500000);

insert into DichVuDiKem
values
(1,'Massage',100000,1,'Con'),
(2,'Karaoke',200000,2,'Con'),
(3,'Thuc An',400000,5,'Het'),
(4,'Nuoc Uong',20000,20,'Con'),
(5,'Thue Xe Tham Quan Resort',600000,3,'Con');

insert into LoaiDichVu
values
(1,'Cao Cap'),
(2,'Trung Cap'),
(3,'Binh Dan');
insert into NhanVien
values
(1,'Hoang Thi Hieu',2,4,4,'1988/02/23','123456789',3500,'0123456789','hieuht@gmail.com','Quang Nam'),
(2,'Ho Nhu Y',5,2,2,'1990/05/13','123786789',3000,'0154756789','honhuy@gmail.com','Da Nang'),
(3,'Kieu Nguyet Nga',1,3,4,'1986/04/15','890456789',2500,'0998456789','ngakieunguyet@gmail.com','Quang Tri'),
(4,'Nguyen Tran Ngoc Khue',1,2,3,'1998/05/29',4000,'839283929','0123466479','khuetran@gmail.com','Quang Nam'),
(5,'Nguyen Tan Loc',3,4,2,'1989/12/11','123656589',2800,'0123443589','locnt@gmail.com','Da Nang'),
(6,'Hoang Mai Linh',5,4,2,'1998/02/24','556456789',3100,'0123489057','linhhoang@gmail.com','Hue'),
(7,'Nguyen Tran Minh Nghi',5,4,2,'1980/10/18','123231569',3300,'0126678989','nghitran@gmail.com','Quang Ngai'),
(8,'Tran Dinh Trong',1,3,2,'1992/09/19','188906789',3450,'0123459990','trongdinh@gmail.com','Da Nang'),
(9,'Ha Van Tinh',5,4,3,'1987/03/17','123873789','012640789',4150,'hatinh@gmail.com','Qui Nhon'),
(10,'Phan Thi Ne',1,2,4,'1980/06/20','123986789','0124906789',4000,'nephan@gmail.com','Da Nang');

insert into KhachHang
values
(1,5,'Kieu Minh Tuan','1988/02/23','123456789','0123456789','kieutuan@gmail.com','Da Nang'),
(2,5,'Hua Minh Dat','1987/01/22','127856789','0123456889','minhdat@gmail.com','Quang Tri'),
(3,4,'Bui Cat Phuong','1990/08/12','123410989','0123440389','phuongcat@gmail.com','Da Nang'),
(4,5,'Ha Anh Tuan','1988/09/16','123422789','0123290789','haanhtuan@gmail.com','Ha Noi'),
(5,3,'Lam Chan Khang','1985/04/11','200293928','012345992','chankhang@gmail.com','Quang Tri'),
(6,2,'Ngo Mai Trang','1997/03/14','123422789','0907456789','ngotrang@gmail.com','Quang Nam'),
(7,5,'Nguyen Hoan Dung','1992/09/10','243466289','0128806789','hoangdung@gmail.com','Da Nang'),
(8,4,'Nguyen Duc Thien','1986/03/26','783456789','0990456789','ryhmastic@gmail.com','Ha Noi'),
(9,5,'Nguyen Duc Cuong','1988/09/19','323456789','0776456789','duccuong@gmail.com','Hai Phong'),
(10,2,'Lam Chan Huy','1991/12/12','342456789','0998256789','chanhuy@gmail.com','Hue');

insert into DichVu
values
(1,'Villa',500,6,'12','70000000',1,1,'Con'),
(2,'House',350,4,'10','60000000',1,2,'Con'),
(3,'Villa',500,6,'12','70000000',2,1,'Con'),
(4,'Room',250,4,'8','7000000',3,3,'Con');

insert into HopDong
values
(1,5,7,1,'2018/01/24','2019/01/28',35000000,120000000),
(2,4,4,2,'2019/02/13','2019/02/15',30000000,100000000),
(3,2,7,1,'2019/01/24','2018/01/28',35000000,120000000),
(4,3,8,3,'2019/06/17','2019/06/20',40000000,125000000),
(5,9,5,2,'2019/07/18','2019/07/20',30000000,110000000);

insert into HopDongChiTiet
values
(1,1,3,5),
(2,3,1,4),
(3,2,2,3),
(4,5,2,5),
(5,4,4,3),
(6,1,3,2);