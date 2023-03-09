-- 1 Buscar o nome e ano dos filmes
SELECT
	Nome, Ano
		From Filmes			
-- 2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT
	Nome, Ano
		From Filmes
Order By Ano
-- 3 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT
	*
	From Filmes
	Where Nome = 'De Volta Para o Futuro'		
-- 4 Buscar os filmes lançados em 1997
SELECT 
	*
	FROM Filmes
	WHERE Ano = '1997'	
-- 5 Buscar os filmes lançados APÓS o ano 2000
SELECT 
	*
	FROM Filmes
	WHERE Ano > '2000'	
-- 6 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT 
	*
	FROM Filmes
	WHERE Duracao > '100' AND Duracao < '150'
	ORDER BY Duracao	
-- 7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT 
    Ano, 
    COUNT(*) AS quantidade, 
    MAX(Duracao) AS duracao_maxima
FROM 
    Filmes
GROUP BY 
    Ano
ORDER BY 
    duracao_maxima DESC    
-- 8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT *
FROM Atores
WHERE Genero = 'M'
-- 9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT *
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome
-- 10 Buscar o nome do filme e o gênero
SELECT 
    Filmes.Nome AS Nome, 
    Generos.Genero  AS Genero
FROM 
    Filmes 
    INNER JOIN FilmesGenero ON Filmes.ID = FilmesGenero.IdFilme 
    INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.ID 
-- 11 Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT 
    Filmes.Nome AS Nome, 
    Generos.Genero  AS Genero
FROM 
    Filmes 
    INNER JOIN FilmesGenero ON Filmes.ID = FilmesGenero.IdFilme 
    INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.ID
WHERE Generos.Genero = 'Mistério'

-- 12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT 
    Filmes.Nome AS Nome, 
    Atores.PrimeiroNome AS PrimeiroNome,
    Atores.UltimoNome AS UltimoNome,
    ElencoFilme.Papel AS Papel
FROM
    ElencoFilme
    INNER JOIN Filmes ON ElencoFilme.IdFilme = Filmes.Id
    INNER JOIN Atores ON ElencoFilme.IdAtor  = Atores.Id