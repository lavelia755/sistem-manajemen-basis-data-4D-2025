CREATE DATABASE db_laundry;

USE db_laundry;

CREATE TABLE Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    no_hp VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Layanan (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(50) NOT NULL,
    harga DECIMAL(10,2) NOT NULL
);

CREATE TABLE Karyawan (
    id_karyawan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50) NOT NULL,
    no_hp VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT NOT NULL,
    id_karyawan INT NULL,  
    tanggal_transaksi DATE,
    total_harga DECIMAL(10,2) NOT NULL,
    STATUS ENUM('Proses', 'Selesai', 'Dibatalkan') DEFAULT 'Proses',
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_karyawan) REFERENCES Karyawan(id_karyawan)
);

CREATE TABLE Detail_Transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_layanan INT NOT NULL,
    jumlah INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
    FOREIGN KEY (id_layanan) REFERENCES Layanan(id_layanan)
);


INSERT INTO Layanan (nama_layanan, harga) VALUES
('Cuci Kering', 15000.00),
('Cuci Basah', 12000.00),
('Cuci Setrika', 20000.00),
('Cuci Lipat', 18000.00);

INSERT INTO Karyawan (nama, jabatan, no_hp) VALUES
('Ahmad Fauzi', 'Kasir', '085678901234'),
('Dewi Lestari', 'Pencuci', '086789012345'),
('Rizky Ananda', 'Penyetrika', '087890123456');

INSERT INTO Transaksi (id_pelanggan, id_karyawan, total_harga, STATUS) VALUES
(1, 1, 30000.00, 'Proses'),
(2, 2, 18000.00, 'Selesai'),
(3, 3, 45000.00, 'Selesai');

INSERT INTO Detail_Transaksi (id_transaksi, id_layanan, jumlah, subtotal) VALUES
(1, 1, 2, 30000.00),
(2, 4, 1, 18000.00),
(3, 3, 2, 40000.00),
(3, 2, 1, 12000.00);





