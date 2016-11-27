CREATE SCHEMA IF NOT EXISTS `loshs_compartidos` DEFAULT CHARACTER SET utf8 

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
ENGINE = InnoDB;

CREATE TABLE `Categories` (
  `iCategoryId` int(10) NOT NULL AUTO_INCREMENT,
  `sCategoryName` varchar(100) NOT NULL,
  `dtCreated` datetime DEFAULT NULL,
  `dtDeleted` datetime DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Offers` (
  `iOfferId` int(11) NOT NULL AUTO_INCREMENT,
  `sTitle` varchar(150) NOT NULL,
  `dtStartDate` datetime DEFAULT NULL,
  `dtExpirationDate` datetime DEFAULT NULL,
  `dtCreatedDate` datetime DEFAULT NULL,
  `dtDeletedDate` datetime DEFAULT NULL,
  `dtLastModifiedDate` datetime DEFAULT NULL,
  `pLocation` point NOT NULL,
  `sDescription` varchar(150) NOT NULL,
  `iUserId` int(11) DEFAULT NULL,
  `iCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`iOfferId`),
  KEY `iUserid_idx` (`iUserId`),
  KEY `iCategoryid_idx` (`iCategoryId`),
  CONSTRAINT `iCategoryId` FOREIGN KEY (`iCategoryId`) REFERENCES `Categories` (`iCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `iUserid` FOREIGN KEY (`iUserId`) REFERENCES `User` (`iUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
