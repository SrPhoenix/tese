

CREATE TABLE AspNetUsers (
  Id varchar(36) not null,
  Email varchar(256)
)

CREATE TABLE Vehicle (
  Id uniqueidentifier not null,
  Name varchar(255) not null
)

CREATE TABLE VehicleType (
  Id int not null,
  Name varchar(255) not null
)


CREATE TABLE Owner (
  Id uniqueidentifier not null,
  Name varchar(255) not null
)
begin tran T1;
use MobiCycle

-- CREATE TABLE Dealership (
--   Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
--   Name varchar(255) not null,
--   [Address] varchar(255) not null,
--   Address2 varchar(255),
--   ZipCode varchar(255) not null,
--   City varchar(255) not null, 
--   [State] varchar(255) not null,
--   Country varchar(255) not null,
--   PhoneNumber varchar(255) not null,
--   Email varchar(255) not null,
--   Nif varchar(255) not null,
--   IsRemoved bit not null DEFAULT 0
-- );


CREATE TABLE [VehiclePartTypeCategory] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255) NOT NULL
)


CREATE TABLE [Maintenance] (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [ClientId] varchar(36),
  [OwnerId] uniqueidentifier NOT NULL,
  [ClientEntityId] uniqueidentifier,
  [VehicleId] uniqueidentifier NOT NULL,
  [CreatedDate] datetime NOT NULL,
  [EvalDate] datetime NOT NULL,
  [AnomalyIdentification] varchar(255) NOT NULL,
  [AnomalyCause] varchar(255) NOT NULL,
  [ClientNotes] varchar(255),
  [ConclusionDateExpected] date,
  [ConclusionDate] date,
  [DeliverDate] datetime,
  [BudgetExpected] float,
  [Budget] float,
  [ClientScoreExpected] float,
  [ClientScore] float,
  [WorkHoursExpected] float,
  [WorkHours] float,
  [StatusId] tinyint NOT NULL
);


ALTER TABLE Maintenance ADD FOREIGN KEY (ClientId) REFERENCES AspNetUsers (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (ClientEntityId) REFERENCES Owner (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (OwnerId) REFERENCES Owner (Id);




CREATE TABLE OwnerVehiclePartType (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [Code] varchar(255) NOT NULL,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255) NOT NULL,
  [Price] float NOT NULL,
  [CategoryId] integer NOT NULL,
  [ReorderQuantity] int NOT NULL,
  IsRemoved bit not null DEFAULT 0
);

ALTER TABLE [OwnerVehiclePartType] ADD FOREIGN KEY ([CategoryId]) REFERENCES [VehiclePartTypeCategory] ([Id])


CREATE TABLE OwnerVehiclePart (
  VehiclePartTypeId uniqueidentifier not null,
  VehicleId uniqueidentifier not null,
  DateIn Datetime not null,
  DateOut Datetime,
  PRIMARY KEY (VehiclePartTypeId, VehicleId, DateIn)
);

ALTER TABLE OwnerVehiclePart ADD FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE OwnerVehiclePart ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES OwnerVehiclePartType (Id);

CREATE TABLE EvalTasks (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255) NOT NULL,
  [VehicleTypeId] int,
  [Description] varchar(255) NOT NULL,
  StepNum tinyint NOT NULL,
  IsRemoved bit not null DEFAULT 0
); 

ALTER TABLE [EvalTasks] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])

-- CREATE TABLE [EvalTaskSubStep] (
--   [Id] integer PRIMARY KEY IDENTITY(1, 1),
--   [EvalTaskId] integer NOT NULL,
--   [Name] varchar(255) NOT NULL,
--   [Description] varchar(255) NOT NULL
-- )

-- ALTER TABLE [EvalTaskSubStep] ADD FOREIGN KEY ([EvalTaskId]) REFERENCES [EvalTasks] ([Id])

CREATE TABLE MaintenanceTasksType (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [EvalTaskId] integer,
  [VehiclePartTypeCategoryId] int,
  [Name] varchar(255) NOT NULL,
  [VehicleTypeId] int,
  [Description] varchar(255) NOT NULL,
  [Price] float NOT NULL,
  [Hours] float NOT NULL,
  [Quantity] tinyint NULL,
  [Type] tinyint NOT NULL,
  IsRemoved bit not null DEFAULT 0
);

ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])
ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([VehiclePartTypeCategoryId]) REFERENCES [VehiclePartTypeCategory] ([Id])
ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY (EvalTaskId) REFERENCES EvalTasks (Id); 


CREATE TABLE [MaintenanceTaskStep] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [MaintenanceTaskTypeId] integer NOT NULL,
  [StepNum] tinyint NOT NULL,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255) NOT NULL
)

ALTER TABLE [MaintenanceTaskStep] ADD FOREIGN KEY ([MaintenanceTaskTypeId]) REFERENCES [MaintenanceTasksType] ([Id])


