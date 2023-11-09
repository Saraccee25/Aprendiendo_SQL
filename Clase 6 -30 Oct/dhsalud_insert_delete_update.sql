-- seleccionar la base de datos
use dhsalud;

-- listar datos
SELECT * FROM especialidad;

-- insertar datos
INSERT INTO especialidad (idespecialidad, detalle) 
VALUES (1, "CLINICA MEDICA");

-- insertar varios datos en una sentencia
INSERT INTO especialidad 
VALUES (default, "DERMATOLOGIA"),
(default, "PEDIATRIA"),
(default, "GINECOLOGIA"),
(default, "CIRUGIA"),
(default, "TRAUMATOLOGIA");

-- en este ejemplo se pone la clave foranea a mano, 2 se refiere a  dermatologia
INSERT INTO medico
VALUES (default, "12345", "Juan", "Perez", 2),
(default, "22222", "Lucia", "Montalvo", 3);

SELECT * FROM medico;

-- modificacion de datos
UPDATE medico 
SET nombre = "Juan Jose"
WHERE id_medico = 1;

UPDATE medico
SET matricula = "23687",
especialidad_id = 4
WHERE id_medico = 2;

-- delete
DELETE FROM especialidad
WHERE idespecialidad = 7;