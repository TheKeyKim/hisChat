use hisChat;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hisChat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hisChat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hisChat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
USE `hisChat` ;

-- -----------------------------------------------------
-- Table `hisChat`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hisChat`.`user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) not NULL,
  `status` VARCHAR(20) not NULL,
  `pwd` VARCHAR(32) not NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hisChat`.`chatroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hisChat`.`chatroom` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) not NULL,
  `status` VARCHAR(20) not NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hisChat`.`user_chatroom_mpng`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hisChat`.`user_chatroom_mpng` (
  `user_id` BIGINT(20) NOT NULL,
  `chatroom_id` BIGINT(20) NOT NULL,
  INDEX `fk_user_chatroom_mpng_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_chatroom_mpng_chatroom_idx` (`chatroom_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `chatroom_id`),
  CONSTRAINT `fk_user_chatroom_mpng_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `hisChat`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_chatroom_mpng_chatroom`
    FOREIGN KEY (`chatroom_id`)
    REFERENCES `hisChat`.`chatroom` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
