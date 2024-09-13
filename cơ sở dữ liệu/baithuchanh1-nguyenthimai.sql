select * from PhongBan;
insert into PhongBan
values ('1', 'Phòng phần mềm', '11'),
('2', 'Phòng kiểm thử', '5'),
('3', 'Phòng phần mềm', '4');
show create table PhongBan;

select * from NhanVien;
insert into NhanVien
values ('1', 'Nguyễn Hải Đăng', '08/08/77 12:00:00' , 'Hòa Bình', '4000000.000', '	True', '1'),
('2', 'Trần Cao Hà', '01/09/78 12:00:00', 'Yên Bái', '3500000.000', 'True', '1'),
('3', 'Hoàng Hải Nam', '02/01/75 12:00:00', 'Hà Nội', '2300000.000', 'False', '1'),
('4', 'Trần Hồng Nam', '07/08/76 12:00:00', 'Nam Định', '3200000.000', 'True', '2'),
('5', 'Lê Thị Hẳng', '04/03/76 12:00:00', 'Thanh Hóa', '6700000.000', 'False' ,'3'),
('6', 'Nguyễn Thị Hẳng', '09/09/80 12:00:00', 'Hải Phòng', '9900000.000', 'False' ,'2'),
('7', 'Lê Thị Vân Anh', '05/03/81 12:00:00', 'Hà Nội', '3500000.000', 'False' ,'1'),
('8', 'Ma Văn Cư', '05/08/83 12:00:00', 'Yên Bái', '2300000.000', 'True' ,'3'),
('9', 'Đinh Hồng Nam', '03/08/82 12:00:00', 'Bắc Ninh', '6700000.000', '	True' ,'3'),
('10', 'Hồ Viết Duẩn', '02/04/84 12:00:00', 'Nghệ An', '3500000.000', 'True' ,'3'),
('11', 'Trần Đức Nghĩa', '01/01/76 12:00:00', 'Hà Nội', '6900000.000', 'True' ,'1');
show create table NhanVien;

select * from CongTrinh;
insert into CongTrinh
values ('1', 'Mobile', '08/08/05 12:00:00', '08/08/06 12:00:00', 'HITC'),
('2', 'Re-issue', '06/08/07 12:00:00', '07:07:07 12:00:00', 'FPT Cầu Giấy'),
('3', 'Mobile Contact', '18/01/06 12:00:00', '09/09/07 12:00:00', 'FPT Cầu Giấy'),
('4', 'Wings', '28/08/04 12:00:00', '05/08/05 12:00:00', 'FPT Cầu Giấy');
show create table CongTrinh;

select * from ThamGia;
insert into ThamGia 
values  ('1', '7', '70'), ('1', '9', '60'), ('1', '11', '80'), ('2', '1', '80'), ('2', '2', '90'), ('2', '5', '90'), ('2', '11', '100');
show create table ThamGai;
