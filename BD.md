use master


CREATE TABLE [Maintenance] (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  [ClientId] uniqueidentifier,
  [DealershipId] uniqueidentifier,
  [EntityId] uniqueidentifier,
  [VehicleId] uniqueidentifier,
  [CreatedDate] timestamp,
  [EvalDate] datetime,
  [ClientNotes] nvarchar(255),
  [ConclusionDateExpected] date,
  [ConclusionDate] date,
  [DeliverDate] datetime,
  [BudgetExpected] float,
  [Budget] float,
  [ClientScoreExpected] float,
  [ClientScore] float,
  [WorkHoursExpected] int,
  [WorkHours] int
)
GO

CREATE TABLE [Dealership] (
  [Id] int PRIMARY KEY,
  [Name] nvarchar(255),
  [Address] nvarchar(255)
)
GO

CREATE TABLE [MaintenanceTask] (
  [Id] integer PRIMARY KEY,
  [MaintenanceId] uniqueidentifier,
  [MaintenanceTaskTypeId] integer,
  [Status] nvarchar(255)
)
GO

CREATE TABLE [MaintenanceTasksType] (
  [Id] integer PRIMARY KEY,
  [EvalTaskId] integer,
  [VehiclePartTypeId] int,
  [Name] nvarchar(255),
  [Price] float,
  [Hours] int,
  [Type] nvarchar(255)
)
GO

CREATE TABLE [EvalTasks] (
  [Id] integer PRIMARY KEY,
  [NeedChangePart] bit,
  [Name] nvarchar(255),
  [Description] nvarchar(255)
)
GO

CREATE TABLE [MechanicTasks] (
  [MechanicId] uniqueidentifier,
  [TasksId] integer,
  [StartDateExpected] Datetime,
  [StartDate] Datetime,
  [EndDateExpected] Datetime,
  [EndDate] Datetime,
  PRIMARY KEY ([MechanicId], [TasksId], [StartDateExpected])
)
GO

CREATE TABLE [AspNetUsers] (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  [DealershipId] uniqueidentifier,
  [Role] nvarchar(255)
)
GO

CREATE TABLE [Vehicle] (
  [Id] uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
  [vehiclePartId] int
)
GO

CREATE TABLE [VehiclePart] (
  [VehiclePartType] uniqueidentifier,
  [VehicleId] uniqueidentifier,
  [DateIn] Datetime,
  [DateOut] Datetime,
  PRIMARY KEY ([VehiclePartType], [VehicleId])
)
GO

CREATE TABLE [Parts] (
  [DealershipId] uniqueidentifier,
  [VehiclePartType] uniqueidentifier,
  [count] int
)
GO

CREATE TABLE [PurchaseVehiclePart] (
  [OperatorId] uniqueidentifier,
  [Id] int PRIMARY KEY,
  [DealershipId] uniqueidentifier,
  [VehiclePartType] uniqueidentifier,
  [Status] nvarchar(255),
  [Price] float,
  [DateIn] date,
  [Count] int
)
GO

CREATE TABLE [MaintenanceChange] (
  [MaintenanceId] uniqueidentifier,
  [CreateDate] datetime,
  [PurchaseVehiclePartId] uniqueidentifier,
  [NewBudget] float,
  [NewDate] date,
  [Status] nvarchar(255),
  PRIMARY KEY ([MaintenanceId], [PurchaseVehiclePartId])
)
GO

CREATE TABLE [VehiclePartType] (
  [Id] int PRIMARY KEY,
  [Nome] nvarchar(255),
  [Price] nvarchar(255)
)
GO

CREATE TABLE [Entity] (
  [Id] int PRIMARY KEY,
  [Nome] nvarchar(255)
)
GO

ALTER TABLE [AspNetUsers] ADD FOREIGN KEY ([Id]) REFERENCES [MechanicTasks] ([MechanicId])
GO

ALTER TABLE [MaintenanceTask] ADD FOREIGN KEY ([Id]) REFERENCES [MechanicTasks] ([TasksId])
GO

ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([Id]) REFERENCES [MaintenanceTask] ([MaintenanceTaskTypeId])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([ClientId]) REFERENCES [AspNetUsers] ([Id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([VehicleId]) REFERENCES [Vehicle] ([Id])
GO

ALTER TABLE [VehiclePart] ADD FOREIGN KEY ([VehicleId]) REFERENCES [Vehicle] ([Id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([EntityId]) REFERENCES [Entity] ([Id])
GO

ALTER TABLE [MaintenanceTask] ADD FOREIGN KEY ([MaintenanceId]) REFERENCES [Maintenance] ([Id])
GO

ALTER TABLE [AspNetUsers] ADD FOREIGN KEY ([Id]) REFERENCES [PurchaseVehiclePart] ([OperatorId])
GO

ALTER TABLE [PurchaseVehiclePart] ADD FOREIGN KEY ([VehiclePartType]) REFERENCES [VehiclePartType] ([Id])
GO

ALTER TABLE [PurchaseVehiclePart] ADD FOREIGN KEY ([Id]) REFERENCES [MaintenanceChange] ([PurchaseVehiclePartId])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([Id]) REFERENCES [MaintenanceChange] ([MaintenanceId])
GO

ALTER TABLE [VehiclePartType] ADD FOREIGN KEY ([Id]) REFERENCES [Parts] ([VehiclePartType])
GO

ALTER TABLE [VehiclePartType] ADD FOREIGN KEY ([Id]) REFERENCES [VehiclePart] ([VehiclePartType])
GO

ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([evalTaskId]) REFERENCES [EvalTasks] ([Id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])
GO

ALTER TABLE [Dealership] ADD FOREIGN KEY ([Id]) REFERENCES [AspNetUsers] ([DealershipId])
GO

ALTER TABLE [Dealership] ADD FOREIGN KEY ([Id]) REFERENCES [Parts] ([DealershipId])
GO

ALTER TABLE [PurchaseVehiclePart] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])
GO

ALTER TABLE [VehiclePartType] ADD FOREIGN KEY ([Id]) REFERENCES [MaintenanceTasksType] ([vehiclePartTypeId])
GO
