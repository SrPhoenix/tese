use MobiCycle

--DROP TABLE Maintenance
--DROP TABLE Entity
--DROP TABLE Dealership
--DROP TABLE MaintenanceTask
--DROP TABLE MaintenanceTasksType
--DROP TABLE EvalTasks
--DROP TABLE MechanicTasks
--DROP TABLE DealershipInventory
--DROP TABLE Purchase
--DROP TABLE PurchaseDetail
--DROP TABLE Delivery
--DROP TABLE DeliveryDetail
--DROP TABLE MaintenanceChange

BEGIN TRAN T1;

CREATE TABLE Dealership (
  Id uniqueidentifier PRIMARY KEY,
  Name varchar(255),
  [Address] varchar(255),
  Address2 varchar(255),
  ZipCode varchar(255),
  City varchar(255),
  [State] varchar(255),
  Country varchar(255),
  PhoneNumber varchar(255),
  Email varchar(255),
  Nif varchar(255)
);

CREATE TABLE Maintenance (
  Id uniqueidentifier PRIMARY KEY,
  ClientId varchar(36),
  DealershipId uniqueidentifier,
  EntityId uniqueidentifier,
  VehicleId uniqueidentifier,
  CreatedDate timestamp,
  EvalDate datetime,
  ClientNotes varchar(255),
  ConclusionDateExpected date,
  ConclusionDate date,
  DeliverDate datetime,
  BudgetExpected float,
  Budget float,
  ClientScoreExpected float,
  ClientScore float,
  WorkHoursExpected int,
  WorkHours int
);

ALTER TABLE Maintenance ADD FOREIGN KEY (ClientId) REFERENCES AspNetUsers (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (VehicleId) REFERENCES vehicle (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (EntityId) REFERENCES Owner (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE DealershipVehiclePartType (
  Id uniqueidentifier PRIMARY KEY,
  Code varchar(255),
  [Name] varchar(255),
  [Description] varchar(255),
  Price varchar(255),
  Category varchar(255),
  ReorderQuantity int
);

CREATE TABLE DealershipVehiclePart (
  VehiclePartTypeId uniqueidentifier,
  VehicleId uniqueidentifier,
  DateIn Datetime,
  DateOut Datetime,
  PRIMARY KEY (VehiclePartTypeId, VehicleId, DateIn)
);

ALTER TABLE DealershipVehiclePart ADD FOREIGN KEY (VehicleId) REFERENCES vehicle (Id);
ALTER TABLE DealershipVehiclePart ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);

CREATE TABLE EvalTasks (
  Id integer PRIMARY KEY,
  NeedChangePart bit,
  Name varchar(255),
  Description varchar(255)
);

CREATE TABLE MaintenanceTasksType (
  Id integer PRIMARY KEY,
  EvalTaskId integer,
  VehiclePartTypeId uniqueidentifier,
  [Name] varchar(255),
  Price float,
  [Hours] int,
  [Type] varchar(255)
);

ALTER TABLE MaintenanceTasksType ADD FOREIGN KEY (EvalTaskId) REFERENCES EvalTasks (Id);
ALTER TABLE MaintenanceTasksType ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);


CREATE TABLE MaintenanceTask (
  Id integer PRIMARY KEY,
  MaintenanceId uniqueidentifier,
  MaintenanceTaskTypeId integer,
  [Status] varchar(255)
);

ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceTaskTypeId) REFERENCES MaintenanceTasksType (Id);


CREATE TABLE MechanicTasks (
  MechanicId varchar(36),
  MaintenanceTaskId integer,
  StartDateExpected Datetime,
  StartDate Datetime,
  EndDateExpected Datetime,
  EndDate Datetime,
  PRIMARY KEY (MechanicId, MaintenanceTaskId, StartDateExpected)
);

ALTER TABLE MechanicTasks ADD FOREIGN KEY (MechanicId) REFERENCES AspNetUsers (Id);
ALTER TABLE MechanicTasks ADD FOREIGN KEY (MaintenanceTaskId) REFERENCES MaintenanceTask (Id);


CREATE TABLE DealershipInventory (
  InventoryId uniqueidentifier PRIMARY KEY,
  VehiclePartType uniqueidentifier,
  DealershipId uniqueidentifier,
  QuantityAvailable int,
  MinimumStockLevel int,
  MaximumStockLevel int,
  ReorderPoint int
);

ALTER TABLE DealershipInventory ADD FOREIGN KEY (VehiclePartType) REFERENCES DealershipVehiclePartType (Id);
ALTER TABLE DealershipInventory ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE Purchase  (
  Id uniqueidentifier PRIMARY KEY,
  OperatorId varchar(36),
  DealershipId uniqueidentifier,
  CreatedDate date,
  TotalPrice float,
  [Status] varchar(255)
);

ALTER TABLE Purchase  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);
ALTER TABLE Purchase  ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE PurchaseDetail (
  Id uniqueidentifier PRIMARY KEY,
  PurchaseId uniqueidentifier,
  Count int,
  ExpectedDate date,
  ActualDate date,
  VehiclePartType uniqueidentifier,
  Price float
);

ALTER TABLE PurchaseDetail ADD FOREIGN KEY (VehiclePartType) REFERENCES DealershipVehiclePartType (Id);
ALTER TABLE PurchaseDetail ADD FOREIGN KEY (PurchaseId) REFERENCES Purchase  (Id);


CREATE TABLE MaintenanceChange (
  MaintenanceId uniqueidentifier,
  CreateDate datetime,
  PurchaseVehiclePartId uniqueidentifier,
  NewBudget float,
  NewDate date,
  Status varchar(255),
  PRIMARY KEY (MaintenanceId, PurchaseVehiclePartId)
);

ALTER TABLE MaintenanceChange ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceChange ADD FOREIGN KEY (PurchaseVehiclePartId) REFERENCES Purchase  (Id);


CREATE TABLE Delivery (
  Id uniqueidentifier PRIMARY KEY,
  DealershipId uniqueidentifier,
  [status] varchar(255),
  CreatedDate date
);
ALTER TABLE Delivery ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE DeliveryDetail (
  Id uniqueidentifier PRIMARY KEY,
  DeliveryId uniqueidentifier,
  Count int,
  ExpectedDate uniqueidentifier,
  ActualDate uniqueidentifier,
  VehiclePartType uniqueidentifier
);
ALTER TABLE DeliveryDetail ADD FOREIGN KEY (DeliveryId) REFERENCES Delivery (Id);
ALTER TABLE DeliveryDetail ADD FOREIGN KEY (VehiclePartType) REFERENCES DealershipVehiclePartType (Id);



ROLLBACK;

