CREATE TABLE `Maintenance` (
  `Id` Guid PRIMARY KEY,
  `ClientId` guid,
  `DealershipId` guid,
  `EntityId` guid,
  `VehicleId` guid,
  `CreatedDate` timestamp,
  `EvalDate` datetime,
  `ClientNotes` varchar(255),
  `ConclusionDateExpected` date,
  `ConclusionDate` date,
  `DeliverDate` datetime,
  `BudgetExpected` double,
  `Budget` double,
  `ClientScoreExpected` float,
  `ClientScore` float,
  `WorkHoursExpected` int,
  `WorkHours` int
);

CREATE TABLE `Dealership` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `Address` varchar(255),
  `Address2` varchar(255),
  `ZipCode` varchar(255),
  `City` varchar(255),
  `State` varchar(255),
  `Country` varchar(255),
  `PhoneNumber` varchar(255),
  `Email` varchar(255),
  `Nif` varchar(255)
);

CREATE TABLE `MaintenanceTask` (
  `Id` integer PRIMARY KEY,
  `MaintenanceId` guid,
  `MaintenanceTaskTypeId` integer,
  `Status` varchar(255)
);

CREATE TABLE `MaintenanceTasksType` (
  `Id` integer PRIMARY KEY,
  `EvalTaskId` integer,
  `VehiclePartTypeId` int,
  `Name` varchar(255),
  `Price` double,
  `Hours` int,
  `Type` varchar(255)
);

CREATE TABLE `EvalTasks` (
  `Id` integer PRIMARY KEY,
  `NeedChangePart` bool,
  `Name` varchar(255),
  `Description` varchar(255)
);

CREATE TABLE `MechanicTasks` (
  `MechanicId` Guid,
  `TasksId` integer,
  `StartDateExpected` Datetime,
  `StartDate` Datetime,
  `EndDateExpected` Datetime,
  `EndDate` Datetime,
  PRIMARY KEY (`MechanicId`, `TasksId`, `StartDateExpected`)
);

CREATE TABLE `AspNetUsers` (
  `Id` Guid PRIMARY KEY,
  `DealershipId` guid,
  `Role` varchar(255)
);

CREATE TABLE `vehicle` (
  `Id` Guid PRIMARY KEY,
  `VehiclePartId` int
);

CREATE TABLE `vehiclePart` (
  `VehiclePartType` guid,
  `VehicleId` Guid,
  `DateIn` Datetime,
  `DateOut` Datetime,
  PRIMARY KEY (`VehiclePartType`, `VehicleId`)
);

CREATE TABLE `DealershipInventory` (
  `InventoryId` guid,
  `VehiclePartType` guid,
  `DealershipId` guid,
  `QuantityAvailable` int,
  `MinimumStockLevel` int,
  `MaximumStockLevel` int,
  `ReorderPoint` int
);

CREATE TABLE `Order` (
  `Id` int PRIMARY KEY,
  `DealershipId` guid,
  `Status` varchar(255),
  `OperatorId` guid,
  `CreatedDate` date,
  `TotalPrice` double
);

CREATE TABLE `OrderDetail` (
  `Id` int PRIMARY KEY,
  `OrderId` int,
  `Count` int,
  `ExpectedDate` guid,
  `ActualDate` guid,
  `VehiclePartType` guid,
  `Price` double
);

CREATE TABLE `Delivery` (
  `Id` int PRIMARY KEY,
  `DealershipId` guid,
  `status` varchar(255),
  `CreatedDate` date
);

CREATE TABLE `DeliveryDetail` (
  `Id` int PRIMARY KEY,
  `DeliveryId` int,
  `Count` int,
  `ExpectedDate` guid,
  `ActualDate` guid,
  `VehiclePartType` guid
);

CREATE TABLE `MaintenanceChange` (
  `MaintenanceId` guid,
  `CreateDate` datetime,
  `PurchaseVehiclePartId` guid,
  `NewBudget` double,
  `NewDate` date,
  `Status` varchar(255),
  PRIMARY KEY (`MaintenanceId`, `PurchaseVehiclePartId`)
);

