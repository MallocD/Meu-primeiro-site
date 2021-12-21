--SELECT-- 

SELECT coluna1,coluna2 /*selecionar apenas as colunas desejadas com o nome das colunas*/
FROM tabela -- Nome da tabela desejada a ser acessada

SELECT * /*selecionar todas as colunas da tabela*/
FROM tabela

--DISTINCT-- 
SELECT DISTINCT colunaA, colunaB --> Usado para omitir dados duplicados de uma tabela;
FROM tabela

--WHERE--

SELECT colunaA 
FROM tabela
WHERE condição; --> Será adicionado a condição, por exemplo : "WHERE idade >30"--< Nesse caso o SELECT irá filtrar e selecionar somente aqueles que possuam idade maior que 30 anos;

--COUNT--

SELECT COUNT(*) --> Contagem de colunas totais
FROM tabela

SELECT count (title)--> Contagem de uma coluna em específico;
FROM

SELECT count (DISTINCT title)--> Omiti a quantidade de títulos duplicados;

                --Exemplo

                SELECT count (DISTINCT Name)
                FROM production.product

                SELECT count (DISTINCT size)
                FROM production.product

                SELECT count ( size)
                FROM production.product
                

 --TOP--

 SELECT TOP 10* -- Seleciona somente a quantidade colunas desejadas;
 FROM TABELA

                    Exemplo

                    SELECT TOP 10(name)
                    FROM production.product


 --ORDER BY--

 SELECT coluna1,coluna2
 FROM tabela
 ORDER BY coluna asc/desc

                    --Exemplo


                        SELECT*
                        FROM person.Person
                        ORDER BY FirstName asc, Lastname desc
                      
                        SELECT TOP 10 *
 /*ORDER BY and TOP*/   FROM production.product
                        ORDER BY ListPrice desc 

                        SELECT TOP 4(ProductID),ProductNumber,Name
                        FROM production.product
                        ORDER BY ProductID asc 



---BETWEEN--
SELECT *
FROM tabela
WHERE coluna BETWEEN minimo and máximo;--Usado para encontrar valor entre um valor mínimo e valor máximo

valor Not BETWEEN mpinimo and máximo;

                    --Exemplo

                    SELECT *
                    FROM production.product
                    WHERE listprice between 1000 and 1500

                    SELECT *
                    FROM HumanResources.Employee
                    Where HireDate between '2010/01/01' and '2015/01/01'
                    order by HireDate


|--IN--

SELECT *
FROM tabela
where nome da tabela in (valor)-->Usado para verificar se um valor corresponde a algum que foi passado na list de valores where (Mais facilidade na busca específica)


valor in (valor 1, valor2)

                    --Exemplo

                    SELECT *
                    FROM Person.person
                    Where BusinessEntityID in (2,3,5)
                    SELECT *
                    FROM Person.person
                    Where BusinessEntityID not in (2)--> Retorna todos valores diferentes de 2;

                    --Exemplo do Where sem IN : 
                    SELECT *
                    FROM Person.person
                    Where BusinessEntityID = 2 or 
                    BusinessEntityID = 3 or 
                    BusinessEntityID =5;

--LIKE--

SELECT *
FROM TABELA
Where nome da coluna like 'alo%' --> Procura dentro das colunas algo que contenha esses caractéres;

                        --Exemplo

                        SELECT *
                        FROM person.person
                        Where Firstname like 'jo%'--> Ínicio da palavra

                        SELECT *
                        FROM person.person
                        Where Firstname like '%to'-->Final da palavra

                        SELECT *
                        FROM person.person
                        Where Firstname like '%to%'-->Começo ou final da palrava

                        SELECT *
                        FROM person.person
                        Where Firstname like '%to_'-->Apenas um caractére será buscado após o _;

////--Desafio--////
SELECT COUNT (ProductID)--1 Desafio / Quantos produtos existem acima de 1500 reais
FROM Production.Product
WHERE ListPrice > 1500

SELECT COUNT (Lastname)--2 Desafio/ Quantas pessoas tem o sobrenome que se inicia com a letra P
FROM Person.person
Where lastname like 'P%' 

SELECT COUNT(DISTINCT city)-- 3° Desafio/ Em quantas cidades únicas estão cadastrados os clientes
FROM Person.Address

SELECT DISTINCT city-- 4° Desafio/ Quais são as cidades únicas que temos cadastradas em nosso sistema
FROM Person.Address

SELECT COUNT (*)--5° Desafio/ Quantos produtos vermelhos tem  preço entre 500 e 1000;
FROM production.product
WHERE color = 'red' and ListPrice between 500 and 1500

