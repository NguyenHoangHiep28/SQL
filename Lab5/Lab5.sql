USE EXAMPLE3
GO
CREATE TABLE PhongBan(
	MaPB varchar(7) PRIMARY KEY,
	TenPB nvarchar(50)
)
GO

CREATE TABLE NhanVien(
	MaNV varchar(7) PRIMARY KEY,
	TenNV nvarchar(50),
	NgaySinh Datetime CHECK (NgaySinh < GETDATE()),
	SoCMND char(9) CHECK (LEN(SoCMND) = 9 AND NOT SoCMND like '%[A-Z]%' AND NOT SoCMND LIKE '%[a-z]%'),
	GioiTinh Char(1) CHECK (GioiTinh lIKE 'M' OR GioiTinh LIKE 'F') DEFAULT 'M',
	DiaChi nvarchar(100),
	NgayVaoLam Datetime,
	MaPB varchar(7) FOREIGN KEY REFERENCES PhongBan(MaPB)
)
 ALTER TABLE NhanVien 
	ADD CONSTRAINT Chk_Date CHECK (NgayVaoLam >DATEADD(yy, 20, NgaySinh))
GO
CREATE TABLE LuongDA(
	MaDA varchar(8),
	MaNV varchar(7) FOREIGN KEY REFERENCES NhanVien(MaNV),
	NgayNhan Datetime NOT NULL DEFAULT GETDATE(),
	SoTien Money CHECK (SoTien > 0),
	CONSTRAINT PK_LuongDA PRIMARY KEY (MaDA, MaNV)
)
GO
INSERT INTO PhongBan VALUES
('PB01','Quan Tri'),
('PB02','Kiem Soat'),
('PB03','San Xuat'),
('PB04','Quan Ly'),
('PB05','Hanh Chinh');
GO
INSERT INTO NhanVien VALUES
('NV01','Nguyen Van A','1995-10-25','759385069','M','Chi Lang, Lang Son','2015-12-12','PB02'),
('NV02','Hoang Van B','1996-08-15','847493729','M','Chi Lang, Lang Son','2017-10-17','PB03'),
('NV03','Tran Thi C','1997-09-13','494847402','F','Chi Lang, Lang Son','2018-11-20','PB05'),
('NV04','Le Van D','1990-06-17','183575946','M','Chi Lang, Lang Son','2014-12-20','PB03'),
('NV05','Dang Thi E','1996-08-20','484759577','F','Chi Lang, Lang Son','2018-09-12','PB01');
GO
INSERT INTO NhanVien VALUES ('NV01', 'NGuyen Van A', '2000-01-12', '847564837', 'M', 'Chi Lang', '2020-01-13', 'PB02')
INSERT INTO LuongDA(MaDA, MaNV, SoTien) VALUES
('DXD01', 'NV01', 1000000),
('DXD02', 'NV02', 1500000),
('DXD03', 'NV01', 2000000),
('DXD01', 'NV03', 800000);
INSERT INTO LuongDA VALUES ('DXD05', 'NV05','2003-10-12 20:50:00', 3000000);
--2
SELECT * FROM LuongDA
SELECT * FROM NhanVien
SELECT * FROM PhongBan
--3
SELECT * FROM NhanVien WHERE GioiTinh LIKE 'F'
--4
SELECT MaDA FROM LuongDA
--
DROP TABLE LuongDA
GO
DROP TABLE NhanVien 
GO
DROP TABLE PhongBan

--5
GO
SELECT MaNV, Sum(SoTien) FROM LuongDA  GROUP BY MaNV 
--6
SELECT TenPB, MaNV, TenNV FROM NhanVien inner join PhongBan
ON NhanVien.MaPB = PhongBan.MaPB WHERE TenPB LIKE 'San Xuat';
--7
SELECT TenNV, SoTien FROM LuongDA INNER JOIN NhanVien
ON LuongDA.MaNV = NhanVien.MaNV WHERE MaPB LIKE 'PB05'

--8
SELECT MaPB, COUNT(*) FROM NhanVien GROUP BY MaPB
--9
SELECT MaNV FROM LuongDA GROUP BY MaNV
--10
SELECT MaPB, Count(MaPB) AS SoLuong FROM NhanVien GROUP BY MaPB 
HAVING COUNT(MaPB) >= ALL(SELECT COUNT(MaPB) FROM NhanVien GROUP BY MaPB)
--11
SELECT MaPB, Count(MaNV) FROM NhanVien WHERE MaPB LIKE 'PB05' GROUP BY MaPB
--12
SELECT sum(SoTien) FROM NhanVien inner join LuongDA ON NhanVien.MaNV = LuongDa.MaNV
WHERE SoCMND LIKE '%9'
--13
SELECT MaNV, Sum(SoTien) FROM LuongDA GROUP BY MaNV 
HAVING Sum(SoTien) >= ALL (SELECT Sum(SoTien) FROM LuongDA GROUP BY MaNV)

--14
SELECT * FROM NhanVien INNER JOIN LuongDA ON NhanVien.MaNV = LuongDA.MaNV 
WHERE MaPB LIKE 'PB05' AND GioiTinh LIKE 'F' AND SoTien > 1200000
--15
SELECT MaPB, Sum(SoTien) AS TongLuong FROM LuongDA inner join NhanVien ON LuongDA.MaNV = NhanVien.MaNV
GROUP BY MaPB
--16
SELECT MaDA FROM LuongDA GROUP BY MaDA HAVING COUNT(MaNV) >= 2
--17
SELECT * FROM NhanVien WHERE TenNV LIKE 'N%'
--18
SELECT TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB FROM 
NhanVien inner join LuongDA ON NhanVien.MaNV = LuongDA.MaNV
WHERE YEAR(NgayNhan) = 2003
--19
SELECT TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB FROM
NhanVien left join LuongDA ON NhanVien.MaNV = LuongDA.MaNV 
WHERE MaDA IS NULL
--20
DELETE FROM LuongDA WHERE MaDA LIKE 'DXD02'
--21
DELETE FROM LuongDA WHERE SoTien = 2000000
--22
UPDATE LuongDA SET SoTien = SoTien + SoTien*10/100
WHERE MaDA LIKE 'DXD01'
--23
DELETE FROM NhanVien WHERE
NOT EXISTS(SELECT MaNV FROM LuongDA WHERE LuongDA.MaNV = NhanVien.MaNV)
--24
UPDATE NhanVien SET NgayVaoLam = '2019/12/02' WHERE MaPB LIKE 'PB05'