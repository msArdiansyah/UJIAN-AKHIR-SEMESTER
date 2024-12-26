DELIMITER //
CREATE PROCEDURE Insert_Transaksi(
    IN p_id_transaksi INT,
    IN p_tanggal DATE,
    IN p_id_pelanggan INT,
    IN p_id_produk INT,
    IN p_kuantitas INT
)
BEGIN
    DECLARE v_harga DECIMAL(10, 2);
    DECLARE v_subtotal DECIMAL(10, 2);
    
    -- Ambil harga produk
    SELECT harga INTO v_harga FROM Produk WHERE id_produk = p_id_produk;
    
    -- Hitung subtotal
    SET v_subtotal = v_harga * p_kuantitas;

    -- Insert ke tabel Transaksi
    INSERT INTO Transaksi (id_transaksi, tanggal, id_pelanggan) 
    VALUES (p_id_transaksi, p_tanggal, p_id_pelanggan);

    -- Insert ke tabel Detail Transaksi
    INSERT INTO Detail_Transaksi (id_detail_transaksi, id_transaksi, id_produk, kuantitas, subtotal) 
    VALUES (NULL, p_id_transaksi, p_id_produk, p_kuantitas, v_subtotal);
END //
DELIMITER ;
