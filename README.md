# Ejercicios de SQL

Este repositorio contiene ejercicios de SQL organizados en tres niveles de dificultad: **Básicos**, **Intermedios** y **Avanzados**.

¿Qué es una Query?

Una query o consulta en SQL es una pregunta que se le hace a una base de datos para obtener información. Las consultas se componen de sentencias, comandos y cláusulas.

Conceptos Clave

Sentencia `SELECT`: Permite seleccionar columnas de una base de datos.

Cláusula `DISTINCT`: Selecciona valores únicos de una columna.

Cláusula `ORDER BY`: Ordena los resultados obtenidos.

Cláusula `LIMIT`: Limita la cantidad de resultados.

Cláusula `WHERE`: Filtra resultados según una condición.

Cláusula `LIKE`: Busca patrones específicos utilizando el carácter comodín %.

Cláusula `GROUP BY`: Agrupa filas con los mismos valores en filas de resumen.

Cláusula `HAVING`: Filtra resultados después de aplicar un GROUP BY, permitiendo condiciones con funciones de agregación.

## Ejercicios Básicos

1. **Seleccionar todas las columnas de la tabla Episodios:**
   ```sql
   SELECT * FROM episodios;

2. **Seleccionar las columnas episodio_id y titulo de la tabla Episodios:**
   ```sql
   SELECT episodio_id, titulo FROM episodios;

3. **Obtener géneros únicos de la tabla Series:**
   ```sql
  SELECT DISTINCT genero FROM series;

4. **Seleccionar titulo y duracion de la tabla Episodios y ordenarlos de manera descendente:**
  ```sql
  SELECT titulo, duracion FROM episodios
  ORDER BY duracion DESC;

5. **Seleccionar los primeros 10 registros de la tabla Episodios:**
  ```sql
  SELECT * FROM episodios
  LIMIT 10;

6. **Obtener los 5 episodios con mayor duración:**
  ```sql
  SELECT titulo, duracion FROM episodios
  ORDER BY duracion DESC
  LIMIT 5;

7. **Obtener todas las series del género 'Drama':**
  ```sql
  SELECT * FROM series
  WHERE genero = 'Drama';

8. **Seleccionar todas las series cuyo año de lanzamiento sea mayor a 2015:**
  ```sql
  Copiar código
  SELECT * FROM series
  WHERE año_lanzamiento > 2015;

9. **Seleccionar episodios con duración mayor a 45 minutos y un rating IMDb mayor o igual a 9:**
  ```sql
  SELECT titulo, duracion, rating_imdb FROM episodios
  WHERE duracion > 45 AND rating_imdb >= 9;

10. **Seleccionar todas las series del género 'Comedia' o 'Animación':**
  ```sql
  SELECT * FROM series
  WHERE genero = 'Comedia' OR genero = 'Animación';

11. **Obtener el mismo resultado que el punto anterior utilizando IN:**
  ```sql
  SELECT * FROM series
  WHERE genero IN ('Comedia', 'Animación');

12. **Seleccionar todas las series excepto las del género 'Comedia':**
  ```sql
  SELECT * FROM series
  WHERE genero <> 'Comedia';

13. **Obtener el mismo resultado que el punto anterior utilizando NOT IN:**
  ```sql
  SELECT * FROM series
  WHERE genero NOT IN ('Comedia');

14. **Seleccionar todas las series cuyo título contenga la palabra 'The':**
  ```sql
  SELECT * FROM series
  WHERE titulo LIKE '%The%';

15. **Calcular la duración promedio de episodios para las series con ID 1 y 2:**
  ```sql
  SELECT serie_id, AVG(duracion) AS promedio FROM episodios
  WHERE serie_id IN (1, 2)
  GROUP BY serie_id;

16. **Contar el número de episodios por serie y mostrar solo aquellas con más de 10 episodios:**
```sql
  SELECT serie_id, COUNT(episodio_id) AS numero_episodios 
  FROM episodios
  GROUP BY serie_id
  HAVING COUNT(episodio_id) > 10;