-- CREATE TABLE [MaintenanceTaskSubStep] (
--   [Id] integer PRIMARY KEY IDENTITY(1, 1),
--   [MaintenanceTaskStepId] integer NOT NULL,
--   [Name] varchar(255) NOT NULL,
--   [Description] varchar(255) NOT NULL
-- )

-- ALTER TABLE [MaintenanceTaskSubStep] ADD FOREIGN KEY ([MaintenanceTaskStepId]) REFERENCES [MaintenanceTaskStep] ([Id])


CREATE TABLE MaintenanceTask (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [MaintenanceId] uniqueidentifier NOT NULL,
  [MaintenanceTaskTypeId] integer NOT NULL,
  [VehiclePartTypeId] uniqueidentifier,
  [Status] tinyint NOT NULL
);



ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceTaskTypeId) REFERENCES MaintenanceTasksType (Id);
ALTER TABLE [MaintenanceTask] ADD FOREIGN KEY ([VehiclePartTypeId]) REFERENCES [OwnerVehiclePartType] ([Id])


CREATE TABLE MechanicTasks (
  MechanicId varchar(36) not null,
  MaintenanceTaskId uniqueidentifier not null,
  StartDateExpected Datetime not null,
  StartDate Datetime,
  EndDateExpected Datetime not null,
  EndDate Datetime,
  MechanicNotes varchar(255),
  PRIMARY KEY (MaintenanceTaskId)
);

ALTER TABLE MechanicTasks ADD FOREIGN KEY (MechanicId) REFERENCES AspNetUsers (Id);
ALTER TABLE MechanicTasks ADD FOREIGN KEY (MaintenanceTaskId) REFERENCES MaintenanceTask (Id);

CREATE TABLE PauseTasks (
  MaintenanceTaskId uniqueidentifier not null,
  StartDate Datetime,
  EndDate Datetime,
  PRIMARY KEY (MaintenanceTaskId, StartDate)
);

ALTER TABLE PauseTasks ADD FOREIGN KEY (MaintenanceTaskId) REFERENCES MaintenanceTask (Id);


CREATE TABLE OwnerInventory (
  Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  VehiclePartTypeId uniqueidentifier not null,
  OwnerId uniqueidentifier not null,
  locationWithinWarehouse varchar(36) not null,
  MeanDeliveryInDays float,
  QuantityAvailable int not null,
  DefaultOrderQuantity int,
  MinimumStockLevel int,
  MaximumStockLevel int,
  ReorderPoint int 
);



ALTER TABLE OwnerInventory ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES OwnerVehiclePartType (Id);
ALTER TABLE OwnerInventory ADD FOREIGN KEY (OwnerId) REFERENCES Owner (Id);


-- CREATE TABLE [MaintenanceTaskChange] (
--   [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
--   [MaintenanceTaskId] uniqueidentifier NOT NULL,
--   [CreateDate] datetime NOT NULL,
--   [VehiclePartTypeId] uniqueidentifier NOT NULL,
--   [Status] tinyint NOT NULL
-- )

-- ALTER TABLE [MaintenanceTaskChange] ADD FOREIGN KEY ([MaintenanceTaskId]) REFERENCES [MaintenanceTask] ([Id])
-- ALTER TABLE [MaintenanceTaskChange] ADD FOREIGN KEY ([VehiclePartTypeId]) REFERENCES [DealershipVehiclePartType] ([Id])

CREATE TABLE Purchase  (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [OwnerId] uniqueidentifier NOT NULL,
  [MaintenanceTaskId] uniqueidentifier,
  [OperatorId] varchar(36),
  [CreatedDate] date NOT NULL,
  [Price] float,
  [Reason] varchar(255) NOT NULL,
  [Status] tinyint NOT NULL,

  [Count] int NOT NULL,
  [ExpectedArrivalDate] date,
  [ArrivalDate] datetime,
  [VehiclePartTypeId] uniqueidentifier NOT NULL,
  [PurchaseDate] date
);

ALTER TABLE Purchase  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);
ALTER TABLE Purchase  ADD FOREIGN KEY (OwnerId) REFERENCES Owner (Id);
ALTER TABLE [Purchase] ADD FOREIGN KEY ([MaintenanceTaskId]) REFERENCES [MaintenanceTask] ([Id])
ALTER TABLE Purchase ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES OwnerVehiclePartType (Id);

CREATE TABLE PurchaseDelay  (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [PurchaseId] uniqueidentifier NOT NULL,
  [CreatedDate] date NOT NULL,
  [Status] tinyint NOT NULL,
  [ExpectedArrivalDate] date
);
ALTER TABLE PurchaseDelay  ADD FOREIGN KEY (PurchaseId) REFERENCES Purchase (Id);

CREATE TABLE Contacts (
  Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  [Name] varchar(36) not null,
  PhoenNumber varchar(36),
  Email varchar(36),
  [Address] varchar(36)
);