SELECT COUNT(*)--6° Desafio/ Quantos produtos cadastrados tem a palavra 'road' no nome/
FROM production.Product
WHERE name like '%road%'
                        
--SQL Aula 12 MIN MAX SUM AVG--

AS "nome" --Nomeia as colunas 

SELECT TOP 10 (sum(linetotal)) AS "SOMA" ----Realiza a somatória de todas as colunas selecionadas
FROM Sales.SalesOrderDetail

SELECT sum(linetotal) 
FROM Sales.SalesOrderDetail


SELECT TOP 10 min(LineTotal) --Procura o valor mínimo dentro da coluna selecionada
FROM Sales.SalesOrderDetail

SELECT min(LineTotal) 
FROM Sales.SalesOrderDetail

SELECT max(LineTotal) --Procura o valor máximo dentro da coluna selecionada
FROM Sales.SalesOrderDetail

SELECT TOP 10 avg (LineTotal)--Faz a média de todos os valores da coluna
FROM Sales.SalesOrderDetail

SELECT avg (LineTotal)
FROM Sales.SalesOrderDetail

--SQL  AULA 13 GROUP BY + DESAFIOS INTERMEDIÁRIOS

--O Group By divide o resultado da sua pesquisa em grupos
--Para cada grupo que você aplicar uma função de agregação, por exemplo:
    --Calcular a soma de itens
    --Contar o número de itens naquele grupo   

                    SELECT coluna1,funcaoAgregacao(coluna2)
                    FROM nomeTabela
                    GROUP BY coluna1;

                    --exemplos

                    SELECT SpecialOfferID, sum(UnitPrice) "SOMA"--Irá somar o valor de todos os produtos que possuem o mesmo ID
                    FROM Sales.SalesOrderDetail
                    GROUP BY SpecialOfferID

                    SELECT SpecialOfferID, COUNT(UnitPrice) "Contagem"--Irá contar a quantidade de produtos que tem o mesmo ID
                    FROM Sales.SalesOrderDetail
                    GROUP BY SpecialOfferID
                    
                    SELECT ProductID, COUNT(ProductID) "Contagem"-- Irá agrupar pela quantidade de vezes que o ID aparece na coluna
                    FROM Sales.SalesOrderDetail
                    Group by ProductID

                    SELECT Firstname, count (firstname) "Número de vezes que o nome aparece"--Irá agrupar e contar a quantidade de vezes que cada nome se repete
                    FROM Person.Person
                    GROUP by firstname

                    select color, avg(listprice) -- Descobrir a média de preço de todos produtos que são da cor prata
                    from production.product
                    group by color

                    SELECT color, count(color)
                    FROM production.product
                    where color= 'silver'--Filtrar um único valor utilizando o WHERE
                    GROUP BY color

--DESAFIOS

SELECT middlename, count(middlename)--1 ° Desafio/ Quantas pessoas tem o mesmo middle name
from person.person
group by middleName

SELECT ProductID, avg(OrderQty)--2°Desafio/ Média de produtos vendidos
FROM Sales.SalesOrderDetail
GROUP by ProductID

SELECT top 10 productid, sum(Linetotal)--3° Desafio/ Saber quais foram os 10 produtos que tiveram o valor de vendas mais altos, do menor para o maior
from Sales.SalesOrderDetail
Group by ProductID
ORDER BY sum(linetotal) desc

SELECT productID,COUNT(productID) "Contagem" ,avg(orderqty) "Média" -- 4° Desafio / Fazer a contagem da quantidade de cada produto e a média da quantidade de produtos cadastrados
from production.WORKORDER
GROUP BY productID

--SQL AULA 14 HAVING + DESAFIOS

-- O having é utilizado juntamente com o group by para filtrar a busca de um resultado dentro de um agrupamento
--Basicamente um where para dados agrupados

--A diferença entre os dois é que o HAVING é aplicado após os dados terem sido agrupados e o where antes.

SELECT coluna, funcaoAgregacao(coluna2)
FROM   nomeTabela
GROUP BY coluna 1
HAVING condição

            --EXEMPLOS 

            SELECT firstname, count(firstname) "quantidade"
            from Person.Person
            GROUP BY firstname
            Having count(FirstName) < 10 --> Irá relizar a filtragem a partir de onde ocorrencia é  menor que 10 

            SELECT ProducTId, sum(linetotal) "Soma"
            from Sales.SalesOrderDetail
            group by ProductID
            HAVING sum(LineTotal) between 162000 and 500000 --Descobrir quais produtos no total de vendas estão entre 162k e 500k

            SELECT firstname, count(firstname) "quantidade"
            from Person.Person
            where title = 'Mr.'--> Utilizado para filtrar antes do GROUP BY E HAVING
            GROUP BY firstname
            Having count(FirstName) > 10
