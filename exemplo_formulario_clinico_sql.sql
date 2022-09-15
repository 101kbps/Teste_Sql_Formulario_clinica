-- MySQL Workbench Synchronization
-- Generated: 2022-09-15 10:53
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: 69582653191

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `esquema_clinica`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `esquema_clinica`.`Paciente` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `Telefone` `Telefone` INT(10) NULL DEFAULT NULL ,
CHANGE COLUMN `CPF` `CPF` INT(13) NOT NULL ;

CREATE TABLE IF NOT EXISTS `esquema_clinica`.`Comorbidades_Clinicas` (
  `Hipertensão` CHAR(5) NULL DEFAULT 'nao',
  `Diabetes` CHAR(5) NULL DEFAULT 'nao',
  `Problemas Respiratórios` CHAR(5) NULL DEFAULT 'nao',
  `Epilepsia` CHAR(5) NULL DEFAULT 'nao',
  `Tuberculose` CHAR(5) NULL DEFAULT 'nao',
  `Alteracoes_sist_digestivo` CHAR(5) NULL DEFAULT 'nao',
  `HIV` CHAR(5) NULL DEFAULT 'nao',
  `Hanseniase` CHAR(5) NULL DEFAULT 'nao',
  `Cancer` CHAR(5) NULL DEFAULT 'nao',
  `Outros` VARCHAR(80) NULL DEFAULT NULL,
  `Paciente_idPaciente` INT(11) NOT NULL,
  `Paciente_CPF` INT(13) NOT NULL,
  INDEX `fk_Comorbidades_Clinicas_Paciente1_idx` (`Paciente_idPaciente` ASC, `Paciente_CPF` ASC) VISIBLE,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_CPF`),
  CONSTRAINT `fk_Comorbidades_Clinicas_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_CPF`)
    REFERENCES `esquema_clinica`.`Paciente` (`idPaciente` , `CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `esquema_clinica`.`Atitudes_que_causem_risco_para_si` (
  `Nenhum` CHAR(5) NULL DEFAULT NULL COMMENT 'Paciente não demonstrou/relatou nenhuma atitude que possa representar um risco para si.\n\nEx: Não tem pensamentos suicidas, não cometeu nenhuma violência contra si.',
  `Pensamento_suicida` CHAR(5) NULL DEFAULT 'nao' COMMENT 'Paciente pensou em algum momento em autoextermínio(suicídio).\n\nEx: Pensar que deveria se matar, por qualquer motivo.',
  `Plano_de_suicidio` CHAR(5) NULL DEFAULT 'nao' COMMENT 'Paciente elaborou um plano ou chegou a pensar em quais alternativas seriam viáveis para tirar a própria vida.\n\nEx: Pensou em pular na frente de um ônibus.\n      Pensou em pular da janela.\n      Pensou em consumir fármacos de maneira excessiva para causar uma overdose/morte.\n      ',
  `Tentativa_de_suicidio` CHAR(5) NULL DEFAULT 'nao' COMMENT 'Paciente realizou uma tentativa de tirar a própria vida.\n\nEx: Pular na frente de um ônibus.\n      Pular da janela.\n      Consumir fármacos de maneira excessiva para causar uma overdose/morte.\n      Mutilação corporal em locais com artérias para causar sangramento excessivo.',
  `Ideias_suicidas` CHAR(5) NULL DEFAULT 'nao',
  `Ameaca_de_suicidio` CHAR(5) NULL DEFAULT 'nao',
  `Ideias_de_autolesao_ou_automutilacao` CHAR(5) NULL DEFAULT 'nao' COMMENT 'Paciente pensou cometer violência/mutilação ou pensou em lesionar o seu corpo intencionalmente.\n\nEx: Pensar em se cortar/queimar intencionalmente.',
  `Historico_familiar_de_suicidio` CHAR(5) NULL DEFAULT 'nao' COMMENT 'Paciente possui algum parente que tenha cometido suicídio.\n\nEx:Primos, tios, pais...',
  `Observacao_extra` VARCHAR(500) NULL DEFAULT NULL,
  `Paciente_idPaciente` INT(11) NOT NULL,
  `Paciente_CPF` INT(13) NOT NULL,
  INDEX `fk_Atitudes_que_causem_risco_para_si_Paciente_idx` (`Paciente_idPaciente` ASC, `Paciente_CPF` ASC) VISIBLE,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_CPF`),
  CONSTRAINT `fk_Atitudes_que_causem_risco_para_si_Paciente`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_CPF`)
    REFERENCES `esquema_clinica`.`Paciente` (`idPaciente` , `CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `esquema_clinica`.`Atitudes_que_causem_risco_para_outros` (
  `Nenhum` CHAR(5) NULL DEFAULT NULL,
  `Plano_de_matar_alguem` CHAR(5) NULL DEFAULT 'nao',
  `Agredir_alguem` CHAR(5) NULL DEFAULT 'nao',
  `Ideias_de_ferir_alguem` CHAR(5) NULL DEFAULT 'nao',
  `Tentativa_de_ferir_alguem` CHAR(5) NULL DEFAULT 'nao',
  `Ameaca_de_ferir_alguem` CHAR(5) NULL DEFAULT 'nao',
  `Observacoes_adicionais` VARCHAR(500) NULL DEFAULT NULL,
  `Paciente_idPaciente` INT(11) NOT NULL,
  `Paciente_CPF` INT(13) NOT NULL,
  INDEX `fk_Atitudes_que_causem_risco_para_outros_Paciente1_idx` (`Paciente_idPaciente` ASC, `Paciente_CPF` ASC) VISIBLE,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_CPF`),
  CONSTRAINT `fk_Atitudes_que_causem_risco_para_outros_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_CPF`)
    REFERENCES `esquema_clinica`.`Paciente` (`idPaciente` , `CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `esquema_clinica`.`Tipo_de_Violencia_interpessoal_autoprovocada` (
  `Fisica` CHAR(5) NULL DEFAULT 'nao',
  `Psicologica_ou_moral` CHAR(5) NULL DEFAULT 'nao',
  `Tortura` CHAR(5) NULL DEFAULT 'nao',
  `Sexual` CHAR(5) NULL DEFAULT 'nao',
  `Trabalho_infantil` CHAR(5) NULL DEFAULT 'nao',
  `Financeira_economica` CHAR(5) NULL DEFAULT 'nao',
  `Negligencia_abandono` CHAR(5) NULL DEFAULT 'nao',
  `Intervencao_legal` CHAR(5) NULL DEFAULT 'nao',
  `Outros` VARCHAR(500) NULL DEFAULT NULL,
  `Paciente_idPaciente` INT(11) NOT NULL,
  `Paciente_CPF` INT(13) NOT NULL,
  INDEX `fk_Tipo_de_Violencia_interpessoal_autoprovocada_Paciente1_idx` (`Paciente_idPaciente` ASC, `Paciente_CPF` ASC) VISIBLE,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_CPF`),
  CONSTRAINT `fk_Tipo_de_Violencia_interpessoal_autoprovocada_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_CPF`)
    REFERENCES `esquema_clinica`.`Paciente` (`idPaciente` , `CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `esquema_clinica`.`Meio_de_agressao_interpessoal_autoprovocada` (
  `Forca_corporal_espancamento` CHAR(5) NULL DEFAULT 'nao',
  `obj_perfuro_cortante` CHAR(5) NULL DEFAULT 'nao',
  `Substancia_obj_quente` CHAR(5) NULL DEFAULT 'nao',
  `Obj_contundente` CHAR(5) NULL DEFAULT 'nao',
  `Envenenamento_intoxicacao` CHAR(5) NULL DEFAULT 'nao',
  `Arma_de_fogo` CHAR(5) NULL DEFAULT 'nao',
  `Ameaca` CHAR(5) NULL DEFAULT 'nao',
  `Outros` VARCHAR(500) NULL DEFAULT NULL,
  `Paciente_idPaciente` INT(11) NOT NULL,
  `Paciente_CPF` INT(13) NOT NULL,
  INDEX `fk_Meio_de_agressao_interpessoal_autoprovocada_Paciente1_idx` (`Paciente_idPaciente` ASC, `Paciente_CPF` ASC) VISIBLE,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_CPF`),
  CONSTRAINT `fk_Meio_de_agressao_interpessoal_autoprovocada_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_CPF`)
    REFERENCES `esquema_clinica`.`Paciente` (`idPaciente` , `CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `esquema_clinica`.`Comportamento_antissocial` (
  `Nenhum` CHAR(5) NULL DEFAULT NULL,
  `Fuga_de_casa` CHAR(5) NULL DEFAULT 'nao',
  `Atear_fogo` CHAR(5) NULL DEFAULT 'nao',
  `Exibicionismo` CHAR(5) NULL DEFAULT 'nao',
  `Mentiras_frequentes` CHAR(5) NULL DEFAULT 'nao',
  `Destruicao_de_propriedade` CHAR(5) NULL DEFAULT 'nao',
  `Perda_de_trabalho_inadequadamente` CHAR(5) NULL DEFAULT 'nao',
  `Comport_sexual_de_risco` CHAR(5) NULL DEFAULT 'nao',
  `Brigas_excessivas` CHAR(5) NULL DEFAULT 'nao',
  `Usar_nomes_falsos` CHAR(5) NULL DEFAULT 'nao',
  `Outros` VARCHAR(500) NULL DEFAULT NULL,
  `Paciente_idPaciente` INT(11) NOT NULL,
  `Paciente_CPF` INT(13) NOT NULL,
  INDEX `fk_Comportamento_antissocial_Paciente1_idx` (`Paciente_idPaciente` ASC, `Paciente_CPF` ASC) VISIBLE,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_CPF`),
  CONSTRAINT `fk_Comportamento_antissocial_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_CPF`)
    REFERENCES `esquema_clinica`.`Paciente` (`idPaciente` , `CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
