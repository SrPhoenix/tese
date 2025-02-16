// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table Maintenance {
  clientId guid 
  Id Guid [primary key]
  entityId guid
  vehicleId guid 
  createdDate timestamp 
  evalDate datetime
  clientNotes varchar
  conclusionDateExpected date
  conclusionDate date
  DeliverDate datetime
  BudgetExpected double
  Budget double
  clientScoreExpected float
  clientScore float
  workHoursExpected int
  workHours int
}



Table maintenanceTask {
  id integer  [primary key]
  maintenanceId guid 
  maintenanceTaskTypeId integer
  status varchar
}

Table MaintenanceTasksType {
  id integer [primary key]
  evalTaskId integer 
  vehiclePartTypeId int
  name varchar
  price double
  hours int
  type varchar
}

Table EvalTasks {
  id integer [primary key]
  needChangePart bool
  name varchar
  description varchar
}

Table MechanicTasks {
  MechanicId Guid [primary key]
  TasksId integer [primary key]
  StartDateExpected Datetime [primary key]
  StartDate Datetime
  EndDateExpected Datetime
  EndDate Datetime
}

Table AspNetUsers {
  id Guid [primary key]
  Role varchar
}

Table vehicle {
  id Guid [primary key]
  vehiclePartId int
}

Table vehiclePart {
  part int [primary key]
  vehiclePartType guid [primary key]
  vehicleId Guid [primary key]
  DateIn Datetime
  DateOut Datetime
}

Table ImportantParts {
  vehiclePartPurchaseId guid
  Id Guid [primary key]
  DateIn datetime
  Status varchar
}

Table disposableParts {
  vehiclePartType guid
  count int
}


Table PurchaseVehiclePart {
  operatorId guid
  id int [primary key]
  vehiclePartType guid
  status varchar
  price double
  dateIn date
  count int
}

Table MaintenanceChange {
  maintenanceId guid [primary key]
  createDate datetime
  PurchaseVehiclePartId guid [primary key]
  tipo varchar 
  newBudget double
  newDate date
  status varchar
}


Table vehiclePartType {
  Id int [primary key]
  Nome varchar
}

Table Entity {
  Id int [primary key]
  Nome varchar
}

// Table posts {
//   id integer [primary key]
//   title varchar
//   body text [note: 'Content of the post']
//   user_id integer
//   status varchar
//   created_at timestamp
// }

// Ref: posts.user_id > users.id // many-to-one

// Ref: users.id < follows.following_user_id

// Ref: users.id < follows.followed_user_id



Ref: "MechanicTasks"."MechanicId" - "AspNetUsers"."id"

Ref: "MechanicTasks"."TasksId" - "maintenanceTask"."id"

Ref: "maintenanceTask"."maintenanceTaskTypeId" - "MaintenanceTasksType"."id"

Ref: "AspNetUsers"."id" - "Maintenance"."clientId"

Ref: "vehicle"."id" - "Maintenance"."vehicleId"

Ref: "vehiclePart"."vehicleId" > "vehicle"."id"

Ref: "ImportantParts"."Id" - "vehiclePart"."part"


Ref: "Entity"."Id" - "Maintenance"."entityId"

Ref: "maintenanceTask"."maintenanceId" > "Maintenance"."Id"


Ref: "PurchaseVehiclePart"."id" - "ImportantParts"."vehiclePartPurchaseId"

Ref: "PurchaseVehiclePart"."operatorId" - "AspNetUsers"."id"

Ref: "vehiclePartType"."Id" - "PurchaseVehiclePart"."vehiclePartType"

Ref: "MaintenanceChange"."PurchaseVehiclePartId" - "PurchaseVehiclePart"."id"

Ref: "MaintenanceChange"."maintenanceId" - "Maintenance"."Id"

Ref: "disposableParts"."vehiclePartType" - "vehiclePartType"."Id"

Ref: "vehiclePart"."vehiclePartType" - "vehiclePartType"."Id"


Ref: "EvalTasks"."id" < "MaintenanceTasksType"."evalTaskId"