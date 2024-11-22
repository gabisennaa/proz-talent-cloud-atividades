DELIMITER //

CREATE FUNCTION SomarClientesPorDia(dia DATE) 
RETURNS INT
BEGIN
    DECLARE totalClientes INT;

    SELECT COUNT(*) INTO totalClientes
    FROM Clientes
    WHERE DataCadastro = dia;

    RETURN totalClientes;
END;

//

DELIMITER ;

SELECT SomarClientesPorDia('2024-11-01') AS TotalClientes;
