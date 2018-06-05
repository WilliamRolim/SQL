/* cursores */
/*CURSORES = VETORES UMA VARIAVEL*/
/*CURSOR VAI PARA MEMORIA RAM DEPENDENDO DO DESEMPENHO DO SEU SERVIDOR VC PODE JOGAR SEU DESEMPENHO LÁ EMBAIXO*/
create database vendas;
use vendas;
CREATE TABLE VENDEDORES(
idvendedor int primary key auto_increment,
nomevendedor varchar(30),
janeiro int,
fevereiro int,
marco int
);

INSERT INTO vendedores VALUES (null, 'Joana',23456,32442,43556);
INSERT INTO vendedores VALUES (null, 'Maria',34456,12442,134564);
INSERT INTO vendedores VALUES (null, 'Bruna',72656,82949,43556);
INSERT INTO vendedores VALUES (null, 'Joanquina',12454,82842,43655);
INSERT INTO vendedores VALUES (null, 'Mautozorio',13556,67342,52135);
INSERT INTO vendedores VALUES (null, 'Ancentidao',62657,32341,82512);
INSERT INTO vendedores VALUES (null, 'Salomao', 45484,19489,77852);


Select nomevendedor, (janeiro + fevereiro + marco ) as 'Soma 3 val' from vendedores;

Select nomevendedor, (janeiro + fevereiro + marco ) / 3 as 'Media' from vendedores;

/*situação que os itens acima estão demandando muito processamento*/

create table venda_total(
nomevendedor varchar(30),
janeiro int,
fevereiro int,
marco int,
total int,
media int
);

DELIMITER $
/*CURSOS É UMA PROGRAMAÇÃO DENTRO DE UMA PROCEDURE*/

CREATE PROCEDURE INSEREDADOS()
BEGIN
 DECLARE FIM INT DEFAULT 0;/*DECLARAÇÃO DE VARIAVEIS */
 DECLARE VAR1, VAR2, VAR3,VTOTAL,VMEDIA INT; /*DECLARAÇÃO PARA ARMAZENAR CADA MES*/
DECLARE VNOME VARCHAR(30);

	DECLARE REG CURSOR FOR (
	SELECT nomevendedor,janeiro,fevereiro,marco from vendedores
	);
	/*HANDLER VARIAVEL DE MANIPULAÇAO CONTINUA*/
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
	/*QUANDO NÃO TENHO MAIS ELEMENTOS NO MEU CURSOS ELE ALTERA PARA 1*/

	/*OPEN REG VAI PEGAR O REG E JOGAR PARA MEMORIA RAM -> TODOS OS DADOS EM MEMORIA*/
	/* JÁ NA MEMORIA RAM É VOLATIL E CONSIGO FAZER AS MODIFCAÇÕES*/
	/*NA TABELA ESTÁ ARMAZENADO NO BANDO E CONSEQUENTEMENTE ESTÁ NO HD, NÃO CONSIGO
MANIPULAR POIS ELE ESTÁ GRAVADO NO HD*/
	OPEN REG;
	
/*REPEAT - LOOP*/
	REPEAT/* COM O VETOR DENTRO DA MEMORIA RAM COMEÇO MEU LOOPING REPEAT*/
	
		FETCH REG INTO VNOME,VAR1,VAR2,VAR3;/*FETCH SIGNIFICA ME TRAGA O PROXIMO*/
		IF NOT FIM THEN
	
			SET VTOTAL = VAR1 + VAR2 + VAR3;
			SET VMEDIA = VTOTAL /3;
	
			INSERT INTO VENDA_TOTAL VALUES (VNOME,VAR1,VAR2,VAR3, VTOTAL,VMEDIA);
	
		END IF;
	
	UNTIL FIM END REPEAT;/*UNTIL FIM END REPEAT FIM DO REPEAT*/
	
	CLOSE REG;
/*CLOSE REG LIMPAR A MEMORIA RAM*/
	
END
$

delimiter $

select * from vendedores;
select * from venda_total; 
/*verificamos que venda_total está vazia (não executamos a procedure do cursor ainda)*/

call inseredados();/*chamando a procedure*/

select * from venda_total;
	

























END