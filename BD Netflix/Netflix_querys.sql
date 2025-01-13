USE NetflixDB;
-- Consultas básicass en SQL

-- 1. Seleccionamos todas las columnas de la tabla Episodios
select * from episodios;

-- 2. Seleccionamos las columnas episodio_id y titulo de la tabla Episodios
select episodio_id, titulo from episodios;

-- 3. Obtener géneros únicos de la tabla Serie
SELECT DISTINCT genero FROM series;

-- 4. SEleccionar titulo y duración de la tabla Episodios y ordenarlos de manera descendente
SELECT titulo, duracion FROM episodios
ORDER BY duracion DESC;

-- 5. Seleccionamos todos los datos de la tabla Episodios pero solo queremos observar 10
SELECT * FROM episodios
LIMIT 10;

-- 6. Obtener los 5 episodios con mayor duración
SELECT titulo, duracion FROM episodios
ORDER BY duracion DESC
LIMIT 5;

-- 6. Obtener todas las series de la tabal Series del géner 'Drama'
SELECT * FROM series
WHERE genero = 'Drama';

-- 7. Seleccionar todas las series cuyo año de lanzamiento sea mayor al 2015
SELECT * FROM series
WHERE año_lanzamiento > 2015;

-- 8. 
SELECT titulo, duracion, rating_imdb FROM episodios
WHERE duracion > 45 AND rating_imdb >= 9;

-- 9.
SELECT * FROM series
WHERE (genero = 'Comedia' OR genero='Animación');

-- 10. Obtenemos el mismo resultado que el punto 9
SELECT * FROM series
WHERE genero IN('Comedia','Animación');

-- 11. 
SELECT * FROM series
WHERE genero <> 'Comedia';

-- 12. Obtenemos el mismo resultado que el punto 11
SELECT * FROM series
WHERE genero NOT IN('Comedia');

-- 13. 
SELECT * FROM series
WHERE titulo LIKE '%The%';

-- 14. 
SELECT serie_id, AVG(duracion) AS promedio FROM episodios
WHERE serie_id IN (1,2)
GROUP BY serie_id;

-- 15. 
SELECT serie_id, COUNT(episodio_id) AS numero_episodios 
FROM episodios
GROUP BY serie_id
HAVING COUNT(episodio_id) > 10;

