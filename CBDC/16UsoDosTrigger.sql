/*Entendendo Triggers */

/* estrutura de uma trigger = gatilho */

CREATE TRIGGER nome
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO
		QUALQUER COMANDO SQL;
END->FIM
$
/* DELIMITADORES $ OU # ETC */ 

CREATE DATABASE aulatrigger;

use aulatrigger;

CREATE TABLE usuario (
idusuario INT PRIMARY KEY AUTO_INCREMENT,
nomeusuario VARCHAR(30),
loginusuario VARCHAR(30),
senhausuario VARCHAR(100)
);

/*criando tabela de backup de usuario */
CREATE TABLE bkp_usuario (
idbackup INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT,
nomeBackup VARCHAR (30),
loginBackup VARCHAR (30)
);

/*criando a TRIGGER*/

DELIMITER #

CREATE TRIGGER backup_usuario
BEFORE DELETE ON USUARIO
FOR EACH ROW 
BEGIN
INSERT INTO BKP_USUARIO
VALUES (NULL,OLD.idusuario,OLD.nomeusuario,OLD.loginusuario);
END
#

INSERT INTO usuario VALUES (NULL,"william rolim","williamrolim@hotmail.com","12345");

DELETE FROM usuario WHERE idusuario = 1;

/*excluindo trigger*/
DROP TRIGGER backup_usuario;


