DELIMITER $$

CREATE PROCEDURE RelatorioVendasDiario()
BEGIN
    SELECT 
        data_venda,
        produto_id,
        SUM(quantidade) AS total_quantidade
    FROM 
        vendas
    GROUP BY 
        data_venda, produto_id
    ORDER BY 
        data_venda, produto_id;
END$$

DELIMITER ;

CALL RelatorioVendasDiario();
