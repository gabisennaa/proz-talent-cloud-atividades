DELIMITER //

CREATE PROCEDURE RelatorioVendasDiarias(IN data_inicio DATE, IN data_fim DATE)
BEGIN
    SELECT 
        p.Nome AS Produto,
        SUM(v.Quantidade) AS TotalVendido,
        v.DataVenda
    FROM 
        Vendas v
    JOIN 
        Produtos p ON v.ProdutoID = p.ProdutoID
    WHERE 
        v.DataVenda BETWEEN data_inicio AND data_fim
    GROUP BY 
        p.Nome, v.DataVenda
    ORDER BY 
        v.DataVenda, p.Nome;
END;

//

DELIMITER ;

CALL RelatorioVendasDiarias('2024-11-01', '2024-11-04');