--Desafios:

SELECT StateprovinceID, count(AddressID) "Contagem"--1° /Contar quantos cadastros existem na mesma provincias e selecionar quais deles são maiores que 1000
FROM person.Address
Group by StateProvinceID
having count(Addressid) > 1000


SELECT ProductID, avg(linetotal)-- 2°/ O gerente quer saber  quais produtos não estão gerando uma média de 1kk de renda;
from Sales.SalesOrderDetail
GROUP BY ProductID
HAVING avg(linetotal)<1000000


--SQL Aula 15 AS + Desafios
--Não é necessário utilizar "as"
SELECT Listprice as Preço --> não é necessário " " quando é uma palavra sem espaço
SELECT Listprice as "Preço do produto" -->  é necessário " " quando é uma palavra com espaço


Select firstname  Primeiro, lastname  Ultimo 
From person.Person
--Ambos funcionam da mesma maneira
Select firstname as Primeiro, lastname as Ultimo --1°ex
From person.Person
                        
SELECT productnumber "Numero do Produto" --2° ex
from production.product         

--SQL AULA 16 INNER JOIN  + DESAFIOS


--Sempre deve haver uma coluna em comum nas duas categorias
--Serve para mesclar informações de duas tabelas
--EXISTEM 3 tipos gerais de joins : 
--INNER JOIN , OUTER JOIN E SELF-JOIN

SELECT C.ClientId,C.Nome, E.Rua, E.cidade
FROM Ciente C
INNER JOIN Endereco E ON E.EnederecoID = C.EnderecoID

SELECT po.ProductID, po.Name , po.color , s.salesorderID , s.LineTotal-- Seleciona primeiro as colunas que ja estão e depois as da outra tabela que deseja mesclar
FROM Production.Product po--Nome da tabela raiz renomeado para po
INNER JOIN Sales.SalesOrderDetail s on po.ProductID = s.ProductID -- no INNER  JOIN  coloca qual será a tabela secundária e no ON compara a coluna quue existe em ambas as tabelas

Select pp.ListPrice , pp.Name , ps.Name as NameS
FROM Production.product pp
INNER JOIN Production.ProductSubcategory ps on pp.ProductSubcategoryID = ps.ProductSubcategoryID 

select top 10*--Serve para mesclar duas tabelas inteiras ao invés de apenas algumas colunas
from person.BusinessEntity pb
INNER JOIN Person.Password pp on pb.BusinessEntityID = pp.BusinessEntityID

select top 10 pp.BusinessEntityId as ID, pt.Name as Nome , pp.phoneNumberTypeId as "ID do telefone", pp.Phonenumber as Numero-- Desafio de mesclagem
from Person.PhoneNumberType pt
INNER JOIN Person.PersonPhone pp ON pt.PhoneNumberTypeID = pp.PhoneNumberTypeID

select top 10 pa.AddressID,pa.City,ps.StateProvinceId, ps.Name--Desafio mesclagem
FROM person.StateProvince ps
INNER Join person.Address pa on pa.StateProvinceID = ps.StateProvinceID

--SQL AULA 18 TIPOS DE JOINS + DESAFIOS

FULL OUTER JOIN -->Retorna todos os valores de ambas as tabelas

select top 5 *
from Production.Product
inner join sales.SalesOrderDetail on Product.ProductID = SalesOrderDetail.ProductID--Retorna somente valores que possuem na mesma tabela

select top 5 *
from Production.Product
full outer join sales.SalesOrderDetail on Product.ProductID = SalesOrderDetail.ProductID--Retorna todos os valores de ambas as tabelas, as auto preenchendo com valores "vazios"

select top 5 *
from Production.Product
left join sales.SalesOrderDetail on Product.ProductID = SalesOrderDetail.ProductID-->Retorna os valores da tabela a e as que se comparam com a tabelab,  e quando não houver valores iguais, ele irá se auto preencher

SELECT *
FROM person.person pp
LEFT join Sales.PersonCreditCard pc
on pp.BusinessEntityID = pc.BusinessEntityID
WHERE pc.BusinessEntityID is null -- > Verificar quantas pessoas não possuem cartão de crédito, através de onde o valor é nulo

--SQL AULA 19 UNION

--O operador union combina dois ou mais resultados de um select em uma coluna apenas;
select firstname
from person.person
UNION -->Junta as duas colunas, tornando-as uma só e ainda apaga os elementos duplicados o UNION ALL--Junta todos sem excluir os que sejam duplicados
select lastname
from person.person

