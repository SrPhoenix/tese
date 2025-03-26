

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

CREATE TABLE Dealership (
  Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
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


CREATE TABLE [VehiclePartTypeCategory] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255) NOT NULL
)


CREATE TABLE [Maintenance] (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [ClientId] varchar(36) NOT NULL,
  [DealershipId] uniqueidentifier NOT NULL,
  [EntityId] uniqueidentifier,
  [VehicleId] uniqueidentifier NOT NULL,
  [CreatedDate] datetime NOT NULL,
  [EvalDate] datetime NOT NULL,
  [ClientNotes] varchar(255),
  [ConclusionDateExpected] date,
  [ConclusionDate] date,
  [DeliverDate] datetime,
  [BudgetExpected] float,
  [Budget] float,
  [ClientScoreExpected] float,
  [ClientScore] float,
  [WorkHoursExpected] int,
  [WorkHours] int,
  [StatusId] tinyint NOT NULL
);


ALTER TABLE Maintenance ADD FOREIGN KEY (ClientId) REFERENCES AspNetUsers (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (EntityId) REFERENCES Owner (Id);
ALTER TABLE Maintenance ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);




CREATE TABLE DealershipVehiclePartType (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [Code] varchar(255) NOT NULL,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255) NOT NULL,
  [Price] float NOT NULL,
  [CategoryId] integer NOT NULL,
  [ReorderQuantity] int NOT NULL
);

ALTER TABLE [DealershipVehiclePartType] ADD FOREIGN KEY ([CategoryId]) REFERENCES [VehiclePartTypeCategory] ([Id])


CREATE TABLE DealershipVehiclePart (
  VehiclePartTypeId uniqueidentifier not null,
  VehicleId uniqueidentifier not null,
  DateIn Datetime not null,
  DateOut Datetime,
  PRIMARY KEY (VehiclePartTypeId, VehicleId, DateIn)
);

ALTER TABLE DealershipVehiclePart ADD FOREIGN KEY (VehicleId) REFERENCES Vehicle (Id);
ALTER TABLE DealershipVehiclePart ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);

CREATE TABLE EvalTasks (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255) NOT NULL,
  [VehicleTypeId] int,
  [Description] varchar(255) NOT NULL,
  StepNum tinyint NOT NULL
); 

ALTER TABLE [EvalTasks] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])

CREATE TABLE [EvalTaskSubStep] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [EvalTaskId] integer NOT NULL,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255) NOT NULL
)

ALTER TABLE [EvalTaskSubStep] ADD FOREIGN KEY ([EvalTaskId]) REFERENCES [EvalTasks] ([Id])

CREATE TABLE MaintenanceTasksType (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [EvalTaskId] integer,
  [VehiclePartTypeCategoryId] int,
  [Name] varchar(255) NOT NULL,
  [VehicleTypeId] int,
  [Description] varchar(255) NOT NULL,
  [Price] float NOT NULL,
  [Hours] float NOT NULL,
  [Type] tinyint NOT NULL
);

ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])
ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([VehiclePartTypeCategoryId]) REFERENCES [VehiclePartTypeCategory] ([Id])
ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY (EvalTaskId) REFERENCES EvalTasks (Id); 


CREATE TABLE [MaintenanceTaskStep] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [MaintenanceTaskTypeId] integer NOT NULL,
  [StepNum] tinyint NOT NULL,
  [Name] varchar(255) NOT NULL,
  [ShowVehiclePart] bit NOT NULL,
  [Description] varchar(255) NOT NULL
)

ALTER TABLE [MaintenanceTaskStep] ADD FOREIGN KEY ([MaintenanceTaskTypeId]) REFERENCES [MaintenanceTasksType] ([Id])


CREATE TABLE [MaintenanceTaskSubStep] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [MaintenanceTaskStepId] integer NOT NULL,
  [Name] varchar(255) NOT NULL,
  [Description] varchar(255) NOT NULL
)

ALTER TABLE [MaintenanceTaskSubStep] ADD FOREIGN KEY ([MaintenanceTaskStepId]) REFERENCES [MaintenanceTaskStep] ([Id])


CREATE TABLE MaintenanceTask (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [MaintenanceId] uniqueidentifier NOT NULL,
  [MaintenanceTaskTypeId] integer NOT NULL,
  [VehiclePartTypeId] uniqueidentifier,
  [Status] tinyint NOT NULL
);



ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);
ALTER TABLE MaintenanceTask ADD FOREIGN KEY (MaintenanceTaskTypeId) REFERENCES MaintenanceTasksType (Id);
ALTER TABLE [MaintenanceTask] ADD FOREIGN KEY ([VehiclePartTypeId]) REFERENCES [DealershipVehiclePartType] ([Id])


