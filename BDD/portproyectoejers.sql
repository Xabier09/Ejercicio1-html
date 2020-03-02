-- 1.- Nombres de naciones con circuito

select pais
from naciones
where exists (select nombre
            from circuitos
            where clave_nacion = nacion)

-- 2.- Listado con Nombre piloto, Nombre Equipo, Nacion del piloto ordenado por Nombre piloto Asc

select pilotos.nombre, equipos.nombre, pais
    from pilotos, equipos, naciones
    where pilotos.equipo=equipos.clave_equipo
	and naciones.clave_nacion=pilotos.nacion
    order by pilotos.nombre asc;

-- 3.- Todos los podios (1º, 2º y 3º) con Nombre piloto, nombre circuito, posicion (ordenado por circuito)

select posicion, circuito, piloto
from resultados
where posicion <4
order by circuito asc

-- 4.- Nombre de los pilotos que no han puntuado en Montecarlo.

select nombre
from pilotos
where not exists
	(select *
    from circuitos, resultados
    where clave_circuitos=circuito and
    clave_piloto=piloto and
    circuitos.nombres='Montecarlo');

-- 5.- Clasificación del mundial (Nombre piloto, puntos)

select nombre as Piloto, sum(puntos) as Puntos
    from pilotos p, resultados r, puntos n
    where p.clave_piloto=r.piloto
	    and r.posicion=n.posicion
    group by Piloto
    order by Puntos desc

-- 6.- Clasificación del mundial (Nombre piloto, puntos) solo los 5 primeros

select nombre as Piloto, sum(puntos) as Puntos
    from pilotos p, resultados r, puntos n
    where p.clave_piloto=r.piloto
	    and r.posicion=n.posicion
    group by Piloto
    order by Puntos desc
    limit 5

-- 7.- Clasificación del mundial (Nombre piloto, puntos) solo pilotos con mas de 20 puntos.

select nombre as Piloto, sum(puntos) as Puntos
    from pilotos p, resultados r, puntos n
    where p.clave_piloto=r.piloto
	    and r.posicion=n.posicion
        and Puntos >20
    group by Piloto
    having Puntos >20
    order by Puntos desc

-- 8.-Circuitos en cuya nación existe un equipo de F1 (subconsulta con EXISTS)

select c.nombre as Circuito, pais as Nacion, e.nombre as Equipo
from equipos e,naciones n,circuitos c
where exists (select *
				from circuitos, naciones
                where n.clave_nacion=c.nacion
					and e.nacion=n.clave_nacion)

-- 9.-Clasificacion por equipos. (Equipo y lo puntos de sus pilotos)

-- 10.-Pilotos que han ganado alguna carrera (subconsulta con exists)

-- 11.-Pilotos que han hecho podio en Montecarlo (subconsulta con IN)

-- 12.-Equipos que no han ganado ninguna carrera (subconsulta con NOT EXISTS)

-- 13.-Pilotos que han ganado más de una carrera

-- 14.-Las naciones con el nombre del circuito o especificando que no tiene circuito

/*
+----------------+------------------------------------+
| pais           | ifnull(nombre,'No tiene circuito') |
+----------------+------------------------------------+
| Abu Dhabi      | Yas Marina                         |
| Alemania       | Nurburgring                        |
| Australia      | Albert Park                        |
| Bahrein        | Sakhir                             |
| Belgica        | Spa-Francochamps                   |
| Brasil         | Interlagos                         |
| Canada         | Gilles Villeneuve                  |
| China          | Shanghai                           |
| España         | Montmelo                           |
| Finlandia      | No tiene circuito                  |
| Francia        | No tiene circuito                  |
| Gran Bretaña   | Silverstone                        |
| Holanda        | No tiene circuito                  |
| Hungria        | Hungaroring                        |
| India          | Buddh                              |
| Italia         | Monza                              |
| Japon          | Suzuka                             |
| Corea del Sur  | Yeongam                            |
| Malasia        | Sepang                             |
| Mexico         | No tiene circuito                  |
| Monaco         | Montecarlo                         |
| Polonia        | No tiene circuito                  |
| Rusia          | No tiene circuito                  |
| Singapur       | Marina Bay                         |
| Suiza          | No tiene circuito                  |
| Turquia        | No tiene circuito                  |
| Estados Unidos | Austin                             |
| Venezuela      | No tiene circuito                  |
+----------------+------------------------------------+

o lo que es lo mismo 

+----------------+-----------------------------+
| pais           | ifnull(circuitos.nombre,'') |
+----------------+-----------------------------+
| Abu Dhabi      | Yas Marina                  |
| Alemania       | Nurburgring                 |
| Australia      | Albert Park                 |
| Bahrein        | Sakhir                      |
| Belgica        | Spa-Francochamps            |
| Brasil         | Interlagos                  |
| Canada         | Gilles Villeneuve           |
| China          | Shanghai                    |
| España         | Montmelo                    |
| Finlandia      |                             |
| Francia        |                             |
| Gran Bretaña   | Silverstone                 |
| Holanda        |                             |
| Hungria        | Hungaroring                 |
| India          | Buddh                       |
| Italia         | Monza                       |
| Japon          | Suzuka                      |
| Corea del Sur  | Yeongam                     |
| Malasia        | Sepang                      |
| Mexico         |                             |
| Monaco         | Montecarlo                  |
| Polonia        |                             |
| Rusia          |                             |
| Singapur       | Marina Bay                  |
| Suiza          |                             |
| Turquia        |                             |
| Estados Unidos | Austin                      |
| Venezuela      |                             |
+----------------+-----------------------------+
*/
------+-------------------+
*/