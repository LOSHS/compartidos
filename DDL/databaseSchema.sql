CREATE TABLE IF NOT EXISTS `loshs_compartidos`.`Categories` (
  `iCategoriesId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sCategoryName` VARCHAR(100) NOT NULL,
  `dtCreated` DATETIME NULL,
  `dtDeleted` DATETIME NULL,
  `lastModifiedDate` DATETIME NULL,
  `Categoriescol` VARCHAR(45) NULL,
  PRIMARY KEY (`iCategoriesId`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `loshs_compartidos`.`User` (
  `iUserId` INT NOT NULL AUTO_INCREMENT,
  `sUserName` VARCHAR(50) NULL,
  `sUserFirstName` VARCHAR(50) NOT NULL,
  `sUserLastName` VARCHAR(50) NULL,
  `dtCreatedDate` DATETIME NOT NULL,
  `dtDeletedDate` VARCHAR(50) NULL,
  `dtLastModifiedDate` DATETIME NULL,
  `sPassword` VARCHAR(50) NOT NULL,
  `sLocationSource` VARCHAR(45) NULL,
  PRIMARY KEY (`iUserId`))
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `loshs_compartidos`.`Categories` (
  `iCategoriesId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sCategoryName` VARCHAR(100) NOT NULL,
  `dtCreated` DATETIME NULL,
  `dtDeleted` DATETIME NULL,
  `lastModifiedDate` DATETIME NULL,
  `Categoriescol` VARCHAR(45) NULL,
  PRIMARY KEY (`iCategoriesId`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `loshs_compartidos`.`Offers` (
  `iOfferId` INT NOT NULL AUTO_INCREMENT,
  `sTitle` VARCHAR(150) NOT NULL,
  `dtStartDate` DATETIME NULL,
  `dtExpirationDate` DATETIME NULL,
  `dtCreatedDate` DATETIME NULL,
  `dtDeletedDate` DATETIME NULL,
  `dtLastModifiedDate` DATETIME NULL,
  `pXLocation` POINT NOT NULL,
  `pYLocation` POINT NOT NULL,
  `sDescription` VARCHAR(500) NULL,
  `iUserid` INT NOT NULL,
  `iCategoryId` INT NOT NULL,
  PRIMARY KEY (`iOfferId`),
  INDEX `iUserId_idx` (`iUserid` ASC),
  INDEX `iCategoryId_idx` (`iCategoryId` ASC),
  CONSTRAINT `iUserId`
    FOREIGN KEY (`iUserid`)
    REFERENCES `loshs_compartidos`.`User` (`iUserId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `iCategoryId`
    FOREIGN KEY (`iCategoryId`)
    REFERENCES `loshs_compartidos`.`Offers` (`iCategoryId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB

