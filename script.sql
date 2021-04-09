-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema seguradora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seguradora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seguradora` DEFAULT CHARACTER SET utf8 ;
USE `seguradora` ;

-- -----------------------------------------------------
-- Table `seguradora`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`cliente` (
  `s_cpf_cliente` VARCHAR(15) NOT NULL,
  `s_nome_cliente` VARCHAR(60) NOT NULL,
  `s_celular_cliente` VARCHAR(15) NOT NULL,
  `s_telefone_cliente` VARCHAR(14) NULL DEFAULT NULL,
  `s_rua_cliente` VARCHAR(60) NOT NULL,
  `s_cep_cliente` VARCHAR(9) NOT NULL,
  `s_complemento_cliente` VARCHAR(60) NULL DEFAULT NULL,
  `i_numeroResidencial_cliente` INT NOT NULL,
  PRIMARY KEY (`s_cpf_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `seguradora`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`carro` (
  `s_placa_carro` VARCHAR(7) NOT NULL,
  `s_tipo_carro` VARCHAR(25) NOT NULL,
  `i_ano_carro` INT NOT NULL,
  `s_marca_carro` VARCHAR(20) NOT NULL,
  `cliente_s_cpf_cliente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`s_placa_carro`),
  INDEX `fk_carro_cliente1_idx` (`cliente_s_cpf_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_carro_cliente1`
    FOREIGN KEY (`cliente_s_cpf_cliente`)
    REFERENCES `seguradora`.`cliente` (`s_cpf_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `seguradora`.`apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`apolice` (
  `i_numero_apolice` INT NOT NULL AUTO_INCREMENT,
  `f_valor_apolice` FLOAT(10,2) NOT NULL,
  `dt_dataInicial_apolice` DATE NOT NULL,
  `dt_validade_apolice` DATE NOT NULL,
  `cliente_s_cpf_cliente` VARCHAR(15) NOT NULL,
  `carro_s_placa_carro` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`i_numero_apolice`),
  INDEX `fk_apolice_cliente1_idx` (`cliente_s_cpf_cliente` ASC) VISIBLE,
  INDEX `fk_apolice_carro1_idx` (`carro_s_placa_carro` ASC) VISIBLE,
  CONSTRAINT `fk_apolice_carro1`
    FOREIGN KEY (`carro_s_placa_carro`)
    REFERENCES `seguradora`.`carro` (`s_placa_carro`),
  CONSTRAINT `fk_apolice_cliente1`
    FOREIGN KEY (`cliente_s_cpf_cliente`)
    REFERENCES `seguradora`.`cliente` (`s_cpf_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `seguradora`.`registrodeacidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`registrodeacidente` (
  `i_nRegistro_registroDeAcidente` INT NOT NULL AUTO_INCREMENT,
  `dt_data_registroDeAcidente` DATETIME NOT NULL,
  `s_rua_registroDeAcidente` VARCHAR(45) NOT NULL,
  `s_cep_registroDeAcidente` VARCHAR(45) NOT NULL,
  `f_custoDeConcerto_registroDeAcidente` FLOAT(11,2) NOT NULL,
  `carro_s_placa_carro` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`i_nRegistro_registroDeAcidente`),
  INDEX `fk_registroDeAcidente_carro1_idx` (`carro_s_placa_carro` ASC) VISIBLE,
  CONSTRAINT `fk_registroDeAcidente_carro1`
    FOREIGN KEY (`carro_s_placa_carro`)
    REFERENCES `seguradora`.`carro` (`s_placa_carro`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
