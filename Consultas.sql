select distinct u.nome
from usuarios u inner join condominios c
on c.contador = u.contador
where not exists
(select *
from avisos a
where a.condominio = c.codigo and a.resumo = null)

select distinct s.sindico
from sindicos s inner join condominios c
on s.id != c.codigo
where exists
(select *
from blocos b
where b.condominio = s.condominio and b.codigo > c.codigo)

select distinct s.sindico, c.nome
from sindicos s inner join condominios c
on s.id != c.codigo
where exists
(select *
from blocos b
where b.condominio = s.condominio and
exists
(select *
from contadores con
where c.contador = con.id)
)

select count(*)
from blocos b
inner join condominios c
on b.condominio = c.codigo and c.cidade = 'Goiania'

select count(*)
from condominios c
where exists
(select *
from contadores con
where c.contador = con.id and con.id = 1)

SELECT COUNT(b.codigo), b.condominio
FROM blocos b
GROUP BY condominio
HAVING COUNT(b.codigo) > 5

SELECT COUNT(b.codigo), b.condominio
FROM blocos b inner join condominio c on b.condominio = c.codigo
where c.cidade = 'Goiania'
GROUP BY b.condominio
HAVING COUNT(*)
