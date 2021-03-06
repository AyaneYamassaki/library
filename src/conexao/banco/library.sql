-- MySQL Script generated by MySQL Workbench
-- Tue Apr  6 15:49:05 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 3762230_library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 3762230_library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `3762230_library` DEFAULT CHARACTER SET utf8 ;
USE `3762230_library` ;

-- -----------------------------------------------------
-- Table `3762230_library`.`TIPO_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`TIPO_USUARIO` (
  `IDTIPO_USUARIO` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDTIPO_USUARIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3762230_library`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`CURSO` (
  `IDCURSO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IDCURSO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3762230_library`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`USUARIO` (
  `IDUSUARIO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(150) NOT NULL,
  `EMAIL` VARCHAR(225) NOT NULL,
  `SENHA` VARCHAR(36) NOT NULL,
  `TIPO_USUARIO_IDTIPO_USUARIO` INT NOT NULL,
  `CURSO_IDCURSO` INT NOT NULL,
  PRIMARY KEY (`IDUSUARIO`),
  INDEX `fk_USUARIO_TIPO_USUARIO_idx` (`TIPO_USUARIO_IDTIPO_USUARIO` ASC),
  INDEX `fk_USUARIO_CURSO1_idx` (`CURSO_IDCURSO` ASC),
  CONSTRAINT `fk_USUARIO_TIPO_USUARIO`
    FOREIGN KEY (`TIPO_USUARIO_IDTIPO_USUARIO`)
    REFERENCES `3762230_library`.`TIPO_USUARIO` (`IDTIPO_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_CURSO1`
    FOREIGN KEY (`CURSO_IDCURSO`)
    REFERENCES `3762230_library`.`CURSO` (`IDCURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3762230_library`.`EIXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`EIXO` (
  `IDEIXO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(100) NULL,
  `CURSO_IDCURSO` INT NOT NULL,
  PRIMARY KEY (`IDEIXO`),
  INDEX `fk_EIXO_CURSO1_idx` (`CURSO_IDCURSO` ASC),
  CONSTRAINT `fk_EIXO_CURSO1`
    FOREIGN KEY (`CURSO_IDCURSO`)
    REFERENCES `3762230_library`.`CURSO` (`IDCURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3762230_library`.`TRABALHO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`TRABALHO` (
  `IDTRABALHO` INT NOT NULL AUTO_INCREMENT,
  `TITULO` VARCHAR(150) NOT NULL,
  `ANO` INT NOT NULL,
  `NROPAGINAS` INT NOT NULL,
  `RESUMO` LONGTEXT NOT NULL,
  `ORIENTADOR` VARCHAR(100) NOT NULL,
  `COORIENTADOR` VARCHAR(100) NULL,
  `ARQUIVO` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`IDTRABALHO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3762230_library`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`AUTOR` (
  `USUARIO_IDUSUARIO` INT NOT NULL,
  `TRABALHO_IDTRABALHO` INT NOT NULL,
  PRIMARY KEY (`USUARIO_IDUSUARIO`, `TRABALHO_IDTRABALHO`),
  INDEX `fk_USUARIO_has_TRABALHO_TRABALHO1_idx` (`TRABALHO_IDTRABALHO` ASC),
  INDEX `fk_USUARIO_has_TRABALHO_USUARIO1_idx` (`USUARIO_IDUSUARIO` ASC),
  CONSTRAINT `fk_USUARIO_has_TRABALHO_USUARIO1`
    FOREIGN KEY (`USUARIO_IDUSUARIO`)
    REFERENCES `3762230_library`.`USUARIO` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_has_TRABALHO_TRABALHO1`
    FOREIGN KEY (`TRABALHO_IDTRABALHO`)
    REFERENCES `3762230_library`.`TRABALHO` (`IDTRABALHO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3762230_library`.`HISTORICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3762230_library`.`HISTORICO` (
  `IDHISTORICO` INT NOT NULL AUTO_INCREMENT,
  `DATA` DATE NOT NULL,
  `HORA` TIME NOT NULL,
  `USUARIO_IDUSUARIO` INT NOT NULL,
  `TRABALHO_IDTRABALHO` INT NOT NULL,
  PRIMARY KEY (`IDHISTORICO`),
  INDEX `fk_HISTORICO_USUARIO1_idx` (`USUARIO_IDUSUARIO` ASC),
  INDEX `fk_HISTORICO_TRABALHO1_idx` (`TRABALHO_IDTRABALHO` ASC),
  CONSTRAINT `fk_HISTORICO_USUARIO1`
    FOREIGN KEY (`USUARIO_IDUSUARIO`)
    REFERENCES `3762230_library`.`USUARIO` (`IDUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HISTORICO_TRABALHO1`
    FOREIGN KEY (`TRABALHO_IDTRABALHO`)
    REFERENCES `3762230_library`.`TRABALHO` (`IDTRABALHO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
