create database bai1;
use bai1;
create table if not exists Khoa(
   MaKhoa char(10) not null, primary key(MaKhoa), 
   TenKhoa varchar(50) unique
);
create table if not exists SinhVien(
   MaSV char(20) not null, primary key(MaSV),
   HoSV  varchar(50),
   Ten varchar(50),
   Ngaysinh Datetime,
   Phai char(3) check (Phai in ('nam', 'nu')),
   MaKhoa char(5), constraint Fk_makhoa foreign key(MaKhoa) references Khoa(MaKhoa)
);
create table if not exists MonHoc(
   MaMH char(10) not null, primary key(MaMH),
   TenMH varchar(50),
   Sotiet int
);
create table if not exists KetQua(
   MaSV char(10) not null,
   MaMH char(10) not null,
   LanThi int default 1 not null,
   primary key(MaSV,MaMH,LanThi),
   Diem numeric(5,1) check (Diem between 0 and 10)
);
alter table KetQua add constraint Fk1_masv foreign key(MaSV) references SinhVien(MaSV);
alter table KetQua add constraint Fk2_mamh foreign key(MaMH) references MonHoc(MaMH);
insert into Khoa(MaKhoa, TenKhoa)
values ('AVAN', 'Khoa Anh Văn'),('CNTT', 'Khoa cong nghe thong tin'),
	  ('DTVT', 'Khoa dien tu vien thong'),('QTKD', 'Khoa quan tri kinh doanh');

insert into SinhVien(HoSV, Ten, MaSV, Ngaysinh, Phai, MaKhoa)
values ('Tran Minh','Son','S001','1986/05/01 12:00','NAM','CNTT'),
	   ('Nguyen quoc','bao','S002','1986/05/16 12:00','NAM','CNTT'),
       ('Phan Anh','Tung','S003','1983/12/20 12:00','Nam','QTKD'),
       ('Bui Thi Anh','Thu','S004','1985/02/01 12:00','Nu','QTKD'),
       ('Le Thi','Lan','S005','1987/03/07 12:00','Nu','DTVT'),
       ('Nguyen Thi','Lam','S006','1984/11/11 12:00','Nu','DTVT'),
       ('Phan Thi','Ha','S007','1988/03/07 12:00','Nu','CNTT'),
       ('Tran The','Dung','S008','1985/10/21 12:00','Nam','CNTT');

insert into MonHoc(MaMH, TenMH, Sotiet)
values ('AV','Anh Van',45),('CSDL','Co so du lieu',45),
		('KTLT','Ki thuat lap trinh',60),('KTTC','Ke toan tai chinh',45),
        ('TCC','Toan cao cap',60),('THVP','Tin hoc van phong',30),
        ('TTNT','Tri tue nhan tao',60);

insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('S001','CSDL',1,4),('S001','TCC',1,6),('S002','CSDL',1,3),('S002','CSDL',2,6),
	   ('S003','KTTC',1,5),('S004','AV',1,8),('S004','THVP',1,4),('S004','THVP',2,8),
       ('S006','TCC',1,5),('S007','AV',1,2),('S007','AV',2,9),('S007','KTLT',1,6),
       ('S008','AV',1,7);

create database cau2;
use cau2;
create table if not exists PhongBan(
	MaPB int, primary key(MaPB),
    TenPB varchar(50) not null,
    nguoiquanly int not null
);
create table if not exists NhanVien(
	MaNV int, primary key(MaNV),
    TenNV varchar(50) not null,
    Ngaysinh datetime,
    Diachi varchar(50),
    Luong int,
    Gioitinh bit,
    MaPB int not null
);
create table if not exists CongTrinh(
	MaCT int, primary key(MaCT),
    TenCT varchar(50) not null,
    NgayKC datetime not null,
    NgayHT datetime not null,
    Diadiem varchar(50)
);
create table if not exists ThamGia(
	MaCT int not null,
    MaNV int not null,
    primary key(MaCT, MaNV),
    Songaycong numeric(18,0) not null
);
alter table NhanVien add constraint Fk1_mapb foreign key(MaPB) references PhongBan(MaPB);
alter table ThamGia add constraint Fk2_mact foreign key(MaCT) references CongTrinh(MaCT);
alter table ThamGia add constraint Fk3_manv foreign key(MaNV) references NhanVien(MaNV);
alter table NhanVien add check (Luong > 0);
alter table CongTrinh alter NgayKC set default '2024/05/09 12:00';
select * from PhongBan;
insert into PhongBan (MaPB, TenPB, Nguoiquanly)
values (1	, 'Phòng phần mềm', 11), (2	, 'Phòng kiểm thứ', 5), (3	, 'Phòng phần mềm', 4);

show create table NhanVien;

select * from NhanVien;
insert into NhanVien (MaNV, TenNV, Ngaysinh, Diachi, Luong, Gioitinh, MaPB)
values (1	, 'Nguyễn Hải Đăng'	, '77-08-08 12:00:00', 'Hoà Bình', '4000000.0000', 1, 1), (2	, 'Trần Cao Hà'	, '78-09-01 12:00:00', 'Yên Bái'	, '3500000.0000', 1, 1),
		(3	, 'Hoàng Hải Nam'	, '75-01-02 12:00:00', 'Hà Nội'		, '2300000.0000', 0, 1), 
        (4	, 'Trần Hồng Nam'	, '76-08-07 12:00:00', 'Nam Định'	, '3200000.0000', 1, 2),
        (5	, 'Lê Thị Hằng'		, '76-03-04 12:00:00', 'Thanh Hoá'	, '6700000.0000', 0, 3), 
        (6	, 'Nguyễn Thị Hằng'	, '80-09-09 12:00:00', 'Hải Phòng'	, '9900000.0000', 0, 2),
        (7	, 'Lê Thị Vân Anh'	, '81-03-05 12:00:00', 'Hà Nội'		, '3500000.0000', 0, 1), 
        (8	, 'Mai Văn Cư'		, '83-08-05 12:00:00', 'Yên Bái'	, '2300000.0000', 1, 3),
        (9	, 'Đinh Hồng Nam'	, '82-08-03 12:00:00', 'Bắc Ninh'	, '6700000.0000', 1, 3), 
        (10	, 'Hồ Viết Duẩn'	, '84-04-02 12:00:00', 'Nghệ An'	, '3500000.0000', 1, 3),
        (11	, 'Trần Đức Nghĩa'	, '76-01-01 12:00:00', 'Hà Nội'		, '9900000.0000', 1, 1);
        
show create table CongTrinh;

select * from CongTrinh;
insert into CongTrinh (MaCT, TenCT, NgayKC, NgayHT, Diadiem)
values (1	, 'Mobile contact'	, '05-08-08 12:00:00', '06-08-08 12:00:00', 'HITC'),
		(2	, 'Re-issue'		, '07-08-06 12:00:00', '07-07-07 12:00:00', 'FPT Cầu Giấy'),
        (3	, 'Mobile contact'	, '06-01-18 12:00:00', '07-09-09 12:00:00', 'FPT Cầu Giấy'),
        (4	, 'Wings'			, '04-08-28 12:00:00', '05-08-05 12:00:00', 'FPT Cầu Giấy');

show create table ThamGia;

select * from ThamGia;
insert into ThamGia (MaCT, MaNV, Songaycong)
values (1	, 7	 ,70),
		(1	, 9	 ,60),
        (1	, 11 ,80),
        (2	, 1	 ,80),
        (2	, 2	 ,90),
        (2	, 5	 ,90),
        (2	, 11 ,100);
