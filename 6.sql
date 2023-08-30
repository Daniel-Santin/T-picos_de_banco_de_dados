-----1

CREATE OR REPLACE FUNCTION TotalPedidosPorCliente(
    nome_cliente IN varchar)
RETURN number IS
    total_pedidos number;
BEGIN
    SELECT COUNT(*) INTO total_pedidos
    FROM Pedido P
    JOIN Cliente C ON P.Cod_Cli = C.Cod_Cli
    WHERE C.Nome_Cli = nome_cliente;
    
    RETURN total_pedidos;
END TotalPedidosPorCliente;
/

SELECT
    C.Nome_Cli,
    TotalPedidosPorCliente(C.Nome_Cli) AS TotalPedidos
FROM Cliente C
WHERE TotalPedidosPorCliente(C.Nome_Cli) < TotalPedidosPorCliente('Mauro');







------2


CREATE OR REPLACE FUNCTION ValorTotalPedido(
    codigo_pedido IN integer)
RETURN integer IS
    valor_total integer;
BEGIN
    SELECT SUM(P.Valor_Unit * I.Quantidade) INTO valor_total
    FROM Item_do_Pedido I
    JOIN Produto P ON I.Cod_Prod = P.Cod_Prod
    WHERE I.Cod_Ped = codigo_pedido;

    RETURN valor_total;
END ValorTotalPedido;
/




DECLARE
    valor_pedido integer;
BEGIN
    valor_pedido := ValorTotalPedido(100);
    DBMS_OUTPUT.PUT_LINE('O valor total do pedido é: ' || valor_pedido);
END;
/



--------3



CREATE OR REPLACE FUNCTION NomeClientePorPedido(
    codigo_pedido IN integer)
RETURN varchar AS
    nome_cliente varchar(30);
BEGIN
    SELECT C.Nome_Cli INTO nome_cliente
    FROM Pedido P
    JOIN Cliente C ON P.Cod_Cli = C.Cod_Cli
    WHERE P.Cod_Ped = codigo_pedido;

    RETURN nome_cliente;
END NomeClientePorPedido;
/


DECLARE
    nome_cliente_pedido varchar(30);
BEGIN
    nome_cliente_pedido := NomeClientePorPedido(100);
    DBMS_OUTPUT.PUT_LINE('O nome do cliente que fez o pedido é: ' || nome_cliente_pedido);
END;
/
