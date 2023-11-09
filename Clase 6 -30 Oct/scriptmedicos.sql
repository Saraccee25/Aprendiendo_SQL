-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dhsalud
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dhsalud
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dhsalud` DEFAULT CHARACTER SET utf8 ;
USE `dhsalud` ;

-- -----------------------------------------------------
-- Table `dhsalud`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhsalud`.`paciente` (
  `num_socio` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`num_socio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhsalud`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhsalud`.`especialidad` (
  `idespecialidad` INT NOT NULL AUTO_INCREMENT,
  `detalle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespecialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhsalud`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhsalud`.`medico` (
  `id_medico` INT NOT NULL AUTO_INCREMENT,
  `matricula` CHAR(5) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `especialidad_id` INT NOT NULL,
  PRIMARY KEY (`id_medico`),
  INDEX `fk_medico_especialidad_idx` (`especialidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_medico_especialidad`
    FOREIGN KEY (`especialidad_id`)
    REFERENCES `dhsalud`.`especialidad` (`idespecialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhsalud`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhsalud`.`turno` (
  `idturno` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NULL,
  `consultorio` CHAR(4) NULL,
  `medico_id_medico` INT NOT NULL,
  `paciente_num_socio` INT NOT NULL,
  PRIMARY KEY (`idturno`),
  INDEX `fk_turno_medico1_idx` (`medico_id_medico` ASC) VISIBLE,
  INDEX `fk_turno_paciente1_idx` (`paciente_num_socio` ASC) VISIBLE,
  CONSTRAINT `fk_turno_medico1`
    FOREIGN KEY (`medico_id_medico`)
    REFERENCES `dhsalud`.`medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turno_paciente1`
    FOREIGN KEY (`paciente_num_socio`)
    REFERENCES `dhsalud`.`paciente` (`num_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