--EXEMPLO
SELECT ProductID, Name, ProductNumber
From Production.product
Where name like '%bike%'
UNION
SELECT ProductID, Name, ProductNumber
From Production.product
where name like '%chain%'
order by name
--EXEMPLO
SELECT Firstname, title, Middlename
FROM person.person
where title = 'Mr.'
Union
SELECT firstname, title, MiddleName
From person.person
where MiddleName= 'A'
                --DESAFIO
            select name, StateProvinceCode, CountryRegionCode
            from person.StateProvince
            where countryregioncode = 'US'
            UNION 
            select name, stateprovincecode, CountryRegionCode
            from person.StateProvince
            where CountryRegionCode = 'FR'
            
--SQL AULA 20 DATEPART + DESAFIOS

select SalesOrderID, datepart(month, Orderdate) Mes -->Realiza a busca por meio do da data (datepart) utilizando o mês(month) através da tabela (orderdata
from sales.SalesOrderHeader
where datepart(MONTH,OrderDate)> 10

select datepart(month, Orderdate) Mes, avg(totaldue) Media--> Calcula a média por mês de produtos vendidos
from sales.SalesOrderHeader
group by DATEPART(month, orderdate)

    --Desafios
        select datepart(MINUTE,ModifiedDate) Minuto, BusinessEntityID  ID
        from person.BusinessEntity

--SQL AULA 21 OPERAÇÕES EM STRING (AVANÇADO)
SELECT CONCAT(FirstName, ' ', Lastname)-->Concatena o primeiro e ultimo nome em uma linha só
From person.person

SELECT Concat(Firstname,' ', MiddleName, ' ', Lastname) as NomeCompleto
from person.person

SELECT UPPER(FIRSTnaME), lower (firstname)--> Transforma todos os elementos da tabela em strings com letras maísculas ou mínusculas
FROM person.person

SELECT len(FIRSTnaME)--> Realiza contagem da quantidade de caractéres dentro da string, é como o lenght
FROM person.person

SELECT SUBSTRING(Firstname,1,3)--> Utilizado para extrair uma quantidade de caractéres de uma string, de 1 a 3, ou pode ser utilizado outro valor como de 3 a 5, 3,5
from person.person

SELECT REPLACE(PRODUCTNUMBER,'-','#')-->Utilizado para substituição de caractéres dentro de uma string, (Nome da tabela, caractéres a ser substítiuido, caractéres que iram subistituir)
FROM Production.product

SELECT REPLACE(PRODUCTNUMBER,'R64Y','xxxxxxxx')
FROM Production.product

--SQL AULA 22 FUNÇÕES MATEMÁTICAS

select linetotal - unitprice-->Subtrai uma tabela pela outra
from Sales.SalesOrderDetail

select linetotal + unitprice-->Soma uma tabela com a outra
from Sales.SalesOrderDetail

select linetotal / unitprice-->Divide uma tabela pela outra
from Sales.SalesOrderDetail

select linetotal * unitprice-->Multiplica uma tabela pela outra
from Sales.SalesOrderDetail

select ROUND(Linetotal,2)-->Arredonda os valores e o segundo parâmetro, designa o quanto será arredondado em casa decimais
from Sales.SalesOrderDetail

select SQRT(Linetotal)-->Raiz quadrada dos valores
from Sales.SalesOrderDetail

--SQL AULA 23 SUBQUERY (SUBSELECT)
SELECT*
FROM Production.product
WHERE ListPrice > (SELECT AVG (listprice)from Production.product)

--UTILIZANDO SUBQUERY
SELECT Firstname
from person.person
where BusinessEntityID in (select BusinessEntityID from HumanResources.Employee where JobTitle= 'Design Engineer')

--UTILIZANDO INNER JOIN
SELECT Firstname
from person.person p
INNER JOIN HumanResources.Employee h ON h.BusinessEntityID = p.BusinessEntityID 
and h.JobTitle = 'Design Engineer'

--UTILIZANDO SUBQUERY
select *
from PERSON.Address
where StateProvinceID in(select StateProvinceid from person.StateProvince p where name =  'Alberta')

--UTILIZANDO INNER JOIN
SELECT name , a.city, a.AddressId
from person.StateProvince p
inner join person.Address a on p.StateProvinceID = a.StateProvinceID and name = 'Alberta'


--SQL AULA 24 - SELF-JOIN
SELECT top 20 a.addressid, b.addressid, b.city
FROM person.Address a, Person.Address B --Realiza a comparação entre a mesma tabela, somente entre colunas diferentes
where a.city = b.city