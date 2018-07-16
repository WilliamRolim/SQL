/*Exibir os drinks cujo primeira letra seja L ou posterior, mas que venham antes de M*/
SELECT nome_do_drink
from DRINK_INFO
where NOME_DO_DRINK >= 'L'
AND NOME_DO_DRINK < 'M';
