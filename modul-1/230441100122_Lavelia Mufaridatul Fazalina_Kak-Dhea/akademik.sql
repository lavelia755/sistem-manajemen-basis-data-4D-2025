CREATE DATABASE akademik;
USE akademik;


CREATE TABLE Prodi (
    id_prodi INT PRIMARY KEY AUTO_INCREMENT,
    nama_prodi VARCHAR(100) NOT NULL
);


CREATE TABLE Mahasiswa (
    nim CHAR(12) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tanggal_lahir DATE,
    id_prodi INT,
    FOREIGN KEY (id_prodi) REFERENCES Prodi(id_prodi)
);


CREATE TABLE Dosen (
    nidn CHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    gelar VARCHAR(50),
    email VARCHAR(100) UNIQUE
);


CREATE TABLE MataKuliah (
    kode_mk CHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL
);


CREATE TABLE Dosen_MataKuliah (
    nidn CHAR(10),
    kode_mk CHAR(10),
    FOREIGN KEY (nidn) REFERENCES Dosen(nidn),
    FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk)
);


CREATE TABLE KRS (
    id_krs INT PRIMARY KEY AUTO_INCREMENT,
    nim CHAR(12),
    kode_mk CHAR(10),
    semester INT,
    tahun_ajaran VARCHAR(10),
STATUS VARCHAR(20),
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk)
);


CREATE TABLE Ruang_Kelas (
    id_ruang CHAR(5) PRIMARY KEY,
    nama_ruang VARCHAR(50),
    kapasitas INT
);


CREATE TABLE Jadwal (
    id_jadwal INT PRIMARY KEY AUTO_INCREMENT,
    kode_mk CHAR(10),
    nidn CHAR(10),
    id_ruang CHAR(5),
    hari ENUM('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'),
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk),
    FOREIGN KEY (nidn) REFERENCES Dosen(nidn),
    FOREIGN KEY (id_ruang) REFERENCES Ruang_Kelas(id_ruang)
);

ALTER TABLE Mahasiswa RENAME TO data_mahasiswa;



INSERT INTO Prodi (nama_prodi) VALUES
('Sistem Informasi'),
('Teknik Informatika'),
('Manajemen'),
('Akuntansi'),
('Teknik Elektro'),
('Teknik Mesin'),
('Ilmu Hukum'),
('Administrasi Publik'),
('Pendidikan Matematika'),
('Pendidikan Bahasa Inggris');


INSERT INTO Mahasiswa (nim, nama, tanggal_lahir, id_prodi) VALUES
('230441100001', 'Rizky Aditya', '2004-05-10', 1),
('230441100002', 'Nadia Permata', '2005-08-21', 2),
('230441100003', 'Budi Santoso', '2005-03-15', 3),
('230441100004', 'Siti Aisyah', '2005-06-05', 4),
('230441100005', 'Andi Pratama', '2005-12-11', 5),
('230441100006', 'Dewi Lestari', '2004-07-25', 6),
('230441100007', 'Faisal Rahman', '2005-09-18', 7),
('230441100008', 'Indah Sari', '2004-02-28', 8),
('230441100009', 'Joko Susilo', '2005-11-14', 9),
('230441100010', 'Cindy Maharani', '2005-01-30', 10);


INSERT INTO Dosen (nidn, nama, gelar, email) VALUES
('10101', 'Dr. Bambang Wijaya', 'S.Kom., M.Kom', 'bambang@kampus.ac.id'),
('10102', 'Prof. Rina Kusuma', 'S.T., M.T., Ph.D', 'rina@kampus.ac.id'),
('10103', 'Dr. Andi Saputra', 'S.E., M.M', 'andi@kampus.ac.id'),
('10104', 'Dr. Sri Lestari', 'S.Ak., M.Ak', 'sri@kampus.ac.id'),
('10105', 'Dr. Hendri Wijaya', 'S.T., M.T', 'hendri@kampus.ac.id'),
('10106', 'Prof. Susanti Wibowo', 'S.T., M.T., Ph.D', 'susanti@kampus.ac.id'),
('10107', 'Dr. Dedy Hidayat', 'S.H., M.H', 'dedy@kampus.ac.id'),
('10108', 'Dr. Farida Rahma', 'S.AP., M.AP', 'farida@kampus.ac.id'),
('10109', 'Dr. Agus Prasetyo', 'S.Pd., M.Pd', 'agus@kampus.ac.id'),
('10110', 'Prof. Lusi Kartika', 'S.S., M.A., Ph.D', 'lusi@kampus.ac.id');


INSERT INTO MataKuliah (kode_mk, nama_mk, sks) VALUES
('MK001', 'Pemrograman Dasar', 3),
('MK002', 'Struktur Data', 3),
('MK003', 'Sistem Basis Data', 3),
('MK004', 'Manajemen Keuangan', 3),
('MK005', 'Akuntansi Dasar', 3),
('MK006', 'Rangkaian Listrik', 3),
('MK007', 'Termodinamika', 3),
('MK008', 'Hukum Perdata', 3),
('MK009', 'Administrasi Publik', 3),
('MK010', 'Metode Statistika', 3);


INSERT INTO Dosen_MataKuliah (nidn, kode_mk) VALUES
('10101', 'MK001'),
('10102', 'MK002'),
('10103', 'MK004'),
('10104', 'MK005'),
('10105', 'MK006'),
('10106', 'MK007'),
('10107', 'MK008'),
('10108', 'MK009'),
('10109', 'MK010'),
('10110', 'MK003');


INSERT INTO Ruang_Kelas (id_ruang, nama_ruang, kapasitas) VALUES
('R101', 'Lab Sistem Informasi', 30),
('R102', 'Lab Teknik Informatika', 30),
('R103', 'Ruang Teori 1', 40),
('R104', 'Ruang Teori 2', 40),
('R105', 'Ruang Akuntansi', 35),
('R106', 'Ruang Teknik', 25),
('R107', 'Ruang Mesin', 25),
('R108', 'Ruang Hukum', 30),
('R109', 'Ruang Administrasi', 30),
('R110', 'Ruang Statistika', 35);


INSERT INTO Jadwal (kode_mk, nidn, id_ruang, hari, jam_mulai, jam_selesai) VALUES
('MK001', '10101', 'R101', 'Senin', '08:00:00', '10:00:00'),
('MK002', '10102', 'R102', 'Selasa', '10:00:00', '12:00:00'),
('MK003', '10110', 'R103', 'Rabu', '13:00:00', '15:00:00'),
('MK004', '10103', 'R104', 'Kamis', '08:00:00', '10:00:00'),
('MK005', '10104', 'R105', 'Jumat', '10:00:00', '12:00:00'),
('MK006', '10105', 'R106', 'Senin', '13:00:00', '15:00:00'),
('MK007', '10106', 'R107', 'Selasa', '08:00:00', '10:00:00'),
('MK008', '10107', 'R108', 'Rabu', '10:00:00', '12:00:00'),
('MK009', '10108', 'R109', 'Kamis', '13:00:00', '15:00:00'),
('MK010', '10109', 'R110', 'Jumat', '08:00:00', '10:00:00');


INSERT INTO KRS (nim, kode_mk, semester, STATUS) VALUES
('230441100001', 'MK001', 2, 'Diambil'),  
('230441100002', 'MK002', 2, 'Disetujui'),  
('230441100003', 'MK004', 3, 'Diambil'),  
('230441100003', 'MK005', 3, 'Disetujui'),  
('230441100004', 'MK006', 4, 'Diambil');  

DROP DATABASE akademik;