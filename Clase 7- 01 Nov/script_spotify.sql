-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify_dh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify_dh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify_dh` DEFAULT CHARACTER SET utf8 ;
USE `spotify_dh` ;

-- -----------------------------------------------------
-- Table `spotify_dh`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`pais` (
  `idpais` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`membresia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`membresia` (
  `idmembresia` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idmembresia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`usuario` (
  `idusuario` INT NOT NULL,
  `nombre_apellido` VARCHAR(45) NULL,
  `email` VARCHAR(75) NULL,
  `codigo_postal` CHAR(4) NULL,
  `pais_idpais` INT NOT NULL,
  `sexo` CHAR(1) NULL,
  `fecha_nacimiento` DATE NULL,
  `password` VARCHAR(15) NULL,
  `fecha_modif` DATETIME NULL,
  `membresia_idmembresia` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_pais_idx` (`pais_idpais` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_usuario_membresia1_idx` (`membresia_idmembresia` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pais`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `spotify_dh`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_membresia1`
    FOREIGN KEY (`membresia_idmembresia`)
    REFERENCES `spotify_dh`.`membresia` (`idmembresia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`playlist` (
  `idplaylist` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `num_canciones` INT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `esta_eliminada` TINYINT NULL,
  `fecha_elimnacion` DATETIME NULL,
  PRIMARY KEY (`idplaylist`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `spotify_dh`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`discografica` (
  `iddiscografica` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `pais_idpais` INT NOT NULL,
  PRIMARY KEY (`iddiscografica`),
  INDEX `fk_discografica_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  CONSTRAINT `fk_discografica_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `spotify_dh`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`artista` (
  `idartista` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `imagen` VARCHAR(75) NULL,
  PRIMARY KEY (`idartista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`album` (
  `idalbum` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `anio_publicacion` YEAR NULL,
  `imagen` VARCHAR(75) NULL,
  `discografica_iddiscografica` INT NOT NULL,
  `artista_idartista` INT NOT NULL,
  PRIMARY KEY (`idalbum`),
  INDEX `fk_album_discografica1_idx` (`discografica_iddiscografica` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_idartista` ASC) VISIBLE,
  CONSTRAINT `fk_album_discografica1`
    FOREIGN KEY (`discografica_iddiscografica`)
    REFERENCES `spotify_dh`.`discografica` (`iddiscografica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_idartista`)
    REFERENCES `spotify_dh`.`artista` (`idartista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`cancion` (
  `idcancion` INT NOT NULL,
  `titulo` VARCHAR(100) NULL,
  `duracion` SMALLINT NULL,
  `num_reproducciones` INT NULL,
  `can_likes` INT NULL,
  `album_idalbum` INT NOT NULL,
  PRIMARY KEY (`idcancion`),
  INDEX `fk_cancion_album1_idx` (`album_idalbum` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_album1`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `spotify_dh`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`genero` (
  `idgenero` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`cancion_has_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`cancion_has_genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cancion_idcancion` INT NOT NULL,
  `genero_idgenero` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cancion_has_genero_genero1_idx` (`genero_idgenero` ASC) VISIBLE,
  INDEX `fk_cancion_has_genero_cancion1_idx` (`cancion_idcancion` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_has_genero_cancion1`
    FOREIGN KEY (`cancion_idcancion`)
    REFERENCES `spotify_dh`.`cancion` (`idcancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancion_has_genero_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `spotify_dh`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify_dh`.`playlist_has_cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify_dh`.`playlist_has_cancion` (
  `playlist_idplaylist` INT NOT NULL,
  `cancion_idcancion` INT NOT NULL,
  PRIMARY KEY (`playlist_idplaylist`, `cancion_idcancion`),
  INDEX `fk_playlist_has_cancion_cancion1_idx` (`cancion_idcancion` ASC) VISIBLE,
  INDEX `fk_playlist_has_cancion_playlist1_idx` (`playlist_idplaylist` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_cancion_playlist1`
    FOREIGN KEY (`playlist_idplaylist`)
    REFERENCES `spotify_dh`.`playlist` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_cancion_cancion1`
    FOREIGN KEY (`cancion_idcancion`)
    REFERENCES `spotify_dh`.`cancion` (`idcancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
