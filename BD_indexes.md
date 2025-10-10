
# ForeingKeys

## Maintenance
CREATE INDEX IX_Maintenance_ClientId ON Maintenance (ClientId);
CREATE INDEX IX_Maintenance_OwnerId ON Maintenance (OwnerId);
CREATE INDEX IX_Maintenance_VehicleId ON Maintenance (VehicleId);
CREATE INDEX IX_Maintenance_ClientEntityId ON Maintenance (ClientEntityId);
CREATE INDEX IX_Maintenance_ClientScoreExpectedId ON Maintenance (ClientScoreExpectedId);
CREATE INDEX IX_Maintenance_ClientScoreId ON Maintenance (ClientScoreId);

## OwnerVehicleType
CREATE INDEX IX_OwnerVehicleType_OwnerId ON OwnerVehicleType (OwnerId);
CREATE INDEX IX_OwnerVehicleType_VehicleTypeId ON OwnerVehicleType (VehicleTypeId);

## OwnerPartnership
CREATE INDEX IX_OwnerPartnership_FromOwnerId ON OwnerPartnership (FromOwnerId);
CREATE INDEX IX_OwnerPartnership_ToOwnerId ON OwnerPartnership (ToOwnerId);
CREATE INDEX IX_OwnerPartnership_VehicleTypeId ON OwnerPartnership (VehicleTypeId);

## MaintenanceTask
CREATE INDEX IX_MaintenanceTask_MaintenanceId ON MaintenanceTask (MaintenanceId);
CREATE INDEX IX_MaintenanceTask_MaintenanceTaskTypeId ON MaintenanceTask (MaintenanceTaskTypeId);
CREATE INDEX IX_MaintenanceTask_VehiclePartTypeId ON MaintenanceTask (VehiclePartTypeId);

## MechanicTasks
CREATE INDEX IX_MechanicTasks_MechanicId ON MechanicTasks (MechanicId);

## PauseTasks
CREATE INDEX IX_PauseTasks_MaintenanceTaskId ON PauseTasks (MaintenanceTaskId);

## MaintenanceChange
CREATE INDEX IX_MaintenanceChange_MaintenanceId ON MaintenanceChange (MaintenanceId);
CREATE INDEX IX_MaintenanceChange_MaintenanceTaskId ON MaintenanceChange (MaintenanceTaskId);
CREATE INDEX IX_MaintenanceChange_VehiclePartTypeId ON MaintenanceChange (VehiclePartTypeId);

## OwnerInventory
CREATE INDEX IX_OwnerInventory_VehiclePartTypeId ON OwnerInventory (VehiclePartTypeId);
CREATE INDEX IX_OwnerInventory_OwnerId ON OwnerInventory (OwnerId);

## Purchase / PurchaseDetail
CREATE INDEX IX_Purchase_OwnerId ON Purchase (OwnerId);
CREATE INDEX IX_Purchase_OperatorId ON Purchase (OperatorId);
CREATE INDEX IX_PurchaseDetail_PurchaseId ON PurchaseDetail (PurchaseId);
CREATE INDEX IX_PurchaseDetail_VehiclePartTypeId ON PurchaseDetail (VehiclePartTypeId);

## OwnerInventoryTransaction
CREATE INDEX IX_OwnerInventoryTransaction_InventoryId ON OwnerInventoryTransaction (InventoryId);
CREATE INDEX IX_OwnerInventoryTransaction_PurchaseDetailId ON OwnerInventoryTransaction (PurchaseDetailId);

## OwnerVehiclePart
CREATE INDEX IX_OwnerVehiclePart_VehicleId ON OwnerVehiclePart (VehicleId);
CREATE INDEX IX_OwnerVehiclePart_VehiclePartTypeId ON OwnerVehiclePart (VehiclePartTypeId);

## OwnerVehiclePartSupplier
CREATE INDEX IX_OwnerVehiclePartSupplier_SupplierId ON OwnerVehiclePartSupplier (SupplierId);
CREATE INDEX IX_OwnerVehiclePartSupplier_OwnerInventoryId ON OwnerVehiclePartSupplier (OwnerInventoryId);

