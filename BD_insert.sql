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
           ,[VehicleTypeId]
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
           ( 'Qualidade' ,null,'Verificações e testes de qualidade',3)
GO


USE [MobiCycle]
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

INSERT INTO [dbo].[MaintenanceTasksType]
           ([EvalTaskId]
           ,[VehiclePartTypeCategoryId]
           ,[Name]
           ,[VehicleTypeId]
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


USE [MobiCycle]
GO

INSERT INTO [dbo].[DealershipVehiclePart]
           ([VehiclePartTypeId]
           ,[VehicleId]
           ,[DateIn]
           ,[DateOut])
     VALUES
     -- AVR1259
           ('F94851D7-68C5-4619-ACE9-0537EEB2D02E','B70094AD-7829-694E-540A-0146ADA70068','2024-04-22 10:34:53.44','2022-04-22 10:35:54.44'),
           ('753954D6-2FEE-49DF-BACC-797D7B13EE8D','B70094AD-7829-694E-540A-0146ADA70068','2024-04-23 10:34:53.44','2022-04-23 10:35:54.44'),
           ('D9ABFCC4-9B39-4231-88A3-FA1B40E440AF','B70094AD-7829-694E-540A-0146ADA70068','2024-04-24 10:34:53.44','2022-04-24 10:35:54.44'),
           ('74BD5A96-3A20-4C4D-899E-98BA8179C3DF','B70094AD-7829-694E-540A-0146ADA70068','2024-04-25 10:34:53.44','2022-04-25 10:35:54.44'),
           ('A231806D-38B3-4325-8680-ECD831E53572','B70094AD-7829-694E-540A-0146ADA70068','2024-04-26 10:34:53.44','2022-04-26 10:35:54.44'),
           ('1C9B319F-9675-49DF-BF92-28EEF798CCAC','B70094AD-7829-694E-540A-0146ADA70068','2024-04-27 10:34:53.44','2022-04-27 10:35:54.44'),
           ('36A599DA-4D33-4CAB-BB06-DBE57FBBF09E','B70094AD-7829-694E-540A-0146ADA70068','2024-04-28 10:34:53.44','2022-04-28 10:35:54.44'),
           ('3BE0AE95-8AF2-415B-A1F5-463106AE1B94','B70094AD-7829-694E-540A-0146ADA70068','2024-04-29 10:34:53.44','2022-04-29 10:35:54.44'),
      
      -- AVR2240
           ('F94851D7-68C5-4619-ACE9-0537EEB2D02E','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-22 10:34:53.44','2022-04-22 10:35:54.44'),
           ('753954D6-2FEE-49DF-BACC-797D7B13EE8D','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-23 10:34:53.44','2022-04-23 10:35:54.44'),
           ('D9ABFCC4-9B39-4231-88A3-FA1B40E440AF','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-24 10:34:53.44','2022-04-24 10:35:54.44'),
           ('74BD5A96-3A20-4C4D-899E-98BA8179C3DF','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-25 10:34:53.44','2022-04-25 10:35:54.44'),
           ('A231806D-38B3-4325-8680-ECD831E53572','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-26 10:34:53.44','2022-04-26 10:35:54.44'),
           ('1C9B319F-9675-49DF-BF92-28EEF798CCAC','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-27 10:34:53.44','2022-04-27 10:35:54.44'),
           ('36A599DA-4D33-4CAB-BB06-DBE57FBBF09E','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-28 10:34:53.44','2022-04-28 10:35:54.44'),
           ('3BE0AE95-8AF2-415B-A1F5-463106AE1B94','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-29 10:34:53.44','2022-04-29 10:35:54.44')

GO


USE [MobiCycle]
GO

INSERT INTO [dbo].[MaintenanceTaskStep]
           ([MaintenanceTaskTypeId]
           ,[StepNum]
		   ,[ShowVehiclePart]
           ,[Name]
           ,[Description])
     VALUES
		   (7,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
		   (8,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
		   (8,2,0,'Mudança de óleo','ir buscar o bidão do óleo'),
		   (8,3,0,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (9,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
           (9,2,0,'Apertos','Ver a máquina de apertos ligada à bicla'),
		   (9,3,0,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (10,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
           (10,2,1,'Trocar Pneus','Tirar muitas coisas a prender os pneus'),
		   (10,3,0,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (11,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
           (11,2,1,'Trocar selim','Tirar muitas coisas a prender o Selim'),
		   (11,3,0,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (12,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
           (12,2,1,'Trocar motor','Tirar muitas coisas a prender o motor'),
           (12,3,0,'Finalizar','Por Bicla à beira das outras'),
		   (13,1,0,'Preparação','Colocar a bicicleta na máquina porreira'),
           (13,2,1,'Trocar bateria','Tirar muitas coisas a prender a bateria'),
           (13,3,0,'Finalizar','Por Bicla à beira das outras'),
		   (14,1,0,'Verificar pneus','Verificar a pressão de ar dos pneus'),
		   (15,1,0,'Verificar óleo','Verificar o nível de óleo da bicicleta'),
		   (16,1,0,'Verificar apertos','Verificar os apertos da bicicleta'),
		   (17,1,0,'Lavagem','lavar muito bem')
GO


USE [MobiCycle]
GO

INSERT INTO [dbo].[MaintenanceTaskSubStep]
           ([MaintenanceTaskStepId]
           ,[Name]
           ,[Description])
     VALUES
		   (3,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
           (3,'Ligar máquina de ar','Ver a máquina de ar ligada à bicla'),
           (3,'Colocar unidades','Meter na máquina nas medidas certas'),
           (3,'Verificar valores','Verificar os valores na máquina'),
           (3,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (3,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (4,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
		   (4,'Retirar tampa','Retirar a tampa da bicla'),
		   (5,'bidão óleo','ir buscar o bidão do óleo'),
		   (5,'Colocar óleo até 30','Colocar óleo até 30'),
		   (6,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (6,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (7,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
           (7,'Buscar máquina de apertos','Ter a máquina de apertos'),
           (8,'Ligar máquina de apertos','Ver a máquina de apertos ligada à bicla'),
           (8,'Colocar unidades','Meter na máquina nas medidas certas'),
           (8,'Verificar valores','Verificar os valores na máquina'),
		   (9,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (9,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (10,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
           (10,'Buscar Penus','Ter Penus'),
           (11,'Tirar coisas a prender os pneus','Tirar muitas coisas a prender os pneus'),
           (11,'Retira pneu velho','Retira pneu velho sem fazer asneiras'),
           (11,'Por pneu novo','Por pneu novo sem fazer asneiras'),
		   (12,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (12,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (13,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
           (13,'Buscar Selim','Ter Selim'),
           (14,'Tirar coisas a prender o Selim','Tirar muitas coisas a prender o Selim'),
           (14,'Retira Selim velho','Retira Selim velho sem fazer asneiras'),
           (14,'Por Selim novo','Por Selim novo sem fazer asneiras'),
		   (15,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (15,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (16,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
           (16,'Buscar motor','Ter motor'),
           (17,'Tirar coisas a prender o motor','Tirar muitas coisas a prender o motor'),
           (17,'Retira motor velho','Retira motor velho sem fazer asneiras'),
           (17,'Por motor novo','Por motor novo sem fazer asneiras'),
		   (18,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (18,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (19,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
           (19,'Buscar bateria','Ter bateria'),
           (20,'Tirar coisas a prender a bateria','Tirar muitas coisas a prender a bateria'),
           (20,'Retira bateria velha','Retira bateria velha sem fazer asneiras'),
           (20,'Por bateria nova','Por bateria nova sem fazer asneiras'),
		   (21,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
           (21,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
		   (22,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
		   (22,'Fazer teste dos pneus','Fazer teste bue porreiro'),
		   (22,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
		   (23,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
		   (23,'Fazer teste do óleo','Fazer teste bue porreiro'),
		   (23,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
		   (24,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
		   (24,'Fazer teste dos apertos','Fazer teste bue porreiro'),
		   (24,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
		   (25,'lavar','lavar muito bem')
GO