CREATE TABLE MechanicTasks (
  MechanicId varchar(36) not null,
  MaintenanceTaskId integer not null,
  StartDateExpected Datetime not null,
  StartDate Datetime,
  EndDateExpected Datetime not null,
  EndDate Datetime,
  MechanicNotes varchar(255),
  PRIMARY KEY (MaintenanceTaskId)
);

ALTER TABLE MechanicTasks ADD FOREIGN KEY (MechanicId) REFERENCES AspNetUsers (Id);
ALTER TABLE MechanicTasks ADD FOREIGN KEY (MaintenanceTaskId) REFERENCES MaintenanceTask (Id);


CREATE TABLE DealershipInventory (
  Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  VehiclePartTypeId uniqueidentifier not null,
  DealershipId uniqueidentifier not null,
  locationWithinWarehouse varchar(36) not null,
  QuantityAvailable int not null,
  MinimumStockLevel int not null,
  MaximumStockLevel int not null,
  ReorderPoint int not null
);



ALTER TABLE DealershipInventory ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);
ALTER TABLE DealershipInventory ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);

CREATE TABLE DealershipInventoryTransaction (
  Id uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  InventoryId uniqueidentifier not null,
  -- DeliveryDetailId uniqueidentifier,
  PurchaseDetailId uniqueidentifier,
  [Type] tinyint not null,
  [OperatorId] varchar(36) not null,
  CreatedDate datetime not null,
  Quantity int not null
);

ALTER TABLE DealershipInventoryTransaction ADD FOREIGN KEY (InventoryId) REFERENCES DealershipInventory (Id);
ALTER TABLE DealershipInventoryTransaction  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);
ALTER TABLE DealershipInventoryTransaction  ADD FOREIGN KEY (PurchaseDetailId) REFERENCES PurchaseDetail (Id);
-- ALTER TABLE DealershipInventoryTransaction  ADD FOREIGN KEY (DeliveryDetailId) REFERENCES DeliveryDetail (Id);

CREATE TABLE [MaintenanceTaskChange] (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [MaintenanceTaskId] uniqueidentifier NOT NULL,
  [CreateDate] datetime NOT NULL,
  [VehiclePartTypeId] uniqueidentifier NOT NULL,
  [Status] tinyint NOT NULL
)

ALTER TABLE [MaintenanceTaskChange] ADD FOREIGN KEY ([MaintenanceTaskId]) REFERENCES [MaintenanceTask] ([Id])
ALTER TABLE [MaintenanceTaskChange] ADD FOREIGN KEY ([VehiclePartTypeId]) REFERENCES [DealershipVehiclePartType] ([Id])

CREATE TABLE Purchase  (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [DealershipId] uniqueidentifier NOT NULL,
  [MaintenanceTaskChangeId] uniqueidentifier,
  [OperatorId] varchar(36),
  [CreatedDate] date NOT NULL,
  [TotalPrice] float,
  [Reason] varchar(255) NOT NULL,
  [Status] tinyint NOT NULL
);

ALTER TABLE Purchase  ADD FOREIGN KEY (OperatorId) REFERENCES AspNetUsers (Id);
ALTER TABLE Purchase  ADD FOREIGN KEY (DealershipId) REFERENCES Dealership (Id);
ALTER TABLE [Purchase] ADD FOREIGN KEY ([MaintenanceTaskChangeId]) REFERENCES [MaintenanceTaskChange] ([Id])


CREATE TABLE PurchaseDetail (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT (NEWID()),
  [PurchaseId] uniqueidentifier NOT NULL,
  [Count] int NOT NULL,
  [ExpectedArrivalDate] date,
  [PurchaseDate] date,
  [ArrivalDate] datetime,
  [VehiclePartTypeId] uniqueidentifier NOT NULL,
  [Price] float 
);

ALTER TABLE PurchaseDetail ADD FOREIGN KEY (VehiclePartTypeId) REFERENCES DealershipVehiclePartType (Id);
ALTER TABLE PurchaseDetail ADD FOREIGN KEY (PurchaseId) REFERENCES Purchase  (Id);


CREATE TABLE MaintenanceChange (
  [MaintenanceId] uniqueidentifier NOT NULL,
  [CreateDate] datetime NOT NULL,
  [NewBudget] float NOT NULL,
  [NewDate] date NOT NULL,
  [Status] tinyint NOT NULL,
  PRIMARY KEY ([MaintenanceId], [CreateDate])
);
ALTER TABLE MaintenanceChange ADD FOREIGN KEY (MaintenanceId) REFERENCES Maintenance (Id);


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


CREATE TABLE [DealershipVehicleType] (
  [DealershipId] uniqueidentifier NOT NULL,
  [VehicleTypeId] int NOT NULL,
  PRIMARY KEY ([VehicleTypeId], [DealershipId])
)


ALTER TABLE [DealershipVehicleType] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])

ALTER TABLE [DealershipVehicleType] ADD FOREIGN KEY ([VehicleTypeId]) REFERENCES [VehicleType] ([Id])
