--Crear una base de datos llamada películas.
CREATE DATABASE peliculas;
\c peliculas

CREATE TABLE peliculas(
    id INT,
    nombre_pelicula VARCHAR(100),
    Año_estreno INT,
    director VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE reparto(
    id_reparto INT,
    nombre_autor VARCHAR(100),
    FOREIGN KEY (id_reparto) REFERENCES peliculas(id)
);

--Cargar ambos archivos a su tabla correspondiente.
\copy peliculas FROM 'D:\EDclases\Unidad VII\desafio_top100\peliculas.csv' csv header;
\copy reparto FROM 'D:\EDclases\Unidad VII\desafio_top100\reparto.csv' csv header;

--Obtener el ID de la película “Titanic”.

SELECT id FROM peliculas 
    WHERE nombre_pelicula = 'Titanic';

--Listar a todos los actores que aparecen en la película "Titanic".

SELECT nombre_autor, id_reparto FROM reparto 
    WHERE id_reparto = '2';


--Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT (id_reparto) AS total 
    FROM reparto
        WHERE nombre_autor = 'Harrison Ford';

--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT nombre_pelicula
    FROM peliculas
        WHERE Año_estreno BETWEEN 1990 AND 1999
            ORDER BY nombre_pelicula ASC;

--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.

SELECT nombre_pelicula,LENGTH(nombre_pelicula)
    AS longitud_titulo
        FROM peliculas;

--Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(nombre_pelicula)) 
FROM peliculas;

