DELIMITER //
CREATE FUNCTION Total_Pengeluaran_Pelanggan(p_id_pelanggan INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    SELECT SUM(subtotal) INTO total
    FROM Transaksi
    JOIN Detail_Transaksi ON Transaksi.id_transaksi = Detail_Transaksi.id_transaksi
    WHERE Transaksi.id_pelanggan = p_id_pelanggan;
    
    RETURN total;
END //
DELIMITER ;
