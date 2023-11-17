-- iniciar postgresql

psql -U postgres

-- Creacion de Base de datos
CREATE DATABASE desafio3_matias_portilla_685;

-- ingresar a Base

\c desafio3_matias_portilla_685

-- Crear tabla usuarios

CREATE TABLE usuarios (
  id serial PRIMARY KEY,
  email varchar,
  nombre varchar,
  apellido varchar,
  rol varchar
);

-- Insertar usuarios

INSERT INTO usuarios (email, nombre, apellido, rol)
VALUES 
  ('ppascal@gmail.com', 'Pedro', 'Pascal', 'usuario'),
  ('jmiller@gmail.com', 'Joel', 'Miller', 'usuario'),
  ('ewilliams@gmail.com', 'Ellie', 'Williams', 'administrador'),
  ('tmiller@gmail.com', 'Tommy', 'Miller', 'usuario'),
  ('tservopoulos@gmail.com', 'tess', 'Servopoulos', 'usuario');

-- Resultado
 id |         email          | nombre |  apellido   |      rol      
----+------------------------+--------+-------------+---------------
  1 | ppascal@gmail.com      | Pedro  | Pascal      | usuario
  2 | jmiller@gmail.com      | Joel   | Miller      | usuario
  3 | ewilliams@gmail.com    | Ellie  | Williams    | administrador
  4 | tmiller@gmail.com      | Tommy  | Miller      | usuario
  5 | tservopoulos@gmail.com | tess   | Servopoulos | usuario
(5 rows)

-- Crear tabla posts

CREATE TABLE posts (
  id serial PRIMARY KEY,
  titulo varchar,
  contenido text,
  fecha_creacion timestamp DEFAULT CURRENT_TIMESTAMP,
  fecha_actualizacion timestamp DEFAULT CURRENT_TIMESTAMP,
  destacado boolean,
  usuario_id bigint
);

-- Insertar posts

INSERT INTO posts (titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES
('Sobrevivir', '10 consejos para sobrevivir a la infección', '2023-11-15 18:54:10.2', NOW(), true, 3),
('Alerta Roja: Epidemia de Zombis', 'Cómo prepararse para el brote de zombis que se avecina', '2023-11-16 09:30:00.0', NOW(), true, 3),
('Informe Médico: Virus Mortal Extendido', 'Descubren un virus letal con propagación rápida, la población en riesgo', '2023-11-17 12:15:45.5', NOW(), false, 4),
('Refugios Antizombi en tu Ciudad', 'Encuentra los lugares seguros para protegerte durante el apocalipsis zombi', '2023-11-18 15:20:30.8', NOW(), false, 5),
('Armas Efectivas contra Zombis', 'Las mejores armas para defenderte en caso de un ataque zombi', '2023-11-19 20:45:22.1', NOW(), false, null);

-- Resultado
 id |                 titulo                 |                                 contenido                                  |    fecha_creacion     |    fecha_actualizacion     | destacado | usuario_id 
----+----------------------------------------+----------------------------------------------------------------------------+-----------------------+----------------------------+-----------+------------
  1 | Sobrevivir                             | 10 consejos para sobrevivir a la infección                                 | 2023-11-15 18:54:10.2 | 2023-11-15 19:51:21.384262 | t         |          3
  2 | Alerta Roja: Epidemia de Zombis        | Cómo prepararse para el brote de zombis que se avecina                     | 2023-11-16 09:30:00   | 2023-11-15 19:51:21.384262 | t         |          3
  3 | Informe Médico: Virus Mortal Extendido | Descubren un virus letal con propagación rápida, la población en riesgo    | 2023-11-17 12:15:45.5 | 2023-11-15 19:51:21.384262 | f         |          4
  4 | Refugios Antizombi en tu Ciudad        | Encuentra los lugares seguros para protegerte durante el apocalipsis zombi | 2023-11-18 15:20:30.8 | 2023-11-15 19:51:21.384262 | f         |          5
  5 | Armas Efectivas contra Zombis          | Las mejores armas para defenderte en caso de un ataque zombi               | 2023-11-19 20:45:22.1 | 2023-11-15 19:51:21.384262 | f         |           
(5 rows)

-- Crear tabla comentarios

CREATE TABLE comentarios (
  id serial PRIMARY KEY,
  contenido text,
  fecha_creacion timestamp,
  usuario_id bigint,
  post_id bigint
);

-- Insertar comentarios

INSERT INTO comentarios (contenido, fecha_creacion, usuario_id, post_id)
VALUES
('Muy útiles las recomendaciones. Gracias por compartir.', '2023-11-20 21:01:00.36', 1, 1),
('¿Cómo protegerse de los zombis en casa?', '2023-11-21 08:45:12.5', 2, 1),
('¡Alerta máxima! Este virus es peligroso. Estén preparados.', '2023-11-22 14:30:05.8', 3, 1),
('¿Dónde encuentro refugios antizombi en mi ciudad?', '2023-11-23 19:20:30.2', 1, 2),
('Excelente información sobre armas antizombi. Me siento más preparado.', '2023-11-24 10:15:22.7', 2, 2);

-- Resultado
 id |                               contenido                               |     fecha_creacion     | usuario_id | post_id 
----+-----------------------------------------------------------------------+------------------------+------------+---------
  1 | Muy útiles las recomendaciones. Gracias por compartir.                | 2023-11-20 21:01:00.36 |          1 |       1
  2 | ¿Cómo protegerse de los zombis en casa?                               | 2023-11-21 08:45:12.5  |          2 |       1
  3 | ¡Alerta máxima! Este virus es peligroso. Estén preparados.            | 2023-11-22 14:30:05.8  |          3 |       1
  4 | ¿Dónde encuentro refugios antizombi en mi ciudad?                     | 2023-11-23 19:20:30.2  |          1 |       2
  5 | Excelente información sobre armas antizombi. Me siento más preparado. | 2023-11-24 10:15:22.7  |          2 |       2
(5 rows)

-- 2) Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas. nombre e email del usuario junto al título y contenido del posts. 

