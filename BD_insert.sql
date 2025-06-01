begin tran T1;

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
		   ,[Quantity]
           ,[Price]
           ,[Hours]
           ,[Type])
     VALUES
           (null
           ,null
           ,'Evaluations'
           ,null
           ,'Do Vehicle Evaluation'
		   ,1
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
           ('Pneus'),
           ('Bateria')
GO

INSERT INTO [dbo].[MaintenanceTasksType]
           ([EvalTaskId]
           ,[VehiclePartTypeCategoryId]
           ,[Name]
           ,[VehicleTypeId]
           ,[Description]
		   ,[Quantity]
           ,[Price]
           ,[Hours]
           ,[Type])
     VALUES
            (7,null,'Presão dos pneus',null,'Usando a bomba de ar, aumentar o ar dos pneus até estar acima do valor X,XX.',null,5.2,1,1),
            (7,null,'Nível do óleo',null,'Por óleo no veículo até estar X,XX.',null,2.2,1,1),
            (7,null,'Apertos',null,'Apertar os parafusos da bicicleta',null,1.1,2,1),   
            (8,null,'Trocar Pneus',null,'Substituir os pneus da bicicleta',null,1.1,1,1),   
            (8,17,'Trocar selim',null,'Substituir o selim da bicicleta',1,1.2,2,1),   
            (8,23,'Trocar motor',null,'Substituir o motor da bicicleta',1,1.3,3,1),   
            (8,25,'Trocar bateria',null,'Substituir a bateria da bicicleta',1,1.4,4,1),   
            (9,null,'Verificar pneus',null,'Verificar a pressão de ar dos pneus',null,1.1,1,2),   
            (9,null,'Verificar óleo',null,'Verificar o nível de óleo da bicicleta',null,1.2,2,2),   
            (9,null,'Verificar apertos',null,'Verificar os apertos da bicicleta',null,1.3,3,2),   
            (9,null,'Lavagem',null,'Lavar a bicicleta',null,1.4,4,2)
GO


--INSERT INTO [dbo].[EvalTaskSubStep]
--           ([Name]
--           ,[VehicleType]
--           ,[Description]
--           ,[StepNum])
--     VALUES
--           (12,'Verificar a pressão dos pneus','Usando a máquina xpto verificar a pressão dos pneus.'),
--           (12,'Verificar a calvice dos pneus','Verificar olhar para os pneus e ver o quão careca eles estão.'),
--           (3,'Verificar a pintura','Verificar se a pintura precisa de retoque.'),
--           (2,'Verificar o selim','Verificar se o selim precisa de ser trocado.'),
--           (2,'Verificar os pedais','Verificar se os pedais precisam de ser trocado.'),
--           (2,'Verificar os travões','Ver se os travões funcionam bem.'),
--           (12,'Verificar o nivel do óleo','Verificar se o nivel do óleo está correto.'),
--           (3,'Verificar apertos','Verificar se os apertos têm a pressão certa.')
--GO




USE [MobiCycle]
GO

INSERT INTO [dbo].[DealershipVehiclePartType]
           ([Code]
           ,[Name]
           ,[Description]
           ,[Price]
           ,[CategoryId]
           ,[ReorderQuantity])
     VALUES
           ('SC123','Selim da China','Descrição apropriada para este selim',3.15,10,20),
           ('SC456','Selim da Guiné','Descrição apropriada para este selim',2.20,10,15),
           ('SC789','Selim Português','Descrição apropriada para este selim',1.5,10,8),
		   ('QG123','Quadro da China','Descrição apropriada para este quadro',3.15,11,20),
           ('QG456','Quadro da Guiné','Descrição apropriada para este quadro',2.20,11,15),
           ('QG789','Quadro Português','Descrição apropriada para este quadro',1.5,11,8),
		   ('TT123','Travões da China','Descrição apropriada para estes travões',3.15,12,20),
           ('TT456','Travões da Guiné','Descrição apropriada para estes travões',2.20,12,15),
           ('TT789','Travões Português','Descrição apropriada para estes travões',1.5,12,8),
		   ('PW123','Pedais da China','Descrição apropriada para estes pedais',3.15,13,20),
           ('PW456','Pedais da Guiné','Descrição apropriada para estes pedais',2.20,13,15),
           ('PW789','Pedais Português','Descrição apropriada para estes pedais',1.5,13,8),
		   ('DS123','Descanso da China','Descrição apropriada para este descanso',3.15,14,20),
           ('DS456','Descanso da Guiné','Descrição apropriada para este descanso',2.20,14,15),
           ('DS789','Descanso Português','Descrição apropriada para este descanso',1.5,14,8),
		   	('GH123','Guiador da China','Descrição apropriada para este guiador',3.15,15,20),
           ('GH456','Guiador da Guiné','Descrição apropriada para este guiador',2.20,15,15),
           ('GH789','Guiador Português','Descrição apropriada para este guiador',1.5,15,8),
		   	('MN123','Motor da China','Descrição apropriada para este motor',3.15,16,20),
           ('MN456','Motor da Guiné','Descrição apropriada para este motor',2.20,16,15),
           ('MN789','Motor Português','Descrição apropriada para este motor',1.5,16,8),
		   	('PO123','Pneus da China','Descrição apropriada para estes pneus',3.15,17,20),
           ('PO456','Pneus da Guiné','Descrição apropriada para estes pneus',2.20,17,15),
           ('PO789','Pneus Português','Descrição apropriada para estes pneus',1.5,17,8),
		   	('BQ123','Bateria da China','Descrição apropriada para esta bateria',3.15,18,20),
           ('BQ456','Bateria da Guiné','Descrição apropriada para esta bateria',2.20,18,15),
           ('BQ789','Bateria Português','Descrição apropriada para esta bateria',1.5,18,8)
GO

rollback


INSERT INTO [dbo].[DealershipVehiclePart]
           ([VehiclePartTypeId]
           ,[VehicleId]
           ,[DateIn]
           ,[DateOut])
     VALUES
     -- AVR1259
           ('17413A6C-85BE-4688-9518-726F54618167','B70094AD-7829-694E-540A-0146ADA70068','2024-04-22 10:34:53.44',NULL),
           ('1FE21409-622F-459D-9AB1-7C7EE0C8A621','B70094AD-7829-694E-540A-0146ADA70068','2024-04-23 10:34:53.44',NULL),
           ('FB414460-CE3E-45AE-8E49-FD43D3E1D4DF','B70094AD-7829-694E-540A-0146ADA70068','2024-04-24 10:34:53.44',NULL),
           ('D8C732EF-22D9-42E0-A07E-5744F6131FEF','B70094AD-7829-694E-540A-0146ADA70068','2024-04-25 10:34:53.44',NULL),
           ('C5D7E96F-FA1D-4A7B-A4C8-3D6357D094DE','B70094AD-7829-694E-540A-0146ADA70068','2024-04-26 10:34:53.44',NULL),
           ('75B9302D-60A2-4F39-97BF-9C33355864D5','B70094AD-7829-694E-540A-0146ADA70068','2024-04-27 10:34:53.44',NULL),
           ('627B8E65-D4BF-472F-BC7E-220CAD8D85E3','B70094AD-7829-694E-540A-0146ADA70068','2024-04-28 10:34:53.44',NULL),
           ('C4475748-728E-4368-A646-B54928FB7EA8','B70094AD-7829-694E-540A-0146ADA70068','2024-04-29 10:34:53.44',NULL),
           ('F559AA41-489C-4898-98FB-DAAA27B4CF34','B70094AD-7829-694E-540A-0146ADA70068','2024-04-29 10:34:53.44',NULL),
      
      -- AVR2240
           ('53AA4FB7-309D-4ADD-8AB6-D9E82275C2FE','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-22 10:34:53.44',NULL),
           ('7954AEF6-5AF2-4F64-80C7-005C5119ED0B','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-23 10:34:53.44',NULL),
           ('F4A4BC18-4B18-45B6-9E37-32E58A88FDE5','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-24 10:34:53.44',NULL),
           ('0245326A-B9AC-42CC-9B2B-E5D3B7AE4BDA','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-25 10:34:53.44',NULL),
           ('3C0AC436-5DE4-4785-B53D-B12C8B9BF1BC','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-26 10:34:53.44',NULL),
           ('B679A3B7-1424-42D0-BB13-4562E16DF259','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-27 10:34:53.44',NULL),
           ('00A7C48E-C914-4713-8C7B-5FD4BFBE1EAE','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-28 10:34:53.44',NULL),
           ('BF24F6E9-4889-4A71-B76A-BD2C45B5E723','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-29 10:34:53.44',NULL),
           ('D1AEFE96-B7DE-4175-AFFC-CE4E678096FD','A6351C23-9CC8-B635-ED8A-01589709DE4C','2024-04-29 10:34:53.44',NULL)

GO

INSERT INTO [dbo].[MaintenanceTaskStep]
           ([MaintenanceTaskTypeId]
           ,[StepNum]
           ,[Name]
           ,[Description])
     VALUES
		   (3,1,'Preparação','Colocar a bicicleta na máquina porreira'),
		   (4,1,'Preparação','Colocar a bicicleta na máquina porreira'),
		   (4,2,'Mudança de óleo','ir buscar o bidão do óleo'),
		   (4,3,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (5,1,'Preparação','Colocar a bicicleta na máquina porreira'),
           (5,2,'Apertos','Ver a máquina de apertos ligada à bicla'),
		   (5,3,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (6,1,'Preparação','Colocar a bicicleta na máquina porreira'),
           (6,2,'Trocar Pneus','Tirar muitas coisas a prender os pneus'),
		   (6,3,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (7,1,'Preparação','Colocar a bicicleta na máquina porreira'),
           (7,2,'Trocar selim','Tirar muitas coisas a prender o Selim'),
		   (7,3,'Finalizar','Tirar a bicicleta na máquina porreira'),
		   (8,1,'Preparação','Colocar a bicicleta na máquina porreira'),
           (8,2,'Trocar motor','Tirar muitas coisas a prender o motor'),
           (8,3,'Finalizar','Por Bicla à beira das outras'),
		   (9,1,'Preparação','Colocar a bicicleta na máquina porreira'),
           (9,2,'Trocar bateria','Tirar muitas coisas a prender a bateria'),
           (9,3,'Finalizar','Por Bicla à beira das outras'),
		   (10,1,'Verificar pneus','Verificar a pressão de ar dos pneus'),
		   (11,1,'Verificar óleo','Verificar o nível de óleo da bicicleta'),
		   (12,1,'Verificar apertos','Verificar os apertos da bicicleta'),
		   (13,1,'Lavagem','lavar muito bem')
GO


-- USE [MobiCycle]
-- GO

-- INSERT INTO [dbo].[MaintenanceTaskSubStep]
--            ([MaintenanceTaskStepId]
--            ,[Name]
--            ,[Description])
--      VALUES
-- 		   (3,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
--            (3,'Ligar máquina de ar','Ver a máquina de ar ligada à bicla'),
--            (3,'Colocar unidades','Meter na máquina nas medidas certas'),
--            (3,'Verificar valores','Verificar os valores na máquina'),
--            (3,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (3,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (4,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
-- 		   (4,'Retirar tampa','Retirar a tampa da bicla'),
-- 		   (5,'bidão óleo','ir buscar o bidão do óleo'),
-- 		   (5,'Colocar óleo até 30','Colocar óleo até 30'),
-- 		   (6,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (6,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (7,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
--            (7,'Buscar máquina de apertos','Ter a máquina de apertos'),
--            (8,'Ligar máquina de apertos','Ver a máquina de apertos ligada à bicla'),
--            (8,'Colocar unidades','Meter na máquina nas medidas certas'),
--            (8,'Verificar valores','Verificar os valores na máquina'),
-- 		   (9,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (9,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (10,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
--            (10,'Buscar Penus','Ter Penus'),
--            (11,'Tirar coisas a prender os pneus','Tirar muitas coisas a prender os pneus'),
--            (11,'Retira pneu velho','Retira pneu velho sem fazer asneiras'),
--            (11,'Por pneu novo','Por pneu novo sem fazer asneiras'),
-- 		   (12,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (12,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (13,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
--            (13,'Buscar Selim','Ter Selim'),
--            (14,'Tirar coisas a prender o Selim','Tirar muitas coisas a prender o Selim'),
--            (14,'Retira Selim velho','Retira Selim velho sem fazer asneiras'),
--            (14,'Por Selim novo','Por Selim novo sem fazer asneiras'),
-- 		   (15,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (15,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (16,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
--            (16,'Buscar motor','Ter motor'),
--            (17,'Tirar coisas a prender o motor','Tirar muitas coisas a prender o motor'),
--            (17,'Retira motor velho','Retira motor velho sem fazer asneiras'),
--            (17,'Por motor novo','Por motor novo sem fazer asneiras'),
-- 		   (18,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (18,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (19,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
--            (19,'Buscar bateria','Ter bateria'),
--            (20,'Tirar coisas a prender a bateria','Tirar muitas coisas a prender a bateria'),
--            (20,'Retira bateria velha','Retira bateria velha sem fazer asneiras'),
--            (20,'Por bateria nova','Por bateria nova sem fazer asneiras'),
-- 		   (21,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
--            (21,'Por Bicla à naquele sitio','Por Bicla à beira das outras'),
-- 		   (22,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
-- 		   (22,'Fazer teste dos pneus','Fazer teste bue porreiro'),
-- 		   (22,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
-- 		   (23,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
-- 		   (23,'Fazer teste do óleo','Fazer teste bue porreiro'),
-- 		   (23,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
-- 		   (24,'Por Bicla ao alto','Colocar a bicicleta na máquina porreira'),
-- 		   (24,'Fazer teste dos apertos','Fazer teste bue porreiro'),
-- 		   (24,'Por Bicla em baixo','Tirar a bicicleta na máquina porreira'),
-- 		   (25,'lavar','lavar muito bem')
-- GO