## MaintenanceTaskPurchase
CREATE INDEX IX_MaintenanceTaskPurchase_PurchaseDetailId ON MaintenanceTaskPurchase (PurchaseDetailId);

## OwnerServiceType / Config
CREATE INDEX IX_OwnerServiceType_OwnerId ON OwnerServiceType (OwnerId);
CREATE INDEX IX_OwnerServiceType_ServiceTypeId ON OwnerServiceType (ServiceTypeId);
CREATE INDEX IX_OwnerServiceTypeConfig_ServiceTypeConfigId ON OwnerServiceTypeConfig (ServiceTypeConfigId);


# Filters

## Maintenance
CREATE INDEX IX_Maintenance_CreatedDate ON Maintenance (CreatedDate);
CREATE INDEX IX_Maintenance_OwnerId_StatusId ON Maintenance (OwnerId,StatusId);


## OwnerPartnership
CREATE INDEX IX_OwnerPartnership_OwnerId_Status ON OwnerPartnership (ToOwnerId,Status);
CREATE INDEX IX_OwnerPartnership_DateOut ON OwnerPartnership (DateOut);


## VehiclePartTypeCategory
CREATE INDEX IX_VehiclePartTypeCategory_Name ON VehiclePartTypeCategory (Name);


## EvalTasks
CREATE INDEX IX_EvalTasks_Name ON EvalTasks (Name);
CREATE INDEX IX_EvalTasks_IsRemoved ON EvalTasks (IsRemoved);
CREATE INDEX IX_EvalTasks_StepNum ON EvalTasks (StepNum);


## MaintenanceTasksType
CREATE INDEX IX_MaintenanceTasksType_Name ON MaintenanceTasksType (Name);
CREATE INDEX IX_MaintenanceTasksType_StepNum ON MaintenanceTasksType (StepNum);
CREATE INDEX IX_MaintenanceTasksType_IsRemoved ON MaintenanceTasksType (IsRemoved);


## MaintenanceTaskStep
CREATE INDEX IX_MaintenanceTaskStep_Name ON MaintenanceTaskStep (Name);
CREATE INDEX IX_MaintenanceTaskStep_StepNum ON MaintenanceTaskStep (StepNum);


## MaintenanceTask
CREATE INDEX IX_MaintenanceTask_MaintenanceId_Status ON MaintenanceTask (MaintenanceId,Status);

## MaintenanceChange

CREATE INDEX IX_MaintenanceChange_CreateDate ON MaintenanceChange (CreateDate);
CREATE INDEX IX_MaintenanceChange_MaintenanceId_Status ON MaintenanceChange (MaintenanceId,Status);

## OwnerVehiclePartType
CREATE INDEX IX_OwnerVehiclePartType_Name ON OwnerVehiclePartType (Name);
CREATE INDEX IX_OwnerVehiclePartType_IsRemoved ON OwnerVehiclePartType (IsRemoved);



## Purchase
CREATE INDEX IX_Purchase_OwnerId_Status ON Purchase (OwnerId,Status);

## OwnerServiceType
CREATE INDEX IX_OwnerServiceType_DateOut ON OwnerServiceType (DateOut);


## OwnerServiceTypeConfig
CREATE INDEX IX_OwnerServiceTypeConfig_DateOut ON OwnerServiceTypeConfig (DateOut);


## ServiceTypeConfig
CREATE INDEX IX_ServiceTypeConfig_Name ON ServiceTypeConfig (Name);



## ServiceType
CREATE INDEX IX_ServiceType_Name ON ServiceType (Name);


## Supplier
CREATE INDEX IX_Supplier_Name ON Supplier (Name);


## OwnerVehiclePartSupplier
CREATE INDEX IX_OwnerVehiclePartSupplier_DateOut ON OwnerVehiclePartSupplier (DateOut);