SELECT a.nombre, a.email, b.titulo, b.contenido  FROM usuarios as a INNER JOIN posts as b ON a.id = b.usuario_id;


-- Respuesta
 nombre |         email          |                 titulo                 |                                 contenido                                  
--------+------------------------+----------------------------------------+----------------------------------------------------------------------------
 Ellie  | ewilliams@gmail.com    | Sobrevivir                             | 10 consejos para sobrevivir a la infección
 Ellie  | ewilliams@gmail.com    | Alerta Roja: Epidemia de Zombis        | Cómo prepararse para el brote de zombis que se avecina
 Tommy  | tmiller@gmail.com      | Informe Médico: Virus Mortal Extendido | Descubren un virus letal con propagación rápida, la población en riesgo
 tess   | tservopoulos@gmail.com | Refugios Antizombi en tu Ciudad        | Encuentra los lugares seguros para protegerte durante el apocalipsis zombi
(4 rows)


-- 3) Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id.

SELECT p.id,titulo,contenido FROM posts p INNER JOIN usuarios u ON u.id=p.usuario_id WHERE u.rol = 'administrador';

-- Respuesta
 id_post |             titulo              |                       contenido                        
---------+---------------------------------+--------------------------------------------------------
       1 | Sobrevivir                      | 10 consejos para sobrevivir a la infección
       2 | Alerta Roja: Epidemia de Zombis | Cómo prepararse para el brote de zombis que se avecina
(2 rows)

-- 4) Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de post de cada usuario.

SELECT a.id, a.email, COUNT(b.id) AS cantidad_posts
FROM usuarios as  a
LEFT JOIN posts b ON a.id = b.usuario_id
GROUP BY a.id, a.email;

-- Respuesta
 id |         email          | cantidad_posts 
----+------------------------+----------------
  4 | tmiller@gmail.com      |              1
  2 | jmiller@gmail.com      |              0
  3 | ewilliams@gmail.com    |              2
  5 | tservopoulos@gmail.com |              1
  1 | ppascal@gmail.com      |              0
(5 rows)

-- 5) Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email.

SELECT a.email FROM usuarios a
INNER JOIN ( SELECT usuario_id, COUNT(*) as num_posts FROM posts GROUP BY usuario_id ORDER BY num_posts DESC LIMIT 1) as b ON a.id = b.usuario_id;

-- Respuesta
        email        
---------------------
 ewilliams@gmail.com
(1 row)

-- 6) Muestra la fecha del último posts de cada usuario. 

