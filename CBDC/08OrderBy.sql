/*ORDER BY*/

/*ORDEM ALFABETICA NO NOME  DO CLIENTE*/
SELECT * FROM CLIENTE ORDER BY Nome;

SELECT 
  c.nome,
  c.sexo,
  IFNULL(c.email, "email não cadastrado") AS 'email',
  c.cpf,
  e.rua,
  e.bairro,
  e.cidade,
  e.estado,
  t.tipo,
  t.numero
FROM
  cliente c 
  INNER JOIN endereco e 
    ON c.idcliente = e.id_cliente
  INNER JOIN telefone t
ON c.idcliente = t.id_cliente
ORDER BY c.nome;

/*ORDEM ASCENDENTE CPF DO CLIENTE*/
SELECT * FROM CLIENTE ORDER BY cpf ASC;


SELECT 
  c.nome,
  c.sexo,
  IFNULL(c.email, "email não cadastrado") AS 'email',
  c.cpf,
  e.rua,
  e.bairro,
  e.cidade,
  e.estado,
  t.tipo,
  t.numero
FROM
  cliente c 
  INNER JOIN endereco e 
    ON c.idcliente = e.id_cliente
  INNER JOIN telefone t
ON c.idcliente = t.id_cliente
ORDER BY c.cpf ASC  ;

/*
curso busines inteligence
data set resultado de uma query set de dados*/