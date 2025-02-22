use MobiCycle
BEGIN TRAN T1;

DROP TABLE DeliveryDetail
DROP TABLE Delivery
DROP TABLE MaintenanceChange
DROP TABLE PurchaseDetail
DROP TABLE Purchase
DROP TABLE DealershipInventory
DROP TABLE MechanicTasks
DROP TABLE MaintenanceTask
DROP TABLE MaintenanceTasksType
DROP TABLE EvalTasks
DROP TABLE DealershipVehiclePart
DROP TABLE DealershipVehiclePartType
DROP TABLE Maintenance
DROP TABLE Dealership
ROLLBACK;

BEGIN TRAN T1;

CREATE TABLE Dealership (
  Id uniqueidentifier PRIMARY KEY,
  Name varchar(255) not null,
  [Address] varchar(255) not null,
  Address2 varchar(255),
  ZipCode varchar(255) not null,
  City varchar(255) not null, 
  [State] varchar(255) not null,
  Country varchar(255) not null,
  PhoneNumber varchar(255) not null,
  Email varchar(255) not null,
  Nif varchar(255) not null
);

CREATE TABLE Maintenance (
  Id uniqueidentifier PRIMARY KEY,
  ClientId varchar(36) not null,
  DealershipId uniqueidentifier not null,
  EntityId uniqueidentifier,
  VehicleId uniqueidentifier not null,
  CreatedDate timestamp not null,
  EvalDate datetime not null,
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
  Code varchar(255) not null,
  [Name] varchar(255) not null,
  [Description] varchar(255) not null,
  Price varchar(255) not null,
  Category varchar(255) not null,
  ReorderQuantity int not null
);

CREATE TABLE DealershipVehiclePart (
  VehiclePartTypeId uniqueidentifier not null,
  VehicleId uniqueidentifier not null,
  DateIn Datetime not null,
  DateOut Datetime,
  PRIMARY KEY (VehiclePartTypeId, VehicleId, DateIn)
);

ALTER TABLE DealershipVehiclePart ADD FOREIGN KEY (VehicleId) REFERENCES vehicle (Id);
ALTER TABLE DealershipVehiclePart ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);

CREATE TABLE EvalTasks (
  Id integer PRIMARY KEY,
  NeedChangePart bit not null,
  Name varchar(255) not null,
  Description varchar(255)  not null
); 

CREATE TABLE MaintenanceTasksType (
  Id integer PRIMARY KEY,
  EvalTaskId integer not null,
  VehiclePartTypeId uniqueidentifier not null,
  [Name] varchar(255) not null,
  Price float not null,
  [Hours] int not null,
  [Type] varchar(255) not null
);

ALTER TABLE MaintenanceTasksType ADD FOREIGN KEY (EvalTaskId) REFERENCES EvalTasks (Id);
ALTER TABLE MaintenanceTasksType ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);


CREATE TABLE MaintenanceTask (
  Id integer PRIMARY KEY,
  MaintenanceId uniqueidentifier not null,
  MaintenanceTaskTypeId integer not null,
  [Status] varchar(255) not null
);

ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceTaskTypeId) REFERENCES MaintenanceTasksType (Id);


CREATE TABLE MechanicTasks (
  MechanicId varchar(36) not null,
  MaintenanceTaskId integer not null,
  StartDateExpected Datetime not null,
  StartDate Datetime,
  EndDateExpected Datetime not null,
  EndDate Datetime,
  PRIMARY KEY (MechanicId, MaintenanceTaskId, StartDateExpected)
);

ALTER TABLE MechanicTasks ADD FOREIGN KEY (MechanicId) REFERENCES AspNetUsers (Id);
ALTER TABLE MechanicTasks ADD FOREIGN KEY (MaintenanceTaskId) REFERENCES MaintenanceTask (Id);


CREATE TABLE DealershipInventory (
  InventoryId uniqueidentifier PRIMARY KEY,
  VehiclePartType uniqueidentifier not null,
  DealershipId uniqueidentifier not null,
  QuantityAvailable int not null,
  MinimumStockLevel int not null,
  MaximumStockLevel int not null,
  ReorderPoint int not null
);

ALTER TABLE DealershipInventory ADD FOREIGN KEY (VehiclePartType) REFERENCES DealershipVehiclePartType (Id);
ALTER TABLE DealershipInventory ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE Purchase  (
  Id uniqueidentifier PRIMARY KEY,
  OperatorId varchar(36) not null,
  DealershipId uniqueidentifier not null,
  CreatedDate date not null,
  TotalPrice float not null,
  [Status] varchar(255) not null
);

ALTER TABLE Purchase  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);
ALTER TABLE Purchase  ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE PurchaseDetail (
  Id uniqueidentifier PRIMARY KEY,
  PurchaseId uniqueidentifier not null,
  Count int not null,
  ExpectedDate date not null,
  ActualDate date,
  VehiclePartType uniqueidentifier not null,
  Price float not null
);

ALTER TABLE PurchaseDetail ADD FOREIGN KEY (VehiclePartType) REFERENCES DealershipVehiclePartType (Id);
ALTER TABLE PurchaseDetail ADD FOREIGN KEY (PurchaseId) REFERENCES Purchase  (Id);


CREATE TABLE MaintenanceChange (
  MaintenanceId uniqueidentifier,
  CreateDate datetime not null,
  PurchaseVehiclePartId uniqueidentifier not null,
  NewBudget float not null,
  NewDate date not null,
  Status varchar(255) not null,
  PRIMARY KEY (MaintenanceId, PurchaseVehiclePartId)
);

ALTER TABLE MaintenanceChange ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceChange ADD FOREIGN KEY (PurchaseVehiclePartId) REFERENCES Purchase  (Id);


CREATE TABLE Delivery (
  Id uniqueidentifier PRIMARY KEY,
  DealershipId uniqueidentifier not null,
  [status] varchar(255) not null,
  CreatedDate date not null
);
ALTER TABLE Delivery ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


CREATE TABLE DeliveryDetail (
  Id uniqueidentifier PRIMARY KEY,
  DeliveryId uniqueidentifier not null,
  Count int not null,
  ExpectedDate uniqueidentifier not null,
  ActualDate uniqueidentifier,
  VehiclePartType uniqueidentifier not null
);
ALTER TABLE DeliveryDetail ADD FOREIGN KEY (DeliveryId) REFERENCES Delivery (Id);
ALTER TABLE DeliveryDetail ADD FOREIGN KEY (VehiclePartType) REFERENCES DealershipVehiclePartType (Id);



ROLLBACK;
