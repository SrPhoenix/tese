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

ALTER TABLE [MechanicTasks] ADD FOREIGN KEY ([MechanicId]) REFERENCES [AspNetUsers] ([id])
GO

ALTER TABLE [MechanicTasks] ADD FOREIGN KEY ([TasksId]) REFERENCES [maintenanceTask] ([id])
GO

ALTER TABLE [maintenanceTask] ADD FOREIGN KEY ([maintenanceTaskTypeId]) REFERENCES [MaintenanceTasksType] ([id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([clientId]) REFERENCES [AspNetUsers] ([id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([vehicleId]) REFERENCES [vehicle] ([id])
GO

ALTER TABLE [vehiclePart] ADD FOREIGN KEY ([vehicleId]) REFERENCES [vehicle] ([id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([entityId]) REFERENCES [Entity] ([Id])
GO

ALTER TABLE [maintenanceTask] ADD FOREIGN KEY ([maintenanceId]) REFERENCES [Maintenance] ([Id])
GO

ALTER TABLE [PurchaseVehiclePart] ADD FOREIGN KEY ([operatorId]) REFERENCES [AspNetUsers] ([id])
GO

ALTER TABLE [PurchaseVehiclePart] ADD FOREIGN KEY ([vehiclePartType]) REFERENCES [vehiclePartType] ([Id])
GO

ALTER TABLE [MaintenanceChange] ADD FOREIGN KEY ([PurchaseVehiclePartId]) REFERENCES [PurchaseVehiclePart] ([id])
GO

ALTER TABLE [MaintenanceChange] ADD FOREIGN KEY ([maintenanceId]) REFERENCES [Maintenance] ([Id])
GO

ALTER TABLE [Parts] ADD FOREIGN KEY ([vehiclePartType]) REFERENCES [vehiclePartType] ([Id])
GO

ALTER TABLE [vehiclePart] ADD FOREIGN KEY ([vehiclePartType]) REFERENCES [vehiclePartType] ([Id])
GO

ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([evalTaskId]) REFERENCES [EvalTasks] ([id])
GO

ALTER TABLE [Maintenance] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])
GO

ALTER TABLE [AspNetUsers] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])
GO

ALTER TABLE [Parts] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])
GO

ALTER TABLE [PurchaseVehiclePart] ADD FOREIGN KEY ([DealershipId]) REFERENCES [Dealership] ([Id])
GO

ALTER TABLE [MaintenanceTasksType] ADD FOREIGN KEY ([vehiclePartTypeId]) REFERENCES [vehiclePartType] ([Id])
GO
