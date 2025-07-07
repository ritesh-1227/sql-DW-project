/*
==================================================================================
Create Database and Schemas
==================================================================================
Purpose:
	To create the new database 'DataWarehouse' after safely checking if it exists already.
	If it exists, it will be dropped and recreated (for the exercise). 
	Sets up three schemas for the database in layers: bronze, silver and gold.

Warning:
	Running this will drop the database if it exists, all data deleted permanently. Check for backups if needed.
*/

USE master;
GO

--Drop and recreate if "DataWarehouse" already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name= 'DataWarehouse')
BEGIN
	--single user mode to terminate other connections and to avoid any new connections (preserves only the current connection i.e., mine) and 
	--the rollback immediate to make sure all the active transactions are rolled back and the query doesnt wait till all the connections are terminated
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 

	-- Drop 
	DROP DATABASE DataWarehouse;
END;
GO

--Create DataWarehouse DB
CREATE DATABASE DataWarehouse;
GO 

USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
