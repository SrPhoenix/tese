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


