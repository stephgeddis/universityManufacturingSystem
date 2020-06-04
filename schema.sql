SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE IF NOT EXISTS `Assignment` (
  `ProjectID` bigint(20) unsigned NOT NULL,
  `EmployeeID` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Contract` (
  `ContractID` bigint(20) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Start` date NOT NULL,
  `DueFinish` date DEFAULT NULL,
  `ActualFinish` date DEFAULT NULL,
  `EmployeeID` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Employee` (
  `EmployeeID` bigint(20) unsigned NOT NULL,
  `Title` varchar(32) DEFAULT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Joined` date DEFAULT NULL,
  `Left` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL,
  `Phone` varchar(32) NOT NULL,
  `GradeID` int(10) unsigned NOT NULL,
  `Manager` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `EmployeeSkill` (
  `EmployeeID` bigint(20) unsigned NOT NULL,
  `SkillID` bigint(20) unsigned NOT NULL,
  `DateAchieved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Equipment` (
  `EquipmentID` bigint(20) unsigned NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Make` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `OperationNotes` text,
  `Damaged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `EquipmentLoan` (
  `EmployeeID` bigint(20) unsigned NOT NULL,
  `EquipmentID` bigint(20) unsigned NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL DEFAULT '1',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Expense` (
  `ExpenseID` bigint(20) unsigned NOT NULL,
  `EmployeeID` bigint(20) unsigned NOT NULL,
  `ProjectID` bigint(20) unsigned DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `Paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `FileItem` (
  `ItemID` bigint(20) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(255) NOT NULL DEFAULT '',
  `EmployeeID` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Grade` (
  `GradeID` int(10) unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Code` varchar(16) NOT NULL,
  `SpineMin` int(10) unsigned NOT NULL DEFAULT '1',
  `SpineMax` int(10) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Payslip` (
  `PayslipID` bigint(20) unsigned NOT NULL,
  `EmployeeID` bigint(20) unsigned NOT NULL,
  `Taxable` double unsigned NOT NULL DEFAULT '0',
  `NonTaxable` double unsigned NOT NULL DEFAULT '0',
  `IncomeTax` double unsigned NOT NULL DEFAULT '0',
  `NationalInsurance` double unsigned NOT NULL DEFAULT '0',
  `NetPay` double unsigned NOT NULL DEFAULT '0',
  `Payday` date NOT NULL,
  `TransferDay` date NOT NULL,
  `TransferRef` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Project` (
  `ProjectID` bigint(20) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Notes` text,
  `Internal` tinyint(1) NOT NULL DEFAULT '0',
  `Sensitive` tinyint(1) NOT NULL DEFAULT '0',
  `Started` date NOT NULL,
  `Ended` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Skill` (
  `SkillID` bigint(20) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `Assignment`
  ADD PRIMARY KEY (`ProjectID`,`EmployeeID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

ALTER TABLE `Contract`
  ADD PRIMARY KEY (`ContractID`),
  ADD UNIQUE KEY `ContractID_2` (`ContractID`),
  ADD KEY `ContractID` (`ContractID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `EmployeeID` (`EmployeeID`);

ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `EmployeeID_2` (`EmployeeID`),
  ADD UNIQUE KEY `Email_2` (`Email`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `FirstName` (`FirstName`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `Email` (`Email`),
  ADD KEY `Current` (`Current`),
  ADD KEY `Manager` (`Manager`),
  ADD KEY `GradeID` (`GradeID`);

ALTER TABLE `EmployeeSkill`
  ADD PRIMARY KEY (`EmployeeID`,`SkillID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `SkillID` (`SkillID`);

ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`EquipmentID`),
  ADD UNIQUE KEY `EquipmentID_2` (`EquipmentID`),
  ADD KEY `EquipmentID` (`EquipmentID`),
  ADD KEY `Type` (`Type`),
  ADD KEY `Model` (`Model`),
  ADD KEY `Description` (`Description`),
  ADD KEY `Damaged` (`Damaged`);

ALTER TABLE `EquipmentLoan`
  ADD PRIMARY KEY (`EmployeeID`,`EquipmentID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `EquipmentID` (`EquipmentID`),
  ADD KEY `StartDate` (`StartDate`),
  ADD KEY `EndDate` (`EndDate`),
  ADD KEY `Current` (`Current`);

ALTER TABLE `Expense`
  ADD PRIMARY KEY (`ExpenseID`),
  ADD UNIQUE KEY `ExpenseID_2` (`ExpenseID`),
  ADD KEY `ExpenseID` (`ExpenseID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `Description` (`Description`);

ALTER TABLE `FileItem`
  ADD PRIMARY KEY (`ItemID`),
  ADD UNIQUE KEY `ItemID_2` (`ItemID`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `EmployeeID` (`EmployeeID`);

ALTER TABLE `Grade`
  ADD PRIMARY KEY (`GradeID`),
  ADD UNIQUE KEY `GradeID_2` (`GradeID`),
  ADD UNIQUE KEY `Code_2` (`Code`),
  ADD KEY `GradeID` (`GradeID`),
  ADD KEY `Code` (`Code`);

ALTER TABLE `Payslip`
  ADD PRIMARY KEY (`PayslipID`),
  ADD UNIQUE KEY `PayslipID_2` (`PayslipID`),
  ADD KEY `PayslipID` (`PayslipID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

ALTER TABLE `Project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD UNIQUE KEY `ProjectID_2` (`ProjectID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `Notes` (`Notes`(150)),
  ADD KEY `Title` (`Title`);

ALTER TABLE `Skill`
  ADD PRIMARY KEY (`SkillID`),
  ADD UNIQUE KEY `SkillID_2` (`SkillID`),
  ADD UNIQUE KEY `Title_2` (`Title`),
  ADD KEY `SkillID` (`SkillID`),
  ADD KEY `Title` (`Title`);


ALTER TABLE `Contract`
  MODIFY `ContractID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `Employee`
  MODIFY `EmployeeID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `Equipment`
  MODIFY `EquipmentID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `Expense`
  MODIFY `ExpenseID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `FileItem`
  MODIFY `ItemID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `Grade`
  MODIFY `GradeID` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `Project`
  MODIFY `ProjectID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `Skill`
  MODIFY `SkillID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;

ALTER TABLE `Assignment`
  ADD CONSTRAINT `Assignment_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `Assignment_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`);

ALTER TABLE `Contract`
  ADD CONSTRAINT `Contract_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`GradeID`) REFERENCES `Grade` (`GradeID`);

ALTER TABLE `EmployeeSkill`
  ADD CONSTRAINT `EmployeeSkill_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `EmployeeSkill_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`SkillID`);

ALTER TABLE `EquipmentLoan`
  ADD CONSTRAINT `EquipmentLoan_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `EquipmentLoan_ibfk_2` FOREIGN KEY (`EquipmentID`) REFERENCES `Equipment` (`EquipmentID`);

ALTER TABLE `Expense`
  ADD CONSTRAINT `Expense_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `Expense_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`);

ALTER TABLE `FileItem`
  ADD CONSTRAINT `FileItem_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `Payslip`
  ADD CONSTRAINT `Payslip_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
