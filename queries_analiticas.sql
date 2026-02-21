-- 1. Ranking de Clientes (Unindo PF e PJ)
SELECT 
    c.idCliente, 
    COALESCE(pf.Nome, pj.RazaoSocial) AS Nome_Cliente, 
    SUM(p.TotalPedido) as Total_Gasto
FROM Cliente c
LEFT JOIN PessoaFisica pf ON c.idCliente = pf.idCliente
LEFT JOIN PessoaJuridica pj ON c.idCliente = pj.idCliente
JOIN Pedido p ON c.idCliente = p.idCliente
GROUP BY c.idCliente
ORDER BY Total_Gasto DESC;

-- 2. Monitoramento de Entregas Pendentes
SELECT p.idPedido, e.CodigoRastreio, e.StatusEntrega
FROM Pedido p
JOIN Entrega e ON p.idEntrega = e.idEntrega
WHERE e.StatusEntrega != 'Entregue';

-- 3. Clientes com Ticket Médio superior a 500 (HAVING)
SELECT idCliente, AVG(TotalPedido) as TicketMedio
FROM Pedido
GROUP BY idCliente
HAVING TicketMedio > 500;
