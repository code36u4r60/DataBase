-- ex 1 
-- Uma lista com o nome de todas as gafanhotas
SELECT 
    nome
FROM
    gafanhotos
WHERE
    sexo = 'F'
ORDER BY nome;

--ex 2
-- Uma lista com os dados de todos que nasceram entre 1/Jan/2000 e 31/Dez/2015
SELECT 
    *
FROM
    gafanhotos
WHERE
    nascimento > '2000-1-1'
        AND nascimento < '2015-12-31'
ORDER BY nascimento;

--ex 3
-- Uma lista com o nome de todos os homens que trabalham como Programadores
SELECT 
    nome
FROM
    gafanhotos
WHERE
    sexo = 'M' and profissao = 'Programador'
ORDER BY nome;

-- ex 4
-- Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome inicidado com a letra 'J'
SELECT 
    *
FROM
    gafanhotos
WHERE
    sexo = 'F' AND nacionalidade = 'Brasil'
        AND nome LIKE 'J%'
ORDER BY nome;

-- ex 5
-- Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100kg
SELECT 
    nome, nacionalidade
FROM
    gafanhotos
WHERE
    sexo = 'M' AND nacionalidade != 'Brasil'
        AND nome LIKE '%Silva%'
        AND peso < '100'
ORDER BY nome;

-- ex 6
-- Qual é a maior altura entre gafanhotos homens que moram no Brasil
SELECT 
    max(altura) 'altura max'
FROM
    gafanhotos
WHERE
    sexo = 'M' AND nacionalidade = 'Brasil'
;

-- ex 7
-- Qual é a média de peso dos gafanhotos cadastrados
SELECT 
    avg(peso) 'Peso médio'
FROM
    gafanhotos
;

-- ex 8
-- Qual é o menor peso entre as gafanhotas mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000?
SELECT 
    MIN(peso) 'Menor Peso'
FROM
    gafanhotos
WHERE
    sexo = 'F' AND nacionalidade != 'Brasil'
        AND nascimento > '1990-1-1'
        AND nascimento < '2000-31-12'
;


-- ex 9
-- Quantas gafanhotas mulheres têm mais de 1.90m de altura?
SELECT 
    count(*) 'Número de mulheres'
FROM
    gafanhotos
WHERE
    sexo = 'F' AND altura > '1.90'
;

-- ex 10
-- Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos
SELECT 
    profissao, COUNT(*)
FROM
    gafanhotos
GROUP BY profissao
ORDER BY profissao;

-- ex 11
-- Quantos gafanhotos homens e quantas mulheres nasceram após 01/Jan/2005?
SELECT 
    sexo, COUNT(*)
FROM
    gafanhotos
WHERE
    nascimento > '2005-01-01'
GROUP BY sexo;

-- ex 12
-- Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o páis de origem e o total de pessoas nascidas lá. Só nos interessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade
SELECT 
    nacionalidade, COUNT(*) quantidade
FROM
    gafanhotos
WHERE
    nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING quantidade > 3;

-- ex 13
-- Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100kg e que estão acima da média de altura de todos os cadastrados
SELECT 
    altura, COUNT(*) quantidade
FROM
    gafanhotos
WHERE
    peso > 100
        AND altura > (SELECT 
            AVG(altura)
        FROM
            gafanhotos)
GROUP BY altura;