SELECT a.nombre, a.apellido, a.email, TO_CHAR(max(b.fecha_creacion), 'DD-MM-YYYY') AS fecha_ultimo_post
FROM usuarios a
inner JOIN posts as b ON a.id = b.usuario_id
GROUP BY a.nombre, a.apellido, a.email
order by a.apellido;

-- Respuesta
 nombre |  apellido   |         email          | fecha_ultimo_post 
--------+-------------+------------------------+-------------------
 Tommy  | Miller      | tmiller@gmail.com      | 17-11-2023
 tess   | Servopoulos | tservopoulos@gmail.com | 18-11-2023
 Ellie  | Williams    | ewilliams@gmail.com    | 16-11-2023
(3 rows)



-- 7) Muestra el título y contenido del posts (artículo) con más comentarios. 

SELECT p.titulo, p.contenido, c.num_comentarios
FROM posts AS p
INNER JOIN (
    SELECT post_id, COUNT(*) as num_comentarios
    FROM comentarios
    GROUP BY post_id
    ORDER BY num_comentarios DESC
    LIMIT 1
) AS c ON p.id = c.post_id;

-- Respuesta
   titulo   |                 contenido                  | num_comentarios 
------------+--------------------------------------------+-----------------
 Sobrevivir | 10 consejos para sobrevivir a la infección |               3
(1 row)

-- 8) Muestra en una tabla el título de cada posts, el contenido de cada posts y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió. 

SELECT p.titulo as post_titulo, p.contenido as post_contenido, c.contenido as comentario_contenido, u.email from posts as p
inner join comentarios as c on p.id=c.post_id
INNER JOIN usuarios AS u ON u.id=c.usuario_id;

-- Respuesta
           post_titulo           |                     post_contenido                     |                         comentario_contenido                          |        email        
---------------------------------+--------------------------------------------------------+-----------------------------------------------------------------------+---------------------
 Sobrevivir                      | 10 consejos para sobrevivir a la infección             | Muy útiles las recomendaciones. Gracias por compartir.                | ppascal@gmail.com
 Sobrevivir                      | 10 consejos para sobrevivir a la infección             | ¿Cómo protegerse de los zombis en casa?                               | jmiller@gmail.com
 Sobrevivir                      | 10 consejos para sobrevivir a la infección             | ¡Alerta máxima! Este virus es peligroso. Estén preparados.            | ewilliams@gmail.com
 Alerta Roja: Epidemia de Zombis | Cómo prepararse para el brote de zombis que se avecina | ¿Dónde encuentro refugios antizombi en mi ciudad?                     | ppascal@gmail.com
 Alerta Roja: Epidemia de Zombis | Cómo prepararse para el brote de zombis que se avecina | Excelente información sobre armas antizombi. Me siento más preparado. | jmiller@gmail.com
(5 rows)

-- 9) Muestra el contenido del último comentario de cada usuario. 

SELECT a.nombre, a.apellido, c.contenido, TO_CHAR(c.fecha_creacion, 'DD-MM-YYYY') AS fecha_ultimo_comentario
FROM comentarios AS c
INNER JOIN ( SELECT usuario_id, MAX(fecha_creacion) AS ultima_fecha FROM comentarios GROUP BY usuario_id) AS u ON c.usuario_id = u.usuario_id 
INNER JOIN usuarios AS a ON a.id=u.usuario_id
where c.fecha_creacion = u.ultima_fecha
ORDER BY c.usuario_id;

-- Respuesta
nombre | apellido |                               contenido                               | fecha_ultimo_comentario 
--------+----------+-----------------------------------------------------------------------+-------------------------
 Pedro  | Pascal   | ¿Dónde encuentro refugios antizombi en mi ciudad?                     | 23-11-2023
 Joel   | Miller   | Excelente información sobre armas antizombi. Me siento más preparado. | 24-11-2023
 Ellie  | Williams | ¡Alerta máxima! Este virus es peligroso. Estén preparados.            | 22-11-2023
(3 rows)

-- 10) Muestra los emails de los usuarios que no han escrito ningún comentario. 

SELECT a.email, COUNT(c.id) as cantidad_comentarios
FROM usuarios a LEFT JOIN comentarios c
ON a.id = c.usuario_id
GROUP BY a.email,a.id
having COUNT(c.id)=0;

-- Respuesta
         email          | cantidad_comentarios 
------------------------+----------------------
 tmiller@gmail.com      |                    0
 tservopoulos@gmail.com |                    0
(2 rows)
