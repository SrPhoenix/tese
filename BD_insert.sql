USE [MobiCycle]
GO

INSERT INTO [dbo].[Dealership]
           ([Name]
           ,[Address]
           ,[Address2]
           ,[ZipCode]
           ,[City]
           ,[State]
           ,[Country]
           ,[PhoneNumber]
           ,[Email]
           ,[Nif])
     VALUES
           ('mobieRepair', 'Rua da mobie', 'Nº25', '3882-111', 'Mobilidade', 'Bicla-Aveiro', 'Republica da bicicleta','915124122','mobieRepair@gestao.rb','222111444'),
           ('BiclaArranjos', 'Rua dos arranjos', 'Nº123', '1234-121', 'Arranjoss', 'BiclaDoente', 'Republica dos Arranjos','923121344','BiclaArranjos@gestao.ra','444111222')
GO

-- 'A49E2DD6-18E9-4DDA-A739-520B2CAF278E'

USE [MobiCycle]
GO

INSERT INTO [dbo].[MaintenanceTasksType]
           ([EvalTaskId]
           ,[VehiclePartTypeCategoryId]
           ,[Name]
           ,[VehicleType]
           ,[Description]
           ,[Price]
           ,[Hours]
           ,[Type])
     VALUES
           (null
           ,null
           ,'Evaluations'
           ,null
           ,'Do Vehicle Evaluation'
           ,5
           ,5
           ,0)
GO


INSERT INTO [dbo].[EvalTasks]
           ([Name]
           ,[VehicleType]
           ,[Description]
           ,[StepNum])
     VALUES
           ( 'Rotina' ,null,'Verificar as condições de rotina das peças',1),
           ( 'Trocar Peças' ,null,'Verificar se é necessário substituir alguma peça',2),
           ( 'Qualidade' ,null,'Verificações e testes de qualidade',3)
GO


USE [MobiCycle]
GO

INSERT INTO [dbo].[MaintenanceTasksType]
           ([EvalTaskId]
           ,[VehiclePartTypeCategoryId]
           ,[Name]
           ,[VehicleType]
           ,[Description]
           ,[Price]
           ,[Hours]
           ,[Type])
     VALUES
            (1,null,'Presão dos pneus',null,'Usando a bomba de ar, aumentar o ar dos pneus até estar acima do valor X,XX.',5.2,1,1),
            (1,null,'Nível do óleo',null,'Por óleo no veículo até estar X,XX.',2.2,1,1),
            (1,null,'Apertos',null,'Apertar os parafusos da bicicleta',1.1,2,1),   
            (2,null,'Trocar Pneus',null,'Substituir os pneus da bicicleta',1.1,1,1),   
            (2,null,'Trocar selim',null,'Substituir o selim da bicicleta',1.2,2,1),   
            (2,null,'Trocar motor',null,'Substituir o motor da bicicleta',1.3,3,1),   
            (2,null,'Trocar bateria',null,'Substituir a bateria da bicicleta',1.4,4,1),   
            (3,null,'Verificar pneus',null,'Verificar a pressão de ar dos pneus',1.1,1,2),   
            (3,null,'Verificar óleo',null,'Verificar o nível de óleo da bicicleta',1.2,2,2),   
            (3,null,'Verificar apertos',null,'Verificar os apertos da bicicleta',1.3,3,2),   
            (3,null,'Lavagem',null,'Lavar a bicicleta',1.4,4,2)
GO


