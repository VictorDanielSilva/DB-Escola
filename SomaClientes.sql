CREATE FUNCTION ContarClientesPorDia(@data DATE)
RETURNS INT
AS
BEGIN
    DECLARE @totalClientes INT;

    -- Conta os clientes cadastrados na data especificada
    SELECT @totalClientes = COUNT(*)
    FROM Clientes
    WHERE CAST(data_cadastro AS DATE) = @data;

    RETURN @totalClientes;
END;

SELECT dbo.ContarClientesPorDia('2024-11-30') AS TotalClientesCadastrados;
