-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca_dh
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca_dh
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca_dh` ;
USE `biblioteca_dh` ;

-- -----------------------------------------------------
-- Table `biblioteca_dh`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`autor` (
  `idautor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idautor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca_dh`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`editorial` (
  `ideditorial` INT NOT NULL,
  `razon_social` VARCHAR(65) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ideditorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca_dh`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`libros` (
  `idlibro` INT NOT NULL,
  `ISBN_cod` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `anio_1` SMALLINT(4) NOT NULL,
  `anio_2` SMALLINT(4) NOT NULL,
  `autor_idautor` INT NOT NULL,
  `editorial_ideditorial` INT NOT NULL,
  PRIMARY KEY (`idlibro`),
  INDEX `fk_libros_autor_idx` (`autor_idautor` ASC) VISIBLE,
  INDEX `fk_libros_editorial1_idx` (`editorial_ideditorial` ASC) VISIBLE,
  CONSTRAINT `fk_libros_autor`
    FOREIGN KEY (`autor_idautor`)
    REFERENCES `biblioteca_dh`.`autor` (`idautor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_editorial1`
    FOREIGN KEY (`editorial_ideditorial`)
    REFERENCES `biblioteca_dh`.`editorial` (`ideditorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca_dh`.`socios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`socios` (
  `idsocio` INT NOT NULL,
  `dni` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsocio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca_dh`.`copias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`copias` (
  `idcopia` INT NOT NULL,
  `deteriorado` TINYINT NOT NULL,
  `libros_idlibro` INT NOT NULL,
  PRIMARY KEY (`idcopia`),
  INDEX `fk_copias_libros1_idx` (`libros_idlibro` ASC) VISIBLE,
  CONSTRAINT `fk_copias_libros1`
    FOREIGN KEY (`libros_idlibro`)
    REFERENCES `biblioteca_dh`.`libros` (`idlibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca_dh`.`prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`prestamo` (
  `idprestamo` INT NOT NULL,
  `fecha_retiro` DATE NOT NULL,
  `fecha_devo` DATE NOT NULL,
  `fecha_tope` VARCHAR(45) NOT NULL,
  `socios_idsocio` INT NOT NULL,
  PRIMARY KEY (`idprestamo`),
  INDEX `fk_prestamo_socios1_idx` (`socios_idsocio` ASC) VISIBLE,
  CONSTRAINT `fk_prestamo_socios1`
    FOREIGN KEY (`socios_idsocio`)
    REFERENCES `biblioteca_dh`.`socios` (`idsocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca_dh`.`copias_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_dh`.`copias_prestamo` (
  `idcopia_prestamo` INT NOT NULL,
  `prestamo_idprestamo` INT NOT NULL,
  `copias_idcopia` INT NOT NULL,
  INDEX `fk_prestamo_has_copias_copias1_idx` (`copias_idcopia` ASC) VISIBLE,
  INDEX `fk_prestamo_has_copias_prestamo1_idx` (`prestamo_idprestamo` ASC) VISIBLE,
  PRIMARY KEY (`idcopia_prestamo`),
  CONSTRAINT `fk_prestamo_has_copias_prestamo1`
    FOREIGN KEY (`prestamo_idprestamo`)
    REFERENCES `biblioteca_dh`.`prestamo` (`idprestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamo_has_copias_copias1`
    FOREIGN KEY (`copias_idcopia`)
    REFERENCES `biblioteca_dh`.`copias` (`idcopia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
