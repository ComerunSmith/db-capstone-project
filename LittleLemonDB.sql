-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Employees` (
  `EmployeeID` INT NOT NULL,
  `Name` VARCHAR(200) NULL,
  `Role` VARCHAR(100) NULL,
  `Address` VARCHAR(200) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(100) NULL,
  `AnnualSalary` DECIMAL(10,2) NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingSlot` VARCHAR(45) NOT NULL,
  `EmployeeID` INT NULL,
  `TableNo` INT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `employee_id_fk_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_id_fk`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `LittleLemonDM`.`Employees` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `CourseName` VARCHAR(200) NULL,
  `StarterName` VARCHAR(100) NULL,
  `DesertName` VARCHAR(45) NULL,
  `Price` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  `MenuName` VARCHAR(100) NULL,
  `Cuisine` VARCHAR(100) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menu_item_id_fk_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `menu_item_id_fk`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDM`.`MenuItems` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `OrderID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `BillAmount` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `booking_id_fk_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDM`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDM`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Delivery Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Delivery Address` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(255) NULL,
  `PostCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `DeliveryCost` DECIMAL(10,2) NULL,
  `AddressID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `address_id_fk_idx` (`AddressID` ASC) VISIBLE,
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `address_id_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `LittleLemonDM`.`Delivery Address` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