-- CREATE TABLE PurchaseDetail (
--   [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
--   [PurchaseId] uniqueidentifier NOT NULL,
-- );

-- ALTER TABLE PurchaseDetail ADD FOREIGN KEY (PurchaseId) REFERENCES Purchase  (Id);


CREATE TABLE OwnerInventoryTransaction (
  Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  InventoryId uniqueidentifier not null,
  -- DeliveryDetailId uniqueidentifier,
  PurchaseId uniqueidentifier,
  [Type] tinyint not null,
  [OperatorId] varchar(36) not null,
  CreatedDate datetime not null,
  Quantity int not null
);

ALTER TABLE OwnerInventoryTransaction ADD FOREIGN KEY (InventoryId) REFERENCES OwnerInventory (Id);
ALTER TABLE OwnerInventoryTransaction  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);
ALTER TABLE OwnerInventoryTransaction  ADD FOREIGN KEY (PurchaseId) REFERENCES Purchase (Id);
-- ALTER TABLE DealershipInventoryTransaction  ADD FOREIGN KEY (DeliveryDetailId) REFERENCES DeliveryDetail (Id);


CREATE TABLE MaintenanceChange (
  [MaintenanceId] uniqueidentifier NOT NULL,
  [CreateDate] datetime NOT NULL,
  [NewBudget] float,
  [MinConclusionDate] date,
  [NewConclusionDate] date,
  [MaintenanceTaskId] uniqueidentifier,
  [VehiclePartTypeId] uniqueidentifier,
  [Status] tinyint NOT NULL,
  PRIMARY KEY ([MaintenanceId], [CreateDate])
);
ALTER TABLE MaintenanceChange ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceChange ADD FOREIGN KEY (MaintenanceTaskId) REFERENCES MaintenanceTask (Id);
ALTER TABLE [MaintenanceChange] ADD FOREIGN KEY ([VehiclePartTypeId]) REFERENCES [OwnerVehiclePartType] ([Id])


-- CREATE TABLE Delivery (
--   [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
--   [PurchaseId] uniqueidentifier NOT NULL,
--   [DealershipId] uniqueidentifier NOT NULL,
--   [status] tinyint NOT NULL,
--   [CreatedDate] date NOT NULL
-- );


-- ALTER TABLE [Delivery] ADD FOREIGN KEY ([PurchaseId]) REFERENCES [Purchase] ([Id])
-- ALTER TABLE Delivery ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);


-- CREATE TABLE DeliveryDetail (
--   [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
--   [DeliveryId] uniqueidentifier NOT NULL,
--   [OperatorId] varchar(36),
--   [Count] int,
--   [ExpectedDate] datetime,
--   [ActualDate] datetime,
--   [VehiclePartTypeId] uniqueidentifier NOT NULL
-- );

-- ALTER TABLE DeliveryDetail ADD FOREIGN KEY (DeliveryId) REFERENCES Delivery (Id);
-- ALTER TABLE DeliveryDetail ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);
-- ALTER TABLE DeliveryDetail  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);


CREATE TABLE [OwnerVehicleType] (
  [OwnerId] uniqueidentifier NOT NULL,
  [VehicleTypeId] int NOT NULL,
  PRIMARY KEY ([VehicleTypeId], [OwnerId])
)


ALTER TABLE [OwnerVehicleType] ADD FOREIGN KEY ([OwnerId]) REFERENCES [Owner] ([Id])
ALTER TABLE [OwnerVehicleType] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])


CREATE TABLE [ServiceType] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  Name varchar(255) not null
)


CREATE TABLE [OwnerPartnership] (
  [FromOwnerId] uniqueidentifier NOT NULL,
  [ToOwnerId] uniqueidentifier NOT NULL,
  [VehicleTypeId] int,
  [CreateDate] datetime NOT NULL,
  [ServiceTypeId] integer not null,
  [Status] tinyint not null,
  [DateIn] datetime,
  [DateOut] datetime,
  PRIMARY KEY ([FromOwnerId], [ToOwnerId],[CreateDate])
)
ALTER TABLE [OwnerPartnership] ADD FOREIGN KEY ([FromOwnerId]) REFERENCES [Owner] ([Id])
ALTER TABLE [OwnerPartnership] ADD FOREIGN KEY ([ToOwnerId]) REFERENCES [Owner] ([Id])
ALTER TABLE [OwnerPartnership] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])
ALTER TABLE [OwnerPartnership] ADD FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceType] ([Id])


CREATE TABLE [OwnerServiceType] (
  [OwnerId] uniqueidentifier NOT NULL,
  [ServiceTypeId] integer not null,
  [DateIn] datetime,
  [DateOut] datetime,
  PRIMARY KEY ([OwnerId], [ServiceTypeId])
)
ALTER TABLE [OwnerServiceType] ADD FOREIGN KEY ([OwnerId]) REFERENCES [Owner] ([Id])
ALTER TABLE [OwnerServiceType] ADD FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceType] ([Id])


rollback