CREATE TABLE `vehiclePartType` (
  `Id` int PRIMARY KEY,
  `Code` varchar(255),
  `Name` varchar(255),
  `Description` varchar(255),
  `Price` varchar(255),
  `Category` varchar(255),
  `ReorderQuantity` int
);

CREATE TABLE `Entity` (
  `Id` int PRIMARY KEY,
  `Nome` varchar(255)
);

ALTER TABLE `MechanicTasks` ADD FOREIGN KEY (`MechanicId`) REFERENCES `AspNetUsers` (`Id`);

ALTER TABLE `MechanicTasks` ADD FOREIGN KEY (`TasksId`) REFERENCES `MaintenanceTask` (`Id`);

ALTER TABLE `MaintenanceTask` ADD FOREIGN KEY (`MaintenanceTaskTypeId`) REFERENCES `MaintenanceTasksType` (`Id`);

ALTER TABLE `Maintenance` ADD FOREIGN KEY (`ClientId`) REFERENCES `AspNetUsers` (`Id`);

ALTER TABLE `Maintenance` ADD FOREIGN KEY (`VehicleId`) REFERENCES `vehicle` (`Id`);

ALTER TABLE `vehiclePart` ADD FOREIGN KEY (`VehicleId`) REFERENCES `vehicle` (`Id`);

ALTER TABLE `Maintenance` ADD FOREIGN KEY (`EntityId`) REFERENCES `Entity` (`Id`);

ALTER TABLE `MaintenanceTask` ADD FOREIGN KEY (`MaintenanceId`) REFERENCES `Maintenance` (`Id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`OperatorId`) REFERENCES `AspNetUsers` (`Id`);

ALTER TABLE `OrderDetail` ADD FOREIGN KEY (`VehiclePartType`) REFERENCES `vehiclePartType` (`Id`);

ALTER TABLE `MaintenanceChange` ADD FOREIGN KEY (`PurchaseVehiclePartId`) REFERENCES `Order` (`Id`);

ALTER TABLE `MaintenanceChange` ADD FOREIGN KEY (`MaintenanceId`) REFERENCES `Maintenance` (`Id`);

ALTER TABLE `DealershipInventory` ADD FOREIGN KEY (`VehiclePartType`) REFERENCES `vehiclePartType` (`Id`);

ALTER TABLE `vehiclePart` ADD FOREIGN KEY (`VehiclePartType`) REFERENCES `vehiclePartType` (`Id`);

ALTER TABLE `MaintenanceTasksType` ADD FOREIGN KEY (`EvalTaskId`) REFERENCES `EvalTasks` (`Id`);

ALTER TABLE `Maintenance` ADD FOREIGN KEY (`DealershipId`) REFERENCES `Dealership` (`Id`);

ALTER TABLE `AspNetUsers` ADD FOREIGN KEY (`DealershipId`) REFERENCES `Dealership` (`Id`);

ALTER TABLE `DealershipInventory` ADD FOREIGN KEY (`DealershipId`) REFERENCES `Dealership` (`Id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`DealershipId`) REFERENCES `Dealership` (`Id`);

ALTER TABLE `MaintenanceTasksType` ADD FOREIGN KEY (`VehiclePartTypeId`) REFERENCES `vehiclePartType` (`Id`);

ALTER TABLE `OrderDetail` ADD FOREIGN KEY (`OrderId`) REFERENCES `Order` (`Id`);

ALTER TABLE `DeliveryDetail` ADD FOREIGN KEY (`DeliveryId`) REFERENCES `Delivery` (`Id`);

ALTER TABLE `vehiclePartType` ADD FOREIGN KEY (`Id`) REFERENCES `DeliveryDetail` (`VehiclePartType`);

ALTER TABLE `Delivery` ADD FOREIGN KEY (`DealershipId`) REFERENCES `Dealership` (`Id`);
