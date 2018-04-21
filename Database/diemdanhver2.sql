CREATE TABLE NGANH(
    maNganh VARCHAR(15) PRIMARY KEY,
    tenNganh VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT fk_maKhoa_CB FOREIGN KEY(maKhoa) REFERENCES KHOA(maKhoa)
);
CREATE TABLE KHOA(
    maKhoa VARCHAR(15) PRIMARY KEY,
    tenKhoa VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE LOP(
    maLop VARCHAR(15) PRIMARY KEY,
    tenLop VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT fk_maNganh_CB FOREIGN KEY(maNganh) REFERENCES KHOA(maNganh)
);
CREATE TABLE BOMON(
    maBoMon VARCHAR(15) PRIMARY KEY,
    tenBoMon VARCHAR(50) UNIQUE NOT NULL,
    CONSTRAINT fk_maKhoa_CB FOREIGN KEY(maKhoa) REFERENCES KHOA(maKhoa)
);

INSERT into NGANH value('52140202','Giáo dục Tiểu học','SP');
INSERT into NGANH value('52140204','Giáo dục Công dân','SP');
INSERT into NGANH value('52140206','Giáo dục Thể chất','TC');
INSERT into NGANH value('52520214','Kỹ thuật máy tính','DI');
INSERT into NGANH value('52480101','Khoa học máy tính','DI');
INSERT into NGANH value('52480102','Truyền thông và mạng máy tính','DI');
INSERT into NGANH value('52480103','Kỹ thuật phần mềm','DI');
INSERT into NGANH value('52480104','Hệ thống thông tin','DI');
INSERT into NGANH value('52480201','Công nghệ thông tin','DI');
INSERT into NGANH value('52510401','Công nghệ kỹ thuật hóa học','CN');

INSERT into KHOA value('DI','Khoa Công nghệ thông tin và truyền thông');
INSERT into KHOA value('CN','Khoa Công nghệ');
INSERT into KHOA value('SP','Khoa Sư phạm');
INSERT into KHOA value('KH','Khoa Khoa học tự nhiên');
INSERT into KHOA value('TS','Khoa Thủy sản');
INSERT into KHOA value('NN','Khoa Nông nghiệp');
INSERT into KHOA value('HA','Khoa Phát triển nông thôn');
INSERT into KHOA value('DB','Khoa Dự bị dân tọc');
INSERT into KHOA value('MT','Khoa Chính trị');
INSERT into KHOA value('TC','Khoa Thể chất');
INSERT into KHOA value('XH','Khoa Khoa học Xã hội NV');


INSERT into LOP value('KH17Y1A2','Tin học Ứng dụng A2 K43','BM.THUD');
INSERT into LOP value('DI1796A1','Kỹ thuật phần mềm A1 K43','BM.CNPM');
INSERT into LOP value('DI17Y9A2','Truyền thông và mạng máy tính A2 K43','BM.MMT&TT');
INSERT into LOP value('FL17X1A1','Sư phạm Tiếng Anh A1 K43','BM.NN');
INSERT into LOP value('DI1496A2','Kỹ thuật phần mềm A2 K40','BM.CNPM');
INSERT into LOP value('HG1713A1','Nuôi trồng thủy sản A1 K43','BM.NTTS');
INSERT into LOP value('HG1722A1','Quản trị kinh doanh A1 K43','BM.QTKD');
INSERT into LOP value('DI14V7A3','Công nghệ thông tin A3 K40','BM.CNNT');
INSERT into LOP value('DI1596A1','Kỹ thuật phần mềm A1 K41','BM.CNPM');


INSERT into BOMON value('BM.CNPM','Bộ môn Công nghệ phần mềm','DI');
INSERT into BOMON value('BM.GDTC','Bộ môn Giáo dục thể chất','TC');
INSERT into BOMON value('BM.HTTT','Bộ môn Hệ thống thông tin','DI');
INSERT into BOMON value('BM.QTKD','Bộ môn Quản trị kinh doanh','MT');
INSERT into BOMON value('BM.MMT&TT','Bộ môn Truyền thông và mạng máy tính','DI');
INSERT into BOMON value('BM.CK','Bộ môn Cơ khí','CN');
INSERT into BOMON value('BM.DDT','Bộ môn Điện điện tử','CN');
INSERT into BOMON value('BM.CNTT','Bộ môn Công nghệ thông tin','DI');
INSERT into BOMON value('BM.THUD','Bộ môn Tin học ứng dụng','KH');
INSERT into BOMON value('BM.NTTS','Bộ môn Nuôi trồng thủy sản','TS');
INSERT into BOMON value('BM.NN','Bộ môn Ngoại ngữ','SP');


CREATE TABLE canbo(
    maCB VARCHAR(15) PRIMARY KEY,
    tenCB VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    maBoMon VARCHAR(15) NOT NULL,
    maKhoa VARCHAR(15) NOT NULL,
    maThe VARCHAR(15),
    CONSTRAINT fk_maBoMon_CB FOREIGN KEY(maBoMon) REFERENCES BOMON(maBoMon),
    CONSTRAINT fk_maKhoa_CB FOREIGN KEY(maKhoa) REFERENCES KHOA(maKhoa)
);
CREATE TABLE sinhvien(
    maSV VARCHAR(15) PRIMARY KEY,
    tenSV VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    maLop VARCHAR(15) NOT NULL,
    maNganh VARCHAR(15) NOT NULL,
    maKhoa VARCHAR(15) NOT NULL,
    nienKhoa VARCHAR(15) NOT NULL,
    maThe VARCHAR(15),
    CONSTRAINT fk_maLop_SV FOREIGN KEY(maLop) REFERENCES LOP(maLop),
    CONSTRAINT fk_maNganh_SV FOREIGN KEY(maNganh) REFERENCES NGANH(maNganh),
    CONSTRAINT fk_maKhoa_SV FOREIGN KEY(maKhoa) REFERENCES KHOA(maKhoa)
);
CREATE TABLE sukien(
    maSK VARCHAR(15) PRIMARY KEY,
    tenSK VARCHAR(50) NOT NULL,
    ngayDienRa DATE NOT NULL,
    gioVao TIME NOT NULL,
    gioKTVao TIME DEFAULT NULL,
    gioRa TIME NOT NULL,
    gioKTRa TIME DEFAULT NULL,
    batBuoc BOOLEAN DEFAULT FALSE,
    diemDanh BOOLEAN DEFAULT FALSE,
    CHECK(gioVao < gioRa 
          AND gioKTVao > gioVao 
          AND gioKTVao < gioRa 
          AND gioKTRa > gioRa)
);

CREATE TABLE sinhvienthamgia(
    maSK VARCHAR(15) NOT NULL,
    maSV VARCHAR(50) NOT NULL,
    thoiGianVao TIME DEFAULT NULL,
    thoiGianRa TIME DEFAULT NULL,
    PRIMARY KEY(maSK, maSV),
    CONSTRAINT fk_maSK_SV FOREIGN KEY(maSK) REFERENCES sukien(maSK),
    CONSTRAINT fk_maSV_SV FOREIGN KEY(maSV) REFERENCES sinhvien(maSV)
);
CREATE TABLE canbothamgia(
    maSK VARCHAR(15) NOT NULL,
    maCB VARCHAR(15) NOT NULL,
    thoiGianVao TIME DEFAULT NULL,
    thoiGianRa TIME DEFAULT NULL,
    PRIMARY KEY(maSK, maCB),    
    CONSTRAINT fk_maSK_CB FOREIGN KEY(maSK) REFERENCES sukien(maSK),
    CONSTRAINT fk_maCB_CB FOREIGN KEY(maCB) REFERENCES canbo(maCB)
);