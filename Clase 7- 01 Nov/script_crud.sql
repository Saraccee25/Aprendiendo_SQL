use spotify_dh;

INSERT INTO artista (idartista, nombre, imagen)
values (default, "Britney Spears", "http://imagen1.com");

SELECT * FROM artista;

INSERT INTO artista
VALUES (default, "AC/DC", "http://imagen2.com"),
(default, "Metallica", "http://imagen3.com"),
(default, "Radiohead", "http://imagen4.com"),
(default, "Eminem", "http://imagen5.com");

UPDATE artista
SET imagen = "http://britney_imagen.com"
WHERE idartista = 1;

UPDATE artista
SET imagen = "http://eminem2.com",
nombre = "EMINEM"
WHERE idartista = 5;

DELETE from artista
WHERE idartista = 2;


