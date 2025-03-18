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
           ,[VehicleTypeId]
           ,[Description]
           ,[StepNum])
     VALUES
           ( 'Rotina' ,null,'Verificar as condições de rotina das peças',1),
           ( 'Trocar Peças' ,null,'Verificar se é necessário substituir alguma peça',2),
           ( 'Qualidade' ,null,'Verificações e testes de qualidade',3),
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
            (2,8,'Trocar selim',null,'Substituir o selim da bicicleta',1.2,2,1),   
            (2,1,'Trocar motor',null,'Substituir o motor da bicicleta',1.3,3,1),   
            (2,7,'Trocar bateria',null,'Substituir a bateria da bicicleta',1.4,4,1),   
            (3,null,'Verificar pneus',null,'Verificar a pressão de ar dos pneus',1.1,1,2),   
            (3,null,'Verificar óleo',null,'Verificar o nível de óleo da bicicleta',1.2,2,2),   
            (3,null,'Verificar apertos',null,'Verificar os apertos da bicicleta',1.3,3,2),   
            (3,null,'Lavagem',null,'Lavar a bicicleta',1.4,4,2)
GO


USE [MobiCycle]
GO

INSERT INTO [dbo].[MaintenanceTaskStep]
           ([MaintenanceTaskTypeId]
           ,[StepNum]
           ,[Name]
           ,[Description])
     VALUES
           (1,1,'Verificar a pressão dos pneus','Usando a máquina xpto verificar a pressão dos pneus.'),
           (1,2,'Verificar a calvice dos pneus','Verificar olhar para os pneus e ver o quão careca eles estão.'),
           (1,3,'Verificar a pintura','Verificar se a pintura precisa de retoque.'),
           (1,4,'Verificar o selim','Verificar se o selim precisa de ser trocado.'),
           (1,5,'Verificar os pedais','Verificar se os pedais precisam de ser trocado.'),
           (1,6,'Verificar os travões','Ver se os travões funcionam bem.')
GO


INSERT INTO [dbo].[EvalTaskSubStep]
           ([Name]
           ,[VehicleType]
           ,[Description]
           ,[StepNum])
     VALUES
           (12,'Verificar a pressão dos pneus','Usando a máquina xpto verificar a pressão dos pneus.'),
           (12,'Verificar a calvice dos pneus','Verificar olhar para os pneus e ver o quão careca eles estão.'),
           (3,'Verificar a pintura','Verificar se a pintura precisa de retoque.'),
           (2,'Verificar o selim','Verificar se o selim precisa de ser trocado.'),
           (2,'Verificar os pedais','Verificar se os pedais precisam de ser trocado.'),
           (2,'Verificar os travões','Ver se os travões funcionam bem.'),
           (12,'Verificar o nivel do óleo','Verificar se o nivel do óleo está correto.'),
           (3,'Verificar apertos','Verificar se os apertos têm a pressão certa.')
GO


USE [MobiCycle]
GO

INSERT INTO [dbo].[VehiclePartTypeCategory]
           ([Name])
     VALUES
           ('Selim'),
           ('Quadro'),
           ('Travões'),
           ('Pedais'),
           ('Descanso'),
           ('Guiador'),
           ('Motor'),
           ('Pneus')
GO

USE [MobiCycle]
GO

INSERT INTO [dbo].[DealershipVehiclePartType]
           ([Code]
           ,[Name]
           ,[Description]
           ,[Price]
           ,[Category]
           ,[ReorderQuantity])
     VALUES
           ('SC123','Selim da China','Descrição apropriada para este selim',3.15,1,20),
           ('SC456','Selim da Guiné','Descrição apropriada para este selim',2.20,1,15),
           ('SC789','Selim Português','Descrição apropriada para este selim',1.5,1,8),
		    ('QG123','Quadro da China','Descrição apropriada para este quadro',3.15,2,20),
           ('QG456','Quadro da Guiné','Descrição apropriada para este quadro',2.20,2,15),
           ('QG789','Quadro Português','Descrição apropriada para este quadro',1.5,2,8),
		   	('TT123','Travões da China','Descrição apropriada para estes travões',3.15,3,20),
           ('TT456','Travões da Guiné','Descrição apropriada para estes travões',2.20,3,15),
           ('TT789','Travões Português','Descrição apropriada para estes travões',1.5,3,8),
		   	('PW123','Pedais da China','Descrição apropriada para estes pedais',3.15,4,20),
           ('PW456','Pedais da Guiné','Descrição apropriada para estes pedais',2.20,4,15),
           ('PW789','Pedais Português','Descrição apropriada para estes pedais',1.5,4,8),
		   	('DS123','Descanso da China','Descrição apropriada para este descanso',3.15,5,20),
           ('DS456','Descanso da Guiné','Descrição apropriada para este descanso',2.20,5,15),
           ('DS789','Descanso Português','Descrição apropriada para este descanso',1.5,5,8),
		   	('GH123','Guiador da China','Descrição apropriada para este guiador',3.15,6,20),
           ('GH456','Guiador da Guiné','Descrição apropriada para este guiador',2.20,6,15),
           ('GH789','Guiador Português','Descrição apropriada para este guiador',1.5,6,8),
		   	('MN123','Motor da China','Descrição apropriada para este motor',3.15,7,20),
           ('MN456','Motor da Guiné','Descrição apropriada para este motor',2.20,7,15),
           ('MN789','Motor Português','Descrição apropriada para este motor',1.5,7,8),
		   	('PO123','Pneus da China','Descrição apropriada para estes pneus',3.15,8,20),
           ('PO456','Pneus da Guiné','Descrição apropriada para estes pneus',2.20,8,15),
           ('PO789','Pneus Português','Descrição apropriada para estes pneus',1.5,8,8)
GO


